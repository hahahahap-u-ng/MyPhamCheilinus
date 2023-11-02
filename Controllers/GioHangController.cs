using Microsoft.AspNetCore.Mvc;
using MyPhamCheilinus.Infrastructure;
using MyPhamCheilinus.Models;
using MyPhamCheilinus.Models.ViewModels;

namespace MyPhamCheilinus.Controllers
{

    public class GioHangController : Controller
    {
        _2023MyPhamContext db = new _2023MyPhamContext();
        private readonly ILogger<GioHangController> _logger;

        public GioHangController(ILogger<GioHangController> logger)
        {
            _logger = logger;
        }
        public IActionResult Index()
        {
            List<SanPhamGioHang> giohang = HttpContext.Session.GetJson<List<SanPhamGioHang>>("GioHang")?? new List<SanPhamGioHang>();

            GioHangViewModel giohangVM = new()
            {
                SanPhamGioHangs = giohang,
                TongTienGioHang = giohang.Sum(x => x.SoLuong * x.Gia)
            };
            
            
            return View(giohangVM);
        }

        public async Task <IActionResult> Add(string maSanPham)
        {
            SanPham sanpham= await db.SanPhams.FindAsync(maSanPham);
            List<SanPhamGioHang> giohang = HttpContext.Session.GetJson<List<SanPhamGioHang>>("GioHang") ?? new List<SanPhamGioHang>();
            SanPhamGioHang sanPhamGioHang= giohang.Where(c => c.MaSanPham==maSanPham).FirstOrDefault();
            
            if (sanPhamGioHang==null)
            {
                giohang.Add(new SanPhamGioHang(sanpham));
            }
            else
            {
                sanPhamGioHang.SoLuong += 1;
            }

            HttpContext.Session.SetJson("GioHang", giohang);
            TempData["Success"] = "Sản phẩm đã được thêm vào";

            return Redirect(Request.Headers["Referer"].ToString());
        }

    }
}
