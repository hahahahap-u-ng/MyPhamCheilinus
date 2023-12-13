using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MyPhamCheilinus.Controllers;
using MyPhamCheilinus.Infrastructure;
using MyPhamCheilinus.Models;


namespace MyPhamCpuheilinus.Controllers
{
    public class DonHangController : Controller
    {

        
        _2023MyPhamContext db = new _2023MyPhamContext();
        private readonly ILogger<DonHangController> _logger;

        public DonHangController(ILogger<DonHangController> logger)
        {
            _logger = logger;
        }

        public IActionResult DonHang()
        {
            // Lấy giá trị từ Session
            var taikhoanID = HttpContext.Session.GetString("AccountId");

            if (taikhoanID != null)
            {
                // Chuyển đổi AccountId từ string sang int
                int accountId = Convert.ToInt32(taikhoanID);

                // Truy vấn danh sách đơn hàng của người dùng
                var donhangs = db.DonHangs
                    .Where(dh => dh.MaKhachHangNavigation.AccountId == accountId)
                    .ToList();

                // Gửi danh sách đơn hàng đến view
                return View(donhangs);
            }

            // Nếu không có thông tin tài khoản hoặc có lỗi, chuyển hướng đến trang đăng nhập
            return RedirectToAction("Login");
        }

        [HttpPost]
        public IActionResult UpdateStatus(string donHangId, int trangThaiDonHang)
        {
            var donHang = db.DonHangs.Find(donHangId);
            if (donHang == null)
            {
                return NotFound();
            }

            donHang.TrangThaiDonHang = trangThaiDonHang;
            db.SaveChanges();

            return Ok();
        }




        
    }
}



