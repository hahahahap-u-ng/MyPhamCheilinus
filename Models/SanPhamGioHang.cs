namespace MyPhamCheilinus.Models
{
    public class SanPhamGioHang
    {
        public string MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public double? Gia { get; set; }
        public double? Tong
        {
            get { return SoLuong * Gia; }
        }
        public string Anh {get; set;}

        public SanPhamGioHang()
        {

        }

        public SanPhamGioHang(SanPham sanpham)
        {
            if (sanpham != null)
            {
                MaSanPham = sanpham.MaSanPham;
                TenSanPham = sanpham.TenSanPham;
                Gia = sanpham.Gia;
                SoLuong = 1;
                Anh = sanpham.Anh;
            }
        }





    }
}
