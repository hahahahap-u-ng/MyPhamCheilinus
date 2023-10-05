using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Models;
using System.Diagnostics;
using X.PagedList;
namespace MyPhamCheilinus.Controllers
{


    public class HomeController : Controller
    {
        _2023MyPhamContext db = new _2023MyPhamContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {

            var listDanhMucSanPham = db.DanhMucSanPhams.ToList();
            return View(listDanhMucSanPham);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }



        public async Task<IActionResult> SanPhamTheoHang(string mahang, int? page, string sortOrder)
        {
            // Số sản phẩm trên mỗi trang
            int pageSize = 9;

            // Lấy danh sách sản phẩm theo mã hàng
            var danhMucSanPhams = db.DanhMucSanPhams
                .Include(x => x.MaHangNavigation) // Include để nạp thông tin về hãng
                .Where(x => x.MaHang == mahang);

            // Lấy tên hãng tương ứng với mã hàng
            var tenHang = danhMucSanPhams.FirstOrDefault()?.MaHangNavigation?.TenHang;

            // Sắp xếp danh sách sản phẩm dựa trên tham số sắp xếp
            switch (sortOrder)
            {
                case "rating":
                    danhMucSanPhams = danhMucSanPhams.OrderBy(x => x.DanhGia);
                    break;
                
                case "price_high":
                    danhMucSanPhams = danhMucSanPhams.OrderByDescending(x => x.Gia);
                    break;
                case "price_low":
                    danhMucSanPhams = danhMucSanPhams.OrderBy(x => x.Gia);
                    break;
                default:
                    danhMucSanPhams = danhMucSanPhams.OrderBy(x => x.TenDanhMuc);
                    break;
            }

            // Sử dụng thư viện PagedList để phân trang
            IPagedList<DanhMucSanPham> pagedList = await danhMucSanPhams.ToPagedListAsync(page ?? 1, pageSize);

            // Đặt giá trị "mahang" vào ViewBag để truyền sang view
            ViewBag.Mahang = mahang;

            // Đặt giá trị tên hãng vào ViewBag
            ViewBag.TenHang = tenHang;

            return View(pagedList);
        }

    }
}
