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

       
        [HttpGet]
        public IActionResult Filter(string mahang, List<string> selectedPrices, List<string> selectedCtLoais)
        {
            // Khởi tạo một truy vấn ban đầu với tất cả dữ liệu
            var query = db.DanhMucSanPhams.AsQueryable();

            // Áp dụng bộ lọc cho sản phẩm theo mã hàng
            query = query.Where(d => d.MaHang == mahang);

            // Áp dụng bộ lọc cho giá
            if (selectedPrices != null && selectedPrices.Count > 0)
            {
                foreach (var priceRange in selectedPrices)
                {
                    if (priceRange == "all")
                    {
                        // Không áp dụng bộ lọc giá nếu chọn "Tất cả"
                        continue;
                    }

                    // Chia chuỗi giá thành giá tối thiểu và tối đa
                    var priceBounds = priceRange.Split('-');
                    if (priceBounds.Length == 2 && double.TryParse(priceBounds[0], out double minPrice) && double.TryParse(priceBounds[1], out double maxPrice))
                    {
                        query = query.Where(d => d.Gia >= minPrice && d.Gia <= maxPrice);
                    }
                }
            }

            // Áp dụng bộ lọc cho Chi tiết loại (MaCtLoai)
            if (selectedCtLoais != null && selectedCtLoais.Count > 0)
            {
                query = query.Where(d => selectedCtLoais.Contains(d.MaCtloai));
            }

            // Thực hiện truy vấn và lấy kết quả
            var filteredData = query.ToList();

            // Trả về kết quả dưới dạng PartialView
            return PartialView("_ReturnHangs", filteredData);
        }

    }
}
