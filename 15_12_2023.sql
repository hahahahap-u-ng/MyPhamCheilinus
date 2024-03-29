CREATE DATABASE [2023_My_Pham];

USE [2023_My_Pham]

/****** Object:  UserDefinedTableType [dbo].[DeletedData]    Script Date: 15/12/2023 9:09:50 pm ******/
CREATE TYPE [dbo].[DeletedData] AS TABLE(
	[MaHang] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15/12/2023 9:09:50 pm ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 15/12/2023 9:09:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](12) NULL,
	[AccountEmail] [nvarchar](50) NULL,
	[AccountPassword] [nvarchar](50) NULL,
	[Salt] [nchar](6) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[NgaySinh] [datetime] NULL,
	[AnhDaiDien] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[GioiTinh] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[ChiTietLoHang]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[CTLoai]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 15/12/2023 9:09:51 pm ******/
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
	[CachDung] [nvarchar](max) NULL,
	[ChiTiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_DanhMucSanPham] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 15/12/2023 9:09:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](20) NULL,
	[Slug] [nvarchar](100) NULL,
	[NameWithType] [nvarchar](255) NULL,
	[PathWithType] [nvarchar](255) NULL,
	[ParentCode] [int] NULL,
	[Levels] [int] NULL,
 CONSTRAINT [PK_DiaChi] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 15/12/2023 9:09:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [varchar](50) NOT NULL,
	[TongTien] [float] NULL,
	[TrangThaiDonHang] [int] NULL,
	[MaKhachHang] [int] NULL,
	[ThanhToan] [bit] NULL,
	[VanChuyen] [int] NULL,
	[PhiVanChuyen] [float] NULL,
	[NgayDatHang] [datetime] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 15/12/2023 9:09:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[LoHang]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[NhaPhanPhoi]    Script Date: 15/12/2023 9:09:51 pm ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 15/12/2023 9:09:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 15/12/2023 9:09:51 pm ******/
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
	[NgaySX] [datetime] NULL,
	[LuotMua] [int] NULL,
	[MaDanhMuc] [varchar](50) NULL,
	[HomeFlag] [bit] NOT NULL,
	[BestSellers] [bit] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[NgaySua] [datetime] NULL,
	[GiaNhap] [float] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [Phone], [AccountEmail], [AccountPassword], [Salt], [Active], [FullName], [RoleId], [LastLogin], [CreateDate], [NgaySinh], [AnhDaiDien], [DiaChi], [GioiTinh]) VALUES (29, N'0832423666', N'admin@gmail.com', N'5ecf5d5d9458ec7ba170bf83fb165095', N'21^5] ', 1, N'admin', 19, CAST(N'2023-12-15T13:45:33.897' AS DateTime), CAST(N'2023-12-15T10:02:46.333' AS DateTime), CAST(N'2000-11-11T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Account] ([AccountId], [Phone], [AccountEmail], [AccountPassword], [Salt], [Active], [FullName], [RoleId], [LastLogin], [CreateDate], [NgaySinh], [AnhDaiDien], [DiaChi], [GioiTinh]) VALUES (32, N'0832523666', N'tai@gmail.com', N'd9e7e1e7dd95252a6e2ba03c4e4c9a47', N')]0i6 ', 1, N'Trịnh Viết Tài', 21, CAST(N'2023-12-15T12:03:05.347' AS DateTime), CAST(N'2023-12-15T10:54:45.000' AS DateTime), CAST(N'2001-12-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Account] ([AccountId], [Phone], [AccountEmail], [AccountPassword], [Salt], [Active], [FullName], [RoleId], [LastLogin], [CreateDate], [NgaySinh], [AnhDaiDien], [DiaChi], [GioiTinh]) VALUES (33, N'0862354888', N'phuong@gmail.com', N'3da75acebd2e7702c524330b97aac8a2', N'&*%v6 ', 0, N'Nguyễn Thị Hà Phương', 20, NULL, CAST(N'2023-12-15T10:59:58.000' AS DateTime), CAST(N'2002-02-20T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Account] ([AccountId], [Phone], [AccountEmail], [AccountPassword], [Salt], [Active], [FullName], [RoleId], [LastLogin], [CreateDate], [NgaySinh], [AnhDaiDien], [DiaChi], [GioiTinh]) VALUES (37, N'0832435666', N'cuong@gmail.com', N'1b5478bceb67f79a521ae82eaeb6b772', N'o]]8k ', 1, N'Nguyễn Đức Cường', 20, CAST(N'2023-12-15T13:46:55.807' AS DateTime), CAST(N'2023-12-15T12:57:23.783' AS DateTime), CAST(N'2002-02-11T00:00:00.000' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH12813', N'SP0005', 1, 160000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH12813', N'SP0006', 1, 160000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH20041', N'SP0003', 1, 160000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH21248', N'SP0004', 1, 160000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH21248', N'SP0006', 1, 160000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH21248', N'SP0010', 1, 172000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH50015', N'SP0006', 1, 160000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH50015', N'SP0010', 1, 172000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (N'DH62102', N'SP0003', 1, 160000)
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
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM001', N'Romand Zero Velvet Tint ', N'Son Kem Lì Cực Nhẹ Môi Romand Zero Velvet Tint là son kem lì của thương hiệu Romand với kết cấu velvet xốp mềm cùng bảng màu đa dạng, dễ dùng cho đôi môi lên màu chuẩn, mịn mượt, nổi bật dù bạn ở bất cứ đâu.', N'CTL016', N'H1', N'Son Kem Lì Cực Nhẹ Môi Romand Zero Velvet Tint.jpg', NULL, 144000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM002', N'Romand Glasting Melting Balm', N'Son Dưỡng Thuần Chay Romand Glasting Melting Balm là son thỏi màu có dưỡng đến từ thương hiệu Romand với tinh chất dầu thực vật thuần chay cùng chất son siêu nhẹ môi có độ dưỡng cao, giúp dưỡng ẩm cho đôi môi mềm mại, căng bóng tự nhiên trong thời gian dài.', N'CTL015', N'H1', N'Son Dưỡng Dạng Thỏi Có Màu Thuần Chay Dưỡng Ẩm Mềm Môi Romand Glasting Melting Balm.jpg', NULL, 144000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM003', N'Romand Juicy Lasting Tint', N'Son Kem Romand Juicy Lasting Tint được bổ sung vào rất nhiều dưỡng chất nên mang lại khả năng dưỡng ẩm cao, nên khi đánh lên môi không những không làm lộ rảnh môi hay khô môi mà giúp đôi môi bạn giữ được lớp màu bền và mọng hơn suốt nhiều giờ đồng hồ.', N'CTL018', N'H1', N'Son Kem Tint Romand Juicy Lasting Tint.jpg', NULL, 146200, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM005', N'Romand Better Than Eye Palette', N'Bảng Phấn Mắt 10 Ô Siêu Lấp Lánh Romand Better Than Eye Palette là bảng phấn mắt 10 ô đầu tiên của thương hiệu Romand với 5 mức độ màu sắc khác nhau tạo nên đôi mắt chiều sâu cuốn hút mọi ánh nhìn.', N'CTL013', N'H1', N'Bảng Phấn Mắt 10 Ô Siêu Lấp Lánh Romand Better Than Eye Palette.jpg', NULL, 135150, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM006', N'Merzy Soft Touch Lip Tint', N'Son Kem Siêu Lì, Siêu Mịn Môi Merzy Soft Touch Lip Tint là son kem lì đến từ thương hiệu Merzy với chất son tint nhung lì, chứa công thức đàn hồi tạo kết cấu lì bên ngoài và độ ẩm bên trong, giúp bổ sung độ ẩm cho môi, giữ cho đôi môi luôn được căng mướt và dưỡng ẩm cho môi hiệu quả, mang đến cho bạn đôi môi mịn lì tự nhiên, mềm mại lâu trôi suốt cả ngày dài. ', N'CTL016', N'H2', N'Merzy Soft Touch Lip Tint.jpg', NULL, 119000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM007', N'Merzy The Watery Dew Tint ', N'Son Tint Bóng Dạng Thạch, Bền Màu, Lâu Trôi Merzy The Watery Dew Tint là son tint đến từ thương hiệu Merzy với kết cấu có kết cấu son tint bóng mới với kết cấu dạng thạch, lên màu chuẩn ngay từ lần chạm cọ đầu tiên. Có độ ẩm cao như một lớp màng nước phủ trên bề mặt và độ bám màu tốt, bền màu, duy trì màu sắc lâu trôi chỉ với lần thoa đầu tiên, cho đôi môi luôn được căng mọng, ẩm mịn tràn đầy sức sống. ', N'CTL018', N'H2', N'Son Tint Bóng Dạng Thạch, Bền Màu, Lâu Trôi Cho Đôi Môi Căng Mọng, Ẩm Mịn Merzy The Watery Dew Tint.jpg', NULL, 140000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM008', N'Merzy Noir In The Mellow Tint', N'Son Kem Siêu Lì, Mịn Môi Merzy Mellow Tint Red Edition màu M13 Vapor Red là son kem lì đến từ thương hiệu Merzy là phiên bản mới với ma lực thu hút ánh nhìn của màu son đỏ trầm M13, màu son thể hiện một tinh thần mạnh mẽ, lôi cuốn đầy quyến rũ, là nữ hoàng của màu đỏ, màu son không thể thiếu trong tủ đồ makeup của bạn.
', N'CTL016', N'H2', N'Son Kem Siêu Lì, Mịn Môi Merzy Noir In The Mellow Tint.jpg', NULL, 152000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM009', N'Merzy The First Pen Eyeliner ', N'Bút Kẻ Mắt Nước Chống Trôi Merzy The First Pen Eyeliner là kẻ mắt nước của thương hiệu Merzy với đầu bút mềm mại giúp kẻ đường line một cách dễ dàng tạo đôi mắt sắc sảo, cho đường kẻ chính xác và liền mạch, bền màu, lâu trôi giữ cho đôi mắt thu hút suốt cả ngày dài.', N'CTL011', N'H2', N'Bút Kẻ Mắt Nước Chống Trôi Merzy The First Pen Eyeliner.jpg', NULL, 120000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM010', N' Merzy Bite The Beat Pen Eyeliner Flex', N'Bút Kẻ Mắt Nước Nét Mảnh, Sắc Nét, Lâu Trôi Merzy Bite The Beat Pen Eyeliner Flex là kẻ mắt nước của thương hiệu Merzy với công thức sợi tơ được nâng cấp cho khả năng lâu trôi cùng đầu bút chắc chắn cho các đường nét kẻ được sắc nét và không bị đứt gãy, màu sắc rõ ràng tạo đôi mắt sắc sảo với đường nét tinh tế lôi cuốn mọi ánh nhìn.', N'CTL016', N'H2', N'Bút Kẻ Mắt Nước Nét Mảnh, Sắc Nét, Lâu Trôi Merzy Bite The Beat Pen Eyeliner Flex.jpg', NULL, 189000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM011', N'Merzy The First Slim Gel Eyeliner', N'Chì Kẻ Mắt Siêu Mảnh Chống Trôi, Siêu Bền, Siêu Lì Merzy The First Slim Gel Eyeliner là chì kẻ mắt của thương hiệu Merzy với dạng gel có chất mềm mịn, cùng với thiết kế đầu chì siêu mảnh lướt mềm trên mi, giúp bạn dễ dàng vẽ mắt cho đôi mắt to tròn tự nhiên, cùng công nghệ đặc biệt và vô cùng ưu tú không chứa dầu giúp sản phẩm không lem không trôi suốt ngày dài. ', N'CTL011', N'H2', N'Chì Kẻ Mắt Siêu Mảnh Chống Trôi, Siêu Bền, Siêu Lì Merzy The First Slim Gel Eyeliner.jpg', NULL, 172000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM012', N'Merzy Mood Fit Shadow Palette', N'Bảng Phấn Mắt 4 Ô Merzy Mood Fit Shadow Palette là phấn mắt của thương hiệu Merzy với những tông màu hài hòa, phù hợp với nhiều phong cách trang điểm khác nhau theo tâm trạng, cảm xúc của riêng bạn giúp bạn sẽ không lo lắng về vấn đề trang điểm mắt và vẻ ngoài luôn lung linh, thu hút mọi ánh nhìn ', N'CTL013', N'H2', N'Bảng Phấn Mắt 4 Ô Merzy Mood Fit Shadow Palette.jpg', NULL, -12222144, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM013', N'Lemonade Supper Matte Cushion ', N'Supermatte Cushion là phấn nước được nghiên cứu dành cho làn da dầu, da siêu dầu và da dầu mụn nhờ có lớp màng cực kỳ bền vững, kiểm soát dầu thừa hữu hiệu, hạn chế vỡ hay chảy nền do mồ hôi và bã nhờn dư thừa. Do đó, lớp nền của bạn sẽ bền chắc, ít xuống màu và lâu trôi.', N'CTL005', N'H4', N'Phấn Nước Kiềm Dầu, Che Phủ Tốt Lemonade Supper Matte Cushion.jpg', NULL, 327250, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM014', N'Lemonade Supertiger Tigereyes Liner', N'Bút Kẻ Mắt Nước Siêu Mảnh, Sắc Nét, Chống Trôi Hiệu Quả Lemonade Supertiger Tigereyes Liner là kẻ mắt nước đến từ thương hiệu Lemonade có đầu bút siêu mảnh, nhỏ và nhọn rất linh hoạt trong từng thao tác, nét vẽ liền mạch giúp bạn dễ dàng đi êm từng đường kẻ sát chân mi cũng như nhấn nhá đuôi eyeliner sắc sảo, thao tác cực dễ dàng với mọi kiểu vẽ, từ phong cách tự nhiên cho đến mắt mèo cá tính. ', N'CTL011', N'H4', N'Bút Kẻ Mắt Nước Siêu Mảnh, Sắc Nét, Chống Trôi Hiệu Quả Lemonade Supertiger Tigereyes Liner.jpg', NULL, 195500, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM015', N'Matte Addict Concealer ', N'Matte Addict Concealer là dòng kem che khuyết điểm có kết cấu mỏng nhẹ nhưng vẫn che phủ hiệu quả. Nhờ kết cấu màng bền vững giúp kiểm soát dầu thừa, lâu trôi và hạn chế xuống tone', N'CTL006', N'H4', N'Kem che khuyết điểm kiềm dầu bền màu Matte Addict Concealer.jpg', NULL, 172500, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM016', N'Lemonade Want It Got It Dual Eyebrow ', N'Chì Kẻ Mày Hai Đầu Tiện Lợi Cho Lông Mày Hoàn Hảo Lemonade Want It Got It Dual Eyebrow là chì kẻ mày đến từ thương hiệu Lemonade bao gồm đầu chì mềm mại cùng đầu mascara giúp lông mày thêm đều màu, cho hàng lông mày thêm vừa vặn và hoàn hảo, tạo ra những đường mày sắc nét và bền màu trong suốt thời gian dài ', N'CTL012', N'H4', N'Chì kẻ mày hai đầu Lemonade Want It Got It Dual Eyebrow.jpg', NULL, 510000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM017', N'Lemonade Soaring Mascara', N'Chuốt mi tơi dài lâu trôi Lemonade Soaring Mascara: 
Giữ mi cong
Làm dày và dài mi
Làm tơi mi giúp mi trông tự nhiên, nhẹ nhàng', N'CTL014', N'H4', N'Chuốt mi tơi dài lâu trôi Lemonade Soaring Mascara.jpg', NULL, 193500, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM018', N'Aesthetic Eyeshadow Palette', N'Bảng Phấn Mắt 16 Ô Siêu Mềm Mịn, Bền Màu, Lâu Trôi Lemonade Aesthetic Eyeshadow Palette là bảng phấn mắt đến từ thương hiệu Lemonade  bao gồm 16 ô màu với kết cấu hạt phấn siêu mịn lì cùng với độ lên màu siêu chuẩn, khả năng bền màu và lâu trôi suốt cả ngày dài, bảng màu ấn tượng dễ phối với nhau dễ sử dụng cho nhiều bối cảnh, cho mọi phong cách cá tính và phù hợp cả cho người mới bắt đầu.', N'CTL013', N'H4', N'Bảng mắt 16 ô Aesthetic Eyeshadow Palette.jpg', NULL, 315000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM019', N'Maybelline Fit Me Matte Poreless Foundation  ', N'Kem Nền Kiềm Dầu, Cho Lớp Nền Mịn Lì Tự Nhiên Maybelline Fit Me Matte Poreless Foundation là kem nền đến từ thương hiệu Maybelline với khả năng kiềm dầu hiệu quả, cùng với độ che phủ hoàn hảo cho lớp nền luôn được mịn lì tự nhiên, bền màu lâu trôi suốt cả ngày dài.', N'CTL002', N'H5', N'Maybelline Fit Me Matte Poreless Foundation.jpg', NULL, 200000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM020', N'Maybelline New York Fit Me Fresh Tint ', N'Kem Nền Tươi Mướt, Chống Nắng Bảo Vệ Da Maybelline New York Fit Me Fresh Tint SPF50/PA+++ là kem nền đến từ thương hiệu Maybelline. Với Vitamin C làm lớp nền sáng mỏng nhẹ, giúp da tươi mướt tự nhiên. Nếu bạn theo trường phái makeup-no-makeup mà không gây hại cho da thì Fit Me Fresh Tint chính là sản phẩm dành cho bạn.', N'CTL002', N'H5', N'Kem Nền Tươi Mướt, Chống Nắng Bảo Vệ Da Maybelline New York Fit Me Fresh Tint.jpg', NULL, 162000, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM021', N'Maybelline New York Lash Sensational Sky High Mascara ', N'Mascara Tơi Dài Mi, Cho Mi Cong Dài Tự Nhiên Maybelline New York Lash Sensational Sky High Mascara là mascara đến từ thương hiệu Maybelline  giúp mi tơi dài không giới hạn. Đầu cọ Flex Tower mới giúp chuốt mi cao vút, chạm từng sợi mi, cho 360 độ hiệu quả từ chân đến ngọn, cho bạn một đôi mắt sâu hút hồn và quyến rũ. ', N'CTL014', N'H5', N'Maybelline New York Lash Sensational Sky High Mascara.jpg', NULL, 172800, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM022', N'Maybelline Fit Me Matte Poreless Powder SPF32 /PA+++ ', N'Phấn Nền Dạng Nén Che Phủ Hoàn Hảo, Kiềm Dầu Hiệu Quả Maybelline Fit Me Matte Poreless Powder SPF32 /PA+++ là phấn nền đến từ thương hiệu Maybelline công thức chứa hạt phấn Micro Power cho lớp nền mịn, kiềm dầu lên đến 16h, mang đến cho bạn một lớp nền hoàn hảo, phủ mịn và không bị bóng dầu.', N'CTL003', N'H5', N'Phấn Nền Dạng Nén Che Phủ Hoàn Hảo, Kiềm Dầu Hiệu Quả Maybelline Fit Me Matte Poreless Powder 6g.jpg', NULL, 166500, NULL, NULL)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [MoTa], [MaCTLoai], [MaHang], [HinhAnh], [DanhGia], [Gia], [CachDung], [ChiTiet]) VALUES (N'DM024', N' Maybelline Baby Skin Pore Eraser ', N'Kem Lót Làm Mịn Da, Che Khuyết Điểm, Se Khít Lỗ Chân Lông Maybelline Baby Skin Pore Eraser 22ml là kem lót thuộc thương hiệu Maybelline có kết cấu gel mịn làm mịn da, se khít lỗ chân lông, hỗ trợ kiềm dầu nhưng vẫn cung cấp đầy đủ độ ẩm cho da và chứa chiết xuất cherry chống lão hóa da.', N'CTL006', N'H5', N'Kem Lót Làm Mịn Da, Che Khuyết Điểm, Se Khít Lỗ Chân Lông Maybelline Baby Skin Pore Eraser.jpg', NULL, 230000, NULL, NULL)
GO
INSERT [dbo].[DonHang] ([MaDonHang], [TongTien], [TrangThaiDonHang], [MaKhachHang], [ThanhToan], [VanChuyen], [PhiVanChuyen], [NgayDatHang]) VALUES (N'DH12813', 320000, 3, 5, 1, 1, 10000, CAST(N'2023-12-01T13:09:50.913' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [TongTien], [TrangThaiDonHang], [MaKhachHang], [ThanhToan], [VanChuyen], [PhiVanChuyen], [NgayDatHang]) VALUES (N'DH20041', 160000, 3, 4, 1, 1, 10000, CAST(N'2023-12-12T13:04:29.210' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [TongTien], [TrangThaiDonHang], [MaKhachHang], [ThanhToan], [VanChuyen], [PhiVanChuyen], [NgayDatHang]) VALUES (N'DH21248', 492000, 1, 5, 1, 1, 10000, CAST(N'2023-12-15T13:14:00.113' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [TongTien], [TrangThaiDonHang], [MaKhachHang], [ThanhToan], [VanChuyen], [PhiVanChuyen], [NgayDatHang]) VALUES (N'DH34841', 320000, 3, 1, 1, 1, 10000, CAST(N'2023-12-12T23:49:09.890' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [TongTien], [TrangThaiDonHang], [MaKhachHang], [ThanhToan], [VanChuyen], [PhiVanChuyen], [NgayDatHang]) VALUES (N'DH50015', 332000, 3, 6, 1, 1, 10000, CAST(N'2023-12-11T13:10:50.767' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [TongTien], [TrangThaiDonHang], [MaKhachHang], [ThanhToan], [VanChuyen], [PhiVanChuyen], [NgayDatHang]) VALUES (N'DH62102', 160000, 2, 4, 1, 1, 10000, CAST(N'2023-12-15T13:46:37.777' AS DateTime))
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H1', N'Roma&nd', N'Hàn Quốc')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H2', N'Merzy', N'Hàn Quốc')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H3', N'Toofaced', N'Mỹ')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H4', N'Lemonade', N'Việt Nam')
INSERT [dbo].[Hang] ([MaHang], [TenHang], [XuatXu]) VALUES (N'H5', N'Maybeline', N'Mỹ')
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [NgaySinh], [AccountId]) VALUES (1, N'Nguyễn Thị Hà Phương', N'Thanh Hóa', N'0832423666', NULL, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [NgaySinh], [AccountId]) VALUES (2, N'Bùi MInh Đức', N'Hoàng Đồng-Lạng Sơn', N'0832423666', NULL, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [NgaySinh], [AccountId]) VALUES (3, N'Nguyễn Thị Hà Phương', N'Hoàng Đồng-Lạng Sơn', N'0832156489', NULL, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [NgaySinh], [AccountId]) VALUES (4, N'Nguyễn Thị Hà Phương', N'Hoàng Đồng-Lạng Sơn', N'0832423666', NULL, 37)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [NgaySinh], [AccountId]) VALUES (5, N'Nguyễn Lê Trung Hiếu', N'Hoàng Đồng-Lạng Sơn', N'0123456789', NULL, 29)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [NgaySinh], [AccountId]) VALUES (6, N'Nguyễn Thị Hà Vân', N'Chợ Lách - Bến Tre', N'0123456789', NULL, 29)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L1', N'Trang điểm mắt')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L2', N'Trang điểm mặt')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L3', N'Trang điểm môi')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'L4', N'Khác')
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (19, N'Admin', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (20, N'Customer', N'Người dùng')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description]) VALUES (21, N'Employee', N'Nhân viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0001', N'12 Anne Shirley', N'#ed4855', N'12-anne-shirley.jpg', 160000, 10, 80, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM001', 0, 0, N'0', 0, CAST(N'2023-11-07T13:31:42.243' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0002', N'13 Berry Cake', N'#e54d4d', N'13-berry-cake.jpg', 160000, 10, 80, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM001', 0, 0, N'0', 0, CAST(N'2023-11-07T13:31:53.223' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0003', N'14 Pecan Tarte', N'#b02c36', N'14-pecan-tarte.jpg', 160000, 10, 20, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM001', 0, 0, N'0', 0, CAST(N'2023-11-07T13:32:06.590' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0004', N'15 Rusk Rusk', N'#b44736', N'15-rusk-rusk.jpg', 200000, 10, 60, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM001', 0, 0, N'0', 0, CAST(N'2023-12-15T13:43:35.613' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0005', N'08 Coralia', N'#f88064', N'08-coralia.jpg', 160000, 10, 60, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM002', 0, 0, N'0', 0, CAST(N'2023-11-14T13:04:28.883' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0006', N'09 Peonies', N'#ff8eb9', N'09-peonies.jpg', 160000, 10, 75, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM002', 0, 0, N'0', 0, CAST(N'2023-11-14T13:04:17.303' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0007', N'10 Nudy Peanut', N'#f08567', N'10-nudy-peanut.jpg', 190000, 15, 20, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM003', 0, 0, N'0', 0, CAST(N'2023-11-14T13:06:09.953' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0008', N'11 Pink Pumpkin', N'#e06a50', N'11-pink-pumpkin.jpg', 190000, 15, 28, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM003', 0, 0, N'0', 0, CAST(N'2023-11-14T13:05:59.333' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0009', N'12 Cherry Bomb', N'#981f20', N'12-cherry-bomb.jpg', 189000, 15, 28, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM003', 0, 0, N'0', 0, CAST(N'2023-12-09T22:40:15.050' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0010', N'13 Eat Dotori', N'#d2462f', N'13-eat-dotori.jpg', 172000, 15, 28, CAST(N'2023-05-26T00:00:00.000' AS DateTime), NULL, N'DM003', 0, 0, N'0', 0, CAST(N'2023-11-14T13:05:35.763' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0011', N'01 Pampas Garden', N'#f6cbbb', N'01-pampas-garden.jpg', 159000, 15, 28, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, N'DM005', 0, 0, N'0', 0, CAST(N'2023-11-14T13:11:19.150' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0012', N'02 Magogany Garden', N'#d78474', N'02-magogany-garden.jpg', 370000, 20, 28, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, N'DM005', 0, 0, N'0', 0, CAST(N'2023-11-14T13:06:40.403' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0013', N'03 Rosebud Garden', N'#9b2759', N'03-rosebud-garden.jpg', 388000, 20, 17, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, N'DM005', 0, 0, N'0', 0, CAST(N'2023-11-14T13:07:03.973' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0014', N'SL7 Devil Rose', N'#cb5259', N'sl7-devil-rose.jpg', 150000, 15, 41, CAST(N'2023-04-13T00:00:00.000' AS DateTime), NULL, N'DM006', 0, 0, N'0', 0, CAST(N'2023-11-14T13:07:45.043' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0015', N'SL8 Feel Lost', N'#b44247', N'sl8-feel-lost.jpg', 140000, 15, 47, CAST(N'2023-04-13T00:00:00.000' AS DateTime), NULL, N'DM006', 0, 0, N'0', 0, CAST(N'2023-11-14T13:07:34.190' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0016', N'SL9 Nutty Blandy', N'#cb4834', N'sl9-nutty-blandy.jpg', 140000, 15, 28, CAST(N'2023-04-13T00:00:00.000' AS DateTime), NULL, N'DM006', 0, 0, N'0', 0, CAST(N'2023-11-14T13:07:23.930' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0017', N'WD12 Benign Nude', N'#984443', N'wd12-benign-nude.jpg', 175000, 20, 56, CAST(N'2023-07-19T00:00:00.000' AS DateTime), NULL, N'DM007', 0, 0, N'0', 0, CAST(N'2023-11-14T13:08:56.963' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0018', N'WD13 Soul Of Rose', N'#ae3341', N'wd13-soul-of-rose.jpg', 180000, 20, 62, CAST(N'2023-07-19T00:00:00.000' AS DateTime), NULL, N'DM007', 0, 0, N'0', 0, CAST(N'2023-11-14T13:08:09.940' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0019', N'WD14 With Zest', N'#710817', N'wd14-with-zest.jpg', 180000, 20, 62, CAST(N'2023-07-19T00:00:00.000' AS DateTime), NULL, N'DM007', 0, 0, N'0', 0, CAST(N'2023-11-14T13:08:01.680' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0022', N'M4 Bian Rose', N'#4d1c1f', NULL, 190000, 20, 40, CAST(N'2023-07-19T00:00:00.000' AS DateTime), 290, N'DM008', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0023', N'M13 Vapor Red', N'#57060f', NULL, 190000, 20, 11, CAST(N'2023-07-19T00:00:00.000' AS DateTime), 341, N'DM008', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0024', N'FP1 Black', N'#010101', NULL, 180000, 20, 25, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 220, N'DM009', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0025', N'FP2 Deep Brown', N'#412618', NULL, 150000, 20, 33, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 210, N'DM009', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0026', N'FP3 Milk Brown', N'#744324', NULL, 160000, 20, 33, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 210, N'DM009', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0027', N'S1 Amusing Rose', N'#cc8d83', NULL, 155000, 15, 33, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 157, N'DM012', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0028', N'S2 Joyful Coral', N'#7e4d4a', NULL, 250000, 15, 22, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 182, N'DM012', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0029', N'S3 Drowsy Nude', N'#7e4d4a', NULL, 250000, 15, 22, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 182, N'DM012', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0030', N'01.Light', N'#eecbbc', NULL, 385000, 15, 22, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 220, N'DM013', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0031', N'02.Medium Light', N'#ecba89', NULL, 390000, 15, 33, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 230, N'DM013', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0032', N'03.Medium', N'#ab714b', NULL, 390000, 15, 45, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 201, N'DM013', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0033', N'01 BLACK', N'#000000', NULL, 235000, 15, 11, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 340, N'DM014', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0034', N'02 BROWN', N'#7f3d22', NULL, 230000, 15, 1, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 359, N'DM014', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0035', N'A01. Da sáng', N'#f1d0b5', NULL, 230000, 25, 13, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 152, N'DM015', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0036', N'A02. Da Trung Bình Sáng', N'#b29d84', NULL, 230000, 25, 13, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 152, N'DM015', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0037', N'A03. Da Trung Bình', N'#f1d0b5', NULL, 230000, 25, 21, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 122, N'DM015', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0039', N'A00. DA TRẮNG SÁNG', N'#8c7c68', NULL, 230000, 25, 23, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 120, N'DM015', 0, 0, N'0', 0, NULL, 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0040', N' SOARING MASCARA', N'#181512', N'soaring-mascara.jpg', 258000, 25, 2, CAST(N'2023-08-19T00:00:00.000' AS DateTime), NULL, N'DM017', 0, 0, N'0', 0, CAST(N'2023-11-24T13:30:59.563' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0041', N' Aesthetic Eyeshadow Palette', N'#db1e76', N'aesthetic-eyeshadow-palette.jpg', 420000, 25, 11, CAST(N'2023-01-02T00:00:00.000' AS DateTime), NULL, N'DM018', 0, 0, N'0', 0, CAST(N'2023-11-24T13:30:50.613' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0042', N'112 NATURAL IVORY', N'#f5d0c0', N'112-natural-ivory.jpg', 250000, 20, 7, CAST(N'2023-04-23T00:00:00.000' AS DateTime), NULL, N'DM019', 0, 0, N'0', 0, CAST(N'2023-11-24T13:30:40.040' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0043', N'115 IVORY', N'#ffd9c9', N'115-ivory.jpg', 254000, 20, 9, CAST(N'2023-04-23T00:00:00.000' AS DateTime), NULL, N'DM019', 0, 0, N'0', 0, CAST(N'2023-11-24T13:30:31.660' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0044', N'120 CLASSIC IVORY', N'#fbd6bc', N'120-classic-ivory.jpg', 250000, 20, 11, CAST(N'2023-04-23T00:00:00.000' AS DateTime), NULL, N'DM019', 0, 0, N'0', 0, CAST(N'2023-11-27T23:47:43.173' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0045', N'01', N'#f3c59e', N'01.jpg', 185000, 10, 22, CAST(N'2023-09-01T00:00:00.000' AS DateTime), NULL, N'DM020', 0, 0, N'0', 0, CAST(N'2023-11-24T13:30:13.637' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0046', N'02', N'#eec8a5', N'02.jpg', 180000, 10, 38, CAST(N'2023-09-01T00:00:00.000' AS DateTime), NULL, N'DM020', 0, 0, N'0', 0, CAST(N'2023-11-24T13:30:05.807' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0047', N'03', N'#e8bea8', N'03.jpg', 180000, 10, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), NULL, N'DM020', 0, 0, N'0', 0, CAST(N'2023-12-09T22:46:53.653' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0048', N'Maybelline New York Lash Sensational Sky High Mascara ', N'#000000', N'maybelline-new-york-lash-sensational-sky-high-mascara.jpg', 192000, 10, 28, CAST(N'2023-09-01T00:00:00.000' AS DateTime), NULL, N'DM021', 0, 0, N'0', 0, CAST(N'2023-12-15T14:34:21.390' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0050', N'123', N'#000000', N'123.jpg', 123456, 10000, 123, CAST(N'2023-12-09T22:41:34.000' AS DateTime), NULL, N'DM012', 0, 0, N'123123123', 0, CAST(N'2023-12-15T14:33:01.617' AS DateTime), 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Mau], [Anh], [Gia], [KhuyenMai], [SLKho], [NgaySX], [LuotMua], [MaDanhMuc], [HomeFlag], [BestSellers], [MoTa], [Active], [NgaySua], [GiaNhap]) VALUES (N'SP0055', N'M2 Jane Chili12', N'#762520', N'm2-jane-chili12.jpg', 529000, 20, 1, CAST(N'2023-11-13T07:53:08.000' AS DateTime), NULL, N'DM008', 0, 0, N'Son Kem L&igrave; Merzy Noir In The Mellow Tint trở lại với một &quot;vỏ ngo&agrave;i&quot; mới mang đến c&aacute; t&iacute;nh ri&ecirc;ng biệt gi&uacute;p cho đ&ocirc;i m&ocirc;i ửng m&agrave;u tự nhi&ecirc;n. - Chất son mịn mượt nhẹ nh&agrave;ng phủ khắp đ&ocirc;i m&ocirc;i căng đầy. - Độ b&aacute;m m&agrave;u cao, giữ cho đ&ocirc;i m&ocirc;i lu&ocirc;n bền m&agrave;u rạng rỡ.', 0, CAST(N'2023-12-15T14:31:29.737' AS DateTime), 100000)
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF__SanPham__Active__3C34F16F]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
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
ALTER TABLE [dbo].[LoHang] CHECK CONSTRAINT [FK_LoHang_NhaPhanPhoi]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMucSanPham] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucSanPham] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMucSanPham]
GO
