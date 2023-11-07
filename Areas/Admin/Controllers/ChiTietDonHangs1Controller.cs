using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Models;

namespace MyPhamCheilinus.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ChiTietDonHangs1Controller : Controller
    {
        private readonly _2023MyPhamContext _context;

        public ChiTietDonHangs1Controller(_2023MyPhamContext context)
        {
            _context = context;
        }

        // GET: Admin/ChiTietDonHangs1
        public async Task<IActionResult> Index()
        {
            var _2023MyPhamContext = _context.ChiTietDonHangs.Include(c => c.MaDonHangNavigation).Include(c => c.MaSanPhamNavigation);
            return View(await _2023MyPhamContext.ToListAsync());
        }

        // GET: Admin/ChiTietDonHangs1/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.ChiTietDonHangs == null)
            {
                return NotFound();
            }

            var chiTietDonHang = await _context.ChiTietDonHangs
                .Include(c => c.MaDonHangNavigation)
                .Include(c => c.MaSanPhamNavigation)
                .FirstOrDefaultAsync(m => m.MaDonHang == id);
            if (chiTietDonHang == null)
            {
                return NotFound();
            }

            return View(chiTietDonHang);
        }

        // GET: Admin/ChiTietDonHangs1/Create
        public IActionResult Create()
        {
            ViewData["MaDonHang"] = new SelectList(_context.DonHangs, "MaDonHang", "MaDonHang");
            ViewData["MaSanPham"] = new SelectList(_context.SanPhams, "MaSanPham", "MaSanPham");
            return View();
        }

        // POST: Admin/ChiTietDonHangs1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaDonHang,MaSanPham,SoLuong,GiaBan")] ChiTietDonHang chiTietDonHang)
        {
            if (ModelState.IsValid)
            {
                _context.Add(chiTietDonHang);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaDonHang"] = new SelectList(_context.DonHangs, "MaDonHang", "MaDonHang", chiTietDonHang.MaDonHang);
            ViewData["MaSanPham"] = new SelectList(_context.SanPhams, "MaSanPham", "MaSanPham", chiTietDonHang.MaSanPham);
            return View(chiTietDonHang);
        }

        // GET: Admin/ChiTietDonHangs1/Edit/5
        public async Task<IActionResult> Edit(string id, string id1)
        {
            if (id == null || _context.ChiTietDonHangs == null)
            {
                return NotFound();
            }

            var chiTietDonHang = await _context.ChiTietDonHangs.FindAsync(id, id1);
            if (chiTietDonHang == null)
            {
                return NotFound();
            }
            ViewData["MaDonHang"] = new SelectList(_context.DonHangs, "MaDonHang", "MaDonHang", chiTietDonHang.MaDonHang);
            ViewData["MaSanPham"] = new SelectList(_context.SanPhams, "MaSanPham", "MaSanPham", chiTietDonHang.MaSanPham);
            return View(chiTietDonHang);
        }

        // POST: Admin/ChiTietDonHangs1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, string id1, [Bind("MaDonHang,MaSanPham,SoLuong,GiaBan")] ChiTietDonHang chiTietDonHang)
        {
            if (id != chiTietDonHang.MaDonHang)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(chiTietDonHang);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ChiTietDonHangExists(chiTietDonHang.MaDonHang))
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
            ViewData["MaDonHang"] = new SelectList(_context.DonHangs, "MaDonHang", "MaDonHang", chiTietDonHang.MaDonHang);
            ViewData["MaSanPham"] = new SelectList(_context.SanPhams, "MaSanPham", "MaSanPham", chiTietDonHang.MaSanPham);
            return View(chiTietDonHang);
        }

        // GET: Admin/ChiTietDonHangs1/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.ChiTietDonHangs == null)
            {
                return NotFound();
            }

            var chiTietDonHang = await _context.ChiTietDonHangs
                .Include(c => c.MaDonHangNavigation)
                .Include(c => c.MaSanPhamNavigation)
                .FirstOrDefaultAsync(m => m.MaDonHang == id);
            if (chiTietDonHang == null)
            {
                return NotFound();
            }

            return View(chiTietDonHang);
        }

        // POST: Admin/ChiTietDonHangs1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.ChiTietDonHangs == null)
            {
                return Problem("Entity set '_2023MyPhamContext.ChiTietDonHangs'  is null.");
            }
            var chiTietDonHang = await _context.ChiTietDonHangs.FindAsync(id);
            if (chiTietDonHang != null)
            {
                _context.ChiTietDonHangs.Remove(chiTietDonHang);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ChiTietDonHangExists(string id)
        {
          return (_context.ChiTietDonHangs?.Any(e => e.MaDonHang == id)).GetValueOrDefault();
        }
    }
}
