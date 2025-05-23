USE [master]
GO
/****** Object:  Database [TMDTShopX]    Script Date: 5/15/2025 9:57:48 AM ******/
CREATE DATABASE [TMDTShopX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TMDTShopX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TMDTShopX.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TMDTShopX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TMDTShopX_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TMDTShopX] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TMDTShopX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TMDTShopX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TMDTShopX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TMDTShopX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TMDTShopX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TMDTShopX] SET ARITHABORT OFF 
GO
ALTER DATABASE [TMDTShopX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TMDTShopX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TMDTShopX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TMDTShopX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TMDTShopX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TMDTShopX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TMDTShopX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TMDTShopX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TMDTShopX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TMDTShopX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TMDTShopX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TMDTShopX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TMDTShopX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TMDTShopX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TMDTShopX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TMDTShopX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TMDTShopX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TMDTShopX] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TMDTShopX] SET  MULTI_USER 
GO
ALTER DATABASE [TMDTShopX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TMDTShopX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TMDTShopX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TMDTShopX] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TMDTShopX] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TMDTShopX]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[AddedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carts]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountCode] [nvarchar](50) NOT NULL,
	[DiscountPercent] [decimal](5, 2) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[DiscountCode] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](255) NOT NULL,
	[DiscountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[imageURL] [nvarchar](500) NULL,
	[SellerCategoryID] [int] NULL,
	[SellerID] [int] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK__Products__B40CC6EDB284AAD0] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellerCategories]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerCategories](
	[SellerCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SellerCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ShopName] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Birthday] [date] NULL,
	[Gender] [bit] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SocialProvider] [nvarchar](50) NULL,
	[SocialID] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK__Users__1788CCAC22F6FB2B] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (1, 1, 1, 2, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (2, 1, 3, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (3, 2, 4, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (4, 2, 5, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (5, 3, 2, 3, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (6, 3, 7, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (7, 4, 9, 2, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (8, 4, 10, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (11, 5, 10, 1, CAST(N'2025-05-13 09:01:58.113' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (12, 5, 9, 1, CAST(N'2025-05-13 09:02:03.690' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (13, 5, 1, 2, CAST(N'2025-05-13 09:02:11.927' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (14, 5, 3, 1, CAST(N'2025-05-13 09:02:17.853' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (16, 5, 7, 3, CAST(N'2025-05-13 06:52:08.823' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (17, 5, 130, 1, CAST(N'2025-05-13 08:38:53.867' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (18, 5, 6, 5, CAST(N'2025-05-15 01:43:21.717' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (19, 5, 91, 2, CAST(N'2025-05-13 09:13:32.000' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (20, 5, 79, 2, CAST(N'2025-05-13 09:16:41.983' AS DateTime))
INSERT [dbo].[CartItems] ([CartItemID], [CartID], [ProductID], [Quantity], [AddedAt]) VALUES (21, 5, 106, 2, CAST(N'2025-05-14 16:55:48.110' AS DateTime))
SET IDENTITY_INSERT [dbo].[CartItems] OFF
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartID], [UserID], [CreatedAt]) VALUES (1, 3, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[Carts] ([CartID], [UserID], [CreatedAt]) VALUES (2, 4, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[Carts] ([CartID], [UserID], [CreatedAt]) VALUES (3, 5, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[Carts] ([CartID], [UserID], [CreatedAt]) VALUES (4, 6, CAST(N'2025-04-20 08:00:00.000' AS DateTime))
INSERT [dbo].[Carts] ([CartID], [UserID], [CreatedAt]) VALUES (5, 8, CAST(N'2025-05-05 02:40:42.033' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (1, N'Khác', N'Những sản phẩm không nằm trong danh mục nào', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (2, N'Thiết Bị Điện Tử', N'Tivi, loa, máy chơi game, thiết bị số', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (3, N'Điện Thoại & Phụ Kiện', N'Điện thoại thông minh và phụ kiện liên quan', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (4, N'Máy Tính & Laptop', N'Laptop, PC, linh kiện máy tính', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (5, N'Máy Ảnh & Máy Quay Phim', N'Máy ảnh kỹ thuật số, máy quay, ống kính', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (6, N'Đồng Hồ', N'Đồng hồ thời trang và cao cấp', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (7, N'Giày Dép Nam', N'Giày thể thao, giày công sở nam', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (8, N'Thiết Bị Điện Gia Dụng', N'Nồi cơm, máy hút bụi, thiết bị bếp', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (9, N'Thể Thao & Du Lịch', N'Dụng cụ thể thao, balo, vali, đồ cắm trại', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (10, N'Ô Tô & Xe Máy & Xe Đạp', N'Xe, phụ tùng, phụ kiện xe', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (11, N'Thời Trang Nữ', N'Quần áo, váy đầm, phụ kiện cho nữ', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (12, N'Mẹ & Bé', N'Sản phẩm cho mẹ bầu, trẻ sơ sinh', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (13, N'Nhà Cửa & Đời Sống', N'Dụng cụ, nội thất, đồ trang trí nhà cửa', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (14, N'Thời Trang Nam', N'Quần áo, phụ kiện cho nam giới', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (15, N'Sắc Đẹp', N'Mỹ phẩm, chăm sóc da, trang điểm', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (16, N'Sức Khỏe', N'Thực phẩm chức năng, dụng cụ y tế', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (17, N'Giày Dép Nữ', N'Giày cao gót, sneaker, dép nữ', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (18, N'Túi Ví Nữ', N'Túi xách, ví da, balo thời trang nữ', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (19, N'Phụ Kiện & Trang Sức Nữ', N'Vòng tay, bông tai, nhẫn, phụ kiện thời trang', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (20, N'Bách Hóa Online', N'Siêu thị online, thực phẩm đóng gói', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (21, N'Nhà Sách Online', N'Sách, truyện, văn phòng phẩm', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (22, N'Balo & Túi Ví Nam', N'Túi đeo chéo, balo laptop, ví nam', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (23, N'Đồ Chơi', N'Đồ chơi trẻ em, đồ chơi giáo dục', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (24, N'Chăm Sóc Thú Cưng', N'Thức ăn, đồ chơi, đồ vệ sinh cho thú cưng', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (25, N'Dụng Cụ & Thiết Bị Tiện Ích', N'Dụng cụ cầm tay, thiết bị tiện ích gia đình', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (26, N'Thời Trang Trẻ Em', N'Quần áo cho bé trai và bé gái', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (27, N'Giặt Giũ & Chăm Sóc Nhà Cửa', N'Nước giặt, nước lau sàn, dụng cụ vệ sinh', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (28, N'Voucher & Dịch Vụ', N'Mã giảm giá, dịch vụ trực tuyến', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (31, N'test', N'danh mục test', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (32, N'test 2', N'Đang cập nhật...', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (33, N'test 3', N'Đang cập nhật...', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (34, N'test 4', N'Đang cập nhật...', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (35, N'test 6', N'Đang cập nhật...', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Image]) VALUES (36, N'test 7', N'Đang cập nhật...', N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1747022695/mmrg2ijh51msijhfsejb.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountID], [DiscountCode], [DiscountPercent], [StartDate], [EndDate], [IsActive]) VALUES (1, N'GIAM10', CAST(10.00 AS Decimal(5, 2)), CAST(N'2025-01-14 00:00:00.000' AS DateTime), CAST(N'2025-12-31 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([DiscountID], [DiscountCode], [DiscountPercent], [StartDate], [EndDate], [IsActive]) VALUES (2, N'SALE20', CAST(20.00 AS Decimal(5, 2)), CAST(N'2025-01-01 00:00:00.000' AS DateTime), CAST(N'2025-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([DiscountID], [DiscountCode], [DiscountPercent], [StartDate], [EndDate], [IsActive]) VALUES (3, N'FREESHIP', CAST(5.00 AS Decimal(5, 2)), CAST(N'2025-01-14 00:00:00.000' AS DateTime), CAST(N'2025-05-14 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Discounts] ([DiscountID], [DiscountCode], [DiscountPercent], [StartDate], [EndDate], [IsActive]) VALUES (4, N'GIAM30', CAST(30.00 AS Decimal(5, 2)), CAST(N'2025-01-14 00:00:00.000' AS DateTime), CAST(N'2025-04-21 00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 1, 3, 1, CAST(280000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 2, 4, 1, CAST(28990000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 2, 5, 1, CAST(5500000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 3, 2, 1, CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 3, 7, 1, CAST(450000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 4, 9, 2, CAST(320000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 4, 10, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 5, 4, 1, CAST(28990000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 6, 1, 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 6, 7, 1, CAST(450000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress], [DiscountID]) VALUES (1, 3, CAST(N'2025-04-18 08:00:00.000' AS DateTime), CAST(470000.00 AS Decimal(18, 2)), N'Đã giao hàng', N'GIAM10', N'789 Đường Trần Phú, Quận 5, TP.HCM', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress], [DiscountID]) VALUES (2, 4, CAST(N'2025-04-19 08:00:00.000' AS DateTime), CAST(34490000.00 AS Decimal(18, 2)), N'Đang xử lý', NULL, N'101 Đường Nguyễn Trãi, Quận Thanh Xuân, Hà Nội', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress], [DiscountID]) VALUES (3, 8, CAST(N'2025-04-19 09:00:00.000' AS DateTime), CAST(1100000.00 AS Decimal(18, 2)), N'Đã giao hàng', N'FREESHIP', N'202 Đường Lê Đại Hành, TP. Huế', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress], [DiscountID]) VALUES (4, 6, CAST(N'2025-04-20 08:00:00.000' AS DateTime), CAST(1840000.00 AS Decimal(18, 2)), N'Đang giao hàng', NULL, N'303 Đường Phạm Văn Đồng, TP. Nha Trang', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress], [DiscountID]) VALUES (5, 3, CAST(N'2025-04-20 09:00:00.000' AS DateTime), CAST(28990000.00 AS Decimal(18, 2)), N'Đã giao hàng', N'SALE20', N'789 Đường Trần Phú, Quận 5, TP.HCM', NULL)
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress], [DiscountID]) VALUES (6, 4, CAST(N'2025-04-20 10:00:00.000' AS DateTime), CAST(670000.00 AS Decimal(18, 2)), N'Đã hủy', NULL, N'101 Đường Nguyễn Trãi, Quận Thanh Xuân, Hà Nội', NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (1, 14, N'Áo Thun Nam Trơn Basic', N'Áo thun nam cổ tròn, chất liệu cotton mềm mại, thoáng mát, nhiều màu sắc.', CAST(120000.00 AS Decimal(18, 2)), 150, CAST(N'2025-04-21 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (2, 1, N'Quần Jean Nam Ống Suông', N'Quần jean nam phong cách hiện đại, ống suông, chất liệu bền, màu xanh đậm.', CAST(350000.00 AS Decimal(18, 2)), 80, CAST(N'2025-04-22 08:00:00.000' AS DateTime), 0, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (3, 3, N'Son Thỏi Lì 3CE Màu Đỏ Cam', N'Son môi 3CE màu đỏ cam thời thượng, chất son lì, bám lâu, không khô môi.', CAST(280000.00 AS Decimal(18, 2)), 200, CAST(N'2025-04-23 08:00:00.000' AS DateTime), 0, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (4, 20, N'iPhone 15 Pro 256GB', N'Điện thoại iPhone 15 Pro, màu đen titan, dung lượng 256GB, hàng chính hãng VN/A.', CAST(28990000.00 AS Decimal(18, 2)), 30, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 0, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, CAST(N'2025-05-12 07:40:20.683' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (5, 2, N'Tai Nghe Không Dây AirPods Pro', N'Tai nghe không dây Apple AirPods Pro, chống ồn chủ động, âm thanh sống động.', CAST(5500000.00 AS Decimal(18, 2)), 50, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (6, 3, N'Nước Hoa Nữ Creed Aventus', N'Nước hoa nữ cao cấp Creed Aventus, mùi hương sang trọng, lưu hương lâu.', CAST(6500000.00 AS Decimal(18, 2)), 20, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (7, 1, N'Áo Khoác Gió Nam 2 Lớp', N'Áo khoác gió nam 2 lớp, chống thấm nước, phù hợp cho mùa đông, nhiều kích cỡ.', CAST(450000.00 AS Decimal(18, 2)), 100, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (8, 1, N'Giày Thể Thao Nam Biti’s Hunter', N'Giầy thể thao Biti’s Hunter, đế cao su êm ái, phong cách trẻ trung, màu đen.', CAST(750000.00 AS Decimal(18, 2)), 60, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (9, 4, N'Túi Xách Nữ Thời Trang', N'Túi xách nữ phong cách Hàn Quốc, chất liệu da PU cao cấp, màu nâu nhạt.', CAST(320000.00 AS Decimal(18, 2)), 90, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (10, 4, N'Đồng Hồ Nữ Casio Chính Hãng', N'Đồng hồ nữ Casio, mặt tròn, dây kim loại, phong cách thanh lịch, chống nước.', CAST(1200000.00 AS Decimal(18, 2)), 40, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (48, 1, N'Samsung Galaxy S23', N'Đang cập nhật', CAST(100.00 AS Decimal(18, 2)), 12, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (49, 1, N'MacBook Air M2', N'Laptop m?ng nh?', CAST(30000000.00 AS Decimal(18, 2)), 20, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (50, 1, N'AirPods Pro', N'Tai nghe không dây', CAST(6000000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (51, 1, N'Sony WH-1000XM5', N'Tai nghe ch?ng ?n', CAST(8000000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (52, 1, N'iPad Pro 11', N'Máy tính b?ng m?nh m?', CAST(22000000.00 AS Decimal(18, 2)), 25, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (53, 1, N'Apple Watch Series 9', N'Ð?ng h? thông minh', CAST(10000000.00 AS Decimal(18, 2)), 35, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (54, 1, N'USB-C Charger 20W', N'S?c nhanh', CAST(500000.00 AS Decimal(18, 2)), 80, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (55, 1, N'HDMI Cable 2m', N'Cáp k?t n?i ch?t lu?ng', CAST(200000.00 AS Decimal(18, 2)), 90, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (56, 2, N'Áo thun Uniqlo', N'Áo thun cotton tho?i mái', CAST(300000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (57, 2, N'Qu?n jeans Levi’s', N'Qu?n jeans b?n d?p', CAST(1200000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (58, 2, N'Giày sneaker Nike', N'Giày th? thao phong cách', CAST(2000000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (59, 2, N'Áo khoác bomber', N'Áo khoác th?i trang', CAST(800000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (60, 2, N'Th?t lung da', N'Th?t lung nam cao c?p', CAST(500000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (61, 2, N'Áo so mi Oxford', N'Áo so mi l?ch lãm', CAST(600000.00 AS Decimal(18, 2)), 45, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (62, 2, N'Qu?n short kaki', N'Qu?n ng?n nang d?ng', CAST(400000.00 AS Decimal(18, 2)), 55, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (63, 3, N'Cà chua h?u co', N'Cà chua tuoi s?ch', CAST(50000.00 AS Decimal(18, 2)), 100, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (64, 3, N'Táo nh?p kh?u', N'Táo ng?t organic', CAST(120000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (65, 3, N'Rau c?i bó xôi', N'Rau s?ch h?u co', CAST(30000.00 AS Decimal(18, 2)), 80, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (66, 3, N'Khoai lang Nh?t', N'Khoai lang ng?t', CAST(40000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (67, 3, N'Dua leo h?u co', N'Dua leo tuoi s?ch', CAST(25000.00 AS Decimal(18, 2)), 90, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (68, 3, N'Chu?i tiêu', N'Chu?i chín t? nhiên', CAST(35000.00 AS Decimal(18, 2)), 65, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (69, 3, N'B?p c?i h?u co', N'B?p c?i tuoi s?ch', CAST(40000.00 AS Decimal(18, 2)), 75, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 3, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (70, 4, N'N?i chiên không d?u', N'N?i chiên ti?n l?i', CAST(1500000.00 AS Decimal(18, 2)), 25, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (71, 4, N'Máy xay sinh t?', N'Máy xay da nang', CAST(700000.00 AS Decimal(18, 2)), 35, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (72, 4, N'B?p t? dôi', N'B?p t? an toàn', CAST(3000000.00 AS Decimal(18, 2)), 15, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (73, 4, N'Máy l?c nu?c RO', N'Máy l?c nu?c s?ch', CAST(5000000.00 AS Decimal(18, 2)), 10, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (74, 4, N'Qu?t di?u hòa', N'Qu?t làm mát hi?u qu?', CAST(2000000.00 AS Decimal(18, 2)), 20, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (75, 4, N'Lò vi sóng', N'Lò vi sóng ti?n d?ng', CAST(1200000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (76, 4, N'Máy hút b?i', N'Máy hút b?i nh? g?n', CAST(1000000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 4, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (77, 5, N'Sách Ð?c Nhân Tâm', N'Sách k? nang s?ng', CAST(150000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (78, 5, N'Nhà gi? kim', N'Ti?u thuy?t n?i ti?ng', CAST(120000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (79, 5, N'Sách Toán l?p 10', N'Sách giáo khoa', CAST(30000.00 AS Decimal(18, 2)), 80, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (80, 5, N'Harry Potter t?p 1', N'Ti?u thuy?t gi? tu?ng', CAST(200000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (81, 5, N'Sách h?c ti?ng Anh', N'Sách h?c ngo?i ng?', CAST(100000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (82, 5, N'T? h?c Python', N'Sách l?p trình', CAST(250000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (83, 5, N'Sách n?u an', N'Công th?c món ngon', CAST(180000.00 AS Decimal(18, 2)), 45, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (84, 6, N'T? tay 5kg', N'D?ng c? t?p gym', CAST(300000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (85, 6, N'Th?m yoga', N'Th?m t?p yoga ch?t lu?ng', CAST(200000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (86, 6, N'Xe d?p t?p', N'Xe d?p t?p th? d?c', CAST(3000000.00 AS Decimal(18, 2)), 15, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (87, 6, N'Bóng dá Adidas', N'Bóng dá ch?t lu?ng', CAST(500000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (88, 6, N'Áo th? thao Nike', N'Áo t?p gym thoáng khí', CAST(400000.00 AS Decimal(18, 2)), 55, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (89, 6, N'Gang tay t?p gym', N'Gang tay b?o v?', CAST(150000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (90, 6, N'Dây nh?y th? thao', N'Dây nh?y b?n b?', CAST(100000.00 AS Decimal(18, 2)), 80, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 6, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (91, 7, N'Son MAC Ruby Woo', N'Son môi cao c?p', CAST(600000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (92, 7, N'Kem n?n Estee Lauder', N'Kem n?n che khuy?t di?m', CAST(1200000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (93, 7, N'Nu?c t?y trang', N'T?y trang d?u nh?', CAST(300000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (94, 7, N'M?t n? gi?y', N'M?t n? du?ng da', CAST(50000.00 AS Decimal(18, 2)), 100, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (95, 7, N'Kem ch?ng n?ng', N'Kem ch?ng n?ng SPF50', CAST(400000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (96, 7, N'Ph?n má h?ng', N'Ph?n má t? nhiên', CAST(350000.00 AS Decimal(18, 2)), 45, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (97, 7, N'Mascara Maybelline', N'Mascara dài mi', CAST(200000.00 AS Decimal(18, 2)), 55, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 7, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (98, 8, N'Lego Classic 500', N'B? x?p hình sáng t?o', CAST(800000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (99, 8, N'Búp bê Barbie', N'Búp bê th?i trang', CAST(400000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (100, 8, N'Xe di?u khi?n t? xa', N'Xe d? choi t?c d?', CAST(600000.00 AS Decimal(18, 2)), 25, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (101, 8, N'B? x?p g?', N'Ð? choi giáo d?c', CAST(200000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (102, 8, N'Thú bông g?u', N'G?u bông dáng yêu', CAST(300000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (103, 8, N'B? d?t n?n', N'Ð?t n?n an toàn', CAST(150000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (104, 8, N'Bóng r? d? choi', N'B? bóng r? cho bé', CAST(250000.00 AS Decimal(18, 2)), 45, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 8, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (105, 9, N'Bàn h?c g?', N'Bàn h?c ch?c ch?n', CAST(2000000.00 AS Decimal(18, 2)), 15, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (106, 9, N'Gh? sofa da', N'Sofa sang tr?ng', CAST(8000000.00 AS Decimal(18, 2)), 10, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (107, 9, N'T? qu?n áo 3 cánh', N'T? g? b?n d?p', CAST(5000000.00 AS Decimal(18, 2)), 12, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (108, 9, N'K? sách 5 t?ng', N'K? sách ti?n l?i', CAST(1500000.00 AS Decimal(18, 2)), 20, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (109, 9, N'Giu?ng ng? 1.6m', N'Giu?ng g? hi?n d?i', CAST(4000000.00 AS Decimal(18, 2)), 15, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (110, 9, N'Bàn trà g?', N'Bàn trà nh? g?n', CAST(1000000.00 AS Decimal(18, 2)), 25, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (111, 9, N'Gh? van phòng', N'Gh? xoay tho?i mái', CAST(1200000.00 AS Decimal(18, 2)), 20, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 9, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (112, 10, N'Váy maxi hoa', N'Váy dài n? tính', CAST(600000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (113, 10, N'Áo croptop', N'Áo croptop nang d?ng', CAST(250000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (114, 10, N'Túi xách mini', N'Túi xách th?i trang', CAST(400000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (115, 10, N'Qu?n culottes', N'Qu?n ?ng r?ng thanh l?ch', CAST(350000.00 AS Decimal(18, 2)), 45, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (116, 10, N'Giày cao gót', N'Giày gót nh?n sang tr?ng', CAST(700000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (117, 10, N'Khan choàng l?a', N'Khan l?a m?m m?i', CAST(200000.00 AS Decimal(18, 2)), 55, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (118, 10, N'Áo blazer n?', N'Áo khoác công s?', CAST(800000.00 AS Decimal(18, 2)), 35, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 10, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (119, 11, N'Bút bi Thiên Long', N'Bút bi m?c xanh', CAST(5000.00 AS Decimal(18, 2)), 100, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (120, 11, N'V? h?c sinh 200 trang', N'V? k? ngang', CAST(30000.00 AS Decimal(18, 2)), 80, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (121, 11, N'H?p bút nh?a', N'H?p bút b?n d?p', CAST(50000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (122, 11, N'Máy tính Casio', N'Máy tính khoa h?c', CAST(300000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (123, 11, N'Bang keo trong', N'Bang keo ch?t lu?ng', CAST(10000.00 AS Decimal(18, 2)), 90, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (124, 11, N'K?p gi?y màu', N'K?p gi?y da nang', CAST(20000.00 AS Decimal(18, 2)), 85, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (125, 11, N'Bút chì g?', N'Bút chì HB', CAST(3000.00 AS Decimal(18, 2)), 95, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 11, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (126, 12, N'H?t di?u rang mu?i', N'H?t di?u thom ngon', CAST(200000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (127, 12, N'M?t d?a non', N'M?t d?a ng?t thanh', CAST(100000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (128, 12, N'Cá com khô', N'Cá com rim m?n', CAST(150000.00 AS Decimal(18, 2)), 40, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (129, 12, N'H?nh nhân M?', N'H?t h?nh nhân b? du?ng', CAST(250000.00 AS Decimal(18, 2)), 45, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (130, 12, N'Nho khô Iran', N'Nho khô ng?t t? nhiên', CAST(120000.00 AS Decimal(18, 2)), 55, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (131, 12, N'M?c khô lo?i 1', N'M?c khô tuoi ngon', CAST(500000.00 AS Decimal(18, 2)), 30, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (132, 12, N'H?t óc chó', N'H?t óc chó nh?p kh?u', CAST(300000.00 AS Decimal(18, 2)), 35, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 12, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (133, 13, N'Trà xanh túi l?c', N'Trà xanh thom mát', CAST(50000.00 AS Decimal(18, 2)), 80, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (134, 13, N'Cà phê hòa tan', N'Cà phê d?m dà', CAST(100000.00 AS Decimal(18, 2)), 60, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (135, 13, N'Nu?c ép cam', N'Nu?c ép nguyên ch?t', CAST(40000.00 AS Decimal(18, 2)), 70, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (136, 13, N'S?a tuoi Vinamilk', N'S?a tuoi không du?ng', CAST(30000.00 AS Decimal(18, 2)), 90, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (137, 13, N'Trà ô long', N'Trà ô long thu?ng h?ng', CAST(150000.00 AS Decimal(18, 2)), 50, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (138, 13, N'Nu?c khoáng Lavie', N'Nu?c khoáng tinh khi?t', CAST(10000.00 AS Decimal(18, 2)), 100, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (139, 13, N'Nu?c ng?t Coca', N'Nu?c ng?t có gas', CAST(15000.00 AS Decimal(18, 2)), 85, CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 13, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (140, 2, N'Tai nghe havit***', N'string', CAST(0.01 AS Decimal(18, 2)), 2147483647, CAST(N'2025-04-28 08:13:23.627' AS DateTime), 1, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive], [imageURL], [SellerCategoryID], [SellerID], [UpdatedAt]) VALUES (143, 22, N'Laptop Gaming Dell', N'Đang cập nhật...', CAST(6600000.00 AS Decimal(18, 2)), 12, CAST(N'2025-05-07 03:13:02.593' AS DateTime), 0, N'https://res.cloudinary.com/chipchipstore21112023/image/upload/v1746587580/xnjxbfvvbciocuitflet.jpg', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[SellerCategories] ON 

INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (1, 1, N'Ði?n t?', N'Ði?n tho?i, laptop, ph? ki?n', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (2, 1, N'Th?i trang nam', N'Áo thun, qu?n jeans, d? th? thao', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (3, 1, N'Th?c ph?m h?u co', N'Rau c?, trái cây s?ch', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (4, 1, N'Gia d?ng', N'Máy xay, n?i chiên, b?p t?', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (5, 1, N'Sách', N'Sách giáo khoa, ti?u thuy?t, k? nang', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (6, 1, N'Th? thao', N'D?ng c? gym, qu?n áo th? thao', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (7, 1, N'M? ph?m', N'Son, kem n?n, cham sóc da', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (8, 1, N'Ð? choi tr? em', N'Lego, búp bê, xe di?u khi?n', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (9, 2, N'Ð? n?i th?t', N'Bàn gh?, t? k?, giu?ng', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (10, 2, N'Th?i trang n?', N'Váy, áo so mi, ph? ki?n', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (11, 2, N'Van phòng ph?m', N'Bút, v?, d?ng c? h?c t?p', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (12, 2, N'Th?c ph?m khô', N'H?t, m?t, h?i s?n khô', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SellerCategories] ([SellerCategoryID], [SellerID], [CategoryName], [Description], [CreatedAt], [IsActive]) VALUES (13, 2, N'Ð? u?ng', N'Trà, cà phê, nu?c gi?i khát', CAST(N'2024-01-01 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SellerCategories] OFF
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([SellerID], [UserID], [ShopName], [CreatedAt], [IsActive]) VALUES (1, 1, N'Shop Hùng Nguyễn', CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sellers] ([SellerID], [UserID], [ShopName], [CreatedAt], [IsActive]) VALUES (2, 2, N'Shop Mai Anh', CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Sellers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (1, N'seller1@gmail.com', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Nguyễn Văn Hùng', N'0901234567', N'123 Đường Nguyễn Huệ, Quận 1, TP.HCM', NULL, NULL, 0, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, NULL, NULL, N'Seller')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (2, N'seller2@gmail.com', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Trần Thị Mai Anh', N'0912345678', N'456 Đường Lê Lợi, TP. Đà Nẵng', NULL, NULL, 0, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, NULL, NULL, N'Seller')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (3, N'customer1@shopx.vn', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Phạm Quốc Anh', N'0987654321', N'789 Đường Trần Phú, Quận 5, TP.HCM', NULL, NULL, 0, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, NULL, NULL, N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (4, N'customer2@shopx.vn', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Lê Thị Hồng Nhung', N'0931234567', N'101 Đường Nguyễn Trãi, Quận Thanh Xuân, Hà Nội', NULL, NULL, 0, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, NULL, NULL, N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (5, N'customer3@shopx.vn', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Nguyễn Thành Đạt', N'0978765432', N'202 Đường Lê Đại Hành, TP. Huế', NULL, NULL, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, NULL, NULL, N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (6, N'customer4@shopx.vn', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Võ Thị Kim Ngân', N'0945678901', N'303 Đường Phạm Văn Đồng, TP. Nha Trang', NULL, NULL, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 1, NULL, NULL, N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (7, N'customer5@shopx.vn', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Hoàng Minh Tuấn', N'0961234567', N'404 Đường Điện Biên Phủ, TP. Đà Lạt', NULL, NULL, 1, CAST(N'2025-04-20 08:00:00.000' AS DateTime), 0, NULL, NULL, N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (8, N'xuanthai0304@gmail.com', N'$2a$11$Oa.QoDUD6q4nxuNbEJDL8emXxz1LDwAcyUH3gHpURAkwPUYrhbfNW', N'Đinh Xuân Thái', N'0852834966', N'111 Hồ Đắc Di, Thành phố Huế, Thừa Thiên Huế', N'https://res.cloudinary.com/dgewgggyd/image/upload/v1747272898/anh_mw8viu.jpg', CAST(N'2003-05-06' AS Date), 1, CAST(N'2025-04-22 08:16:53.177' AS DateTime), 1, NULL, NULL, N'Admin')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (9, N'21t1020687@husc.edu.vn', N'$2a$11$vcdGxZbByxUYfeEa/KrGj.2qo3x9TSTq/lAKZI8CiuK20ix6iVCFK', N'Hoàng Văn A', N'0123456789', N'Đang cập nhật...', NULL, NULL, 0, CAST(N'2025-04-22 16:08:50.640' AS DateTime), 1, N'google.com', N'Cwe8wVwcKJOxVHbQkHymcuDXKUm2', N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (10, N'21t1020687a@husc.edu.vn', N'$2a$11$hYsTBc9Fboj0G57gncQ74eE8dZUaU8i96WHi2q4UIBVybcFBnR/Xa', N'xuan thai', N'0852834966', N'1/350 Phan Chu Trinh', NULL, NULL, NULL, CAST(N'2025-04-24 13:20:19.417' AS DateTime), 1, NULL, NULL, N'Customer')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [Phone], [Address], [Avatar], [Birthday], [Gender], [CreatedAt], [IsActive], [SocialProvider], [SocialID], [Role]) VALUES (11, N'fqfwqfwqwq@gmail.com', N'SOCIAL_LOGIN_2a6079c6-7180-47c4-84d8-17ccc78549f0', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-25 07:51:36.063' AS DateTime), 1, N'facebook.com', N'AgHEhZegIuULc3Rj7ji7s1avvJo1', N'Customer')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Discounts_DiscountCode]    Script Date: 5/15/2025 9:57:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Discounts_DiscountCode] ON [dbo].[Discounts]
(
	[DiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 5/15/2025 9:57:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (getdate()) FOR [AddedAt]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Discounts] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Create__282DF8C2]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__IsActi__29221CFB]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerCategories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SellerCategories] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Sellers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Sellers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__CreatedAt__2BFE89A6]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__IsActive__2CF2ADDF]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Role]  DEFAULT (N'Customer') FOR [Role]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Carts] ([CartID])
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK__CartItems__Produ__2EDAF651] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK__CartItems__Produ__2EDAF651]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK__Carts__UserID__2FCF1A8A] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK__Carts__UserID__2FCF1A8A]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__UserID__32AB8735] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__UserID__32AB8735]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Discounts] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Discounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__3493CFA7] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__3493CFA7]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SellerCategories] FOREIGN KEY([SellerCategoryID])
REFERENCES [dbo].[SellerCategories] ([SellerCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SellerCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sellers] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sellers]
GO
ALTER TABLE [dbo].[SellerCategories]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK__Sellers__UserID__367C1819] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK__Sellers__UserID__367C1819]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Thêm danh mục mới
-- Chức năng: Thêm một danh mục sản phẩm mới vào bảng Categories
CREATE PROCEDURE [dbo].[AddCategory]
    @CategoryName NVARCHAR(50),
    @Description NVARCHAR(255),
    @CategoryID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM [dbo].[Categories] WHERE [CategoryName] = @CategoryName)
    BEGIN
        RAISERROR ('Danh mục đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO [dbo].[Categories] ([CategoryName], [Description])
    VALUES (@CategoryName, @Description);

    SET @CategoryID = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Thêm sản phẩm mới (dành cho Seller)
-- Chức năng: Cho phép Seller thêm sản phẩm mới vào bảng Products
CREATE PROCEDURE [dbo].[AddProduct]
    @SellerID INT,
    @CategoryID INT,
    @ProductName NVARCHAR(100),
    @Description NVARCHAR(max),
    @Price DECIMAL(18, 2),
    @StockQuantity INT,
    @ProductID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Sellers] WHERE [SellerID] = @SellerID AND [IsActive] = 1)
    BEGIN
        RAISERROR ('Seller không tồn tại hoặc không hoạt động.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Categories] WHERE [CategoryID] = @CategoryID)
    BEGIN
        RAISERROR ('Danh mục không tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO [dbo].[Products] ([CategoryID], [SellerID], [ProductName], [Description], [Price], [StockQuantity], [CreatedAt], [IsActive])
    VALUES (@CategoryID, @SellerID, @ProductName, @Description, @Price, @StockQuantity, GETDATE(), 1);

    SET @ProductID = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Thêm sản phẩm vào giỏ hàng
-- Chức năng: Thêm sản phẩm vào giỏ hàng của người dùng, nếu chưa có giỏ hàng thì tạo mới
CREATE PROCEDURE [dbo].[AddToCart]
    @UserID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CartID INT;

    -- Kiểm tra xem sản phẩm có tồn tại và còn hàng không
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Products] WHERE [ProductID] = @ProductID AND [IsActive] = 1 AND [StockQuantity] >= @Quantity)
    BEGIN
        RAISERROR ('Sản phẩm không tồn tại hoặc không đủ số lượng trong kho.', 16, 1);
        RETURN;
    END

    -- Kiểm tra xem người dùng đã có giỏ hàng chưa
    SELECT @CartID = [CartID]
    FROM [dbo].[Carts]
    WHERE [UserID] = @UserID;

    IF @CartID IS NULL
    BEGIN
        -- Tạo giỏ hàng mới
        INSERT INTO [dbo].[Carts] ([UserID], [CreatedAt])
        VALUES (@UserID, GETDATE());
        SET @CartID = SCOPE_IDENTITY();
    END

    -- Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    IF EXISTS (SELECT 1 FROM [dbo].[CartItems] WHERE [CartID] = @CartID AND [ProductID] = @ProductID)
    BEGIN
        -- Cập nhật số lượng nếu sản phẩm đã có trong giỏ hàng
        UPDATE [dbo].[CartItems]
        SET [Quantity] = [Quantity] + @Quantity,
            [AddedAt] = GETDATE()
        WHERE [CartID] = @CartID AND [ProductID] = @ProductID;
    END
    ELSE
    BEGIN
        -- Thêm sản phẩm mới vào giỏ hàng
        INSERT INTO [dbo].[CartItems] ([CartID], [ProductID], [Quantity], [AddedAt])
        VALUES (@CartID, @ProductID, @Quantity, GETDATE());
    END
END

GO
/****** Object:  StoredProcedure [dbo].[CreateOrderFromCart]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Tạo đơn hàng từ giỏ hàng
-- Chức năng: Chuyển các sản phẩm trong giỏ hàng thành đơn hàng, áp dụng mã giảm giá nếu có
CREATE PROCEDURE [dbo].[CreateOrderFromCart]
    @UserID INT,
    @DiscountCode NVARCHAR(50),
    @ShippingAddress NVARCHAR(255),
    @OrderID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CartID INT;
    DECLARE @TotalAmount DECIMAL(18, 2) = 0;
    DECLARE @DiscountPercent DECIMAL(5, 2) = 0;

    -- Kiểm tra giỏ hàng của người dùng
    SELECT @CartID = [CartID]
    FROM [dbo].[Carts]
    WHERE [UserID] = @UserID;

    IF @CartID IS NULL OR NOT EXISTS (SELECT 1 FROM [dbo].[CartItems] WHERE [CartID] = @CartID)
    BEGIN
        RAISERROR ('Giỏ hàng trống hoặc không tồn tại.', 16, 1);
        RETURN;
    END

    -- Tính tổng tiền
    SELECT @TotalAmount = SUM(ci.[Quantity] * p.[Price])
    FROM [dbo].[CartItems] ci
    JOIN [dbo].[Products] p ON ci.[ProductID] = p.[ProductID]
    WHERE ci.[CartID] = @CartID;

    -- Kiểm tra và áp dụng mã giảm giá
    IF @DiscountCode IS NOT NULL
    BEGIN
        SELECT @DiscountPercent = [DiscountPercent]
        FROM [dbo].[Discounts]
        WHERE [DiscountCode] = @DiscountCode AND [IsActive] = 1 AND GETDATE() BETWEEN [StartDate] AND [EndDate];

        IF @DiscountPercent IS NULL
        BEGIN
            SET @DiscountPercent = 0;
        END
    END

    -- Áp dụng giảm giá vào tổng tiền
    SET @TotalAmount = @TotalAmount * (1 - @DiscountPercent / 100);

    -- Tạo đơn hàng
    INSERT INTO [dbo].[Orders] ([UserID], [OrderDate], [TotalAmount], [Status], [DiscountCode], [ShippingAddress])
    VALUES (@UserID, GETDATE(), @TotalAmount, N'Đang xử lý', @DiscountCode, @ShippingAddress);

    SET @OrderID = SCOPE_IDENTITY();

    -- Thêm chi tiết đơn hàng từ giỏ hàng
    INSERT INTO [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice])
    SELECT @OrderID, ci.[ProductID], ci.[Quantity], p.[Price]
    FROM [dbo].[CartItems] ci
    JOIN [dbo].[Products] p ON ci.[ProductID] = p.[ProductID]
    WHERE ci.[CartID] = @CartID;

    -- Xóa giỏ hàng sau khi tạo đơn hàng
    DELETE FROM [dbo].[CartItems] WHERE [CartID] = @CartID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetUserOrderHistory]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Xem lịch sử đơn hàng của người dùng
-- Chức năng: Cho phép người dùng xem danh sách các đơn hàng đã đặt
CREATE PROCEDURE [dbo].[GetUserOrderHistory]
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT o.[OrderID], o.[OrderDate], o.[TotalAmount], o.[Status], o.[DiscountCode], o.[ShippingAddress],
           od.[OrderDetailID], od.[ProductID], od.[Quantity], od.[UnitPrice],
           p.[ProductName], s.[ShopName]
    FROM [dbo].[Orders] o
    JOIN [dbo].[OrderDetails] od ON o.[OrderID] = od.[OrderID]
    JOIN [dbo].[Products] p ON od.[ProductID] = p.[ProductID]
    JOIN [dbo].[Sellers] s ON p.[SellerID] = s.[SellerID]
    WHERE o.[UserID] = @UserID
    ORDER BY o.[OrderDate] DESC;
END

GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Đăng nhập người dùng
-- Chức năng: Kiểm tra thông tin đăng nhập và trả về UserID nếu hợp lệ
CREATE PROCEDURE [dbo].[LoginUser]
    @Email NVARCHAR(100),
    @PasswordHash NVARCHAR(256),
    @UserID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET @UserID = NULL;

    SELECT @UserID = [UserID]
    FROM [dbo].[Users]
    WHERE [Email] = @Email AND [PasswordHash] = @PasswordHash AND [IsActive] = 1;

    IF @UserID IS NULL
    BEGIN
        RAISERROR ('Email hoặc mật khẩu không đúng, hoặc tài khoản bị khóa.', 16, 1);
    END
END

GO
/****** Object:  StoredProcedure [dbo].[RegisterSeller]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Đăng ký Seller
-- Chức năng: Đăng ký một người dùng thành Seller, thêm thông tin vào bảng Sellers
CREATE PROCEDURE [dbo].[RegisterSeller]
    @UserID INT,
    @ShopName NVARCHAR(100),
    @SellerID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [UserID] = @UserID)
    BEGIN
        RAISERROR ('Người dùng không tồn tại.', 16, 1);
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM [dbo].[Sellers] WHERE [UserID] = @UserID)
    BEGIN
        RAISERROR ('Người dùng đã là Seller.', 16, 1);
        RETURN;
    END

    INSERT INTO [dbo].[Sellers] ([UserID], [ShopName], [CreatedAt], [IsActive])
    VALUES (@UserID, @ShopName, GETDATE(), 1);

    SET @SellerID = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Đăng ký người dùng mới
-- Chức năng: Thêm một người dùng mới (User) vào bảng Users
CREATE PROCEDURE [dbo].[RegisterUser]
    @Email NVARCHAR(100),
    @PasswordHash NVARCHAR(256),
    @FullName NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Address NVARCHAR(255),
    @UserID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [Email] = @Email)
    BEGIN
        RAISERROR ('Email đã tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO [dbo].[Users] ([Email], [PasswordHash], [FullName], [Phone], [Address], [CreatedAt], [IsActive])
    VALUES (@Email, @PasswordHash, @FullName, @Phone, @Address, GETDATE(), 1);

    SET @UserID = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[SearchProducts]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Tìm kiếm sản phẩm
-- Chức năng: Cho phép người dùng tìm kiếm sản phẩm theo tên, danh mục (hỗ trợ tìm kiếm gần đúng)
CREATE PROCEDURE [dbo].[SearchProducts]
    @SearchText NVARCHAR(100),
    @CategoryID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT p.[ProductID], p.[ProductName], p.[Description], p.[Price], p.[StockQuantity], c.[CategoryName], s.[ShopName]
    FROM [dbo].[Products] p
    JOIN [dbo].[Categories] c ON p.[CategoryID] = c.[CategoryID]
    JOIN [dbo].[Sellers] s ON p.[SellerID] = s.[SellerID]
    WHERE p.[ProductName] LIKE '%' + @SearchText + '%' 
    AND p.[IsActive] = 1
    AND (@CategoryID IS NULL OR p.[CategoryID] = @CategoryID);
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDiscountStatus]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDiscountStatus]
AS
BEGIN
    UPDATE [TMDTShopX].[dbo].[Discounts]
    SET IsActive = 0
    WHERE EndDate < GETDATE() AND IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderStatus]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Cập nhật trạng thái đơn hàng (dành cho Seller)
-- Chức năng: Cho phép Seller cập nhật trạng thái đơn hàng (Đang xử lý, Đang giao hàng, Đã giao hàng, Đã hủy)
CREATE PROCEDURE [dbo].[UpdateOrderStatus]
    @OrderID INT,
    @SellerID INT,
    @Status NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (
        SELECT 1 
        FROM [dbo].[Orders] o
        JOIN [dbo].[OrderDetails] od ON o.[OrderID] = od.[OrderID]
        JOIN [dbo].[Products] p ON od.[ProductID] = p.[ProductID]
        WHERE o.[OrderID] = @OrderID AND p.[SellerID] = @SellerID
    )
    BEGIN
        RAISERROR ('Đơn hàng không tồn tại hoặc không thuộc Seller này.', 16, 1);
        RETURN;
    END

    UPDATE [dbo].[Orders]
    SET [Status] = @Status
    WHERE [OrderID] = @OrderID;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 5/15/2025 9:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Cập nhật thông tin sản phẩm (dành cho Seller)
-- Chức năng: Cho phép Seller chỉnh sửa thông tin sản phẩm
CREATE PROCEDURE [dbo].[UpdateProduct]
    @ProductID INT,
    @SellerID INT,
    @CategoryID INT,
    @ProductName NVARCHAR(100),
    @Description NVARCHAR(max),
    @Price DECIMAL(18, 2),
    @StockQuantity INT,
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Products] WHERE [ProductID] = @ProductID AND [SellerID] = @SellerID)
    BEGIN
        RAISERROR ('Sản phẩm không tồn tại hoặc không thuộc Seller này.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Categories] WHERE [CategoryID] = @CategoryID)
    BEGIN
        RAISERROR ('Danh mục không tồn tại.', 16, 1);
        RETURN;
    END

    UPDATE [dbo].[Products]
    SET [CategoryID] = @CategoryID,
        [ProductName] = @ProductName,
        [Description] = @Description,
        [Price] = @Price,
        [StockQuantity] = @StockQuantity,
        [IsActive] = @IsActive
    WHERE [ProductID] = @ProductID;
END

GO
USE [master]
GO
ALTER DATABASE [TMDTShopX] SET  READ_WRITE 
GO
