CREATE DATABASE KhachSan_DB
ON PRIMARY(
	name = 'data.mdf',
	filename ='D:\SQL-KhachSan\data.mdf',
	size = 40,
	maxsize = 60,
	filegrowth = 10
)

LOG ON(
	name = 'log.ldf',
	filename ='D:\SQL-KhachSan\log.ldf',
	size = 10,
	maxsize = 20,
	filegrowth = 10
)

USE [KhachSan_DB]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[id_DichVu] [int] IDENTITY(1,1) NOT NULL,
	[ten_dich_vu] [nvarchar](50) NOT NULL,
	[gia_dich_vu] [float] NOT NULL,
	[id_loai_dich_vu] [int] NOT NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[id_DichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id_khach] [int] IDENTITY(1,1) NOT NULL,
	[ho] [nvarchar](30) NOT NULL,
	[ten] [nvarchar](20) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[so_cmnd] [nchar](15) NOT NULL,
	[gioi_tinh] [int] NOT NULL,
	[so_dien_thoai] [nchar](10) NOT NULL,
	[quoc_tich] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[id_khach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDichVu]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDichVu](
	[id_LoaiDichVu] [int] IDENTITY(1,1) NOT NULL,
	[ten_loai_dich_vu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiDichVu] PRIMARY KEY CLUSTERED 
(
	[id_LoaiDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[id_loai_phong] [int] IDENTITY(1,1) NOT NULL,
	[ten_loai_phong] [nvarchar](20) NOT NULL,
	[gia_loai_phong] [float] NOT NULL,
	[ghi_chu] [ntext] NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[id_loai_phong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id_NhanVien] [int] IDENTITY(1,1) NOT NULL,
	[ho] [nchar](30) NOT NULL,
	[ten] [nchar](30) NOT NULL,
	[gioi_tinh] [int] NULL,
	[ngay_sinh] [date] NULL,
	[chuc_vu] [int] NOT NULL,
	[ca_lam_viec] [int] NULL,
	[email] [nchar](60) NOT NULL,
	[mat_khau] [nchar](60) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id_NhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuCheck_In]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuCheck_In](
	[id_phieu_checkin] [int] IDENTITY(1,1) NOT NULL,
	[ngay_check_in] [date] NULL,
	[gio_check_in] [time](7) NULL,
	[ngay_check_out] [date] NULL,
	[gio_check_out] [time](7) NULL,
	[soLuongKhach] [int] NULL,
	[soLuongDichVu] [int] NULL,
	[giam_gia] [float] NULL,
	[TrangThaiPhieuCK] [int] NULL,
	[id_khach] [int] NULL,
	[id_DichVu] [int] NULL,
	[id_Phong] [int] NULL,
	[id_NhanVien] [int] NULL,
 CONSTRAINT [PK_PhieuCheck_In] PRIMARY KEY CLUSTERED 
(
	[id_phieu_checkin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phong]    Script Date: 11/2/2019 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[id_Phong] [int] IDENTITY(1,1) NOT NULL,
	[so_Phong] [nchar](10) NOT NULL,
	[tang] [int] NOT NULL,
	[so_luong_nguoi] [int] NOT NULL,
	[tinh_trang] [int] NOT NULL,
	[ghi_chu] [ntext] NULL,
	[id_loai_phong] [int] NOT NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[id_Phong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (1, N'Mì Trứng', 20000, 1)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (2, N'Cơm Chiên', 50000, 1)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (4, N'Phở', 80000, 1)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (5, N'Pepsi', 20000, 2)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (6, N'Sting', 20000, 2)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (7, N'Nước Suối', 15000, 2)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (8, N'Giặt', 150000, 3)
INSERT [dbo].[DichVu] ([id_DichVu], [ten_dich_vu], [gia_dich_vu], [id_loai_dich_vu]) VALUES (9, N'Ủi', 50000, 3)
SET IDENTITY_INSERT [dbo].[DichVu] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([id_khach], [ho], [ten], [date_of_birth], [so_cmnd], [gioi_tinh], [so_dien_thoai], [quoc_tich]) VALUES (1, N'Đỗ Thị', N'Đức', CAST(N'2019-10-31' AS Date), N'123456789      ', 1, N'012234567 ', N'Việt Nam')
INSERT [dbo].[KhachHang] ([id_khach], [ho], [ten], [date_of_birth], [so_cmnd], [gioi_tinh], [so_dien_thoai], [quoc_tich]) VALUES (2, N'Nguyễn Văn', N'Đức', CAST(N'2019-10-22' AS Date), N'020396544      ', 0, N'012234567 ', N'Việt Nam')
INSERT [dbo].[KhachHang] ([id_khach], [ho], [ten], [date_of_birth], [so_cmnd], [gioi_tinh], [so_dien_thoai], [quoc_tich]) VALUES (3, N'Văn', N'Long', CAST(N'2019-10-31' AS Date), N'1231355        ', 0, N'012234567 ', N'Trung Quốc')
INSERT [dbo].[KhachHang] ([id_khach], [ho], [ten], [date_of_birth], [so_cmnd], [gioi_tinh], [so_dien_thoai], [quoc_tich]) VALUES (4, N'Robert', N'Chen', CAST(N'2019-10-31' AS Date), N'51386161523    ', 0, N'012234567 ', N'Guinea Xích đạo')
INSERT [dbo].[KhachHang] ([id_khach], [ho], [ten], [date_of_birth], [so_cmnd], [gioi_tinh], [so_dien_thoai], [quoc_tich]) VALUES (5, N'Nguyễn Quang', N'Hải', CAST(N'2019-11-02' AS Date), N'456789123      ', 1, N'012234567 ', N'Việt Nam')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiDichVu] ON 

INSERT [dbo].[LoaiDichVu] ([id_LoaiDichVu], [ten_loai_dich_vu]) VALUES (1, N'Thức Ăn')
INSERT [dbo].[LoaiDichVu] ([id_LoaiDichVu], [ten_loai_dich_vu]) VALUES (2, N'Nước Uống')
INSERT [dbo].[LoaiDichVu] ([id_LoaiDichVu], [ten_loai_dich_vu]) VALUES (3, N'Phụ Thu')
INSERT [dbo].[LoaiDichVu] ([id_LoaiDichVu], [ten_loai_dich_vu]) VALUES (14, N'Nướng')
SET IDENTITY_INSERT [dbo].[LoaiDichVu] OFF
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([id_loai_phong], [ten_loai_phong], [gia_loai_phong], [ghi_chu]) VALUES (1, N'Standard', 800000, NULL)
INSERT [dbo].[LoaiPhong] ([id_loai_phong], [ten_loai_phong], [gia_loai_phong], [ghi_chu]) VALUES (2, N'Deluxe', 1000000, NULL)
INSERT [dbo].[LoaiPhong] ([id_loai_phong], [ten_loai_phong], [gia_loai_phong], [ghi_chu]) VALUES (3, N'Express View', 1200000, NULL)
INSERT [dbo].[LoaiPhong] ([id_loai_phong], [ten_loai_phong], [gia_loai_phong], [ghi_chu]) VALUES (4, N'VIP', 2000000, NULL)
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([id_NhanVien], [ho], [ten], [gioi_tinh], [ngay_sinh], [chuc_vu], [ca_lam_viec], [email], [mat_khau]) VALUES (1, N'Trần Huỳnh Công               ', N'Lộc                           ', 1, CAST(N'1999-04-07' AS Date), 1, 1, N'admin@gmail.com                                             ', N'e10adc3949ba59abbe56e057f20f883e                            ')
INSERT [dbo].[NhanVien] ([id_NhanVien], [ho], [ten], [gioi_tinh], [ngay_sinh], [chuc_vu], [ca_lam_viec], [email], [mat_khau]) VALUES (4, N'Nguyễn Quang                  ', N'Hải                           ', 1, CAST(N'2019-10-31' AS Date), 1, 1, N'hai@gmail.com                                               ', N'202cb962ac59075b964b07152d234b70                            ')
INSERT [dbo].[NhanVien] ([id_NhanVien], [ho], [ten], [gioi_tinh], [ngay_sinh], [chuc_vu], [ca_lam_viec], [email], [mat_khau]) VALUES (5, N'Phan Văn                      ', N'Đức                           ', 1, CAST(N'2019-10-31' AS Date), 2, 1, N'hai02@gmail.com                                             ', N'202cb962ac59075b964b07152d234b70                            ')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuCheck_In] ON 

INSERT [dbo].[PhieuCheck_In] ([id_phieu_checkin], [ngay_check_in], [gio_check_in], [ngay_check_out], [gio_check_out], [soLuongKhach], [soLuongDichVu], [giam_gia], [TrangThaiPhieuCK], [id_khach], [id_DichVu], [id_Phong], [id_NhanVien]) VALUES (1, CAST(N'2019-10-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'2019-10-22' AS Date), CAST(N'11:00:00' AS Time), 2, 0, 0, 0, 1, NULL, 2, 1)
INSERT [dbo].[PhieuCheck_In] ([id_phieu_checkin], [ngay_check_in], [gio_check_in], [ngay_check_out], [gio_check_out], [soLuongKhach], [soLuongDichVu], [giam_gia], [TrangThaiPhieuCK], [id_khach], [id_DichVu], [id_Phong], [id_NhanVien]) VALUES (2, CAST(N'2019-10-29' AS Date), CAST(N'16:00:00' AS Time), CAST(N'2019-10-30' AS Date), CAST(N'08:00:00' AS Time), 2, 0, 0, 0, 2, NULL, 5, 1)
INSERT [dbo].[PhieuCheck_In] ([id_phieu_checkin], [ngay_check_in], [gio_check_in], [ngay_check_out], [gio_check_out], [soLuongKhach], [soLuongDichVu], [giam_gia], [TrangThaiPhieuCK], [id_khach], [id_DichVu], [id_Phong], [id_NhanVien]) VALUES (27, CAST(N'2019-10-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'2019-10-22' AS Date), CAST(N'11:00:00' AS Time), 0, 10, 0, 1, 1, 2, 2, 1)
INSERT [dbo].[PhieuCheck_In] ([id_phieu_checkin], [ngay_check_in], [gio_check_in], [ngay_check_out], [gio_check_out], [soLuongKhach], [soLuongDichVu], [giam_gia], [TrangThaiPhieuCK], [id_khach], [id_DichVu], [id_Phong], [id_NhanVien]) VALUES (28, CAST(N'2019-10-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'2019-10-22' AS Date), CAST(N'11:00:00' AS Time), 0, 5, 0, 1, 1, 5, 2, 1)
INSERT [dbo].[PhieuCheck_In] ([id_phieu_checkin], [ngay_check_in], [gio_check_in], [ngay_check_out], [gio_check_out], [soLuongKhach], [soLuongDichVu], [giam_gia], [TrangThaiPhieuCK], [id_khach], [id_DichVu], [id_Phong], [id_NhanVien]) VALUES (31, CAST(N'2019-10-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'2019-10-22' AS Date), CAST(N'11:00:00' AS Time), 0, 1, 0, 1, 1, 5, 2, 1)
INSERT [dbo].[PhieuCheck_In] ([id_phieu_checkin], [ngay_check_in], [gio_check_in], [ngay_check_out], [gio_check_out], [soLuongKhach], [soLuongDichVu], [giam_gia], [TrangThaiPhieuCK], [id_khach], [id_DichVu], [id_Phong], [id_NhanVien]) VALUES (32, CAST(N'2019-10-29' AS Date), CAST(N'16:00:00' AS Time), CAST(N'2019-10-30' AS Date), CAST(N'08:00:00' AS Time), 0, 5, 0, 1, 2, 9, 5, 1)
SET IDENTITY_INSERT [dbo].[PhieuCheck_In] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (1, N'T101      ', 1, 2, 1, NULL, 1)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (2, N'T102      ', 1, 2, 1, NULL, 1)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (3, N'T103      ', 1, 2, 1, NULL, 2)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (4, N'T204      ', 2, 3, 1, NULL, 2)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (5, N'T205      ', 2, 2, 1, NULL, 2)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (6, N'T206      ', 2, 2, 0, NULL, 3)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (7, N'T307      ', 3, 3, 0, NULL, 2)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (8, N'T308      ', 3, 3, 0, NULL, 3)
INSERT [dbo].[Phong] ([id_Phong], [so_Phong], [tang], [so_luong_nguoi], [tinh_trang], [ghi_chu], [id_loai_phong]) VALUES (9, N'T409      ', 4, 4, 1, NULL, 4)
SET IDENTITY_INSERT [dbo].[Phong] OFF
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_LoaiDichVu] FOREIGN KEY([id_loai_dich_vu])
REFERENCES [dbo].[LoaiDichVu] ([id_LoaiDichVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_LoaiDichVu]
GO
ALTER TABLE [dbo].[PhieuCheck_In]  WITH CHECK ADD  CONSTRAINT [FK_PhieuCheck_In_DichVu] FOREIGN KEY([id_DichVu])
REFERENCES [dbo].[DichVu] ([id_DichVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuCheck_In] CHECK CONSTRAINT [FK_PhieuCheck_In_DichVu]
GO
ALTER TABLE [dbo].[PhieuCheck_In]  WITH CHECK ADD  CONSTRAINT [FK_PhieuCheck_In_KhachHang] FOREIGN KEY([id_khach])
REFERENCES [dbo].[KhachHang] ([id_khach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuCheck_In] CHECK CONSTRAINT [FK_PhieuCheck_In_KhachHang]
GO
ALTER TABLE [dbo].[PhieuCheck_In]  WITH CHECK ADD  CONSTRAINT [FK_PhieuCheck_In_NhanVien] FOREIGN KEY([id_NhanVien])
REFERENCES [dbo].[NhanVien] ([id_NhanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuCheck_In] CHECK CONSTRAINT [FK_PhieuCheck_In_NhanVien]
GO
ALTER TABLE [dbo].[PhieuCheck_In]  WITH CHECK ADD  CONSTRAINT [FK_PhieuCheck_In_Phong] FOREIGN KEY([id_Phong])
REFERENCES [dbo].[Phong] ([id_Phong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuCheck_In] CHECK CONSTRAINT [FK_PhieuCheck_In_Phong]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([id_loai_phong])
REFERENCES [dbo].[LoaiPhong] ([id_loai_phong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [ck_caLamViec] CHECK  (([ca_lam_viec]=(3) OR [ca_lam_viec]=(2) OR [ca_lam_viec]=(1)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [ck_caLamViec]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [ck_chucVu] CHECK  (([chuc_vu]=(1) OR [chuc_vu]=(2)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [ck_chucVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [ck_gioiTinh] CHECK  (([gioi_tinh]=(1) OR [gioi_tinh]=(0)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [ck_gioiTinh]
GO
