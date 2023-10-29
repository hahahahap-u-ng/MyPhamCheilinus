using Microsoft.AspNetCore.Mvc;
using MyPhamCheilinus.Controllers;
using MyPhamCheilinus.Infrastructure;
using MyPhamCheilinus.Models;

namespace MyPhamCpuheilinus.Controllers
{
    public class GioHangController : Controller
    {
        
        public GioHang? GioHang { get; set; }
        _2023MyPhamContext db = new _2023MyPhamContext();
        private readonly ILogger<GioHangController> _logger;

        public GioHangController(ILogger<GioHangController> logger)
        {
            _logger = logger;
        }
        public IActionResult AddGioHang(string maSanPham)
        {
            SanPham? sanpham = db.SanPhams.FirstOrDefault(p => p.MaSanPham == maSanPham);
            if (sanpham != null)
            {
                GioHang = HttpContext.Session.GetJson<GioHang>("giohang")?? new GioHang();
                GioHang.AddItem(sanpham, 1);
                HttpContext.Session.SetJson("giohang", GioHang);
            }
            return View("GioHang", GioHang);
        }

        public IActionResult RemoveFromGioHang(string maSanPham)
        {
            SanPham? sanpham = db.SanPhams.FirstOrDefault(p => p.MaSanPham == maSanPham);
            if (sanpham != null)
            {
                GioHang = HttpContext.Session.GetJson<GioHang>("giohang");
                GioHang.RemoveLine(sanpham);
                HttpContext.Session.SetJson("giohang", GioHang);
            }
            return View("GioHang", GioHang);
        }

    }
}
