using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Extension;
using MyPhamCheilinus.Helpper;
using MyPhamCheilinus.Models;
using MyPhamCheilinus.ModelViews;
using System.Security.Claims;

namespace MyPhamCheilinus.Controllers
{
    [Authorize]
    public class AccountsController : Controller
    {
        private readonly _2023MyPhamContext _context;
        public INotyfService _notifyService { get; }

        public AccountsController(_2023MyPhamContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult ValidatePhone(string SoDienThoai)
        {
            try
            {
                var khachhang = _context.KhachHangs.AsNoTracking().SingleOrDefault(x => x.SoDienThoai.ToLower() == SoDienThoai.ToLower());
                if (khachhang != null)
                    return Json(data: "Số điện thoại : " + SoDienThoai + " Đã được sử dụng");

                return Json(data: true);
            }
            catch
            {
                return Json(data: true);
            }
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult ValidateEmail(string Email)
        {
            try
            {
                var khachhang = _context.KhachHangs.AsNoTracking().SingleOrDefault(x => x.Email.ToLower() == Email.ToLower());
                if (khachhang != null)
                    return Json(data: "Email : " + Email + " Đã được sử dụng");

                return Json(data: true);
            }
            catch
            {
                return Json(data: true);
            }
        }
        [Route("tai-khoan-cua-toi.html", Name = "Dashboard")]
        public IActionResult Dashboard()
        {
            var taikhoanID = HttpContext.Session.GetString("MaKhachHang");
            if (taikhoanID != null)
            {
                var khachhang = _context.KhachHangs.AsNoTracking().SingleOrDefault(x => x.MaKhachHang ==taikhoanID);
                if (khachhang != null)
                {
                    return View();
                }
            }
            return RedirectToAction("Login");
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("dang-ky.html", Name = "Dangky")]
        public IActionResult DangKyTaiKhoan()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [Route("dang-ky.html", Name = "Dangky")]
        public async Task<IActionResult> DangKyTaiKhoan(RegisterVM taikhoan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string salt = Utilities.GetRandomKey();
                    KhachHang khachhang = new KhachHang
                    {
                        TenKhachHang = taikhoan.TenKhachHang,
                        SoDienThoai = taikhoan.SoDienThoai.Trim().ToLower(),
                        Email = taikhoan.Email.Trim().ToLower(),
                        Password = (taikhoan.Password + salt.Trim()).ToMD5(),
                        Active = true,
                        Salt = salt,
                        CreateDate = DateTime.Now
                    };
                    try
                    {
                        _context.Add(khachhang);
                        await _context.SaveChangesAsync();
                        HttpContext.Session.SetString("MaKhachHang", khachhang.MaKhachHang.ToString());
                        var taikhoanID = HttpContext.Session.GetString("MaKhachHang");

                        var claims = new List<Claim>
                        {
                            new Claim(ClaimTypes.Name, khachhang.TenKhachHang),
                            new Claim("MaKhachHang", khachhang.MaKhachHang.ToString())
                        };
                        ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
                        ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                        await HttpContext.SignInAsync(claimsPrincipal);
                        return RedirectToAction("Dashboard", "Accounts");
                    }
                    catch (Exception ex)
                    {
                        return RedirectToAction("DangKyTaiKhoan", "Accounts");
                    }
                }
                else
                {
                    return View(taikhoan);
                }
            }
            catch
            {
                return View(taikhoan);
            }
        }
        [AllowAnonymous]
        [Route("dang-nhap.html", Name = "Dangnhap")]
        public IActionResult Login(string? returnUrl = null)
        {
            var taikhoanID = HttpContext.Session.GetString("MaKhachHang");
            if (taikhoanID != null)
            {
                return RedirectToAction("Dashboard", "Accounts");
            }

            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [Route("dang-nhap.html", Name = "Dangnhap")]
        public async Task<IActionResult> Login(LoginViewModel customer, string? returnUrl = null)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isEmail = Utilities.IsValidEmail(customer.UserName);
                    if (!isEmail) return View(customer);

                    var khachhang = _context.KhachHangs.AsNoTracking().SingleOrDefault(x => x.Email.Trim() == customer.UserName);
                    if (khachhang == null) return RedirectToAction("DangKyTaiKhoan");

                    string pass = (customer.Password + khachhang.Salt.Trim()).ToMD5();
                    if (khachhang.Password != pass)
                    {
                        _notifyService.Success("Thông tin đăng nhập chưa chính xác.");
                        return View(customer);
                    }
                    if (khachhang.Active == false)
                    {
                        return RedirectToAction("ThongBao", "Accounts");
                    }

                    HttpContext.Session.SetString("MaKhachHang", khachhang.MaKhachHang.ToString());

                    var taikhoanID = HttpContext.Session.GetString("MaKhachHang");

                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, khachhang.TenKhachHang),
                        new Claim("MaKhachHang", khachhang.MaKhachHang.ToString())
                    };

                    ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
                    ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                    await HttpContext.SignInAsync(claimsPrincipal);
                    _notifyService.Success("Đăng nhập thành công!");
                    return RedirectToAction("Dashboard", "Accounts");
                }
            }
            catch
            {
                return RedirectToAction("DangKyTaiKhoan", "Accounts");
            }
            return View(customer);
        }
        [HttpGet]
        [Route("dang-xuat.html", Name = "Logout")]
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Remove("MaKhachHang");
            return RedirectToAction("Index", "Home");
        }
    }
}
