using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using AspNetCoreHero.ToastNotification.Notyf;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Models;
using PagedList.Core;

namespace MyPhamCheilinus.Areas.Admin.Controllers
{
    [Area("Admin")]
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
   
        public IActionResult Index(int? page, string? MaKH ="")
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;

            IQueryable<DonHang> query = _context.DonHangs
                .AsNoTracking().Include(dh => dh.ChiTietDonHangs).ThenInclude(c => c.MaSanPhamNavigation)
                .Include(x => x.MaKhachHangNavigation);

           

            var lsDonHangs = query.OrderByDescending(x => x.NgayDatHang);

            PagedList<DonHang> models = new PagedList<DonHang>(lsDonHangs, pageNumber, pageSize);

            ViewBag.CurrentPage = pageNumber;

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

        // GET: Admin/DonHangs/Details/5
        public async Task<IActionResult> Details(string id)
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
        public async Task<IActionResult> Edit(string id)
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
        public async Task<IActionResult> Edit(string id, [Bind("MaDonHang,TongTien,TrangThaiDonHang,MaKhachHang,ThanhToan,VanChuyen,PhiVanChuyen,NgayDatHang")] DonHang donHang)
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
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKhachHang"] = new SelectList(_context.KhachHangs, "MaKhachHang", "MaKhachHang", donHang.MaKhachHang);
            return View(donHang);
        }

        // GET: Admin/DonHangs/Delete/5
        public async Task<IActionResult> Delete(string id)
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
        public async Task<IActionResult> DeleteConfirmed(string id)
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
            return RedirectToAction(nameof(Index));
        }

        private bool DonHangExists(string id)
        {
          return (_context.DonHangs?.Any(e => e.MaDonHang == id)).GetValueOrDefault();
        }
    }
}
