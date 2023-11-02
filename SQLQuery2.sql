Create database [2023_My_Pham]
Go
USE [2023_My_Pham]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [varchar](50) NOT NULL,
	[MaSanPham] [varchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [float] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLoHang]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLoHang](
	[MaLoHang] [varchar](50) NOT NULL,
	[MaSanPham] [varchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [float] NULL,
 CONSTRAINT [PK_ChiTietLoHang] PRIMARY KEY CLUSTERED 
(
	[MaLoHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTLoai]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTLoai](
	[MaCTLoai] [varchar](50) NOT NULL,
	[TenCTLoai] [nvarchar](250) NULL,
	[MaLoai] [varchar](50) NULL,
 CONSTRAINT [PK_CTLoai] PRIMARY KEY CLUSTERED 
(
	[MaCTLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[MaDanhMuc] [varchar](50) NOT NULL,
	[TenDanhMuc] [nvarchar](250) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaCTLoai] [varchar](50) NULL,
	[MaHang] [varchar](50) NULL,
	[HinhAnh] [nvarchar](250) NULL,
	[DanhGia] [float] NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_DanhMucSanPham] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [varchar](50) NOT NULL,
	[NgayDatHang] [date] NULL,
	[TongTien] [float] NULL,
	[TrangThaiDonHang] [int] NULL,
	[MaKhachHang] [varchar](50) NULL,
	[ThanhToan] [bit] NULL,
	[VanChuyen] [int] NULL,
	[PhiVanChuyen] [float] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [varchar](50) NOT NULL,
	[TenHang] [nvarchar](250) NULL,
	[XuatXu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hang] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [varchar](50) NOT NULL,
	[NgayLap] [date] NULL,
	[TongTien] [float] NULL,
	[MaDonHang] [varchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [varchar](50) NOT NULL,
	[TenKhachHang] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [varchar](50) NOT NULL,
	[TenLoai] [nvarchar](250) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoHang]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoHang](
	[MaLoHang] [varchar](50) NOT NULL,
	[NgayNhan] [date] NULL,
	[MaNhaPP] [varchar](50) NULL,
	[GiaLo] [float] NULL,
 CONSTRAINT [PK_LoHang] PRIMARY KEY CLUSTERED 
(
	[MaLoHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaPhanPhoi]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaPhanPhoi](
	[MaNhaPP] [varchar](50) NOT NULL,
	[TenNhaPP] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [varchar](50) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_NhaPhanPhoi] PRIMARY KEY CLUSTERED 
(
	[MaNhaPP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL
	CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED
	(
		[RoleId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[AccountEmail] [nvarchar](50) NULL,
	[AccountPassword] [nvarchar](50) NULL,
	[Sail] [nchar](6) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[RoleId] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED
	(
		[AccountId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/6/2023 3:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [varchar](50) NOT NULL,
	[TenSanPham] [nvarchar](250) NULL,
	[Mau] [nvarchar](50) NULL,
	[Anh] [nvarchar](max) NULL,
	[Gia] [float] NULL,
	[KhuyenMai] [float] NULL,
	[SLKho] [int] NULL,
	[NgaySX] [date] NULL,
	[LuotMua] [int] NULL,
	[MaDanhMuc] [varchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL001', N'Kem lót', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL002', N'Kem nền', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL003', N'Phấn nền', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL004', N'BB/CC Cream', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL005', N'Cushion', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL006', N'Che khuyết điểm', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL007', N'Má hồng', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL008', N'Phấn phủ', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL009', N'Highlight', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL010', N'Xịt khóa makup', N'L1')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL011', N'Kẻ mắt', N'L2')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL012', N'Kẻ mày', N'L2')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL013', N'Phấn mắt', N'L2')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL014', N'Mascara', N'L2')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL015', N'Son dưỡng
', N'L3')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL016', N'Son kem
', N'L3')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL017', N'Son thỏi
', N'L3')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL018', N'Son bóng
', N'L3')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL019', N'Chì kẻ môi
', N'L3')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL020', N'Kẹp mi', N'L4')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL021', N'Cọ', N'L4')
INSERT [dbo].[CTLoai] ([MaCTLoai], [TenCTLoai], [MaLoai]) VALUES (N'CTL022', N'Mút', N'L4')
GO
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM001', N'Romand Zero Velvet Tint ', N'Son Kem Lì Cực Nhẹ Môi Romand Zero Velvet Tint là son kem lì của thương hiệu Romand với kết cấu velvet xốp mềm cùng bảng màu đa dạng, dễ dùng cho đôi môi lên màu chuẩn, mịn mượt, nổi bật dù bạn ở bất cứ đâu.', N'CTL016', N'H1', N'/images/product/default/Son Kem Lì Cực Nhẹ Môi Romand Zero Velvet Tint.jpg', NULL, 144000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM002', N'Romand Glasting Melting Balm', N'Son Dưỡng Thuần Chay Romand Glasting Melting Balm là son thỏi màu có dưỡng đến từ thương hiệu Romand với tinh chất dầu thực vật thuần chay cùng chất son siêu nhẹ môi có độ dưỡng cao, giúp dưỡng ẩm cho đôi môi mềm mại, căng bóng tự nhiên trong thời gian dài.', N'CTL015', N'H1', N'/images/product/default/Son Dưỡng Dạng Thỏi Có Màu Thuần Chay Dưỡng Ẩm Mềm Môi Romand Glasting Melting Balm.jpg', NULL, 144000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM003', N'Romand Juicy Lasting Tint', N'Son Kem Romand Juicy Lasting Tint được bổ sung vào rất nhiều dưỡng chất nên mang lại khả năng dưỡng ẩm cao, nên khi đánh lên môi không những không làm lộ rảnh môi hay khô môi mà giúp đôi môi bạn giữ được lớp màu bền và mọng hơn suốt nhiều giờ đồng hồ.', N'CTL018', N'H1', N'/images/product/default/Son Kem Tint Romand Juicy Lasting Tint.jpg', NULL, 161500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM005', N'Romand Better Than Eye Palette', N'Bảng Phấn Mắt 10 Ô Siêu Lấp Lánh Romand Better Than Eye Palette là bảng phấn mắt 10 ô đầu tiên của thương hiệu Romand với 5 mức độ màu sắc khác nhau tạo nên đôi mắt chiều sâu cuốn hút mọi ánh nhìn.', N'CTL013', N'H1', N'/images/product/default/Bảng Phấn Mắt 10 Ô Siêu Lấp Lánh Romand Better Than Eye Palette.jpg', NULL, 161500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM006', N'Merzy Soft Touch Lip Tint', N'Son Kem Siêu Lì, Siêu Mịn Môi Merzy Soft Touch Lip Tint là son kem lì đến từ thương hiệu Merzy với chất son tint nhung lì, chứa công thức đàn hồi tạo kết cấu lì bên ngoài và độ ẩm bên trong, giúp bổ sung độ ẩm cho môi, giữ cho đôi môi luôn được căng mướt và dưỡng ẩm cho môi hiệu quả, mang đến cho bạn đôi môi mịn lì tự nhiên, mềm mại lâu trôi suốt cả ngày dài. ', N'CTL016', N'H2', N'/images/product/default/Merzy Soft Touch Lip Tint.jpg', NULL, 119000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM007', N'Merzy The Watery Dew Tint ', N'Son Tint Bóng Dạng Thạch, Bền Màu, Lâu Trôi Merzy The Watery Dew Tint là son tint đến từ thương hiệu Merzy với kết cấu có kết cấu son tint bóng mới với kết cấu dạng thạch, lên màu chuẩn ngay từ lần chạm cọ đầu tiên. Có độ ẩm cao như một lớp màng nước phủ trên bề mặt và độ bám màu tốt, bền màu, duy trì màu sắc lâu trôi chỉ với lần thoa đầu tiên, cho đôi môi luôn được căng mọng, ẩm mịn tràn đầy sức sống. 
', N'CTL018', N'H2', N'/images/product/default/Son Tint Bóng Dạng Thạch, Bền Màu, Lâu Trôi Cho Đôi Môi Căng Mọng, Ẩm Mịn Merzy The Watery Dew Tint.jpg', NULL, 144000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM008', N'Merzy Noir In The Mellow Tint', N'Son Kem Siêu Lì, Mịn Môi Merzy Mellow Tint Red Edition màu M13 Vapor Red là son kem lì đến từ thương hiệu Merzy là phiên bản mới với ma lực thu hút ánh nhìn của màu son đỏ trầm M13, màu son thể hiện một tinh thần mạnh mẽ, lôi cuốn đầy quyến rũ, là nữ hoàng của màu đỏ, màu son không thể thiếu trong tủ đồ makeup của bạn.
', N'CTL016', N'H2', N'/images/product/default/Son Kem Siêu Lì, Mịn Môi Merzy Noir In The Mellow Tint.jpg', NULL, 152000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM009', N'Merzy The First Pen Eyeliner ', N'Bút Kẻ Mắt Nước Chống Trôi Merzy The First Pen Eyeliner là kẻ mắt nước của thương hiệu Merzy với đầu bút mềm mại giúp kẻ đường line một cách dễ dàng tạo đôi mắt sắc sảo, cho đường kẻ chính xác và liền mạch, bền màu, lâu trôi giữ cho đôi mắt thu hút suốt cả ngày dài.', N'CTL011', N'H2', N'/images/product/default/Bút Kẻ Mắt Nước Chống Trôi Merzy The First Pen Eyeliner.jpg', NULL, 120000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM010', N' Merzy Bite The Beat Pen Eyeliner Flex', N'Bút Kẻ Mắt Nước Nét Mảnh, Sắc Nét, Lâu Trôi Merzy Bite The Beat Pen Eyeliner Flex là kẻ mắt nước của thương hiệu Merzy với công thức sợi tơ được nâng cấp cho khả năng lâu trôi cùng đầu bút chắc chắn cho các đường nét kẻ được sắc nét và không bị đứt gãy, màu sắc rõ ràng tạo đôi mắt sắc sảo với đường nét tinh tế lôi cuốn mọi ánh nhìn.', N'CTL016', N'H2', N'/images/product/default/Bút Kẻ Mắt Nước Nét Mảnh, Sắc Nét, Lâu Trôi Merzy Bite The Beat Pen Eyeliner Flex.jpg', NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM011', N'Merzy The First Slim Gel Eyeliner', N'Chì Kẻ Mắt Siêu Mảnh Chống Trôi, Siêu Bền, Siêu Lì Merzy The First Slim Gel Eyeliner là chì kẻ mắt của thương hiệu Merzy với dạng gel có chất mềm mịn, cùng với thiết kế đầu chì siêu mảnh lướt mềm trên mi, giúp bạn dễ dàng vẽ mắt cho đôi mắt to tròn tự nhiên, cùng công nghệ đặc biệt và vô cùng ưu tú không chứa dầu giúp sản phẩm không lem không trôi suốt ngày dài. ', N'CTL011', N'H2', N'/images/product/default/Chì Kẻ Mắt Siêu Mảnh Chống Trôi, Siêu Bền, Siêu Lì Merzy The First Slim Gel Eyeliner.jpg', NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM012', N'Merzy Mood Fit Shadow Palette', N'Bảng Phấn Mắt 4 Ô Merzy Mood Fit Shadow Palette là phấn mắt của thương hiệu Merzy với những tông màu hài hòa, phù hợp với nhiều phong cách trang điểm khác nhau theo tâm trạng, cảm xúc của riêng bạn giúp bạn sẽ không lo lắng về vấn đề trang điểm mắt và vẻ ngoài luôn lung linh, thu hút mọi ánh nhìn ', N'CTL013', N'H2', N'/images/product/default/Bảng Phấn Mắt 4 Ô Merzy Mood Fit Shadow Palette.jpg', NULL, 212500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM013', N'Lemonade Supper Matte Cushion ', N'Supermatte Cushion là phấn nước được nghiên cứu dành cho làn da dầu, da siêu dầu và da dầu mụn nhờ có lớp màng cực kỳ bền vững, kiểm soát dầu thừa hữu hiệu, hạn chế vỡ hay chảy nền do mồ hôi và bã nhờn dư thừa. Do đó, lớp nền của bạn sẽ bền chắc, ít xuống màu và lâu trôi.', N'CTL005', N'H4', N'/images/product/default/Phấn Nước Kiềm Dầu, Che Phủ Tốt Lemonade Supper Matte Cushion.jpg', NULL, 331500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM014', N'Lemonade Supertiger Tigereyes Liner', N'Bút Kẻ Mắt Nước Siêu Mảnh, Sắc Nét, Chống Trôi Hiệu Quả Lemonade Supertiger Tigereyes Liner là kẻ mắt nước đến từ thương hiệu Lemonade có đầu bút siêu mảnh, nhỏ và nhọn rất linh hoạt trong từng thao tác, nét vẽ liền mạch giúp bạn dễ dàng đi êm từng đường kẻ sát chân mi cũng như nhấn nhá đuôi eyeliner sắc sảo, thao tác cực dễ dàng với mọi kiểu vẽ, từ phong cách tự nhiên cho đến mắt mèo cá tính. ', N'CTL011', N'H4', N'/images/product/default/Bút Kẻ Mắt Nước Siêu Mảnh, Sắc Nét, Chống Trôi Hiệu Quả Lemonade Supertiger Tigereyes Liner.jpg', NULL, 195500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM015', N'Matte Addict Concealer ', N'Matte Addict Concealer là dòng kem che khuyết điểm có kết cấu mỏng nhẹ nhưng vẫn che phủ hiệu quả. Nhờ kết cấu màng bền vững giúp kiểm soát dầu thừa, lâu trôi và hạn chế xuống tone', N'CTL006', N'H4', N'/images/product/default/Kem che khuyết điểm kiềm dầu bền màu Matte Addict Concealer.jpg', NULL, 172500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM016', N'Lemonade Want It Got It Dual Eyebrow ', N'Chì Kẻ Mày Hai Đầu Tiện Lợi Cho Lông Mày Hoàn Hảo Lemonade Want It Got It Dual Eyebrow là chì kẻ mày đến từ thương hiệu Lemonade bao gồm đầu chì mềm mại cùng đầu mascara giúp lông mày thêm đều màu, cho hàng lông mày thêm vừa vặn và hoàn hảo, tạo ra những đường mày sắc nét và bền màu trong suốt thời gian dài ', N'CTL012', N'H4', N'/images/product/default/Chì kẻ mày hai đầu Lemonade Want It Got It Dual Eyebrow.jpg', NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM017', N'Lemonade Soaring Mascara', N'Chuốt mi tơi dài lâu trôi Lemonade Soaring Mascara: 
Giữ mi cong
Làm dày và dài mi
Làm tơi mi giúp mi trông tự nhiên, nhẹ nhàng', N'CTL014', N'H4', N'/images/product/default/Chuốt mi tơi dài lâu trôi Lemonade Soaring Mascara.jpg', NULL, 187500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM018', N'Aesthetic Eyeshadow Palette', N'Bảng Phấn Mắt 16 Ô Siêu Mềm Mịn, Bền Màu, Lâu Trôi Lemonade Aesthetic Eyeshadow Palette là bảng phấn mắt đến từ thương hiệu Lemonade  bao gồm 16 ô màu với kết cấu hạt phấn siêu mịn lì cùng với độ lên màu siêu chuẩn, khả năng bền màu và lâu trôi suốt cả ngày dài, bảng màu ấn tượng dễ phối với nhau dễ sử dụng cho nhiều bối cảnh, cho mọi phong cách cá tính và phù hợp cả cho người mới bắt đầu.', N'CTL013', N'H4', N'/images/product/default/Bảng mắt 16 ô Aesthetic Eyeshadow Palette.jpg', NULL, 337500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM019', N'Maybelline Fit Me Matte Poreless Foundation  ', N'Kem Nền Kiềm Dầu, Cho Lớp Nền Mịn Lì Tự Nhiên Maybelline Fit Me Matte Poreless Foundation là kem nền đến từ thương hiệu Maybelline với khả năng kiềm dầu hiệu quả, cùng với độ che phủ hoàn hảo cho lớp nền luôn được mịn lì tự nhiên, bền màu lâu trôi suốt cả ngày dài.', N'CTL002', N'H5', N'/images/product/default/Maybelline New York Lash Sensational Sky High Mascara.jpg', NULL, 200000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM020', N'Maybelline New York Fit Me Fresh Tint ', N'Kem Nền Tươi Mướt, Chống Nắng Bảo Vệ Da Maybelline New York Fit Me Fresh Tint SPF50/PA+++ là kem nền đến từ thương hiệu Maybelline. Với Vitamin C làm lớp nền sáng mỏng nhẹ, giúp da tươi mướt tự nhiên. Nếu bạn theo trường phái makeup-no-makeup mà không gây hại cho da thì Fit Me Fresh Tint chính là sản phẩm dành cho bạn.', N'CTL002', N'H5', N'/images/product/default/Kem Nền Tươi Mướt, Chống Nắng Bảo Vệ Da Maybelline New York Fit Me Fresh Tint.jpg', NULL, 162000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM021', N'Maybelline New York Lash Sensational Sky High Mascara ', N'Mascara Tơi Dài Mi, Cho Mi Cong Dài Tự Nhiên Maybelline New York Lash Sensational Sky High Mascara là mascara đến từ thương hiệu Maybelline  giúp mi tơi dài không giới hạn. Đầu cọ Flex Tower mới giúp chuốt mi cao vút, chạm từng sợi mi, cho 360 độ hiệu quả từ chân đến ngọn, cho bạn một đôi mắt sâu hút hồn và quyến rũ. ', N'CTL014', N'H5', N'/images/product/default/Maybelline New York Lash Sensational Sky High Mascara.jpg', NULL, 171000)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM022', N'Maybelline Fit Me Matte Poreless Powder SPF32 /PA+++ ', N'Phấn Nền Dạng Nén Che Phủ Hoàn Hảo, Kiềm Dầu Hiệu Quả Maybelline Fit Me Matte Poreless Powder SPF32 /PA+++ là phấn nền đến từ thương hiệu Maybelline công thức chứa hạt phấn Micro Power cho lớp nền mịn, kiềm dầu lên đến 16h, mang đến cho bạn một lớp nền hoàn hảo, phủ mịn và không bị bóng dầu.', N'CTL003', N'H5', N'/images/product/default/Phấn Nền Dạng Nén Che Phủ Hoàn Hảo, Kiềm Dầu Hiệu Quả Maybelline Fit Me Matte Poreless Powder 6g - Hộp Tròn.jpg', NULL, 166500)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia]) VALUES (N'DM024', N' Maybelline Baby Skin Pore Eraser ', N'Kem Lót Làm Mịn Da, Che Khuyết Điểm, Se Khít Lỗ Chân Lông Maybelline Baby Skin Pore Eraser 22ml là kem lót thuộc thương hiệu Maybelline có kết cấu gel mịn làm mịn da, se khít lỗ chân lông, hỗ trợ kiềm dầu nhưng vẫn cung cấp đầy đủ độ ẩm cho da và chứa chiết xuất cherry chống lão hóa da.', N'CTL006', N'H5', N'/images/product/default/Kem Lót Làm Mịn Da, Che Khuyết Điểm, Se Khít Lỗ Chân Lông Maybelline Baby Skin Pore Eraser.jpg', NULL, NULL)
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H1', N'Roma&nd', N'Hàn Quốc')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H2', N'Merzy', N'Hàn Quốc')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H3', N'Toofaced', N'Mỹ')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H4', N'Lemonade', N'Việt Nam')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H5', N'Maybeline', N'Mỹ')
GO
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L1', N'Trang điểm mắt')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L2', N'Trang điểm mặt')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L3', N'Trang điểm môi')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L4', N'Khác')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0001', N'12 Anne Shirley', N'941f23', NULL, 160000, 10, 80, CAST(N'2023-05-26' AS Date), 128, N'DM001',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0002', N'13 Berry Cake', N'a62d40', NULL, 160000, 10, 80, CAST(N'2023-05-26' AS Date), 128, N'DM001',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0003', N'14 Pecan Tarte', N'b73f48', NULL, 160000, 10, 20, CAST(N'2023-05-26' AS Date), 180, N'DM001',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0004', N'15 Rusk Rusk', N'822f23', NULL, 160000, 10, 60, CAST(N'2023-05-26' AS Date), 120, N'DM001',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0005', N'08 Coralia', N'f88064', NULL, 160000, 10, 60, CAST(N'2023-05-26' AS Date), 129, N'DM002',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0006', N'09 Peonies', N'ff8ab6', NULL, 160000, 10, 75, CAST(N'2023-05-26' AS Date), 130, N'DM002',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0007', N'10 Nudy Peanut', N'e56f60', NULL, 190000, 15, 20, CAST(N'2023-05-26' AS Date), 140, N'DM003',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0008', N'11 Pink Pumpkin', N'd45e5e', NULL, 190000, 15, 28, CAST(N'2023-05-26' AS Date), 140, N'DM003',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0009', N'12 Cherry Bomb', N'aa132f', NULL, 190000, 15, 28, CAST(N'2023-05-26' AS Date), 145, N'DM003',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0010', N'13 Eat Dotori', N'ae3027', NULL, 190000, 15, 28, CAST(N'2023-05-26' AS Date), 145, N'DM003',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0011', N'01 Pampas Garden', N'01 Pampas Garden', NULL, 190000, 15, 28, CAST(N'2023-01-22' AS Date), 85, N'DM005',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0012', N'02 Magogany Garden', N'02 Magogany Garden', NULL, 388000, 20, 28, CAST(N'2023-01-22' AS Date), 85, N'DM005',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0013', N'03 Rosebud Garden', N'03 Rosebud Garden', NULL, 388000, 20, 17, CAST(N'2023-01-22' AS Date), 99, N'DM005',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0014', N'SL7 Devil Rose', N'792827', NULL, 140000, 15, 41, CAST(N'2023-04-13' AS Date), 288, N'DM006',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0015', N'SL8 Feel Lost', N'7d3638', NULL, 140000, 15, 47, CAST(N'2023-04-13' AS Date), 255, N'DM006',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0016', N'SL9 Nutty Blandy', N'7d3225', NULL, 140000, 15, 28, CAST(N'2023-04-13' AS Date), 211, N'DM006',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0017', N'WD12 Benign Nude', N'9f2626', NULL, 180000, 20, 56, CAST(N'2023-07-19' AS Date), 145, N'DM007',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0018', N'WD13 Soul Of Rose', N'ac3645', NULL, 180000, 20, 62, CAST(N'2023-07-19' AS Date), 141, N'DM007',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0019', N'WD14 With Zest', N'780d1c', NULL, 180000, 20, 62, CAST(N'2023-07-19' AS Date), 141, N'DM007',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0020', N'M2 Jane Chili', N'501318', NULL, 190000, 20, 44, CAST(N'2023-07-19' AS Date), 292, N'DM008',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0022', N'M4 Bian Rose', N'4d1c1f', NULL, 190000, 20, 40, CAST(N'2023-07-19' AS Date), 290, N'DM008',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0023', N'M13 Vapor Red', N'57060f', NULL, 190000, 20, 11, CAST(N'2023-07-19' AS Date), 341, N'DM008',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0024', N'FP1 Black', N'010101', NULL, 190000, 20, 25, CAST(N'2023-02-19' AS Date), 220, N'DM009',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0025', N'FP2 Deep Brown', N'412618', NULL, 150000, 20, 33, CAST(N'2023-02-19' AS Date), 210, N'DM009',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0026', N'FP3 Milk Brown', N'744324', NULL, 150000, 20, 33, CAST(N'2023-02-19' AS Date), 210, N'DM009',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0027', N'S1 Amusing Rose', N'S1 Amusing Rose', NULL, 250000, 15, 33, CAST(N'2023-02-19' AS Date), 157, N'DM012',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0028', N'S2 Joyful Coral', N'S2 Joyful Coral', NULL, 250000, 15, 22, CAST(N'2023-02-19' AS Date), 182, N'DM012',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0029', N'S3 Drowsy Nude', N'S3 Drowsy Nude', NULL, 250000, 15, 22, CAST(N'2023-02-19' AS Date), 182, N'DM012',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0030', N'01.Light', N'01.Light', NULL, 390000, 15, 22, CAST(N'2023-02-19' AS Date), 220, N'DM013',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0031', N'02.Medium Light', N'02.Medium Light', NULL, 390000, 15, 33, CAST(N'2023-02-19' AS Date), 230, N'DM013',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0032', N'03.Medium', N'03.Mediumt', NULL, 390000, 15, 45, CAST(N'2023-02-19' AS Date), 201, N'DM013',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0033', N'01 BLACK', N'000000', NULL, 230000, 15, 11, CAST(N'2023-02-19' AS Date), 340, N'DM014',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0034', N'02 BROWN', N'7f3d22', NULL, 230000, 15, 1, CAST(N'2023-02-19' AS Date), 359, N'DM014',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0035', N'A01. Da sáng', N'A01. Da sáng', NULL, 230000, 25, 13, CAST(N'2023-02-19' AS Date), 152, N'DM015',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0036', N'A02. Da Trung Bình Sáng', N'A02. Da Trung Bình Sáng', NULL, 230000, 25, 13, CAST(N'2023-02-19' AS Date), 152, N'DM015',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0037', N'A03. Da Trung Bình', N'A03. Da Trung Bình', NULL, 230000, 25, 21, CAST(N'2023-02-19' AS Date), 122, N'DM015',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0039', N'A00. DA TRẮNG SÁNG', N'A00. DA TRẮNG SÁNG', NULL, 230000, 25, 23, CAST(N'2023-02-19' AS Date), 120, N'DM015',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0040', N' SOARING MASCARA', N' SOARING MASCARA', NULL, 250000, 25, 2, CAST(N'2023-08-19' AS Date), 198, N'DM017',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0041', N' Aesthetic Eyeshadow Palette', N' Aesthetic Eyeshadow Palette', NULL, 450000, 25, 11, CAST(N'2023-01-02' AS Date), 339, N'DM018',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0042', N'112 NATURAL IVORY', N'f5d0c0', NULL, 250000, 20, 7, CAST(N'2023-04-23' AS Date), 393, N'DM019',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0043', N'115 IVORY', N'ffd9c9', NULL, 250000, 20, 9, CAST(N'2023-04-23' AS Date), 391, N'DM019',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0044', N'120 CLASSIC IVORY', N'fbd6bc', NULL, 250000, 20, 11, CAST(N'2023-04-23' AS Date), 389, N'DM019',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0045', N'01', N'f3c59e', NULL, 180000, 10, 22, CAST(N'2023-09-01' AS Date), 278, N'DM020',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0046', N'02', N'eec8a5', NULL, 180000, 10, 38, CAST(N'2023-09-01' AS Date), 262, N'DM020',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0047', N'03', N'e8bea8', NULL, 180000, 10, 31, CAST(N'2023-09-01' AS Date), 269, N'DM020',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0048', N'Maybelline New York Lash Sensational Sky High Mascara ', N'Mascara', NULL, 190000, 10, 28, CAST(N'2023-09-01' AS Date), 172, N'DM021',0,0,0,0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc],[BestSellers],[HomeFlag],[MoTa],[Active]) VALUES (N'SP0050', N'120 Classic Ivory', N'efcbb0', NULL, 185000, 10, 52, CAST(N'2023-01-29' AS Date), 148, N'DM022',0,0,0,0)
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietLoHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoHang_LoHang] FOREIGN KEY([MaLoHang])
REFERENCES [dbo].[LoHang] ([MaLoHang])
GO
ALTER TABLE [dbo].[ChiTietLoHang] CHECK CONSTRAINT [FK_ChiTietLoHang_LoHang]
GO
ALTER TABLE [dbo].[ChiTietLoHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoHang_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietLoHang] CHECK CONSTRAINT [FK_ChiTietLoHang_SanPham]
GO
ALTER TABLE [dbo].[CTLoai]  WITH CHECK ADD  CONSTRAINT [FK_CTLoai_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[CTLoai] CHECK CONSTRAINT [FK_CTLoai_Loai]
GO
ALTER TABLE [dbo].[DanhMucSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DanhMucSanPham_CTLoai] FOREIGN KEY([MaCTLoai])
REFERENCES [dbo].[CTLoai] ([MaCTLoai])
GO
ALTER TABLE [dbo].[DanhMucSanPham] CHECK CONSTRAINT [FK_DanhMucSanPham_CTLoai]
GO
ALTER TABLE [dbo].[DanhMucSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DanhMucSanPham_Hang] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[DanhMucSanPham] CHECK CONSTRAINT [FK_DanhMucSanPham_Hang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_DonHang]
GO
ALTER TABLE [dbo].[LoHang]  WITH CHECK ADD  CONSTRAINT [FK_LoHang_NhaPhanPhoi] FOREIGN KEY([MaNhaPP])
REFERENCES [dbo].[NhaPhanPhoi] ([MaNhaPP])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[LoHang] CHECK CONSTRAINT [FK_LoHang_NhaPhanPhoi]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMucSanPham] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucSanPham] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMucSanPham]
GO

--Trigger
Create TRIGGER [dbo].[UpdateGiaDanhMucSanPham]
ON [dbo].[SanPham]
AFTER UPDATE
AS
BEGIN
    -- Cập nhật trường Gia trong bảng DanhMucSanPham
    UPDATE DanhMucSanPham
    SET Gia = (
        SELECT MIN(SanPham.Gia * (100 - SanPham.KhuyenMai) / 100)
        FROM SanPham
        WHERE SanPham.MaDanhMuc = DanhMucSanPham.MaDanhMuc
    )
    FROM DanhMucSanPham
    WHERE EXISTS (
        SELECT 1
        FROM inserted
        WHERE inserted.MaDanhMuc = DanhMucSanPham.MaDanhMuc
    );
END;