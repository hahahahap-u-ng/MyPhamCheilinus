using Microsoft.AspNetCore.Mvc;
using MyPhamCheilinus.Models;
using System.Diagnostics;

namespace MyPhamCheilinus.Controllers
{
    
    
    public class HomeController : Controller
    {
       _2023MyPhamContext db= new _2023MyPhamContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {

            var listDanhMucSanPham= db.DanhMucSanPhams.ToList();
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
    }
}