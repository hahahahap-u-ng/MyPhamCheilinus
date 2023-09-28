using System;
using System.Collections.Generic;

namespace MyPhamCheilinus.Models;

public partial class SanPham
{
    public string MaSanPham { get; set; } = null!;

    public string? TenSanPham { get; set; }

    public string? Mau { get; set; }

    public string? Anh { get; set; }

    public double? Gia { get; set; }

    public double? KhuyenMai { get; set; }

    public int? Slkho { get; set; }

    public DateTime? NgaySx { get; set; }

    public int? LuotMua { get; set; }

    public string? MaDanhMuc { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual ICollection<ChiTietLoHang> ChiTietLoHangs { get; set; } = new List<ChiTietLoHang>();

    public virtual DanhMucSanPham? MaDanhMucNavigation { get; set; }
}
