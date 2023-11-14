using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using AspNetCoreHero.ToastNotification.Notyf;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MyPhamCheilinus.Models;
using PagedList.Core;

namespace MyPhamCheilinus.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin,Employee")]
    public class DonHangsController : Controller
    {
        private readonly _2023MyPhamContext _context;
        public INotyfService _notifyService { get; }

        public DonHangsController(_2023MyPhamContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        // GET: Admin/DonHangs
   
        public IActionResult Index(int? page, string? MaID = null, string search = "", double? minPrice = null, double? maxPrice = null)
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;

            IQueryable<DonHang> query = _context.DonHangs
                .AsNoTracking().Include(dh => dh.ChiTietDonHangs).ThenInclude(c => c.MaSanPhamNavigation)
                .Include(x => x.MaKhachHangNavigation);
            if (!string.IsNullOrEmpty(MaID))
            {
                query = query.Where(x => x.MaDonHang == MaID);
            }
          

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(x => x.MaKhachHangNavigation.TenKhachHang.Contains(search));
            }

            if (minPrice != null)
            {
                query = query.Where(x => x.TongTien >= minPrice);
            }

            if (maxPrice != null)
            {
                query = query.Where(x => x.TongTien <= maxPrice);
            }



            var lsDonHangs = query.OrderByDescending(x => x.NgayDatHang);

            PagedList<DonHang> models = new PagedList<DonHang>(lsDonHangs, pageNumber, pageSize);

            ViewBag.CurrentMaID = MaID;
            ViewBag.CurrentPage = pageNumber;
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentMinPrice = minPrice;
            ViewBag.CurrentMaxPrice = maxPrice;

            //ViewData["KhachHang"] = new SelectList(_context.DanhMucSanPhams, "MaKhachHang", "TenKhachHang", MaKH);

            return View(models);
        }

        public IActionResult ChiTietDonHang()
        {
            var donHangList = _context.DonHangs
                .AsNoTracking()
               .Include(dh => dh.ChiTietDonHangs)
               .ThenInclude(c => c.MaSanPhamNavigation)
                .Include(x => x.MaKhachHangNavigation)
           .ToList();

            return View(donHangList);
        }
        [HttpPost]
        public IActionResult UpdateStatus(string donHangId, int trangThaiDonHang)
        {
            var donHang = _context.ChiTietDonHangs.Find(donHangId);
            if (donHang == null)
            {
                return NotFound();
            }

            donHang.MaDonHangNavigation.TrangThaiDonHang = trangThaiDonHang;
            _context.SaveChanges();

            return Ok();
        }

        public IActionResult Filtter( string search, double? minPrice, double? maxPrice, string? MaID)
        {
            var url = "/Admin/SanPhams?";
            if (MaID != null)
            {
                url += $"MaID={MaID}&";
            }

            if (!string.IsNullOrEmpty(search))
            {
                url += $"search={search}&";
            }

            if (minPrice != null)
            {
                url += $"minPrice={minPrice}&";
            }

            if (maxPrice != null)
            {
                url += $"maxPrice={maxPrice}&";
            }

            // Loại bỏ dấu '&' cuối cùng nếu có
            if (url.EndsWith("&"))
            {
                url = url.Substring(0, url.Length - 1);
            }

            return Json(new { status = "success", redirectUrl = url });
        }


        // GET: Admin/DonHangs/Details/5
        public async Task<IActionResult> Details(string id, int? page, string? MaID, string? search, double? minPrice, double? maxPrice)
        {
            if (id == null || _context.DonHangs == null)
            {
                return NotFound();
            }

            var donHangs = await _context.DonHangs
               .AsNoTracking()
               .Include(dh => dh.ChiTietDonHangs)
               .ThenInclude(c => c.MaSanPhamNavigation)
                .Include(x => x.MaKhachHangNavigation)
                .FirstOrDefaultAsync(m => m.MaDonHang == id);
            if (donHangs == null)
            {
                return NotFound();
            }
            var donhang = _context.DonHangs
                .AsNoTracking()
                .Include(dh => dh.ChiTietDonHangs)
                .ThenInclude(c => c.MaSanPhamNavigation)
                .Include(x => x.MaKhachHangNavigation)
                .AsNoTracking().Where(x => x.MaDonHang == donHangs.MaDonHang)
                .OrderBy(x => x.MaDonHang).ToList();
            ViewBag.ChiTiet = donhang;
            //string fulladdress = $"{chitietdonhang.Ma}"
            return View(donHangs);
        }

        // GET: Admin/DonHangs/Create
        public IActionResult Create()
        {
            ViewData["MaKhachHang"] = new SelectList(_context.KhachHangs, "MaKhachHang", "MaKhachHang");
            return View();
        }

        // POST: Admin/DonHangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaDonHang,TongTien,TrangThaiDonHang,MaKhachHang,ThanhToan,VanChuyen,PhiVanChuyen,NgayDatHang")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                _context.Add(donHang);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKhachHang"] = new SelectList(_context.KhachHangs, "MaKhachHang", "MaKhachHang", donHang.MaKhachHang);
            return View(donHang);
        }

        // GET: Admin/DonHangs/Edit/5
        public async Task<IActionResult> Edit(string id, int? page, string? MaID, string? search, double? minPrice, double? maxPrice)
        {
            if (id == null || _context.DonHangs == null)
            {
                return NotFound();
            }

            var donHang = await _context.DonHangs.FindAsync(id);
            if (donHang == null)
            {
                return NotFound();
            }
            ViewData["MaKhachHang"] = new SelectList(_context.KhachHangs, "MaKhachHang", "MaKhachHang", donHang.MaKhachHang);
            return View(donHang);
        }

        // POST: Admin/DonHangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, int? page, string? MaID, string? search, double? minPrice, double? maxPrice, [Bind("MaDonHang,TongTien,TrangThaiDonHang,MaKhachHang,ThanhToan,VanChuyen,PhiVanChuyen,NgayDatHang")] DonHang donHang)
        {
            if (id != donHang.MaDonHang)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(donHang);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DonHangExists(donHang.MaDonHang))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index", new { page = page, MaID = MaID, search = search, minPrice = minPrice, maxPrice = maxPrice });
            }
            ViewData["MaKhachHang"] = new SelectList(_context.KhachHangs, "MaKhachHang", "MaKhachHang", donHang.MaKhachHang);
            return View(donHang);
        }

        // GET: Admin/DonHangs/Delete/5
        public async Task<IActionResult> Delete(string id, int? page, string? MaID, string? search, double? minPrice, double? maxPrice)
        {
            if (id == null || _context.DonHangs == null)
            {
                return NotFound();
            }

            var donHang = await _context.DonHangs
                .Include(d => d.MaKhachHangNavigation)
                .FirstOrDefaultAsync(m => m.MaDonHang == id);
            if (donHang == null)
            {
                return NotFound();
            }

            return View(donHang);
        }

        // POST: Admin/DonHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id, int? page, string? MaID, string? search, double? minPrice, double? maxPrice)
        {
            if (_context.DonHangs == null)
            {
                return Problem("Entity set '_2023MyPhamContext.DonHangs'  is null.");
            }
            var donHang = await _context.DonHangs.FindAsync(id);
            if (donHang != null)
            {
                _context.DonHangs.Remove(donHang);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", new { page = page, MaID = MaID, search = search, minPrice = minPrice, maxPrice = maxPrice });
        }

        private bool DonHangExists(string id)
        {
          return (_context.DonHangs?.Any(e => e.MaDonHang == id)).GetValueOrDefault();
        }
    }
}
