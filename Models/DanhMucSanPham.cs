using System;
using System.Collections.Generic;

namespace MyPhamCheilinus.Models;

public partial class DanhMucSanPham
{
    public string MaDanhMuc { get; set; } = null!;

    public string? TenDanhMuc { get; set; }

    public string? MoTa { get; set; }

    public string? MaCtloai { get; set; }

    public string? MaHang { get; set; }

    public string? HinhAnh { get; set; }

    public string? ListHinhAnh { get; set; }

    public virtual Ctloai? MaCtloaiNavigation { get; set; }

    public virtual Hang? MaHangNavigation { get; set; }

    public virtual ICollection<SanPham> SanPhams { get; set; } = new List<SanPham>();
}
