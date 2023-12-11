
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Models;
using System.Web.WebPages;
using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;

namespace MyPhamCheilinus.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ThongKeController : Controller
    {
       
        private readonly _2023MyPhamContext _context;
        public ThongKeController(_2023MyPhamContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult GetThongKe(string fromDate, string toDate)
        {
            try
            {
                var query = from o in _context.DonHangs
                            join od in _context.ChiTietDonHangs
                            on o.MaDonHang equals od.MaDonHang
                            join p in _context.SanPhams
                            on od.MaSanPham equals p.MaSanPham
                            select new
                            {
                                NgayDat = o.NgayDatHang.Value.Date,
                                SLBan = od.SoLuong,
                                Gia = od.GiaBan,
                                GiaGoc = p.GiaNhap
                            };
                if (!string.IsNullOrEmpty(fromDate))
                {
                    DateTime startDate = DateTime.ParseExact(fromDate, "dd/MM/yyyy", null);
                    query = query.Where(x => x.NgayDat >= startDate);
                }
                if (!string.IsNullOrEmpty(toDate))
                {
                    DateTime endDate = DateTime.ParseExact(toDate, "dd/MM/yyyy", null);
                    query = query.Where(x => x.NgayDat < endDate);
                }
                var result = query.GroupBy(x => x.NgayDat)
    .Select(X => new
    {
        Date = X.Key,
        TotalBuy = X.Sum(y=>y.SLBan *y.GiaGoc),
        TotalSell = X.Sum(y => y.SLBan * y.Gia),
    }).Select(X => new
    {
        date = X.Date,
        doanhThu = X.TotalSell,
        loiNhuan = X.TotalSell - X.TotalBuy,
    });
                foreach (var item in result)
                {
                    Console.WriteLine($"Date: {item.date}, DoanhThu: {item.doanhThu}, LoiNhuan: {item.loiNhuan}");
                }
                return new JsonResult(new { Data = result });

            }
            catch (Exception ex)
            {
                // Ghi log hoặc xử lý ngoại lệ
                return BadRequest("Đã xảy ra lỗi: " + ex.Message);
            }
        }
    }
}
