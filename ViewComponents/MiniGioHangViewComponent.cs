using Microsoft.AspNetCore.Mvc;
using MyPhamCheilinus.Infrastructure;
using MyPhamCheilinus.Models;
using MyPhamCheilinus.Models.ViewModels;
using System.Collections.Generic;
using System.Linq;

namespace MyPhamCheilinus.ViewComponents
{
    public class MiniGioHangViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            List<SanPhamGioHang> giohang = HttpContext.Session.GetJson<List<SanPhamGioHang>>("GioHang");
            MiniGioHangViewModel? miniGioHangVM;

            if (giohang != null )
            {
                // Tính toán thông tin giỏ hàng
                miniGioHangVM = new MiniGioHangViewModel
                {
                    SoSanPhams = giohang.Sum(x => x.SoLuong),
                    TongCong = giohang.Sum(x => x.SoLuong * x.Gia)
                };
            }
            else
            {
                miniGioHangVM = null;
            }

            return View(miniGioHangVM);
        }
    }
}
