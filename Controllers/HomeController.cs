using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Models;
using System.Diagnostics;
using X.PagedList;
using static MyPhamCheilinus.Controllers.HomeController;

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

        public async Task<IActionResult> DanhMucSanPham( int? page)
        {
            // Số sản phẩm trên mỗi trang
            int pageSize =9 ;
 
            var danhMucSanPhams = db.DanhMucSanPhams.ToList();

            // Sử dụng thư viện PagedList để phân trang
            IPagedList<DanhMucSanPham> pagedList = await danhMucSanPhams.ToPagedListAsync(page ?? 1, pageSize);

            return View(pagedList);
        }
        [HttpGet]

        public IActionResult FilterByHangs(string[] selectedHangs)
        {
            List<DanhMucSanPham> filteredDanhMucSanPhams = db.DanhMucSanPhams
                .Where(d => selectedHangs.Contains(d.MaHang))
                .ToList();
            return PartialView("_ReturnHangs", filteredDanhMucSanPhams);
        }
        [HttpGet]
        public IActionResult FilterByPriceAndTag(double minPrice, double maxPrice, string tag, string click)
        {
            // Bắt đầu với tất cả sản phẩm
            IQueryable<DanhMucSanPham> filteredSanPhams = db.DanhMucSanPhams;

            // Lọc sản phẩm dựa trên khoảng giá
            filteredSanPhams = filteredSanPhams.Where(p => p.Gia >= minPrice && p.Gia <= maxPrice);

            // Lọc sản phẩm dựa trên thẻ (tag)
            if (!string.IsNullOrEmpty(tag))
            {
                filteredSanPhams = filteredSanPhams.Where(p => p.TenDanhMuc.Contains(tag));
            }
            if (!string.IsNullOrEmpty(click))
            {
                filteredSanPhams = filteredSanPhams.Where(p => p.MaHang.Contains(click));
            }

            // Lấy danh sách sản phẩm đã lọc
            var filteredProducts = filteredSanPhams.ToList();

            // Trả về kết quả dưới dạng partial view
            return PartialView("_ReturnHangs", filteredProducts);
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

            // Sử dụng thư viện PagedList để phân trang
            IPagedList<DanhMucSanPham> pagedList = await danhMucSanPhams.ToPagedListAsync(page ?? 1, pageSize);

            // Đặt giá trị "mahang" vào ViewBag để truyền sang view
            ViewBag.Mahang = mahang;

            // Đặt giá trị tên hãng vào ViewBag
            ViewBag.TenHang = tenHang;

            return View(pagedList);
        }


        public IActionResult SanPhamTheoDanhMuc(string maDanhMuc)
        {
            var danhMuc = db.DanhMucSanPhams.FirstOrDefault(d => d.MaDanhMuc == maDanhMuc);
            var danhMucList = db.DanhMucSanPhams.Where(d => d.MaCtloai == danhMuc.MaCtloai).ToList();

            if (danhMuc == null)
            {
                return NotFound(); // Xử lý trường hợp danh mục không tồn tại
            }

            var sanPhamList = db.SanPhams.Where(s => s.MaDanhMuc == maDanhMuc).ToList();

            // Lấy danh sách màu sắc duy nhất từ danh sách sản phẩm
            var mauSanPhamList = sanPhamList.Select(s => s.Mau).Distinct().ToList();

            ViewData["DanhMuc"] = danhMuc;
            ViewData["DanhMucList"] = danhMucList;
            ViewData["MauSanPhamList"] = mauSanPhamList; // Truyền danh sách màu vào view
            return View(sanPhamList);
        }

        




    }


}
