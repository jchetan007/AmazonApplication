USE [master]
GO
/****** Object:  Database [RadixDb]    Script Date: 18-03-2020 16:19:59 ******/
CREATE DATABASE [RadixDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RadixDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\RadixDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RadixDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\RadixDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RadixDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RadixDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RadixDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RadixDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RadixDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RadixDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RadixDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RadixDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RadixDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RadixDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RadixDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RadixDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RadixDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RadixDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RadixDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RadixDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RadixDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RadixDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RadixDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RadixDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RadixDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RadixDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RadixDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RadixDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RadixDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RadixDb] SET  MULTI_USER 
GO
ALTER DATABASE [RadixDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RadixDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RadixDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RadixDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RadixDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RadixDb] SET QUERY_STORE = OFF
GO
USE [RadixDb]
GO
/****** Object:  Schema [core]    Script Date: 18-03-2020 16:19:59 ******/
CREATE SCHEMA [core]
GO
/****** Object:  Table [dbo].[ApplicationLocales]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationLocales](
	[ApplicationLocaleId] [int] IDENTITY(1,1) NOT NULL,
	[LocaleCode] [varchar](50) NOT NULL,
	[LocaleName] [nvarchar](300) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationLocales] PRIMARY KEY CLUSTERED 
(
	[ApplicationLocaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationTimeZones]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationTimeZones](
	[ApplicationTimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationTimeZoneName] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_TimeZones] PRIMARY KEY CLUSTERED 
(
	[ApplicationTimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationLocaleId] [int] NOT NULL,
	[ApplicationTimeZoneId] [int] NOT NULL,
	[LanguageCode] [varchar](3) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [binary](132) NOT NULL,
	[Salt] [binary](140) NOT NULL,
	[LoginBlocked] [bit] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsers]
AS
SELECT        appuser.UserId, timezone.ApplicationTimeZoneName, appuser.LanguageCode, appuser.UserName, appuser.Password, appuser.Salt, appuser.LoginBlocked, locale.LocaleCode
FROM            dbo.Users AS appuser INNER JOIN
                         dbo.ApplicationLocales AS locale ON appuser.ApplicationLocaleId = locale.ApplicationLocaleId INNER JOIN
                         dbo.ApplicationTimeZones AS timezone ON appuser.ApplicationTimeZoneId = timezone.ApplicationTimeZoneId
GO
/****** Object:  Table [dbo].[PromoCodes]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoCodes](
	[PromoCodeId] [int] IDENTITY(1,1) NOT NULL,
	[PromoCodeName] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PromoCodes] PRIMARY KEY CLUSTERED 
(
	[PromoCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[PaymentDate] [datetimeoffset](7) NOT NULL,
	[PromoCodeId] [int] NULL,
	[AppUserId] [int] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vPromoCodes]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPromoCodes]
AS
SELECT        dbo.PromoCodes.PromoCodeName, dbo.PromoCodes.Amount, dbo.Payments.AppUserId
FROM            dbo.Payments INNER JOIN
                         dbo.PromoCodes ON dbo.Payments.PromoCodeId = dbo.PromoCodes.PromoCodeId
GO
/****** Object:  Table [dbo].[MusicCategories]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicCategories](
	[MusicCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[MusicCategoryName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MusicCategories] PRIMARY KEY CLUSTERED 
(
	[MusicCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musics]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musics](
	[MusicId] [int] IDENTITY(1,1) NOT NULL,
	[MusicName] [varchar](20) NOT NULL,
	[MusicSubCategoryId] [int] NOT NULL,
	[AlbumName] [varchar](20) NOT NULL,
	[ArtistName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Musics] PRIMARY KEY CLUSTERED 
(
	[MusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusicSubCategories]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicSubCategories](
	[MusicSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PrimeMusicId] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[MusicCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_MusicSubCategories] PRIMARY KEY CLUSTERED 
(
	[MusicSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vMusics]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMusics]
AS
SELECT        dbo.Musics.MusicId, dbo.Musics.MusicName, dbo.Musics.AlbumName, dbo.Musics.ArtistName, dbo.Musics.MusicSubCategoryId, dbo.MusicSubCategories.CategoryName, dbo.MusicCategories.MusicCategoryName
FROM            dbo.Musics INNER JOIN
                         dbo.MusicSubCategories ON dbo.Musics.MusicSubCategoryId = dbo.MusicSubCategories.MusicSubCategoryId INNER JOIN
                         dbo.MusicCategories ON dbo.MusicSubCategories.MusicCategoryId = dbo.MusicCategories.MusicCategoryId
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[AppUserId] [int] IDENTITY(1,1) NOT NULL,
	[AppUserName] [varchar](20) NOT NULL,
	[MobileNumber] [varchar](20) NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Password] [binary](132) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[RoleId] [int] NULL,
	[Salt] [binary](140) NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[OriginalProductPrice] [bigint] NOT NULL,
	[SellerDetailId] [int] NOT NULL,
	[BrandId] [int] NULL,
	[SizeId] [int] NULL,
	[MaterialId] [int] NULL,
	[ColorId] [int] NULL,
	[LanguageId] [int] NULL,
	[RoleId] [int] NULL,
	[BankDetailId] [int] NULL,
	[DiscountProductPrice] [bigint] NOT NULL,
	[ProductMainCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[SellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryId] [int] NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vProducts]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vProducts]
AS
SELECT        dbo.Products.ProductId, dbo.Sellers.ProductName, dbo.Sellers.OriginalProductPrice, dbo.Sellers.DiscountProductPrice, dbo.AppUsers.AppUserId, dbo.Products.ProductSubCategoryId
FROM            dbo.Products INNER JOIN
                         dbo.Sellers ON dbo.Products.SellerId = dbo.Sellers.SellerId INNER JOIN
                         dbo.AppUsers ON dbo.Sellers.RoleId = dbo.AppUsers.AppUserId
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[TotalPrice] [int] NULL,
	[CartQuantity] [int] NULL,
	[CartValue] [int] NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[TransactionId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerDetails]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerDetails](
	[SellerDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[PanNumber] [varchar](10) NOT NULL,
	[ShippingFeeDetailId] [int] NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_SellerDetails] PRIMARY KEY CLUSTERED 
(
	[SellerDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [int] NOT NULL,
	[InvoiceDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vInvoices]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vInvoices]
AS
SELECT        dbo.Invoices.InvoiceId, dbo.Invoices.InvoiceDate, dbo.AppUsers.AppUserName, dbo.SellerDetails.CompanyName, dbo.Sellers.ProductName, dbo.Sellers.OriginalProductPrice, dbo.Sellers.DiscountProductPrice, 
                         dbo.CartItems.ProductQuantity, dbo.Orders.CreatedDate, dbo.CartItems.CartValue
FROM            dbo.Sellers INNER JOIN
                         dbo.AppUsers INNER JOIN
                         dbo.Payments INNER JOIN
                         dbo.Invoices ON dbo.Payments.PaymentId = dbo.Invoices.PaymentId INNER JOIN
                         dbo.Orders ON dbo.Payments.OrderId = dbo.Orders.OrderId ON dbo.AppUsers.AppUserId = dbo.Orders.AppUserId ON dbo.Sellers.RoleId = dbo.AppUsers.AppUserId INNER JOIN
                         dbo.SellerDetails ON dbo.AppUsers.AppUserId = dbo.SellerDetails.AppUserId AND dbo.Sellers.SellerDetailId = dbo.SellerDetails.SellerDetailId CROSS JOIN
                         dbo.CartItems
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryName] [varchar](50) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ProductMainCategoryId] [int] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vProductCategoryLookups]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vProductCategoryLookups]
AS
SELECT        ProductCategoryName, ProductCategoryId
FROM            dbo.ProductCategories
GO
/****** Object:  View [dbo].[vCartItems]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCartItems]
AS
SELECT        dbo.Products.SellerId, dbo.CartItems.CartItemId, dbo.Sellers.ProductName, dbo.Sellers.OriginalProductPrice, dbo.Sellers.DiscountProductPrice, dbo.CartItems.ProductQuantity, dbo.CartItems.TotalPrice, 
                         dbo.CartItems.CartQuantity, dbo.CartItems.ProductId, dbo.CartItems.CartValue, dbo.CartItems.AppUserId
FROM            dbo.Products INNER JOIN
                         dbo.Sellers ON dbo.Products.SellerId = dbo.Sellers.SellerId INNER JOIN
                         dbo.CartItems ON dbo.Products.ProductId = dbo.CartItems.ProductId
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[SellerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ValidityFrom] [datetimeoffset](7) NOT NULL,
	[ValidityTill] [datetimeoffset](7) NOT NULL,
	[DiscountPrice] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[AdvertisementId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [image] NULL,
	[OfferId] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OfferPercentage] [int] NOT NULL,
	[DiscountId] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAdvertisements]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAdvertisements]
AS
SELECT        dbo.Advertisements.AdvertisementId, dbo.Offers.OfferPercentage, dbo.Discounts.DiscountPrice
FROM            dbo.Advertisements INNER JOIN
                         dbo.Offers ON dbo.Advertisements.OfferId = dbo.Offers.OfferId INNER JOIN
                         dbo.Discounts ON dbo.Offers.DiscountId = dbo.Discounts.DiscountId
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationModules]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationModules](
	[ApplicationModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleMasterId] [int] NOT NULL,
	[ParentApplicationModuleId] [int] NULL,
 CONSTRAINT [PK_ApplicationModules] PRIMARY KEY CLUSTERED 
(
	[ApplicationModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjects]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjects](
	[ApplicationObjectId] [int] NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
	[ApplicationObjectName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjects] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectTypes]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectTypes](
	[ApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjectTypes] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserTokens]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserTokens](
	[ApplicationUserTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SecurityKey] [varchar](200) NOT NULL,
	[JwtToken] [varchar](max) NOT NULL,
	[AudienceType] [varchar](50) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ApplicationUserTokens] PRIMARY KEY CLUSTERED 
(
	[ApplicationUserTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankDetails](
	[BankDetailId] [int] IDENTITY(1,1) NOT NULL,
	[AccountHolderName] [varchar](50) NOT NULL,
	[AccountType] [varchar](50) NOT NULL,
	[AccountNumber] [varchar](20) NOT NULL,
	[Balance] [float] NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_BankDetails] PRIMARY KEY CLUSTERED 
(
	[BankDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [varchar](20) NOT NULL,
	[CardType] [varchar](50) NOT NULL,
	[ExpiryDate] [varchar](50) NOT NULL,
	[Cvv] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentLanguageContents]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentLanguageContents](
	[ComponentLanguageContentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentKeyId] [int] NOT NULL,
	[LanguageContentId] [int] NOT NULL,
	[En] [varchar](max) NULL,
	[Fr] [varchar](max) NULL,
 CONSTRAINT [PK_ModuleProperties] PRIMARY KEY CLUSTERED 
(
	[ComponentLanguageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [varchar](50) NULL,
	[Image] [image] NULL,
	[Ratings] [float] NOT NULL,
	[AppUserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageContentKeys]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageContentKeys](
	[LanguageContentKeyId] [int] IDENTITY(1,1) NOT NULL,
	[KeyName] [varchar](50) NOT NULL,
	[IsComponent] [bit] NOT NULL,
 CONSTRAINT [PK_LanguageContentKeys] PRIMARY KEY CLUSTERED 
(
	[LanguageContentKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageContents]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageContents](
	[LanguageContentId] [int] IDENTITY(1,1) NOT NULL,
	[LanguageContentKeyId] [int] NOT NULL,
	[ContentType] [varchar](3) NOT NULL,
	[En] [varchar](max) NOT NULL,
	[Fr] [varchar](max) NULL,
 CONSTRAINT [PK_LanguageContents] PRIMARY KEY CLUSTERED 
(
	[LanguageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleMasters]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMasters](
	[ModuleMasterId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleMasterName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ModuleMasters] PRIMARY KEY CLUSTERED 
(
	[ModuleMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ExpectedDate] [datetimeoffset](7) NOT NULL,
	[ShippingFeeDetailId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrdeDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otps]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otps](
	[OtpId] [int] IDENTITY(1,1) NOT NULL,
	[OtpNumber] [int] NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
	[MobileNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Otps] PRIMARY KEY CLUSTERED 
(
	[OtpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimeMusics]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimeMusics](
	[PrimeMusicId] [int] IDENTITY(1,1) NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_PrimeMusics] PRIMARY KEY CLUSTERED 
(
	[PrimeMusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMainCategories]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMainCategories](
	[ProductMainCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductMainCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductMainCategories] PRIMARY KEY CLUSTERED 
(
	[ProductMainCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubCategories](
	[ProductSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryName] [varchar](50) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductSubCategories] PRIMARY KEY CLUSTERED 
(
	[ProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ApplicationModuleId] [int] NOT NULL,
	[CanView] [bit] NULL,
	[CanAdd] [bit] NULL,
	[CanEdit] [bit] NULL,
	[CanDelete] [bit] NULL,
	[PermissionPriority] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ShippingDate] [datetimeoffset](7) NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingFeeDetails]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingFeeDetails](
	[ShippingFeeDetailId] [int] IDENTITY(1,1) NOT NULL,
	[LocalAmount] [int] NOT NULL,
	[RegionalAmount] [int] NOT NULL,
	[NationalAmount] [int] NOT NULL,
	[ApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_ShippingFeeDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingFeeDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[TaxDetails] [varchar](50) NOT NULL,
	[Gst] [varchar](50) NOT NULL,
	[Signature] [image] NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[SellerDetailId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[UserAddressId] [int] IDENTITY(1,1) NOT NULL,
	[HouseNumber] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[Landmark] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[AddressType] [varchar](50) NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[UserAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 18-03-2020 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([UserName], [Password], [RoleId], [AdminId]) VALUES (N'Rutvika', N'rutvika', 1, 1)
SET IDENTITY_INSERT [dbo].[Admins] OFF
SET IDENTITY_INSERT [dbo].[Advertisements] ON 

INSERT [dbo].[Advertisements] ([AdvertisementId], [Image], [OfferId], [ApplicationObjectId]) VALUES (1, NULL, 1, 5)
SET IDENTITY_INSERT [dbo].[Advertisements] OFF
SET IDENTITY_INSERT [dbo].[ApplicationLocales] ON 

INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (1, N'', N'Invariant Language (Invariant Country)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (2, N'aa', N'Qafar', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (3, N'aa-DJ', N'Qafar (Yabuuti)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (4, N'aa-ER', N'Qafar (Eretria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (5, N'aa-ET', N'Qafar (Otobbia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (6, N'af', N'Afrikaans', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (7, N'af-NA', N'Afrikaans (Namibië)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (8, N'af-ZA', N'Afrikaans (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (9, N'agq', N'Aghem', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (10, N'agq-CM', N'Aghem (Kàmàlû?)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (11, N'ak', N'Akan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (12, N'ak-GH', N'Akan (Gaana)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (13, N'am', N'Amharic', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (14, N'am-ET', N'Amharic (Ethiopia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (15, N'ar', N'Arabic', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (16, N'ar-001', N'??????? (??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (17, N'ar-AE', N'Arabic (United Arab Emirates)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (18, N'ar-BH', N'Arabic (Bahrain)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (19, N'ar-DJ', N'??????? (??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (20, N'ar-DZ', N'Arabic (Algeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (21, N'ar-EG', N'Arabic (Egypt)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (22, N'ar-ER', N'??????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (23, N'ar-IL', N'??????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (24, N'ar-IQ', N'Arabic (Iraq)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (25, N'ar-JO', N'Arabic (Jordan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (26, N'ar-KM', N'??????? (??? ?????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (27, N'ar-KW', N'Arabic (Kuwait)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (28, N'ar-LB', N'Arabic (Lebanon)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (29, N'ar-LY', N'Arabic (Libya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (30, N'ar-MA', N'Arabic (Morocco)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (31, N'ar-MR', N'??????? (?????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (32, N'ar-OM', N'Arabic (Oman)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (33, N'ar-PS', N'??????? (?????? ??????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (34, N'ar-QA', N'Arabic (Qatar)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (35, N'ar-SA', N'Arabic (Saudi Arabia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (36, N'ar-SD', N'??????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (37, N'ar-SO', N'??????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (38, N'ar-SS', N'??????? (???? ???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (39, N'ar-SY', N'Arabic (Syria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (40, N'ar-TD', N'??????? (????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (41, N'ar-TN', N'Arabic (Tunisia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (42, N'ar-YE', N'Arabic (Yemen)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (43, N'arn', N'Mapudungun', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (44, N'arn-CL', N'Mapudungun (Chile)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (45, N'as', N'Assamese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (46, N'as-IN', N'Assamese (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (47, N'asa', N'Kipare', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (48, N'asa-TZ', N'Kipare (Tadhania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (49, N'ast', N'asturianu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (50, N'ast-ES', N'asturianu (España)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (51, N'az', N'Azerbaijani', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (52, N'az-Cyrl', N'Azerbaijani (Cyrillic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (53, N'az-Cyrl-AZ', N'Azerbaijani (Cyrillic, Azerbaijan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (54, N'az-Latn', N'Azerbaijani (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (55, N'az-Latn-AZ', N'Azerbaijani (Latin, Azerbaijan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (56, N'ba', N'Bashkir', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (57, N'ba-RU', N'Bashkir (Russia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (58, N'bas', N'?àsàa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (59, N'bas-CM', N'?àsàa (Kàm?`rûn)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (60, N'be', N'Belarusian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (61, N'be-BY', N'Belarusian (Belarus)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (62, N'bem', N'Ichibemba', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (63, N'bem-ZM', N'Ichibemba (Zambia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (64, N'bez', N'Hibena', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (65, N'bez-TZ', N'Hibena (Hutanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (66, N'bg', N'Bulgarian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (67, N'bg-BG', N'Bulgarian (Bulgaria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (68, N'bin', N'Edo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (69, N'bin-NG', N'Edo (Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (70, N'bm', N'bamanakan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (71, N'bm-Latn', N'bamanakan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (72, N'bm-Latn-ML', N'bamanakan (Mali)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (73, N'bn', N'Bangla', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (74, N'bn-BD', N'Bangla (Bangladesh)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (75, N'bn-IN', N'Bengali (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (76, N'bo', N'Tibetan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (77, N'bo-CN', N'Tibetan (China)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (78, N'bo-IN', N'???????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (79, N'br', N'Breton', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (80, N'br-FR', N'Breton (France)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (81, N'brx', N'????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (82, N'brx-IN', N'???? (????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (83, N'bs', N'Bosnian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (84, N'bs-Cyrl', N'Bosnian (Cyrillic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (85, N'bs-Cyrl-BA', N'Bosnian (Cyrillic, Bosnia and Herzegovina)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (86, N'bs-Latn', N'Bosnian (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (87, N'bs-Latn-BA', N'Bosnian (Latin, Bosnia and Herzegovina)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (88, N'byn', N'???', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (89, N'byn-ER', N'??? (????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (90, N'ca', N'Catalan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (91, N'ca-AD', N'català (Andorra)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (92, N'ca-ES', N'Catalan (Catalan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (93, N'ca-ES-valencia', N'Valencian (Spain)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (94, N'ca-FR', N'català (França)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (95, N'ca-IT', N'català (Itàlia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (96, N'ce', N'???????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (97, N'ce-RU', N'??????? (?????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (98, N'cgg', N'Rukiga', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (99, N'cgg-UG', N'Rukiga (Uganda)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (100, N'chr', N'Cherokee', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (101, N'chr-Cher', N'Cherokee', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (102, N'chr-Cher-US', N'Cherokee (Cherokee, United States)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (103, N'co', N'Corsican', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (104, N'co-FR', N'Corsican (France)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (105, N'cs', N'Czech', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (106, N'cs-CZ', N'Czech (Czechia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (107, N'cu', N'?????????????´?????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (108, N'cu-RU', N'?????????????´????? (?????´?)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (109, N'cy', N'Welsh', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (110, N'cy-GB', N'Welsh (United Kingdom)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (111, N'da', N'Danish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (112, N'da-DK', N'Danish (Denmark)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (113, N'da-GL', N'dansk (Grønland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (114, N'dav', N'Kitaita', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (115, N'dav-KE', N'Kitaita (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (116, N'de', N'German', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (117, N'de-AT', N'German (Austria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (118, N'de-BE', N'Deutsch (Belgien)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (119, N'de-CH', N'German (Switzerland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (120, N'de-DE', N'German (Germany)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (121, N'de-IT', N'Deutsch (Italien)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (122, N'de-LI', N'German (Liechtenstein)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (123, N'de-LU', N'German (Luxembourg)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (124, N'dje', N'Zarmaciine', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (125, N'dje-NE', N'Zarmaciine (Nižer)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (126, N'dsb', N'Lower Sorbian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (127, N'dsb-DE', N'Lower Sorbian (Germany)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (128, N'dua', N'duálá', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (129, N'dua-CM', N'duálá (Cameroun)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (130, N'dv', N'Divehi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (131, N'dv-MV', N'Divehi (Maldives)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (132, N'dyo', N'joola', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (133, N'dyo-SN', N'joola (Senegal)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (134, N'dz', N'??????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (135, N'dz-BT', N'Dzongkha (Bhutan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (136, N'ebu', N'Kiembu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (137, N'ebu-KE', N'Kiembu (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (138, N'ee', N'E?egbe', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (139, N'ee-GH', N'E?egbe (Ghana nutome)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (140, N'ee-TG', N'E?egbe (Togo nutome)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (141, N'el', N'Greek', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (142, N'el-CY', N'???????? (??p???)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (143, N'el-GR', N'Greek (Greece)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (144, N'en', N'English', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (145, N'en-001', N'English (World)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (146, N'en-029', N'English (Caribbean)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (147, N'en-150', N'English (Europe)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (148, N'en-AG', N'English (Antigua and Barbuda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (149, N'en-AI', N'English (Anguilla)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (150, N'en-AS', N'English (American Samoa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (151, N'en-AT', N'English (Austria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (152, N'en-AU', N'English (Australia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (153, N'en-BB', N'English (Barbados)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (154, N'en-BE', N'English (Belgium)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (155, N'en-BI', N'English (Burundi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (156, N'en-BM', N'English (Bermuda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (157, N'en-BS', N'English (Bahamas)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (158, N'en-BW', N'English (Botswana)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (159, N'en-BZ', N'English (Belize)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (160, N'en-CA', N'English (Canada)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (161, N'en-CC', N'English (Cocos (Keeling) Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (162, N'en-CH', N'English (Switzerland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (163, N'en-CK', N'English (Cook Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (164, N'en-CM', N'English (Cameroon)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (165, N'en-CX', N'English (Christmas Island)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (166, N'en-CY', N'English (Cyprus)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (167, N'en-DE', N'English (Germany)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (168, N'en-DK', N'English (Denmark)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (169, N'en-DM', N'English (Dominica)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (170, N'en-ER', N'English (Eritrea)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (171, N'en-FI', N'English (Finland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (172, N'en-FJ', N'English (Fiji)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (173, N'en-FK', N'English (Falkland Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (174, N'en-FM', N'English (Micronesia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (175, N'en-GB', N'English (United Kingdom)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (176, N'en-GD', N'English (Grenada)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (177, N'en-GG', N'English (Guernsey)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (178, N'en-GH', N'English (Ghana)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (179, N'en-GI', N'English (Gibraltar)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (180, N'en-GM', N'English (Gambia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (181, N'en-GU', N'English (Guam)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (182, N'en-GY', N'English (Guyana)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (183, N'en-HK', N'English (Hong Kong SAR)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (184, N'en-ID', N'English (Indonesia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (185, N'en-IE', N'English (Ireland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (186, N'en-IL', N'English (Israel)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (187, N'en-IM', N'English (Isle of Man)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (188, N'en-IN', N'English (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (189, N'en-IO', N'English (British Indian Ocean Territory)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (190, N'en-JE', N'English (Jersey)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (191, N'en-JM', N'English (Jamaica)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (192, N'en-KE', N'English (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (193, N'en-KI', N'English (Kiribati)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (194, N'en-KN', N'English (Saint Kitts and Nevis)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (195, N'en-KY', N'English (Cayman Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (196, N'en-LC', N'English (Saint Lucia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (197, N'en-LR', N'English (Liberia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (198, N'en-LS', N'English (Lesotho)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (199, N'en-MG', N'English (Madagascar)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (200, N'en-MH', N'English (Marshall Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (201, N'en-MO', N'English (Macao SAR)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (202, N'en-MP', N'English (Northern Mariana Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (203, N'en-MS', N'English (Montserrat)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (204, N'en-MT', N'English (Malta)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (205, N'en-MU', N'English (Mauritius)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (206, N'en-MW', N'English (Malawi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (207, N'en-MY', N'English (Malaysia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (208, N'en-NA', N'English (Namibia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (209, N'en-NF', N'English (Norfolk Island)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (210, N'en-NG', N'English (Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (211, N'en-NL', N'English (Netherlands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (212, N'en-NR', N'English (Nauru)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (213, N'en-NU', N'English (Niue)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (214, N'en-NZ', N'English (New Zealand)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (215, N'en-PG', N'English (Papua New Guinea)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (216, N'en-PH', N'English (Philippines)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (217, N'en-PK', N'English (Pakistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (218, N'en-PN', N'English (Pitcairn Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (219, N'en-PR', N'English (Puerto Rico)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (220, N'en-PW', N'English (Palau)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (221, N'en-RW', N'English (Rwanda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (222, N'en-SB', N'English (Solomon Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (223, N'en-SC', N'English (Seychelles)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (224, N'en-SD', N'English (Sudan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (225, N'en-SE', N'English (Sweden)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (226, N'en-SG', N'English (Singapore)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (227, N'en-SH', N'English (St Helena, Ascension, Tristan da Cunha)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (228, N'en-SI', N'English (Slovenia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (229, N'en-SL', N'English (Sierra Leone)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (230, N'en-SS', N'English (South Sudan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (231, N'en-SX', N'English (Sint Maarten)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (232, N'en-SZ', N'English (Eswatini)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (233, N'en-TC', N'English (Turks and Caicos Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (234, N'en-TK', N'English (Tokelau)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (235, N'en-TO', N'English (Tonga)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (236, N'en-TT', N'English (Trinidad and Tobago)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (237, N'en-TV', N'English (Tuvalu)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (238, N'en-TZ', N'English (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (239, N'en-UG', N'English (Uganda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (240, N'en-UM', N'English (U.S. Outlying Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (241, N'en-US', N'English (United States)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (242, N'en-VC', N'English (Saint Vincent and the Grenadines)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (243, N'en-VG', N'English (British Virgin Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (244, N'en-VI', N'English (U.S. Virgin Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (245, N'en-VU', N'English (Vanuatu)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (246, N'en-WS', N'English (Samoa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (247, N'en-ZA', N'English (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (248, N'en-ZM', N'English (Zambia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (249, N'en-ZW', N'English (Zimbabwe)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (250, N'eo', N'esperanto', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (251, N'eo-001', N'esperanto (World)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (252, N'es', N'Spanish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (253, N'es-419', N'Spanish (Latin America)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (254, N'es-AR', N'Spanish (Argentina)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (255, N'es-BO', N'Spanish (Bolivia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (256, N'es-BR', N'español (Brasil)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (257, N'es-BZ', N'español (Belice)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (258, N'es-CL', N'Spanish (Chile)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (259, N'es-CO', N'Spanish (Colombia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (260, N'es-CR', N'Spanish (Costa Rica)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (261, N'es-CU', N'Spanish (Cuba)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (262, N'es-DO', N'Spanish (Dominican Republic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (263, N'es-EC', N'Spanish (Ecuador)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (264, N'es-ES', N'Spanish (Spain, International Sort)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (265, N'es-GQ', N'español (Guinea Ecuatorial)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (266, N'es-GT', N'Spanish (Guatemala)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (267, N'es-HN', N'Spanish (Honduras)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (268, N'es-MX', N'Spanish (Mexico)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (269, N'es-NI', N'Spanish (Nicaragua)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (270, N'es-PA', N'Spanish (Panama)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (271, N'es-PE', N'Spanish (Peru)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (272, N'es-PH', N'español (Filipinas)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (273, N'es-PR', N'Spanish (Puerto Rico)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (274, N'es-PY', N'Spanish (Paraguay)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (275, N'es-SV', N'Spanish (El Salvador)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (276, N'es-US', N'Spanish (United States)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (277, N'es-UY', N'Spanish (Uruguay)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (278, N'es-VE', N'Spanish (Venezuela)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (279, N'et', N'Estonian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (280, N'et-EE', N'Estonian (Estonia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (281, N'eu', N'Basque', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (282, N'eu-ES', N'Basque (Basque)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (283, N'ewo', N'ewondo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (284, N'ewo-CM', N'ewondo (Kam?rún)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (285, N'fa', N'Persian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (286, N'fa-IR', N'Persian (Iran)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (287, N'ff', N'Fulah (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (288, N'ff-Latn', N'Fulah (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (289, N'ff-Latn-BF', N'Pulaar (Burkibaa Faaso)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (290, N'ff-Latn-CM', N'Pulaar (Kameruun)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (291, N'ff-Latn-GH', N'Pulaar (Ganaa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (292, N'ff-Latn-GM', N'Pulaar (Gammbi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (293, N'ff-Latn-GN', N'Pulaar (Gine)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (294, N'ff-Latn-GW', N'Pulaar (Gine-Bisaawo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (295, N'ff-Latn-LR', N'Pulaar (Liberiyaa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (296, N'ff-Latn-MR', N'Pulaar (Muritani)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (297, N'ff-Latn-NE', N'Pulaar (Nijeer)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (298, N'ff-Latn-NG', N'Fulah (Latin, Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (299, N'ff-Latn-SL', N'Pulaar (Seraa liyon)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (300, N'ff-Latn-SN', N'Fulah (Latin, Senegal)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (301, N'fi', N'Finnish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (302, N'fi-FI', N'Finnish (Finland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (303, N'fil', N'Filipino', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (304, N'fil-PH', N'Filipino (Philippines)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (305, N'fo', N'Faroese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (306, N'fo-DK', N'føroyskt (Danmark)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (307, N'fo-FO', N'Faroese (Faroe Islands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (308, N'fr', N'French', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (309, N'fr-029', N'French (Caribbean)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (310, N'fr-BE', N'French (Belgium)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (311, N'fr-BF', N'français (Burkina Faso)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (312, N'fr-BI', N'français (Burundi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (313, N'fr-BJ', N'français (Bénin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (314, N'fr-BL', N'français (Saint-Barthélemy)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (315, N'fr-CA', N'French (Canada)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (316, N'fr-CD', N'French Congo (DRC)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (317, N'fr-CF', N'français (République centrafricaine)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (318, N'fr-CG', N'français (Congo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (319, N'fr-CH', N'French (Switzerland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (320, N'fr-CI', N'French (Côte d’Ivoire)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (321, N'fr-CM', N'French (Cameroon)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (322, N'fr-DJ', N'français (Djibouti)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (323, N'fr-DZ', N'français (Algérie)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (324, N'fr-FR', N'French (France)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (325, N'fr-GA', N'français (Gabon)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (326, N'fr-GF', N'français (Guyane française)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (327, N'fr-GN', N'français (Guinée)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (328, N'fr-GP', N'français (Guadeloupe)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (329, N'fr-GQ', N'français (Guinée équatoriale)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (330, N'fr-HT', N'French (Haiti)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (331, N'fr-KM', N'français (Comores)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (332, N'fr-LU', N'French (Luxembourg)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (333, N'fr-MA', N'French (Morocco)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (334, N'fr-MC', N'French (Monaco)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (335, N'fr-MF', N'français (Saint-Martin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (336, N'fr-MG', N'français (Madagascar)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (337, N'fr-ML', N'French (Mali)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (338, N'fr-MQ', N'français (Martinique)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (339, N'fr-MR', N'français (Mauritanie)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (340, N'fr-MU', N'français (Maurice)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (341, N'fr-NC', N'français (Nouvelle-Calédonie)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (342, N'fr-NE', N'français (Niger)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (343, N'fr-PF', N'français (Polynésie française)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (344, N'fr-PM', N'français (Saint-Pierre-et-Miquelon)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (345, N'fr-RE', N'French (Réunion)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (346, N'fr-RW', N'français (Rwanda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (347, N'fr-SC', N'français (Seychelles)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (348, N'fr-SN', N'French (Senegal)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (349, N'fr-SY', N'français (Syrie)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (350, N'fr-TD', N'français (Tchad)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (351, N'fr-TG', N'français (Togo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (352, N'fr-TN', N'français (Tunisie)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (353, N'fr-VU', N'français (Vanuatu)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (354, N'fr-WF', N'français (Wallis-et-Futuna)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (355, N'fr-YT', N'français (Mayotte)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (356, N'fur', N'furlan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (357, N'fur-IT', N'furlan (Italie)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (358, N'fy', N'Western Frisian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (359, N'fy-NL', N'Western Frisian (Netherlands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (360, N'ga', N'Irish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (361, N'ga-IE', N'Irish (Ireland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (362, N'gd', N'Scottish Gaelic', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (363, N'gd-GB', N'Scottish Gaelic (United Kingdom)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (364, N'gl', N'Galician', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (365, N'gl-ES', N'Galician (Galician)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (366, N'gn', N'Guarani', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (367, N'gn-PY', N'Guarani (Paraguay)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (368, N'gsw', N'Swiss German', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (369, N'gsw-CH', N'Schwiizertüütsch (Schwiiz)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (370, N'gsw-FR', N'Alsatian (France)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (371, N'gsw-LI', N'Schwiizertüütsch (Liächteschtäi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (372, N'gu', N'Gujarati', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (373, N'gu-IN', N'Gujarati (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (374, N'guz', N'Ekegusii', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (375, N'guz-KE', N'Ekegusii (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (376, N'gv', N'Gaelg', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (377, N'gv-IM', N'Gaelg (Ellan Vannin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (378, N'ha', N'Hausa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (379, N'ha-Latn', N'Hausa (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (380, N'ha-Latn-GH', N'Hausa (Gana)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (381, N'ha-Latn-NE', N'Hausa (Nijar)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (382, N'ha-Latn-NG', N'Hausa (Latin, Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (383, N'haw', N'Hawaiian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (384, N'haw-US', N'Hawaiian (United States)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (385, N'he', N'Hebrew', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (386, N'he-IL', N'Hebrew (Israel)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (387, N'hi', N'Hindi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (388, N'hi-IN', N'Hindi (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (389, N'hr', N'Croatian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (390, N'hr-BA', N'Croatian (Bosnia and Herzegovina)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (391, N'hr-HR', N'Croatian (Croatia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (392, N'hsb', N'Upper Sorbian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (393, N'hsb-DE', N'Upper Sorbian (Germany)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (394, N'hu', N'Hungarian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (395, N'hu-HU', N'Hungarian (Hungary)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (396, N'hy', N'Armenian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (397, N'hy-AM', N'Armenian (Armenia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (398, N'ia', N'interlingua', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (399, N'ia-001', N'interlingua (Mundo)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (400, N'ibb', N'Ibibio', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (401, N'ibb-NG', N'Ibibio (Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (402, N'id', N'Indonesian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (403, N'id-ID', N'Indonesian (Indonesia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (404, N'ig', N'Igbo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (405, N'ig-NG', N'Igbo (Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (406, N'ii', N'Yi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (407, N'ii-CN', N'Yi (China)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (408, N'is', N'Icelandic', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (409, N'is-IS', N'Icelandic (Iceland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (410, N'it', N'Italian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (411, N'it-CH', N'Italian (Switzerland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (412, N'it-IT', N'Italian (Italy)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (413, N'it-SM', N'italiano (San Marino)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (414, N'it-VA', N'italiano (Città del Vaticano)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (415, N'iu', N'Inuktitut', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (416, N'iu-Cans', N'Inuktitut (Syllabics)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (417, N'iu-Cans-CA', N'Inuktitut (Syllabics, Canada)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (418, N'iu-Latn', N'Inuktitut (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (419, N'iu-Latn-CA', N'Inuktitut (Latin, Canada)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (420, N'ja', N'Japanese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (421, N'ja-JP', N'Japanese (Japan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (422, N'jgo', N'Nda?a', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (423, N'jgo-CM', N'Nda?a (Kam?lûn)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (424, N'jmc', N'Kimachame', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (425, N'jmc-TZ', N'Kimachame (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (426, N'jv', N'Basa Jawa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (427, N'jv-Java', N'????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (428, N'jv-Java-ID', N'???? (Indonesia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (429, N'jv-Latn', N'Basa Jawa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (430, N'jv-Latn-ID', N'Basa Jawa (Indonesia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (431, N'ka', N'Georgian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (432, N'ka-GE', N'Georgian (Georgia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (433, N'kab', N'Taqbaylit', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (434, N'kab-DZ', N'Taqbaylit (Lezzayer)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (435, N'kam', N'Kikamba', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (436, N'kam-KE', N'Kikamba (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (437, N'kde', N'Chimakonde', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (438, N'kde-TZ', N'Chimakonde (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (439, N'kea', N'kabuverdianu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (440, N'kea-CV', N'kabuverdianu (Kabu Verdi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (441, N'khq', N'Koyra ciini', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (442, N'khq-ML', N'Koyra ciini (Maali)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (443, N'ki', N'Gikuyu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (444, N'ki-KE', N'Gikuyu (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (445, N'kk', N'Kazakh', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (446, N'kk-KZ', N'Kazakh (Kazakhstan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (447, N'kkj', N'kak?', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (448, N'kkj-CM', N'kak? (Kam?run)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (449, N'kl', N'Greenlandic', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (450, N'kl-GL', N'Greenlandic (Greenland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (451, N'kln', N'Kalenjin', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (452, N'kln-KE', N'Kalenjin (Emetab Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (453, N'km', N'Khmer', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (454, N'km-KH', N'Khmer (Cambodia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (455, N'kn', N'Kannada', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (456, N'kn-IN', N'Kannada (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (457, N'ko', N'Korean', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (458, N'ko-KP', N'??? (???????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (459, N'ko-KR', N'Korean (Korea)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (460, N'kok', N'Konkani', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (461, N'kok-IN', N'Konkani (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (462, N'kr', N'Kanuri', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (463, N'kr-Latn', N'Kanuri', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (464, N'kr-Latn-NG', N'Kanuri (Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (465, N'ks', N'Kashmiri', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (466, N'ks-Arab', N'Kashmiri (Perso-Arabic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (467, N'ks-Arab-IN', N'????? (?????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (468, N'ks-Deva', N'?????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (469, N'ks-Deva-IN', N'Kashmiri (Devanagari)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (470, N'ksb', N'Kishambaa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (471, N'ksb-TZ', N'Kishambaa (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (472, N'ksf', N'rikpa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (473, N'ksf-CM', N'rikpa (kam?rún)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (474, N'ksh', N'Kölsch', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (475, N'ksh-DE', N'Kölsch (Doütschland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (476, N'ku', N'Central Kurdish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (477, N'ku-Arab', N'Central Kurdish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (478, N'ku-Arab-IQ', N'Central Kurdish (Iraq)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (479, N'ku-Arab-IR', N'????? (?????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (480, N'kw', N'kernewek', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (481, N'kw-GB', N'kernewek (Rywvaneth Unys)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (482, N'ky', N'Kyrgyz', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (483, N'ky-KG', N'Kyrgyz (Kyrgyzstan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (484, N'la', N'Latin', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (485, N'la-001', N'Latin (World)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (486, N'lag', N'K?laangi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (487, N'lag-TZ', N'K?laangi (Taansanía)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (488, N'lb', N'Luxembourgish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (489, N'lb-LU', N'Luxembourgish (Luxembourg)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (490, N'lg', N'Luganda', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (491, N'lg-UG', N'Luganda (Yuganda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (492, N'lkt', N'Lak?ól''iyapi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (493, N'lkt-US', N'Lak?ól''iyapi (Mílaha?ska T?amák?oche)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (494, N'ln', N'lingála', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (495, N'ln-AO', N'lingála (Angóla)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (496, N'ln-CD', N'lingála (Republíki ya Kongó Demokratíki)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (497, N'ln-CF', N'lingála (Repibiki ya Afríka ya Káti)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (498, N'ln-CG', N'lingála (Kongo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (499, N'lo', N'Lao', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (500, N'lo-LA', N'Lao (Laos)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (501, N'lrc', N'???? ??????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (502, N'lrc-IQ', N'???? ?????? (Iraq)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (503, N'lrc-IR', N'???? ?????? (Iran)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (504, N'lt', N'Lithuanian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (505, N'lt-LT', N'Lithuanian (Lithuania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (506, N'lu', N'Tshiluba', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (507, N'lu-CD', N'Tshiluba (Ditunga wa Kongu)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (508, N'luo', N'Dholuo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (509, N'luo-KE', N'Dholuo (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (510, N'luy', N'Luluhia', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (511, N'luy-KE', N'Luluhia (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (512, N'lv', N'Latvian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (513, N'lv-LV', N'Latvian (Latvia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (514, N'mas', N'Maa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (515, N'mas-KE', N'Maa (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (516, N'mas-TZ', N'Maa (Tansania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (517, N'mer', N'Kimiru', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (518, N'mer-KE', N'Kimiru (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (519, N'mfe', N'kreol morisien', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (520, N'mfe-MU', N'kreol morisien (Moris)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (521, N'mg', N'Malagasy', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (522, N'mg-MG', N'Malagasy (Madagasikara)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (523, N'mgh', N'Makua', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (524, N'mgh-MZ', N'Makua (Umozambiki)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (525, N'mgo', N'meta''', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (526, N'mgo-CM', N'meta'' (Kamalun)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (527, N'mi', N'Maori', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (528, N'mi-NZ', N'Maori (New Zealand)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (529, N'mk', N'Macedonian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (530, N'mk-MK', N'Macedonian (North Macedonia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (531, N'ml', N'Malayalam', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (532, N'ml-IN', N'Malayalam (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (533, N'mn', N'Mongolian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (534, N'mn-Cyrl', N'Mongolian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (535, N'mn-MN', N'Mongolian (Mongolia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (536, N'mn-Mong', N'Mongolian (Traditional Mongolian)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (537, N'mn-Mong-CN', N'Mongolian (Traditional Mongolian, China)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (538, N'mn-Mong-MN', N'Mongolian (Traditional Mongolian, Mongolia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (539, N'mni', N'Manipuri', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (540, N'mni-IN', N'Manipuri (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (541, N'moh', N'Mohawk', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (542, N'moh-CA', N'Mohawk (Mohawk)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (543, N'mr', N'Marathi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (544, N'mr-IN', N'Marathi (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (545, N'ms', N'Malay', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (546, N'ms-BN', N'Malay (Brunei)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (547, N'ms-MY', N'Malay (Malaysia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (548, N'ms-SG', N'Melayu (Singapura)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (549, N'mt', N'Maltese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (550, N'mt-MT', N'Maltese (Malta)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (551, N'mua', N'MUNDA?', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (552, N'mua-CM', N'MUNDA? (kameru?)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (553, N'my', N'Burmese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (554, N'my-MM', N'Burmese (Myanmar)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (555, N'mzn', N'???????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (556, N'mzn-IR', N'??????? (?????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (557, N'naq', N'Khoekhoegowab', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (558, N'naq-NA', N'Khoekhoegowab (Namibiab)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (559, N'nb', N'Norwegian Bokmål', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (560, N'nb-NO', N'Norwegian Bokmål (Norway)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (561, N'nb-SJ', N'norsk bokmål (Svalbard og Jan Mayen)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (562, N'nd', N'isiNdebele', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (563, N'nd-ZW', N'isiNdebele (Zimbabwe)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (564, N'nds', N'Neddersass’sch', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (565, N'nds-DE', N'Neddersass’sch (Düütschland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (566, N'nds-NL', N'Neddersass’sch (Nedderlannen)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (567, N'ne', N'Nepali', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (568, N'ne-IN', N'Nepali (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (569, N'ne-NP', N'Nepali (Nepal)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (570, N'nl', N'Dutch', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (571, N'nl-AW', N'Nederlands (Aruba)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (572, N'nl-BE', N'Dutch (Belgium)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (573, N'nl-BQ', N'Nederlands (Bonaire, Sint Eustatius en Saba)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (574, N'nl-CW', N'Nederlands (Curaçao)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (575, N'nl-NL', N'Dutch (Netherlands)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (576, N'nl-SR', N'Nederlands (Suriname)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (577, N'nl-SX', N'Nederlands (Sint-Maarten)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (578, N'nmg', N'Kwasio', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (579, N'nmg-CM', N'Kwasio (Kamerun)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (580, N'nn', N'Norwegian Nynorsk', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (581, N'nn-NO', N'Norwegian Nynorsk (Norway)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (582, N'nnh', N'Shwó?ò ngiemb??n', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (583, N'nnh-CM', N'Shwó?ò ngiemb??n (Kàmalûm)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (584, N'no', N'Norwegian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (585, N'nqo', N'???', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (586, N'nqo-GN', N'??? (?????? ??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (587, N'nr', N'isiNdebele', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (588, N'nr-ZA', N'isiNdebele (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (589, N'nso', N'Sesotho sa Leboa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (590, N'nso-ZA', N'Sesotho sa Leboa (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (591, N'nus', N'Thok Nath', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (592, N'nus-SS', N'Thok Nath (South Sudan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (593, N'nyn', N'Runyankore', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (594, N'nyn-UG', N'Runyankore (Uganda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (595, N'oc', N'Occitan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (596, N'oc-FR', N'Occitan (France)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (597, N'om', N'Oromo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (598, N'om-ET', N'Oromo (Ethiopia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (599, N'om-KE', N'Oromoo (Keeniyaa)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (600, N'or', N'Odia', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (601, N'or-IN', N'Odia (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (602, N'os', N'????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (603, N'os-GE', N'???? (???????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (604, N'os-RU', N'???? (??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (605, N'pa', N'Punjabi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (606, N'pa-Arab', N'Punjabi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (607, N'pa-Arab-PK', N'Punjabi (Pakistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (608, N'pa-Guru', N'??????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (609, N'pa-IN', N'Punjabi (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (610, N'pap', N'Papiamento', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (611, N'pap-029', N'Papiamento (Caribbean)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (612, N'pl', N'Polish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (613, N'pl-PL', N'Polish (Poland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (614, N'prg', N'prusiskan', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (615, N'prg-001', N'prusiskan (switai)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (616, N'prs', N'Dari', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (617, N'prs-AF', N'Dari (Afghanistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (618, N'ps', N'Pashto', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (619, N'ps-AF', N'Pashto (Afghanistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (620, N'pt', N'Portuguese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (621, N'pt-AO', N'português (Angola)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (622, N'pt-BR', N'Portuguese (Brazil)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (623, N'pt-CH', N'português (Suíça)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (624, N'pt-CV', N'português (Cabo Verde)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (625, N'pt-GQ', N'português (Guiné Equatorial)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (626, N'pt-GW', N'português (Guiné-Bissau)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (627, N'pt-LU', N'português (Luxemburgo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (628, N'pt-MO', N'português (RAE de Macau)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (629, N'pt-MZ', N'português (Moçambique)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (630, N'pt-PT', N'Portuguese (Portugal)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (631, N'pt-ST', N'português (São Tomé e Príncipe)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (632, N'pt-TL', N'português (Timor-Leste)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (633, N'quc', N'Kiche', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (634, N'quc-Latn', N'Kiche', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (635, N'quc-Latn-GT', N'Kiche (Guatemala)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (636, N'quz', N'Quechua', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (637, N'quz-BO', N'Quechua (Bolivia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (638, N'quz-EC', N'Quechua (Ecuador)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (639, N'quz-PE', N'Quechua (Peru)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (640, N'rm', N'Romansh', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (641, N'rm-CH', N'Romansh (Switzerland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (642, N'rn', N'Ikirundi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (643, N'rn-BI', N'Ikirundi (Uburundi)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (644, N'ro', N'Romanian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (645, N'ro-MD', N'Romanian (Moldova)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (646, N'ro-RO', N'Romanian (Romania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (647, N'rof', N'Kihorombo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (648, N'rof-TZ', N'Kihorombo (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (649, N'ru', N'Russian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (650, N'ru-BY', N'??????? (????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (651, N'ru-KG', N'??????? (????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (652, N'ru-KZ', N'??????? (?????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (653, N'ru-MD', N'Russian (Moldova)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (654, N'ru-RU', N'Russian (Russia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (655, N'ru-UA', N'??????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (656, N'rw', N'Kinyarwanda', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (657, N'rw-RW', N'Kinyarwanda (Rwanda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (658, N'rwk', N'Kiruwa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (659, N'rwk-TZ', N'Kiruwa (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (660, N'sa', N'Sanskrit', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (661, N'sa-IN', N'Sanskrit (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (662, N'sah', N'Sakha', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (663, N'sah-RU', N'Sakha (Russia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (664, N'saq', N'Kisampur', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (665, N'saq-KE', N'Kisampur (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (666, N'sbp', N'Ishisangu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (667, N'sbp-TZ', N'Ishisangu (Tansaniya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (668, N'sd', N'Sindhi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (669, N'sd-Arab', N'Sindhi', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (670, N'sd-Arab-PK', N'Sindhi (Pakistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (671, N'sd-Deva', N'??????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (672, N'sd-Deva-IN', N'Sindhi (Devanagari, India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (673, N'se', N'Northern Sami', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (674, N'se-FI', N'Sami, Northern (Finland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (675, N'se-NO', N'Sami, Northern (Norway)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (676, N'se-SE', N'Sami, Northern (Sweden)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (677, N'seh', N'sena', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (678, N'seh-MZ', N'sena (Moçambique)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (679, N'ses', N'Koyraboro senni', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (680, N'ses-ML', N'Koyraboro senni (Maali)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (681, N'sg', N'Sängö', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (682, N'sg-CF', N'Sängö (Ködörösêse tî Bêafrîka)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (683, N'shi', N'???????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (684, N'shi-Latn', N'Tashel?iyt', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (685, N'shi-Latn-MA', N'Tashel?iyt (lm?rib)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (686, N'shi-Tfng', N'???????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (687, N'shi-Tfng-MA', N'??????? (??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (688, N'si', N'Sinhala', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (689, N'si-LK', N'Sinhala (Sri Lanka)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (690, N'sk', N'Slovak', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (691, N'sk-SK', N'Slovak (Slovakia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (692, N'sl', N'Slovenian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (693, N'sl-SI', N'Slovenian (Slovenia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (694, N'sma', N'Sami (Southern)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (695, N'sma-NO', N'Sami, Southern (Norway)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (696, N'sma-SE', N'Sami, Southern (Sweden)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (697, N'smj', N'Sami (Lule)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (698, N'smj-NO', N'Sami, Lule (Norway)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (699, N'smj-SE', N'Sami, Lule (Sweden)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (700, N'smn', N'Sami (Inari)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (701, N'smn-FI', N'Sami, Inari (Finland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (702, N'sms', N'Sami (Skolt)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (703, N'sms-FI', N'Sami, Skolt (Finland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (704, N'sn', N'chiShona', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (705, N'sn-Latn', N'chiShona (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (706, N'sn-Latn-ZW', N'chiShona (Zimbabwe)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (707, N'so', N'Somali', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (708, N'so-DJ', N'Soomaali (Jabuuti)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (709, N'so-ET', N'Soomaali (Itoobiya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (710, N'so-KE', N'Soomaali (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (711, N'so-SO', N'Somali (Somalia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (712, N'sq', N'Albanian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (713, N'sq-AL', N'Albanian (Albania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (714, N'sq-MK', N'shqip (Maqedonia e Veriut)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (715, N'sq-XK', N'shqip (Kosovë)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (716, N'sr', N'Serbian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (717, N'sr-Cyrl', N'Serbian (Cyrillic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (718, N'sr-Cyrl-BA', N'Serbian (Cyrillic, Bosnia and Herzegovina)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (719, N'sr-Cyrl-ME', N'Serbian (Cyrillic, Montenegro)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (720, N'sr-Cyrl-RS', N'Serbian (Cyrillic, Serbia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (721, N'sr-Cyrl-XK', N'?????? (??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (722, N'sr-Latn', N'Serbian (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (723, N'sr-Latn-BA', N'Serbian (Latin, Bosnia and Herzegovina)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (724, N'sr-Latn-ME', N'Serbian (Latin, Montenegro)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (725, N'sr-Latn-RS', N'Serbian (Latin, Serbia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (726, N'sr-Latn-XK', N'srpski (Kosovo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (727, N'ss', N'Siswati', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (728, N'ss-SZ', N'siSwati (eSwatini)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (729, N'ss-ZA', N'siSwati (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (730, N'ssy', N'Saho', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (731, N'ssy-ER', N'Saho (Eretria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (732, N'st', N'Sesotho', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (733, N'st-LS', N'Sesotho (Lesotho)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (734, N'st-ZA', N'Sesotho (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (735, N'sv', N'Swedish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (736, N'sv-AX', N'svenska (Åland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (737, N'sv-FI', N'Swedish (Finland)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (738, N'sv-SE', N'Swedish (Sweden)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (739, N'sw', N'Kiswahili', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (740, N'sw-CD', N'Kiswahili (Jamhuri ya Kidemokrasia ya Kongo)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (741, N'sw-KE', N'Kiswahili (Kenya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (742, N'sw-TZ', N'Kiswahili (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (743, N'sw-UG', N'Kiswahili (Uganda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (744, N'syr', N'Syriac', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (745, N'syr-SY', N'Syriac (Syria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (746, N'ta', N'Tamil', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (747, N'ta-IN', N'Tamil (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (748, N'ta-LK', N'Tamil (Sri Lanka)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (749, N'ta-MY', N'????? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (750, N'ta-SG', N'????? (???????????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (751, N'te', N'Telugu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (752, N'te-IN', N'Telugu (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (753, N'teo', N'Kiteso', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (754, N'teo-KE', N'Kiteso (Kenia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (755, N'teo-UG', N'Kiteso (Uganda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (756, N'tg', N'Tajik', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (757, N'tg-Cyrl', N'Tajik (Cyrillic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (758, N'tg-Cyrl-TJ', N'Tajik (Cyrillic, Tajikistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (759, N'th', N'Thai', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (760, N'th-TH', N'Thai (Thailand)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (761, N'ti', N'Tigrinya', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (762, N'ti-ER', N'Tigrinya (Eritrea)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (763, N'ti-ET', N'Tigrinya (Ethiopia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (764, N'tig', N'???', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (765, N'tig-ER', N'??? (????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (766, N'tk', N'Turkmen', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (767, N'tk-TM', N'Turkmen (Turkmenistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (768, N'tn', N'Setswana', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (769, N'tn-BW', N'Setswana (Botswana)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (770, N'tn-ZA', N'Setswana (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (771, N'to', N'lea fakatonga', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (772, N'to-TO', N'lea fakatonga (Tonga)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (773, N'tr', N'Turkish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (774, N'tr-CY', N'Türkçe (Kibris)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (775, N'tr-TR', N'Turkish (Turkey)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (776, N'ts', N'Tsonga', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (777, N'ts-ZA', N'Xitsonga (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (778, N'tt', N'Tatar', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (779, N'tt-RU', N'Tatar (Russia)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (780, N'twq', N'Tasawaq senni', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (781, N'twq-NE', N'Tasawaq senni (Nižer)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (782, N'tzm', N'Central Atlas Tamazight', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (783, N'tzm-Arab', N'???? ???????? ???????????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (784, N'tzm-Arab-MA', N'Central Atlas Tamazight (Arabic, Morocco)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (785, N'tzm-Latn', N'Central Atlas Tamazight (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (786, N'tzm-Latn-DZ', N'Central Atlas Tamazight (Latin, Algeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (787, N'tzm-Latn-MA', N'Tamazi?t n la?la? (Me??uk)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (788, N'tzm-Tfng', N'Central Atlas Tamazight (Tifinagh)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (789, N'tzm-Tfng-MA', N'Central Atlas Tamazight (Tifinagh, Morocco)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (790, N'ug', N'Uyghur', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (791, N'ug-CN', N'Uyghur (China)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (792, N'uk', N'Ukrainian', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (793, N'uk-UA', N'Ukrainian (Ukraine)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (794, N'ur', N'Urdu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (795, N'ur-IN', N'Urdu (India)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (796, N'ur-PK', N'Urdu (Pakistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (797, N'uz', N'Uzbek', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (798, N'uz-Arab', N'??????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (799, N'uz-Arab-AF', N'?????? (?????????)', 1)
GO
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (800, N'uz-Cyrl', N'Uzbek (Cyrillic)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (801, N'uz-Cyrl-UZ', N'Uzbek (Cyrillic, Uzbekistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (802, N'uz-Latn', N'Uzbek (Latin)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (803, N'uz-Latn-UZ', N'Uzbek (Latin, Uzbekistan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (804, N'vai', N'??', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (805, N'vai-Latn', N'Vai', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (806, N'vai-Latn-LR', N'Vai (Laibhiya)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (807, N'vai-Vaii', N'??', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (808, N'vai-Vaii-LR', N'?? (????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (809, N've', N'Venda', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (810, N've-ZA', N'Venda (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (811, N'vi', N'Vietnamese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (812, N'vi-VN', N'Vietnamese (Vietnam)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (813, N'vo', N'Volapük', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (814, N'vo-001', N'Volapük (World)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (815, N'vun', N'Kyivunjo', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (816, N'vun-TZ', N'Kyivunjo (Tanzania)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (817, N'wae', N'Walser', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (818, N'wae-CH', N'Walser (Schwiz)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (819, N'wal', N'?????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (820, N'wal-ET', N'????? (?????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (821, N'wo', N'Wolof', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (822, N'wo-SN', N'Wolof (Senegal)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (823, N'xh', N'isiXhosa', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (824, N'xh-ZA', N'isiXhosa (South Africa)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (825, N'xog', N'Olusoga', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (826, N'xog-UG', N'Olusoga (Yuganda)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (827, N'yav', N'nuasue', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (828, N'yav-CM', N'nuasue (Kemelún)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (829, N'yi', N'Yiddish', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (830, N'yi-001', N'Yiddish (World)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (831, N'yo', N'Yoruba', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (832, N'yo-BJ', N'Èdè Yorùbá (Oríl?´ède B?`n?`)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (833, N'yo-NG', N'Yoruba (Nigeria)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (834, N'zgh', N'????????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (835, N'zgh-Tfng', N'????????', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (836, N'zgh-Tfng-MA', N'???????? (??????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (837, N'zh', N'Chinese', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (838, N'zh-CN', N'Chinese (Simplified, China)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (839, N'zh-Hans', N'Chinese (Simplified)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (840, N'zh-Hans-HK', N'?? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (841, N'zh-Hans-MO', N'?? (???????)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (842, N'zh-Hant', N'Chinese (Traditional)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (843, N'zh-HK', N'Chinese (Traditional, Hong Kong SAR)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (844, N'zh-MO', N'Chinese (Traditional, Macao SAR)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (845, N'zh-SG', N'Chinese (Simplified, Singapore)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (846, N'zh-TW', N'Chinese (Traditional, Taiwan)', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (847, N'zu', N'isiZulu', 1)
INSERT [dbo].[ApplicationLocales] ([ApplicationLocaleId], [LocaleCode], [LocaleName], [StatusId]) VALUES (848, N'zu-ZA', N'isiZulu (South Africa)', 1)
SET IDENTITY_INSERT [dbo].[ApplicationLocales] OFF
SET IDENTITY_INSERT [dbo].[ApplicationModules] ON 

INSERT [dbo].[ApplicationModules] ([ApplicationModuleId], [ModuleMasterId], [ParentApplicationModuleId]) VALUES (1, 1, NULL)
SET IDENTITY_INSERT [dbo].[ApplicationModules] OFF
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (1, 1, N'Active', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (3, 1, N'InActive', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (4, 1, N'Deleted', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (5, 2, N'Latest Offers', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (6, 2, N'Launched Products', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (7, 3, N'Movie', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (8, 3, N'Album', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (9, 4, N'Men''s Fashion', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (10, 4, N'Women''s Fashion', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (11, 4, N'Electronics', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (12, 4, N'Home Accessories', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (13, 4, N'Cars and Motorbikes', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (14, 4, N'Books', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (15, 5, N'Online', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (16, 5, N'Cash on delivery', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (17, 5, N'EMI', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (18, 6, N'Pending', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (19, 6, N'Delivered', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (20, 7, N'Free Shipping', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (21, 7, N'Shipping Fees', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (22, 8, N'Home', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (23, 8, N'Office', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (24, 9, N'InProgress', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (26, 9, N'Success', 1)
INSERT [dbo].[ApplicationObjects] ([ApplicationObjectId], [ApplicationObjectTypeId], [ApplicationObjectName], [StatusId]) VALUES (27, 9, N'Failed', 1)
SET IDENTITY_INSERT [dbo].[ApplicationObjectTypes] ON 

INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (1, N'Status', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (2, N'AdvertismentType', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (3, N'MusicCategory', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (4, N'Category', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (5, N'PaymentMethods', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (6, N'OrderStatus', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (7, N'ShippingType', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (8, N'AddressType', 1)
INSERT [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId], [ApplicationObjectTypeName], [StatusId]) VALUES (9, N'TransactionStatus', 1)
SET IDENTITY_INSERT [dbo].[ApplicationObjectTypes] OFF
SET IDENTITY_INSERT [dbo].[ApplicationTimeZones] ON 

INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (1, N'Europe/Andorra', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (2, N'Pacific/Port_Moresby', N'Papua New Guinea (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (3, N'Pacific/Gambier', N'Gambier Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (4, N'Pacific/Marquesas', N'Marquesas Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (5, N'Pacific/Tahiti', N'Society Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (6, N'America/Lima', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (7, N'America/Panama', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (8, N'Asia/Muscat', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (9, N'Pacific/Chatham', N'Chatham Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (10, N'Pacific/Auckland', N'New Zealand (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (11, N'Pacific/Niue', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (12, N'Pacific/Bougainville', N'Bougainville', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (13, N'Pacific/Nauru', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (14, N'Europe/Oslo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (15, N'Europe/Amsterdam', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (16, N'America/Managua', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (17, N'Africa/Lagos', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (18, N'Pacific/Norfolk', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (19, N'Africa/Niamey', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (20, N'Pacific/Noumea', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (21, N'Africa/Windhoek', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (22, N'Africa/Maputo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (23, N'Asia/Kuching', N'Sabah, Sarawak', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (24, N'Asia/Kathmandu', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (25, N'Asia/Manila', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (26, N'Asia/Karachi', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (27, N'Europe/Warsaw', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (28, N'Europe/Samara', N'MSK+01 - Samara, Udmurtia', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (29, N'Europe/Ulyanovsk', N'MSK+01 - Ulyanovsk', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (30, N'Europe/Saratov', N'MSK+01 - Saratov', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (31, N'Europe/Astrakhan', N'MSK+01 - Astrakhan', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (32, N'Europe/Kirov', N'MSK+00 - Kirov', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (33, N'Europe/Volgograd', N'MSK+00 - Volgograd', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (34, N'Europe/Simferopol', N'MSK+00 - Crimea', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (35, N'Europe/Moscow', N'MSK+00 - Moscow area', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (36, N'Europe/Kaliningrad', N'MSK-01 - Kaliningrad', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (37, N'Europe/Belgrade', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (38, N'Europe/Bucharest', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (39, N'Indian/Reunion', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (40, N'Asia/Qatar', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (41, N'America/Asuncion', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (42, N'Pacific/Palau', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (43, N'Atlantic/Azores', N'Azores', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (44, N'Atlantic/Madeira', N'Madeira Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (45, N'Europe/Lisbon', N'Portugal (mainland)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (46, N'Asia/Hebron', N'West Bank', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (47, N'Asia/Gaza', N'Gaza Strip', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (48, N'America/Puerto_Rico', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (49, N'Pacific/Pitcairn', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (50, N'America/Miquelon', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (51, N'Asia/Kuala_Lumpur', N'Malaysia (peninsula)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (52, N'Asia/Yekaterinburg', N'MSK+02 - Urals', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (53, N'America/Bahia_Banderas', N'Central Time - Bahia de Banderas', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (54, N'America/Hermosillo', N'Mountain Standard Time - Sonora', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (55, N'Europe/Podgorica', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (56, N'Europe/Chisinau', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (57, N'Europe/Monaco', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (58, N'Africa/Casablanca', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (59, N'Africa/Tripoli', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (60, N'Europe/Riga', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (61, N'Europe/Luxembourg', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (62, N'Europe/Vilnius', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (63, N'Africa/Maseru', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (64, N'Africa/Monrovia', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (65, N'America/Marigot', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (66, N'Asia/Colombo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (67, N'America/St_Lucia', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (68, N'Asia/Beirut', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (69, N'Asia/Vientiane', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (70, N'Asia/Oral', N'West Kazakhstan', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (71, N'Asia/Atyrau', N'Atyrau/Atirau/Gur''yev', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (72, N'Asia/Aqtau', N'Mangghystau/Mankistau', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (73, N'Asia/Aqtobe', N'Aqtobe/Aktobe', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (74, N'Asia/Qyzylorda', N'Qyzylorda/Kyzylorda/Kzyl-Orda', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (75, N'Asia/Almaty', N'Kazakhstan (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (76, N'America/Cayman', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (77, N'Europe/Vaduz', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (78, N'Indian/Antananarivo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (79, N'Pacific/Majuro', N'Marshall Islands (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (80, N'Pacific/Kwajalein', N'Kwajalein', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (81, N'America/Ojinaga', N'Mountain Time US - Chihuahua (US border)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (82, N'America/Chihuahua', N'Mountain Time - Chihuahua (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (83, N'America/Mazatlan', N'Mountain Time - Baja California Sur, Nayarit, Sinaloa', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (84, N'America/Matamoros', N'Central Time US - Coahuila, Nuevo Leon, Tamaulipas (US border)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (85, N'America/Monterrey', N'Central Time - Durango; Coahuila, Nuevo Leon, Tamaulipas (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (86, N'America/Merida', N'Central Time - Campeche, Yucatan', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (87, N'America/Cancun', N'Eastern Standard Time - Quintana Roo', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (88, N'America/Mexico_City', N'Central Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (89, N'Africa/Blantyre', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (90, N'Indian/Maldives', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (91, N'Indian/Mauritius', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (92, N'Europe/Malta', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (93, N'America/Montserrat', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (94, N'Africa/Nouakchott', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (95, N'America/Martinique', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (96, N'Pacific/Saipan', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (97, N'Asia/Macau', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (98, N'Asia/Choibalsan', N'Dornod, Sukhbaatar', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (99, N'Asia/Hovd', N'Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan', 1)
GO
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (100, N'Asia/Ulaanbaatar', N'Mongolia (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (101, N'Asia/Yangon', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (102, N'Africa/Bamako', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (103, N'Europe/Skopje', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (104, N'America/Tijuana', N'Pacific Time US - Baja California', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (105, N'Asia/Kuwait', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (106, N'Asia/Omsk', N'MSK+03 - Omsk', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (107, N'Asia/Barnaul', N'MSK+04 - Altai', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (108, N'America/North_Dakota/Beulah', N'Central - ND (Mercer)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (109, N'America/North_Dakota/New_Salem', N'Central - ND (Morton rural)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (110, N'America/North_Dakota/Center', N'Central - ND (Oliver)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (111, N'America/Menominee', N'Central - MI (Wisconsin border)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (112, N'America/Indiana/Knox', N'Central - IN (Starke)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (113, N'America/Indiana/Tell_City', N'Central - IN (Perry)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (114, N'America/Chicago', N'Central (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (115, N'America/Indiana/Vevay', N'Eastern - IN (Switzerland)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (116, N'America/Indiana/Petersburg', N'Eastern - IN (Pike)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (117, N'America/Indiana/Marengo', N'Eastern - IN (Crawford)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (118, N'America/Denver', N'Mountain (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (119, N'America/Indiana/Winamac', N'Eastern - IN (Pulaski)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (120, N'America/Indiana/Indianapolis', N'Eastern - IN (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (121, N'America/Kentucky/Monticello', N'Eastern - KY (Wayne)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (122, N'America/Kentucky/Louisville', N'Eastern - KY (Louisville area)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (123, N'America/Detroit', N'Eastern - MI (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (124, N'America/New_York', N'Eastern Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (125, N'Pacific/Wake', N'Wake Island', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (126, N'Pacific/Midway', N'Midway Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (127, N'Africa/Kampala', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (128, N'Europe/Zaporozhye', N'Zaporozh''ye/Zaporizhia; Lugansk/Luhansk (east)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (129, N'Europe/Uzhgorod', N'Ruthenia', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (130, N'America/Indiana/Vincennes', N'Eastern - IN (Da, Du, K, Mn)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (131, N'America/Boise', N'Mountain - ID (south); OR (east)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (132, N'America/Phoenix', N'MST - Arizona (except Navajo)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (133, N'America/Los_Angeles', N'Pacific', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (134, N'Africa/Johannesburg', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (135, N'Indian/Mayotte', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (136, N'Asia/Aden', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (137, N'Pacific/Apia', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (138, N'Pacific/Wallis', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (139, N'Pacific/Efate', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (140, N'Asia/Ho_Chi_Minh', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (141, N'America/St_Thomas', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (142, N'America/Tortola', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (143, N'America/Caracas', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (144, N'America/St_Vincent', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (145, N'Europe/Vatican', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (146, N'Asia/Tashkent', N'Uzbekistan (east)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (147, N'Asia/Samarkand', N'Uzbekistan (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (148, N'America/Montevideo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (149, N'Pacific/Honolulu', N'Hawaii', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (150, N'America/Adak', N'Aleutian Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (151, N'America/Nome', N'Alaska (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (152, N'America/Yakutat', N'Alaska - Yakutat', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (153, N'America/Metlakatla', N'Alaska - Annette Island', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (154, N'America/Sitka', N'Alaska - Sitka area', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (155, N'America/Juneau', N'Alaska - Juneau area', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (156, N'America/Anchorage', N'Alaska (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (157, N'Europe/Kiev', N'Ukraine (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (158, N'Asia/Novosibirsk', N'MSK+04 - Novosibirsk', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (159, N'Africa/Dar_es_Salaam', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (160, N'Pacific/Funafuti', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (161, N'Atlantic/St_Helena', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (162, N'Asia/Singapore', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (163, N'Europe/Stockholm', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (164, N'Africa/Khartoum', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (165, N'Indian/Mahe', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (166, N'Pacific/Guadalcanal', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (167, N'Asia/Riyadh', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (168, N'Africa/Kigali', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (169, N'Asia/Anadyr', N'MSK+09 - Bering Sea', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (170, N'Asia/Kamchatka', N'MSK+09 - Kamchatka', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (171, N'Europe/Ljubljana', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (172, N'Asia/Srednekolymsk', N'MSK+08 - Sakha (E); North Kuril Is', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (173, N'Asia/Magadan', N'MSK+08 - Magadan', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (174, N'Asia/Ust-Nera', N'MSK+07 - Oymyakonsky', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (175, N'Asia/Vladivostok', N'MSK+07 - Amur River', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (176, N'Asia/Khandyga', N'MSK+06 - Tomponsky, Ust-Maysky', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (177, N'Asia/Yakutsk', N'MSK+06 - Lena River', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (178, N'Asia/Chita', N'MSK+06 - Zabaykalsky', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (179, N'Asia/Irkutsk', N'MSK+05 - Irkutsk, Buryatia', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (180, N'Asia/Krasnoyarsk', N'MSK+04 - Krasnoyarsk area', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (181, N'Asia/Novokuznetsk', N'MSK+04 - Kemerovo', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (182, N'Asia/Tomsk', N'MSK+04 - Tomsk', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (183, N'Asia/Sakhalin', N'MSK+08 - Sakhalin Island', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (184, N'Arctic/Longyearbyen', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (185, N'Europe/Bratislava', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (186, N'Africa/Freetown', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (187, N'America/Port_of_Spain', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (188, N'Europe/Istanbul', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (189, N'Pacific/Tongatapu', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (190, N'Africa/Tunis', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (191, N'Asia/Ashgabat', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (192, N'Asia/Dili', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (193, N'Pacific/Fakaofo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (194, N'Asia/Dushanbe', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (195, N'Asia/Bangkok', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (196, N'Africa/Lome', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (197, N'Indian/Kerguelen', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (198, N'Africa/Ndjamena', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (199, N'America/Grand_Turk', N'', 1)
GO
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (200, N'Africa/Mbabane', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (201, N'Asia/Damascus', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (202, N'America/Lower_Princes', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (203, N'America/El_Salvador', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (204, N'Africa/Sao_Tome', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (205, N'Africa/Juba', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (206, N'America/Paramaribo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (207, N'Africa/Mogadishu', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (208, N'Africa/Dakar', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (209, N'Europe/San_Marino', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (210, N'Asia/Taipei', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (211, N'Asia/Seoul', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (212, N'Asia/Pyongyang', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (213, N'America/St_Kitts', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (214, N'America/Manaus', N'Amazonas (east)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (215, N'America/Boa_Vista', N'Roraima', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (216, N'America/Porto_Velho', N'Rondonia', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (217, N'America/Santarem', N'Para (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (218, N'America/Cuiaba', N'Mato Grosso', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (219, N'America/Campo_Grande', N'Mato Grosso do Sul', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (220, N'America/Sao_Paulo', N'Brazil (southeast: GO, DF, MG, ES, RJ, SP, PR, SC, RS)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (221, N'America/Bahia', N'Bahia', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (222, N'America/Maceio', N'Alagoas, Sergipe', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (223, N'America/Araguaina', N'Tocantins', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (224, N'America/Eirunepe', N'Amazonas (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (225, N'America/Recife', N'Pernambuco', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (226, N'America/Belem', N'Para (east); Amapa', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (227, N'America/Noronha', N'Atlantic islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (228, N'America/Kralendijk', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (229, N'America/La_Paz', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (230, N'Asia/Brunei', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (231, N'Atlantic/Bermuda', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (232, N'America/St_Barthelemy', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (233, N'Africa/Porto-Novo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (234, N'Africa/Bujumbura', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (235, N'Asia/Bahrain', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (236, N'America/Fortaleza', N'Brazil (northeast: MA, PI, CE, RN, PB)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (237, N'America/Rio_Branco', N'Acre', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (238, N'America/Nassau', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (239, N'Asia/Thimphu', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (240, N'America/Cambridge_Bay', N'Mountain - NU (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (241, N'America/Edmonton', N'Mountain - AB; BC (E); SK (W)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (242, N'America/Swift_Current', N'CST - SK (midwest)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (243, N'America/Regina', N'CST - SK (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (244, N'America/Rankin_Inlet', N'Central - NU (central)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (245, N'America/Resolute', N'Central - NU (Resolute)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (246, N'America/Rainy_River', N'Central - ON (Rainy R, Ft Frances)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (247, N'America/Winnipeg', N'Central - ON (west); Manitoba', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (248, N'America/Atikokan', N'EST - ON (Atikokan); NU (Coral H)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (249, N'America/Pangnirtung', N'Eastern - NU (Pangnirtung)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (250, N'America/Iqaluit', N'Eastern - NU (most east areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (251, N'America/Thunder_Bay', N'Eastern - ON (Thunder Bay)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (252, N'America/Nipigon', N'Eastern - ON, QC (no DST 1967-73)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (253, N'America/Toronto', N'Eastern - ON, QC (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (254, N'America/Blanc-Sablon', N'AST - QC (Lower North Shore)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (255, N'America/Goose_Bay', N'Atlantic - Labrador (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (256, N'America/Moncton', N'Atlantic - New Brunswick', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (257, N'America/Glace_Bay', N'Atlantic - NS (Cape Breton)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (258, N'America/Halifax', N'Atlantic - NS (most areas); PE', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (259, N'America/St_Johns', N'Newfoundland; Labrador (southeast)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (260, N'America/Belize', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (261, N'Europe/Minsk', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (262, N'Africa/Gaborone', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (263, N'Europe/Sofia', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (264, N'America/Yellowknife', N'Mountain - NT (central)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (265, N'Africa/Ouagadougou', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (266, N'Asia/Dhaka', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (267, N'America/Argentina/Tucuman', N'Tucuman (TM)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (268, N'America/Argentina/Jujuy', N'Jujuy (JY)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (269, N'America/Argentina/Salta', N'Salta (SA, LP, NQ, RN)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (270, N'America/Argentina/Cordoba', N'Argentina (most areas: CB, CC, CN, ER, FM, MN, SE, SF)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (271, N'America/Argentina/Buenos_Aires', N'Buenos Aires (BA, CF)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (272, N'Antarctica/Vostok', N'Vostok', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (273, N'Antarctica/Troll', N'Troll', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (274, N'Antarctica/Syowa', N'Syowa', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (275, N'Antarctica/Rothera', N'Rothera', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (276, N'Antarctica/Palmer', N'Palmer', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (277, N'America/Argentina/Catamarca', N'Catamarca (CT); Chubut (CH)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (278, N'Antarctica/Mawson', N'Mawson', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (279, N'Antarctica/Davis', N'Davis', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (280, N'Antarctica/Casey', N'Casey', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (281, N'Antarctica/McMurdo', N'New Zealand time - McMurdo, South Pole', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (282, N'Africa/Luanda', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (283, N'Asia/Yerevan', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (284, N'Europe/Tirane', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (285, N'America/Anguilla', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (286, N'America/Antigua', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (287, N'Asia/Kabul', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (288, N'Asia/Dubai', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (289, N'Antarctica/DumontDUrville', N'Dumont-d''Urville', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (290, N'America/Argentina/La_Rioja', N'La Rioja (LR)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (291, N'America/Argentina/San_Juan', N'San Juan (SJ)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (292, N'America/Argentina/Mendoza', N'Mendoza (MZ)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (293, N'America/Barbados', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (294, N'Europe/Sarajevo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (295, N'Asia/Baku', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (296, N'Europe/Mariehamn', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (297, N'America/Aruba', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (298, N'Australia/Eucla', N'W. Australia Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (299, N'Australia/Perth', N'W. Australia Standard Time', 1)
GO
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (300, N'Australia/Darwin', N'AUS Central Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (301, N'Australia/Adelaide', N'Cen. Australia Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (302, N'Australia/Lindeman', N'AUS Eastern Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (303, N'Australia/Brisbane', N'E. Australia Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (304, N'Australia/Broken_Hill', N'AUS Central Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (305, N'Australia/Sydney', N'AUS Eastern Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (306, N'Australia/Melbourne', N'AUS Eastern Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (307, N'Australia/Currie', N'AUS Eastern Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (308, N'Australia/Hobart', N'Tasmania Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (309, N'Antarctica/Macquarie', N'Macquarie Island', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (310, N'Australia/Lord_Howe', N'Lord Howe Standard Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (311, N'Europe/Vienna', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (312, N'Pacific/Pago_Pago', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (313, N'America/Argentina/Ushuaia', N'Tierra del Fuego (TF)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (314, N'America/Argentina/Rio_Gallegos', N'Santa Cruz (SC)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (315, N'America/Argentina/San_Luis', N'San Luis (SL)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (316, N'Europe/Brussels', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (317, N'America/Inuvik', N'Mountain - NT (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (318, N'America/Creston', N'MST - BC (Creston)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (319, N'America/Dawson_Creek', N'MST - BC (Dawson Cr, Ft St John)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (320, N'America/Tegucigalpa', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (321, N'Asia/Hong_Kong', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (322, N'America/Guyana', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (323, N'Africa/Bissau', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (324, N'Pacific/Guam', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (325, N'America/Guatemala', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (326, N'Atlantic/South_Georgia', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (327, N'Europe/Athens', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (328, N'Africa/Malabo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (329, N'America/Guadeloupe', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (330, N'Europe/Zagreb', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (331, N'Africa/Conakry', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (332, N'America/Thule', N'Thule/Pituffik', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (333, N'America/Scoresbysund', N'Scoresbysund/Ittoqqortoormiit', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (334, N'America/Danmarkshavn', N'National Park (east coast)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (335, N'America/Godthab', N'Greenland (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (336, N'Europe/Gibraltar', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (337, N'Africa/Accra', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (338, N'Europe/Guernsey', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (339, N'America/Cayenne', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (340, N'Asia/Tbilisi', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (341, N'America/Grenada', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (342, N'Africa/Banjul', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (343, N'America/Port-au-Prince', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (344, N'Europe/Budapest', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (345, N'Asia/Jakarta', N'Java, Sumatra', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (346, N'Indian/Comoro', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (347, N'Pacific/Kiritimati', N'Line Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (348, N'Pacific/Enderbury', N'Phoenix Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (349, N'Pacific/Tarawa', N'Gilbert Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (350, N'Asia/Phnom_Penh', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (351, N'Asia/Bishkek', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (352, N'Africa/Nairobi', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (353, N'Asia/Tokyo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (354, N'Asia/Amman', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (355, N'America/Jamaica', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (356, N'Europe/Jersey', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (357, N'Europe/Rome', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (358, N'Atlantic/Reykjavik', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (359, N'Asia/Tehran', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (360, N'Asia/Baghdad', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (361, N'Indian/Chagos', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (362, N'Asia/Kolkata', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (363, N'Europe/Isle_of_Man', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (364, N'Asia/Jerusalem', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (365, N'Europe/Dublin', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (366, N'Asia/Jayapura', N'New Guinea (West Papua / Irian Jaya); Malukus/Moluccas', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (367, N'Asia/Makassar', N'Borneo (east, south); Sulawesi/Celebes, Bali, Nusa Tengarra; Timor (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (368, N'Asia/Pontianak', N'Borneo (west, central)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (369, N'Europe/London', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (370, N'Africa/Libreville', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (371, N'Europe/Paris', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (372, N'Atlantic/Faroe', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (373, N'America/Curacao', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (374, N'Atlantic/Cape_Verde', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (375, N'America/Havana', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (376, N'America/Costa_Rica', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (377, N'America/Bogota', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (378, N'Asia/Urumqi', N'Xinjiang Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (379, N'Asia/Shanghai', N'Beijing Time', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (380, N'Africa/Douala', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (381, N'Pacific/Easter', N'Easter Island', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (382, N'America/Punta_Arenas', N'Region of Magallanes', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (383, N'America/Santiago', N'Chile (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (384, N'Pacific/Rarotonga', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (385, N'Africa/Abidjan', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (386, N'Europe/Zurich', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (387, N'Africa/Brazzaville', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (388, N'Africa/Bangui', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (389, N'Africa/Lubumbashi', N'Dem. Rep. of Congo (east)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (390, N'Africa/Kinshasa', N'Dem. Rep. of Congo (west)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (391, N'Indian/Cocos', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (392, N'America/Dawson', N'Pacific - Yukon (north)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (393, N'America/Whitehorse', N'Pacific - Yukon (south)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (394, N'America/Vancouver', N'Pacific - BC (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (395, N'America/Fort_Nelson', N'MST - BC (Ft Nelson)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (396, N'Indian/Christmas', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (397, N'Africa/Lusaka', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (398, N'Asia/Nicosia', N'Cyprus (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (399, N'Europe/Prague', N'', 1)
GO
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (400, N'Pacific/Kosrae', N'Kosrae', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (401, N'Pacific/Pohnpei', N'Pohnpei/Ponape', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (402, N'Pacific/Chuuk', N'Chuuk/Truk, Yap', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (403, N'Atlantic/Stanley', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (404, N'Pacific/Fiji', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (405, N'Europe/Helsinki', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (406, N'Africa/Addis_Ababa', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (407, N'Atlantic/Canary', N'Canary Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (408, N'Africa/Ceuta', N'Ceuta, Melilla', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (409, N'Europe/Madrid', N'Spain (mainland)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (410, N'Africa/Asmara', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (411, N'Africa/El_Aaiun', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (412, N'Africa/Cairo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (413, N'Europe/Tallinn', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (414, N'Pacific/Galapagos', N'Galapagos Islands', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (415, N'America/Guayaquil', N'Ecuador (mainland)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (416, N'Africa/Algiers', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (417, N'America/Santo_Domingo', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (418, N'America/Dominica', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (419, N'Europe/Copenhagen', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (420, N'Africa/Djibouti', N'', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (421, N'Europe/Busingen', N'Busingen', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (422, N'Europe/Berlin', N'Germany (most areas)', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (423, N'Asia/Famagusta', N'Northern Cyprus', 1)
INSERT [dbo].[ApplicationTimeZones] ([ApplicationTimeZoneId], [ApplicationTimeZoneName], [Comment], [StatusId]) VALUES (424, N'Africa/Harare', N'', 1)
SET IDENTITY_INSERT [dbo].[ApplicationTimeZones] OFF
SET IDENTITY_INSERT [dbo].[ApplicationUserTokens] ON 

INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (71, 3, N'BNoFVBnjlN7IKIL0hcULcbpUMm1hYIc0Kj6ncIt3woo=', N'CfDJ8B37V4qGsudDmGto112e7MYWJaMh_jUXgfrLrqHIjQyF41K8aFX-EZ-s-74mjwk6HCmjyEhxdE7byiAvwMqrhldjYH3aQ05X7mBV5kT-400cId1p5zKAyvyXt-3qs2jJTkDfHtF34OqZaTb7lcOXsigiFSbCy0463FmNDvXwAv_xR6pNIgD8KEj3ZKSdYWDyYgvyJIacOZXXoskyIB4TVeo2CGYHdt5Ppm05HBoFqSBYKgAGKhlCx4AHxo-VubRGGKKPs3CFTRccBDGosO77CVG8IupGC0--QXsYfCt120R1pHq_pnurAhjBF913s6D5JFTR8UUMgwtgEcDrNf11bnUyQiChARb-X903_63xUaWLIuXO1ZlqDsksjZS-mjtgGMEAe_gWQSwQLdEyMr4ieNWLpCju1wK12636Ak8ZPkaI7bGTA9HvVqsJeRqKg5qLhNBwaTsZzZKotGdxzUvokF93doLY2oBeIVQOG4tQfjkDSDTooc6bOgm-kqIU5eDJ1Ec0oGC0Wh2SLuYMGeB3D2yYLSplmFJpfXpb9pdFa2ItiTH_gBzhhnqem4zCVPlcow', N'web', CAST(N'2020-03-17T12:04:47.1487401+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (72, 3, N'KY+TCYCuWbCV7vKsSk0CP3Tu4EYFOUAxeqJrjp51zLY=', N'CfDJ8B37V4qGsudDmGto112e7MZn5sFKipgMtI__Q81o4_jjAJPrSTULjGH1TX4eDVJjJxNd94dIS6awWemvLr8nwSfqSXKRiEs2IkvEJBieJ6o5h0EYlI2DwbZ0ngqlWP8Of33U-yNy6bnyZoeU3DfrGEuHgYBbJxKDKfVAMonJoTiXdWNzXf8PxbxKPjuMT0Nn2_89WHWJpbL1Iikq6gifUQDHkfyMtXAm8GEYMIhPRcsrMiBP9csNuwiaYSrLxlaJO0n7SLyIqPJATbPnNCC2O7U8EEul83-IUQ5KAvUq5IDoHkdaRQHh_sUV9tebYH-3Po9BKFq8iJJjKr0KKmwnm1y0WrFwvuJA_C46ZQeIFHNVfqqdSz4M4w1fO9FRHNZfZr0A8ud9iurslN9ebUhsCkmCsm_m9nGtrPXdppZImLSl_Y3Yfh8psM7OohH6F14vgErvLQFJUovrfCJyec1ZOac28uIa_wY8FlSeFLYFQ_w62r-Ha3vHtVoYQWdCDOsZQsfcxNdcHG9Jrivz7iPSC0Vn4zc8yTaK0T9qgXthnCkpRChJbP-rSeVREEly025X5A', N'web', CAST(N'2020-03-17T12:09:02.3804351+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (73, 3, N'9pZ29WMIfaI+Tk7DMIBDCCaRIq/HuAin9u4H0vlvpPc=', N'CfDJ8B37V4qGsudDmGto112e7Mb89MoayO5P9Bd_SwUyWpKBoQspaDpskZGfQRu1eGnRncg8rfgUKzATfUF-Z71CZt7V2maUBCY2UVLi0TF-ylmAAGVoM4d3bTf7cYvYmyEdmq4k5KHPwVmo--QE9V2zxw6ef5Up4dypaqSD0_E-EJpXNrBwpMiTjS_sr7HdmI0De7CRjAqE4wlqNjKUaV4bfxkgqYqVgczLWBZSaesUCUOnfnKVJY2CUyBl-7x79lOHq7QiZb3oplWRmx0KCh0AhSmDuuKBBGfzdInHm-FppCNYzCeSSnt82QzYmnn7H3Yt-RExY9YH-tlQooEul7gSlTntf3ZjpTK_XV1efqA4JPpqOu8aMZr2fTYxx4althYh_0IvDw7KzelNDcLbsBbQCxBKcAfFJDIrrlxidNhw2RYbh_lCKdRSg1CXWszMNIGZ9JfTpere1BJpOLj4qVce0mlSfSPwh1ITzfGxtfEUkxh3E9zCnmrHWhqvQGh8mBu-tDttu3SLRipovRAmxmL1P8NvAMLc77qnooN-pahiTUKNFtsLROvJGWLCFdUcASm39Q', N'web', CAST(N'2020-03-17T12:22:02.9224360+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (74, 3, N'6Zz/zBntd7aO1wlgNZoBfhpWIaa3bY2gpJYzN8g/N6g=', N'CfDJ8B37V4qGsudDmGto112e7MacIzzHUmc-KfVDkgVEwm3LwjP-c32p4CpYqvpNKAVjFzmeIL3Feigtgd6sjnMWldwVNb_ef6seU-twaCAxyfA0WDAaPIMAM9DWnuJqxqYXS8Jm1B04Kd_7e9DV88cvJu7h0cGR6q9tX43QQ93dJaYx01gc66aRn-24ioDAK2CqAgU92DNGhV-SpbQ4GFWTThXMFSzz1XFcpkSBYhh-8F33OpdVZo78-3O1hN8GXu2M7y6Sqy-8sMZrdWVmXIBm_zUXKlbYjl-e-1jYpKYPkBjsaV3g-NSVpYddWCaw8wXh6bdxN7akHDGPNnqYuPY4jyTPtZstMrCTr-cT2kWV-AgdCoRD_1dDtVTKLW2aZbxBtwg2Lb8atPLbyfJBZgUaNGB7Pf8B7m3TkNqMDn5W4ZZdc2Y0_jGaQhVjMiRtsngU_znLnKM79N01J9nLyITSke1fMnWX-gQWoFHy7XyJWmC-NUL0L7gUV30e5oynQar5Y_vWpTLMbUnmlVO5dF16ZOhBE6lmMmHaP1-NofEyeYwLNkVBFc6DrVlc66dJgfxKeg', N'web', CAST(N'2020-03-17T13:14:48.1263748+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (75, 3, N'6jEZ1KVVHBN3ffJCHYX7OkYD5ADqoYfcGiZfDpbh7jI=', N'CfDJ8B37V4qGsudDmGto112e7MZCA33P1ZOEHO7agFA4XLLY9IL4Q1nnymDeFqU53pUsnxbVcfG1_kgFQ07eu3QTE7vxom60AJhOxZK6f0_78O8m33U4K8diEZR6x-l6oQrzaH2_ILtOHvGyZNJ8Wde5nbbLp1pDx6t2AIo5KnoZcwrhpejcJxlt6WdOYyfwjqV-zj2nWwJDjZPyO2fIZWbZeDfHzTvRTGnajKLirYXwiwYZYi-e0MqUr3A4vEgZ6uUQhYM36dMseeJdppfPjpvYgSgjiXSV2AJe7H3nCbuFYd3ppy-OHAXjcYxSCuv1hOBt3uWs-qzsID6MXd0hBcwLzdqSo5ZRDOSFkQzRLlrtg3lXdwsBm7zdrs9YwxWpWn-8fyvLD1rC6PMbVuquL687wOqu825reAJVPHgfLhZSKYb5ZDfeVFWEzK4ghwzJjhs27OYtQSTkU5pE6t8YpdZqzmfIQfY9rn6-BElLqKORVsrf0q2iuCJ035Q7CVuynY_KpkSdYwFx4Q_PtiWj7Sbe3ZhCp9ICRglw5pCzpeEeugeQlBQmZvz58wr0m6UZFQxnEA', N'web', CAST(N'2020-03-17T13:17:21.5449286+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (76, 3, N'RFchlkpXjwl4jv6RRPXSQsofZfxX43M0worEfsJPmNI=', N'CfDJ8B37V4qGsudDmGto112e7MYN6pz9TP3U8ydGvVN5tW9EsFy5taxEnfOkBnqpgCGd_YsHvkE0L8ewKdBe11hxbENYQVeS2k18k-Yr2u4bwK-hhG_SxKtO1FyJ9q3kll27OeCJSi4Byyu3lB9iMt_OKzohgeiGMgCm-s9DDjMYX76dTi7mr_zcDp_2AL5CCTUeabXZuPXBCbNeEl5-r_7BLva8047KlDGTwFsipg11NdxRK61PeZOCwnpqCtLn9s7u1wFztrNqu0-xxIadm1lwD3GBnQCeEa3b04Wem68_GGaUcE4IHFgFYWdrTH6avYAIfgGhLU69rU0Xf8MUYL09eVLqw-8hI0rTkDmCEBf1B743Bn8N20wC4sKiFcqcq5W-1oSiD7TG3oJVMN7jIdJOMh-B1nNfF_hxY3MWp9kQTmShUTGYnLFeJh45XZIMgJx7OjFftr6mZkqf3TFosw5wN5nF5Z4iEyQ_FVpszvxznS-nVhYEyfCq8O-gHWFiJV_ihq8JeiHVysrBpfWmPpZM-PdNhDy3j3lVSbXxSoisltcVl8ZtlUqv7fw2vp_uQLN1Jw', N'web', CAST(N'2020-03-17T13:19:31.4959493+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (77, 3, N'd9s1cONxvK17BSJold8JuiDmOI7tee/6ezR2on31hwo=', N'CfDJ8B37V4qGsudDmGto112e7MbBMZHpszc_9OC7RNFGMdL2PqrYixEB4i8aheGdZgDT8Ph1DfMSCgLjhKkFtWfURMgg77rLbqsgc0IXEZhUVgCvdmAUdu2uWBywMfPx5vdmy_pjsszHxy5247u2xwwEy9QApTfLnwyZ0_ky-ENLp8cQNZacmzZZNiAdCDoAhNmue6HvrV53eQIyy8wr_g_74UqMK6Y5cO2mVp-fBPSoA0bDJK94AKCgDxiD0sKpw9rC37HC5ArzwMpz0fbHBJsOaSg8d0qAZebbtuNpA1cbrfPdV_j71CDVuhw446K_GMzH5-F72-etZQTzB8Yv5mNN17G_dQlW3oXIL5buKoD9Pf5sZsS-AnB4cbXM1sFMlwiPqeCbR9kcNtKU8eFXt4Bn2a_DURf6BE7JCYYJZHx-zaDwHV1b6mXslxOHrgaX6Sod6c_UHMiq0OvPM8VrctP1AaOIDErFRclq1U1Wf0ab0q73DK9lHEM7aelhbXeTGcodb5UJIMxv2LZdUjxwKmqQcJlv14NXtPjPxMIly38ww6Ye4MdFvYtcydTVAo87X_k9Ew', N'web', CAST(N'2020-03-17T13:35:01.1550306+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (78, 3, N'B8ARLljRz2LLiD4/myJDQa3SttXYM4Bo01cv6+4SbXQ=', N'CfDJ8B37V4qGsudDmGto112e7MbmRxz_uoiSYV2u5b28DsCpDajMaOWGXwmSOoWdUTCnopkiKFGEg5Zn5yFFnvStyNYHIBISg228WOrqLBdrIQ5FQrQ-aO1FBuafd4RDWBwcafVHNV5YEyBsyacYNU6iAeubncDdR9ef_OzxwaIkq46hpOWKorkbP9FzDCGTY8Jcaz5UaSxrrhttdoA0sJ-ggakMZMxJhBUzGi3i0QZ9eFsZgq1ukdakODnFrx9RsAS2uMZp07qdqnZXXvgD2TfC4IBuMDAne2I6xKe0_p7Ue2M3KGQA4Ezf9Cn1G425n0UHGr96cZ6x9SReuXI9jVnl-HYhTSMqGAYfpKu56Y7p9uFnuRgCupkfqbthXG4KPYFqb96cZspcqbuuGKJtcQIffvr7iDhE-1N8Y2cBs-NgC-39KONB_fYMnslxPprgyzXRT4lWkpAg-CFASCOTUEALx8_g-EscJul5BbpLj_nEK23rQS2MbyRECPE-DOrKVW_tKz6KlLe3vL1suNvod1DR6dOyNakJo0LxAxALqMWcOUlBz0KHrTaMg_Yr9nxF92Wa7Q', N'web', CAST(N'2020-03-17T13:50:02.3654774+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (79, 3, N'z0fZKBLXAXkMfEzeeP+EykhpTPNR2eBGL5Os17jpCNA=', N'CfDJ8B37V4qGsudDmGto112e7MZ61rw5biuKd-Q5TPdKCs8zlNyeOoNbDwfvzMx3EmIOouYoGiuxlGTOjVd1RTHpnYEkHNO8-GHFmllzN9O7LNl8CSJuBGt3ivvKFb1aKtyhv99uBTxLh1IlzWdVchnxwcDrCBLxw_vWg6oLtMMpQtzrL8E4zbUHBtXdqMLpeM4Vf2fNeBl7X2gPqRnHzg_tlbcnSgzFpwAkNo8bXp6F-8bizQq-0Yg0tI3A9DBJRmVyEqdtv15Yndzkg_a1PcajGLiBJFeGWoV6qtvaxiUE2upop0FYvFgZL4q7MyYmJq1cpX10eh0SYhCdtHq9FKvo1ujyPKWyhYLJQwmklYbyR9t1eUe6I68TZFR9hyusO3ImzV7XSLqYqHxHmvWNWfn_IfbWa2nFSSn9Mn5rpvVyWoRZHaMChVudjP9xDxz1-VRKDDvNhjQRYrwTfHeK5KbqgeFLjWFSmcwg7u-wlyWJnA-t50ty4NVJuS0fCtTfstuvi74tls4HVEkFl8fQmhL2HjGo3pc_xs06iBq-9IXQ6uiLlPRjVEOcvqnLz_XGhCkVMQ', N'web', CAST(N'2020-03-17T14:08:07.2886766+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (80, 3, N'tm2g3Lz9j3ZvtTe+Mf9qiOyQfLM/6Sfa4ofhaxrh/bg=', N'CfDJ8B37V4qGsudDmGto112e7MbZNX2kMo5-SxxnH6wB9AsOj675_XQLFFx462LvYl7zV7Sw-DQv69bNztUa9rHniJCu2CJd684SIel4NHws1fpUPehHLplKbCudc3tBjxzyjAgpYrIZfag945PufHndOl7gRb27TthaGoRxxPOGPmY22VPQmkAX5oOHmVPmH9HSNtAKXUycpdmcAOsKUQsvmxC4xrfWjO-GSKyAp6UYdyJA-Lbk-sAIdzWMbSBWvPo-TINE3cwmmSJhhnorH04JrsLsCd5xFHWqKyRWlxVGHYBBIB7DzqoJFAeq4efVW8uzshUFIOTh_0XqoJObX7F-t4Th-DmwsKuyvIFB2TBytJ8iWNs9dIF_M1kkEqUTrFmOIYRtAQVrpwWP1spyWAObd8x1DU3hIFsjyZIY7AWQOW5GXb0taCkpDhzMYYR9Rk6EbyzWTFFXHISb8zmbSENsM7bGsur8DrVNalhKQgvC2G_tPl20orkRFMexG1In0lGgWrXfyi8i8UslstRPesRkwaUgnREc71K3yZDr2vrcmXqBAtJAYyRR9svBq5Bxt-N_dQ', N'web', CAST(N'2020-03-17T14:14:05.5166734+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (81, 3, N'3R1jGdlVZvY1CZS8L9CxuBlLEJZhIthuO8R2yYD97+Y=', N'CfDJ8B37V4qGsudDmGto112e7MYJRl2cIKrVezlMdGqHwohQHjPFQagMjNzPwUE0ApjsJDtv4_-TUS3NRSwb-4OMRly4rWkIGpNIEmXE2eb4FVFytm3tgteD1e6vMA6hV6LQxjrUwUruq_YwI1-07KmHLY8nENuI0yIQAY8tB5fB5m43GSEmnQtTCIGzIinWV9tNMTaa55xg2SmmqOrEF_BhPZ5drKFeTYWA0TrUGCkxlTyYgAJoI33pgcVmG-yYJ-lU5GNnvxbipIxY_IwvkMF8Ec08fWzQgvUK2o4TPNy9AWxaRib3dDqggqeXd8uR2jHNKCYAilLhAD5y4U-KFHHvFeq99ImlcxxMaobXI4aU8HER1ttMX0uOjj18dLh-6mQa8Is-r7QTA4TrjnLkvZbDsSFAt9gsn4kSCfeDGMCLHuYZzUHwMO_W2fSh723rfxXoaTSrMn6sI7VQfZNub2Sp7yNEhZ3MNs8UQE-S44W5iMxzF0Lv9rgdfpMoHR6--BsQ6sZoNAWA9uZ6kPhU-HfufNtlgiCmu4W22QP3Tx9mf3Gm79Tl_BA220uKM9IOCbD0WA', N'web', CAST(N'2020-03-17T14:25:00.1232568+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (82, 3, N'60heKtO+WKb/BK8PNH3pBvPxgf5hQAqaswKP2a7C1PY=', N'CfDJ8B37V4qGsudDmGto112e7MaRIvrC442lWuTrVNN6TfpXWdR4caNLe9rIMxp1ULv6cgnPZgUt5MqbMsnOwUJIoHlry993OimojJMQCml_vjqM5hTiNB6Zuum7F0dhSMG2aeDsT0fwarfgHJhXjjxYudMhRJggbRd6-zuunsk0EHn_mE29CKCWTv40ppyNJgw81k0vvV38PA2flv06OcpZZD-HMMio9O-Jdh55MnGRRIEr0aD4H9JkVdQx5QD9nlhoqRTvaPrZlAwFKirB42EC5tDQy3-iVePcbFieypB__OnUcEpoZRNstdLxG9RHy8gmjqcV0lmqSyX9gYkPksCuXNVXItLnLAPOTvV-ZNnMdPTIVki3IvkXmgrW9c716e15eEH5guD4jX2ZHU1fioaRYcgzBl934puitvYoUS4-k2HilCceRcJTF6M7fUhLHdTZGt8Zrg8QKvAgenWcz0Lrt3I4UZWahbxc3Ki0J_RzO4YmoRTvnkKrqeyiolDRsIpeiTC4NeLEPXzXtNx0ZodJM4eDJ6yfJ-2bVJr99N22l6u2incHxtMzKr2Skvd51DWTIw', N'web', CAST(N'2020-03-17T14:30:25.6855660+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (83, 3, N'ZWcNuWWIWLmPfVhTCfxz+oGI5t5eBJSR5DXiYmR5+2s=', N'CfDJ8B37V4qGsudDmGto112e7MbIwbmNMRqloeqSgMGY7E16abJH08IBnS1r71r9JuKBodX3_L5uqEtC1EkxRGcTC5xOVtNeOKN4DB9plMpo6gcdcs3uxPjUhJNASarZCOAs0W0bj0MSzOW_OxCsIP8jd99oGwaoVEEt_9n4n4_WiEVxY_h0xYUMTq5uRbKJCeOgpRiGreDc0TcbX63UosBgdAgS-NgrdmTueR3xaQtXu0KQkKw-f38ElzJO3asGQAHDD4f1hXYkVEj1UCL3YSil1Y5tNfKKkxEuhaPdg0om7LhYrUBAH-5wKQtzVmybYk97oU1_83Ao5jt-vty1Dm0HLqrHMihFDFDMFr2EWytclqDQpEnL0ohgW1tyUK7JONsJdLJVOTW_LVhEmB5BW0753cWhe3vuwPIVmffoITSCgpSbgbOJYw5nJec-jDxZAVWj8g2CswUKlynUAhiPgGlc_M4VmnuLsz4Cixmp21eZoMzbR8ifqdN82SCmHhwu5VFbAy4bxyegyYrIUMJzNNsJS10T7hUoVKmVb23SDsOoM4LcD2kDbKcKv5XNQ-Uyv8jDEg', N'web', CAST(N'2020-03-18T03:54:16.1330548+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (84, 3, N'hX5xkUeecJhqXpPJTiwee5TSBMOHLrFy3OfuwfhSr64=', N'CfDJ8B37V4qGsudDmGto112e7MZsu-gfPfmVhKl3HrrfOSuK-a-UFMlkH6y3fT28WTUog3i1VLB1mI4t31cvHBLcQWVU0V4oayqu6ClEJBCAVZxsLrl-c68_uF5P-SAQj6k2NfLb4ikucjCOOG2OhnkZN97eTXQxFNFk82qYBniGxMjEGeyLyvoH9lOWSKsDRcGyyegydeIsttzyG2Z8UrtcSeyQKqNRLuhtTP7R_WH2qoxa0qll53jDztgBB4nDcpR_Q7FGJ9Y4H-rr0IwLHf44WAqUlA7Arx3iBt_1ighf3LyXhuH2t3p2PhV3lx72xo6UFkEDS2IqPPMveLCQieQVMFulv2pIlMN3uGVptV7iNqdcYJgZMjy4GJxpCV2W2-A_rokL2Cfa4qSAlUmGEuTQ90fIlY-N-rc1vSCBQ7bROaWRQuSsB3vnvo_y_30PlGMuCP3wpQ-28yaZbMq6gXUhggORF_alTptE2_DNF43cbYQYK9TMsqEuv3xWYhdom1Ep4FqmCO9kJaRkKEOu5g0PpI5rzI9oA9LWMzyEDFUTzd_FdTUiBmia_7eyn4tLMlMCMQ', N'web', CAST(N'2020-03-18T04:03:12.2904937+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (85, 3, N'DKobXL72Ukq5wnwuikwKBC8HprrGLQQa1vR1UBKSHZI=', N'CfDJ8B37V4qGsudDmGto112e7MZIJ64GFsr-ko941JxR_l6QvtRlXxfcKJnwqDYO06MoHFxI-fWTylH5rhQorSB_rpzss4vMjbiC75nYkOdOz-zM0sDXS5WUdNOudGwW9B_YNkxwBbbLSbd7etlvYjlCDd3STnfNU_lJT3hEEdl2yvteFswNYJG1VDv7YH3wvY5O531M3nhhJOQuvqg-w_TazSPsTMXG33RIo90E2CxTl78mOjOccmZpYFs1ZGJP446xyvrlnE2dudNfgb2YGK0YUaqNnNQuMDFjJ33E2Ohlcls9S-gGLpoWZG3Me1YVIRLfoO2srXTNNX9LoVx6-pWcNAZlAhA8XHJu9aclWbgKS3gZkH4HfDRmWGf-JGgAJ2NAIWkfHcRZznvxNqh5lC_uxULI1ZJQntaMY7QX4c_qJYQDnGgGBH5TTZjDwh2ZwkVrJj5v0DTZaob5pNAjfRW28yqbUI9w-XkhTG9h9rz3bUZ66s2CDvcljb8iqSEqoBZSOOJfjSUXzgdYgk9jGgXxagoIdifisPf0A8Gb6QlCDZGf7-URdnD5IPROXyt5QjujVA', N'web', CAST(N'2020-03-18T04:06:43.9669876+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (86, 3, N'GCQCH1xR1+PwWc/vV9yuZxTDn3fVHW5n8VfNtv1AQxk=', N'CfDJ8B37V4qGsudDmGto112e7MbCAZBFvT3ezaKMMJqju_UQem3w6E4WDM7K3KroAlUgJxifo9rl2COcdRqpP6i_lzJU7pOHBXvzfOmC5gW-6rVadQN1bZYNOWYIyXdiHov2HAGeQQHUPBjqsBjSIqWz95IgUx6w7azJRi0F4wkO8HolgZn7PoRSLlu9RZDekATFnV2xVBIHshcV7BFmH3AxByrm-GJ6enaJqwxgmwqYXroZnkevGUpSbsT8-Nm51h9jDDBo7zpn8ldvFNKePZ62xYdxLe1D1Cr2WSPFq6HUWeE5YNQ7SLS4beoAfPFpb9onMIyPWZ6hydragsTwbUGUce5HStFkAJ1slgXjO25D8pN7Q9ZiZPK2Rm9-Ufc3mvZ67mCsNqq7oHv7PuHLdA-r2zRzxYtnG9i2GaP5kFsCKCN55AiNh5L9j1UKN4j7eQoXdEbp6rkjujUYanJZiuITnSIpqPKtMXKV3_FApOu99-0GqJGU5o4bHlEZRrxRA277LY8l4_x6G9rVoNSGZdpDljYPQqJ5ByAAMF3FtO-TzTDO3nTjSfmCXWz-Hwarxqn4sQ', N'web', CAST(N'2020-03-18T04:20:10.8830633+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (87, 3, N'jGaGMx2aYJjHos07xYHTL7ZwmoP2tqr5gJijBe63Rq4=', N'CfDJ8B37V4qGsudDmGto112e7MZclcVBF6jRufAynlHM71MzGBCvZ47LMnu-UKALXlVUxB-tpXJHtgZDfr9YTxirb4UaTdHZ_u1rh22oL9lolvIH6pCVOR4sHTESK39jwJiQLJ6i49RCWRwhigVAFpsijG2RttRrCt5_i1HSALYtsru-NJ_eE0Y2P2EXU2W7RUFziI2JV7qVEfkvT5fgdRd30C6sjX-P5gLDH3hsLpz3nc7jx-jmZtsXZU2ka-cjXtdjr2M5emWVHMVUHDzra12OfaaCEEXb0QPoYsQKNOd5779jJH1u1uekBr64BbtNHMED8udSUQBQNxd-Pn2kGVmeEcqmQk7fY_GxtLDRkGR9oI7vyzYbN-_X1sW1cPoXVI6T0qfF2czFz0frJCCQqt5_NmHxf0oNEeXpiGDEiEDst4BfDoz5VjoSJ6v52UYyeq72RwI4xQ8___DQcYKsSsATKgAGqdzBzXq-dugDSZ5HM_TAPhWB0ZnMm8moENhzVkKjVaqYgi1C5rlcJuovjMXH26YDPLkPo1Bvg3sFB70YNCoIUONXUouvOxMFum9OLWPAlA', N'web', CAST(N'2020-03-18T04:24:04.3919960+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (88, 3, N'XWiLyBtIx5H5oB+QzPadO9bv9DBJXz0tft0c3w1kkYw=', N'CfDJ8B37V4qGsudDmGto112e7MZcdN0QZLC6R1TiVkvKDc0icTkBs9WM_sPSoIBMIdDqpECeM0lvUaovrsXK5s1HoZkUGzxTF4IlxE0rZcHP64ywbdPzEeZd2iGxIMzUOf9D-a1JEnq3E4MzoCkUBNFd7xW9VWcTnS8rK9cd9yQN-b_gGVRQT0v0j6zVZMZqdha0xu41siZME-4YWW9B16bW0GRds-RU7-GzGc8L9g69D89r6VeocR8kvlYtC9i1cEiwZuGdOMhOXx--2Wk7hLGDysJ4yu3Tl1nuqZif80Wh3MbxK-w6KwFJI3C9I1jfJKece8zcxw9MpnCB3nV8Gz3kABkKgQ5dJn3ph-XIMpBJmGcEBZcZF0Tl00zDLl7V83PYkopfKbVJzYeXBiGGnparsuV7dBoq5QT5LxnqV0hYJK3YYuKDMs6SC7ZDfmI5_YI7NWGOZCwcZu98XMs4hr63D9G_OU_X_EIgU4L9qiaIdtZRxd9uQZSRIgGzTQ25ujlB5pUpRJ1vL3EZQROeoV-Mj6NBItN8Hy3R6CZpY4QwzAKGw2aveIFTTzxrSp8qmLMDBw', N'web', CAST(N'2020-03-18T04:25:10.8918799+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (89, 3, N'0vU2muCLC7BqBdDAoEWUpkKFNBcExCs7a89X50VQR3s=', N'CfDJ8B37V4qGsudDmGto112e7MZWwA4eaK5d9AFL7LNfAdvZ3u4EStYN57l86gdcflDZ93vm_MmPa6alMtL27TjBzhTzvie2NaQtD9RosonV2P5eg3lS8nS0G6a-_Hi1eRpQXbbJLBmB_8tktgyvlq0MIda9lODkXMeJ5H8b0l-91ukG6XFgovY3m8UgE0OeLj9yyWzkwPDAo0YQeKYn4RPni4eU4w_QfiTl-PrYY8hVc1wu74dU2endOQj4CkxM3Kd7FUBZ-N9711Y53_1v7bJTKeq9hV0k240nOoBXLmFy3WsWjTOFogLunCY4jBMPHPG8yjuPMl2b1WF4WrGPRJYDAXtxnLLVUUnJF9BTOiXEABj1-nzY-oEZ99fPhwaJprWxedJbWshe7GJDbSzKAh5cQqUvjHWZ0jvFSrKdAPOVFQXqLPSM-Ct6zZqh8ldp66_OWUbjFScg7oUW451CvRai5lWOvkbF48lTBDiraQBdQ332J6T7iK3KxD9kSsI1AACaAYQmuipagkDcLWhdbPUs-l3AuCFK0M6oAxVDLt0KPHGphY1HFZZ0olB2msSppUQFZw', N'web', CAST(N'2020-03-18T04:26:08.2598856+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (90, 3, N'ffrWU11i9ZluQvxPNNecbICN/UUX8or8ox8VdLb/o4E=', N'CfDJ8B37V4qGsudDmGto112e7MZWercz1-JYzqhyySwGkg1Cpg_YSf4e3fZhni8qYPWyAWw9D0JSJo_jK1J3VEy7TgBHp0Y4FGo2F1iRxqVHBithqPAcnC3xvHMlmWV8jsSCVlSYVRYk1I8QglY-D4PC_6pueiuAj5pqHIKNNCMCUPiN7W1G8pfUhvs61MbcdkHR6BcXDee9cDjTSBpv2H6lPROv0FbGvUk8rQuKirAKDU0fCRJ2VXFuY6n_L8sJs-GnAZ-7WjZJy6qu6A_Xh-3jlwIg12p-8LWPVj8iixUZv7HWNgN43UcCaCaVmWzyoFvEePYW95hUyolc-KMQyERHdIU8DN3S2cTyDKFFUnwTchJZVZ81NUdxtdlZVKAQBKsOgOxQ66cpfB8seRHRykh9kMCodrGrfN3I5fbp42KfCRGF2nPuKDai6cetaG9Mxa6c15Wm-HHH_JcBHhXNchgW8la7HDZhvchRiCFay27IFXBHWisJF9KQNKwUHxK785p7_YdIkF4eDBbPVvJiNYQ98B5evNDRMLcBitWcWBSHdUww0FB_xB2WHgqZgXPveEy3oQ', N'web', CAST(N'2020-03-18T04:30:02.1279230+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (91, 3, N'LQN/bGavgUakufnk/EmGsoEnTOV5mZvpcNDC4R+wWOw=', N'CfDJ8B37V4qGsudDmGto112e7MYJsFGlSLS1jqd3wxdy0hgsY9s53Yqp7irsk-BzwBzqEEt2dAsDhlxVpfR5buzb42QRAPY7zMG8E3w2eqgi5rbnKx5o2ITbyJnYmkoEO9Lfv_fBFwA204pFV_P0sigI_aSojde3gV7eYP585FHjp_ebmCABbd-htnB0nfeqBpFgBcNSLIK2Ndgn_9tpjIu2CZtguhPhGeep37Q7eypf_38SBpDHjxwj9SLjcELfLcpvhYHL0H_djQI0tntod6zazR0f3ZZZwZG35wRSBFsCwAkEfTyW4YIgwGK4hufJM49buUBm8COnskolXlBiT9VJT5OtAbKtnqwQI9XONUvr8C7ntZ9GMaotT4GhNF8M6N4d3uj-hYwidHCdwfwuwr_86ub5CuEVKaPbh7ByRwh_iTqlkDQY5dwWNrrMuInjDRYpD0irSuL2UNrav4jOGPA8I4rcOkFvEbMzVQ4kUm7YKTJ4cpkTe3_nEsYz7iACfJpGWo3WSkf5K2Y_IF8GSEHGlIR2mKxRMA1KfO42YmO2rPRaf6CWZ5-u4tSbeo-eaXYqfA', N'web', CAST(N'2020-03-18T04:30:50.7845796+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (92, 3, N'yTPYMObpyofxbb+dd/9gEEJbE0EfdtgUVL2AEhUn3GU=', N'CfDJ8B37V4qGsudDmGto112e7MZNjl9g1vWOK0iGZx3loU3fUN8r67DNR56m0VIHnG7lRrTzTM5FpXrhyfpnEPpiFG-OC27HVwvtuEeQKXQbTadvW4VVo4NICPTDatF1eib7vw4Q61Y6y_Vq8CL5JE3DoK7DqfZSdiB_YsauH7OtBbaughElaQSJiovEKM7wAp7SNjxH4jXNGFSYW-WrXeuf5tu6kuBGC1VYRrop8kc5nem9L_O63hQL1mQi2WENa8NQVfg3ZNS8WXxtLe3rPtDdgIgOaqkudHG6uWUm6sIi3ZhpfHrAPnXgMwQgLjq3J7d5tUttUvmEL-5dFFiKbbes3rrSh1z-Jpj6G01MXqRdVuZHEAX4uLpUuTB_7Ko2IDBEdeznl6MMkg_NP1eoGJ__xzGe2kUIs_YdSfPh0bg5zZWZQNrW0PeCJ3uqQNNkiLZ43JtSW5CfJ_wlLObebYlAffh8KuKn9vkNovXbnW_6xI2s8anP8mZhi0Xx3Sh9ImcDByMMxJa_H74FZ2U9UPaXQk7BrbFQ6rQ9YcWZPYskSpm-WWVy3MbgZtLay9qz79OVvg', N'web', CAST(N'2020-03-18T04:42:57.4873068+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (93, 3, N'jqZ2Hv0tjYmMKTnj3ngZAsK3t5bvRHXUCNX8Dkuab5M=', N'CfDJ8B37V4qGsudDmGto112e7MZADd3pIyOjXxWY0UYx_K0Lc0Uv6393IiHdeCzbAEj4-jcipFfMpyRSbjRQt8GyU4DXz6LywvUgGiSNtY2XNv7iKHQjoQWiMUG9FgcA1BYNMqbi2qPmP44E8IpIDKA5LV6SB0OfxJjS84v2lG9lmD_h1aKJZKwp1oryO2Bd-FlKQWmCO1imXkGXpIeu6AEtssMXAcR0LWj__opL5dDb6j5e9cLlSz9rx54xV66No7pTFo52kfPZzaQVhhnJ5V-DuRkoC1jkXsLpbXFs-9sj2SgGiQTsP_sbEKaxF8QFiOXYXYB5SVJgly0xpzilpP8IrkjfsBNuNmc2I1y5zwSETEiSaszANorWav3EVtzda8aWvsz1aaBQjTBisCp40V3oDpcBYNY-MkREesNmYXe1zHfhlRlsbeJYGT2s4Ui-hHRpwkYEfwTPhGwGeEzIMXPVKSwlzUBiNDUlbB-u88K_kIHENalSPt22RU4IJBx97eyWM599ey3-PuBLWxFwfUyDPY6q7EyekAYNPTIMDBiIr5rsRt0MDsZTbpwr2EMVIdsM9Q', N'web', CAST(N'2020-03-18T05:14:39.8546529+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (94, 3, N'4RK4phoqZexgfnrGanmK8Q52Dg2RYjaTDXR4Z5XpIXk=', N'CfDJ8B37V4qGsudDmGto112e7MYKYwftuT332INI9LJUf3bCB5p_912hdeDhRf-gIxfmRPgwE5NAVxaRIoIu0bkBOcco-B6WS2HTAS5I9C-R-aLqmDJdDYPK-I6c8FkVX3-VFdaYiKuLZoRZ54dk4PGvcigrRoIETZl6aIzQcnavuVXwtH0964OcZxWnz5BL2gcPkLebVGsSV373h1RD18T-xE1dJSlQc18QpHdXuPwt6BmA2bBCQMoGjUClXL1Mbcblp24S4GB6nng8-Amld97NanjfLjPBY9I08cqS2YvwC1l3fNiDCmFoKL-_-edUZpO_6JzhyIWZUA6qpeJOXWRpqOgTi_QUTxr1udIY7vKfuDRuQRfVG8W_nhUnAOCkB4EeuQmpBJk8tAnOmu6hc9syA19eNavU4x2YX9bGk0xHOJAtvHjB1BRkQKhgNZ2ytumeyX5HYMdvbCXvXFOLcrj-NYNWlYA9Vo739PVtb9sS66A3TtX1xW3x7ThxGn_6ChXDVaWBSYCOs1ik2a-hQPhfO_raeKtu9tddn0VVN1m7VAmvdu_fdFL7m0S4VnY2B1qevw', N'web', CAST(N'2020-03-18T05:20:08.8621176+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (95, 3, N'drEbw/dkExRyb3MMIaVZe/G0mUXAaniZ/E9HsHNg1Xg=', N'CfDJ8B37V4qGsudDmGto112e7Ma-YFzRZNp3WuWUmowvV75cCazKIOT5jaHrCfLjRvdmcdvN_vWfLOExFBeBsIkHWBGeU0yscoGFDSkthtr1GMjQIMuODmf72jMRIwKHNe1AzMlSv_S4znOdaDvlkOtKsoOHdDsZlqN74qAKjvc3-_N98M12XZLc07q1VlEW0dUBHinF116sNgdrnJ4aXqjczyLx6undQ_mVS__LAuGDqF9m5wEIscfDXB8hH5LzBz8WZqOx_ArKOsrOV-oirq3cpPjO8CTgrRV3OGNJ3nuySzcLKk5uPU7-vCeI1ZbOZqmBTBxrXtlU9DIRMl6ngTvJbch05_cQAarE1Q8vKiMH9esro1j9JU4kyKev8WWtPQM5C-ginkI9ApqHKM6HQ0ID5TEBczFD-8fdAFaJq4wqerFIybVBEhSQgFSVmsT3oOaBeu21chhbEfDcu_2AANK7lzkftHwTUkrih-IXADGfGDefilcVr-9SwjIsKp5vWbUKKPK5REqHej_4W1dp1q51xJ1COFPuUXrSP8AcBxHb5ILHo7vnYBX5xjceX_ZSG4tR2Q', N'web', CAST(N'2020-03-18T05:23:41.4205431+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (96, 3, N'96QGm4H7aBa+R22klwP0SKrCuSgSWABqz1LDqLYFdcU=', N'CfDJ8B37V4qGsudDmGto112e7MZBVpPk87iEKs9EkYN53Ls8qp0ve5My0ROkzEWIqn1e8A7n87MAHMCrKyvfsgM7BgX91iNSExVUzD62dM8aFizRKQZbvilc0xFlogqyb1XX6nuEC7TPVFpCgVF26y3USpV6Jm2tvPx5szm0KmYvMQN0LryoF0qu8VLT-kSoIf2nEN0Km4fjtuc9By7BjmA9ibUIaIv04WjzEq0DMSOW-FhfMU6ZJMTfK5Dl9zZenJP4SYyQHZmHQC8QlJSX3ILXoxe7uGKB3c8XetQQGs57LGdfpOJxE6DSzUrprQ7r0I4nEzhz8aonYo092YA4fZ4GYam33i0fx1rrccy2pJIoHP6KWCXs4NeB7wQyLc2j8a5MeXLLAtHRfYYmNo8paT9R4y9-Wpxxw0jYi-sQ0x3fH1yz1XJ-W0HoueAIXabTcIXLwSASsvm9Tfp_Cr62NLP0PEPMvNEyK8PCEbznMVd8cHXRICHkbh7uwddRJuicImzDNdgrlk2IShwz5n-C4LFeeLjHAhdb-Mo8gqbGyvOXk8WdLVEoAXFjksrPGbOSczfYrA', N'web', CAST(N'2020-03-18T05:44:45.3582729+00:00' AS DateTimeOffset))
INSERT [dbo].[ApplicationUserTokens] ([ApplicationUserTokenId], [UserId], [SecurityKey], [JwtToken], [AudienceType], [CreatedDateTime]) VALUES (97, 3, N'WbwOFc+arapT3lVXiUjae5pM7LONlKFUOywgbSfzUH4=', N'CfDJ8B37V4qGsudDmGto112e7MbaMT9nt4mF2_UWp7IeHIt1iWKF4htf9qisAsJ5fI0bDoBw4rbcpVBSXYGRt6KZl-XCjqzCR1EXGWiII-1L08sUg5WrqXhhwBadwt9JDp0CL1xdJCrF1ZZfHRNBuv5_c0Ujkh4BHBwqSRNUo1rR0k4GSfA6OSugPg1piI3_HI1mO8p5WA-hp6oSGhVw2YHSPxkVjBwVxFNV6GbGyttDCVSDFmFu5-Mli-uF32X0TLXqo1tPIpgaYaDSJ-71lEQXxC8yvPDF5jR3rhqPz9k0BiqT7ZIZGk6rJc1XEjzRjrv3JxJ_EBQq7CStJKGz-YH_YI5jetArGZp6xQZgDvqeAMddma263RbaoSoUL7EldGW-hQEMhjniVmoMbIOBzst27Eo_KklPJ6dGKJNVpyWnZTMvDna3AOOCTa7EEVM5zgeUZ9Ellwk4vY9dWcbfFerJIo6lj0_-s5bfwViRNB8EDd8S7HIQkwMtZQtU0BhoLhlBRP90tgaKaffICUR5Njx5XMyQL5R49ETkJMxEFqmqX8rKiL_V7BCOhMYmv5ico-tVTg', N'web', CAST(N'2020-03-18T05:49:27.0407976+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[ApplicationUserTokens] OFF
SET IDENTITY_INSERT [dbo].[AppUsers] ON 

INSERT [dbo].[AppUsers] ([AppUserId], [AppUserName], [MobileNumber], [EmailId], [Password], [CreatedDate], [RoleId], [Salt]) VALUES (1, N'Bhawna', N'7489840787', N'bhawna@gmail.com', 0x6B756E6E7500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2020-02-20T00:00:00.0000000+05:30' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[AppUsers] ([AppUserId], [AppUserName], [MobileNumber], [EmailId], [Password], [CreatedDate], [RoleId], [Salt]) VALUES (2, N'Chetan', N'7868586758', N'chetan@gmail.com', 0x63686574616E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2020-02-12T00:00:00.0000000+05:30' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[AppUsers] ([AppUserId], [AppUserName], [MobileNumber], [EmailId], [Password], [CreatedDate], [RoleId], [Salt]) VALUES (3, N'Rutvika', N'987456321', N'rutvika@gmail.com', 0x00692A1A6A02339100980DEE96B9BDCE630B13CBC49824D0027685DC8DCCCE3B58B8C996273EAFAD933EA9DE6786C2D93BB8857120479C3E9774F4ABD9CE6296ED1A00F3AFB7E6A9BB0498482EB039BB90708693927FBD5C5C1D89AB53302B897CBD00D9C76061B5DBD7BF4462BE1275607A1C13F5A91FD12E80D81ED5F4E2588FDABAE1, CAST(N'2020-02-28T13:05:53.6950000+00:00' AS DateTimeOffset), 1, 0x454353354200000000B907C0C702F229884562DCF6BC23A53B2BA2D9C72A54523CBD57C1E0E2DEBC6E7C96014830D29832CE6DDBF1D641428A79C92805B4AEEB990170EDDC41B5C7EAE600F820FCB35A01ED1C9A8CD13308CB79AD006C0310B2A6A055D9B93A5B8EC3D56E9A1353329D0A0C70B2EB8C2CE8B233510D45959F2A311C092C65D99AF27DEED565)
INSERT [dbo].[AppUsers] ([AppUserId], [AppUserName], [MobileNumber], [EmailId], [Password], [CreatedDate], [RoleId], [Salt]) VALUES (14, N'Afzal', N'56574581576', N'afzal@gmail.com', 0x01F043F97BB678A49B4A113B720BE255B969AF14AAB4CC36DF23EB8C22F7FF8291BE0526BBC4C0213279E5BF1CFD82D728BEE6CF62AEEC56875BA9439037E53C414D017A517F9EE1BE4F334A67241F9634700D7CD0861A0B96255B28D8D8F6B7047B90304FEE60DA4FB101107A1C2507834DF116D0A72A26ADA480BD96BD3D26B090D938, CAST(N'2020-03-13T11:49:19.7110000+00:00' AS DateTimeOffset), 1, 0x45435335420000000124E449FDDE8EC776F69B085CF54DFA640070E1A6CC2915BCFF4FC6BE545A3DD3C0BDD652691755B1D01D79FAB183FAD61A2C4BE3F5C85B587000E24B6ABBFDE84D00436C942855312E6719DED3A25665F90D047929674776884A663292F84E511779432DC82950E4451DD29ED379CBFC781193FF402A69286F401D84D5204A934A384E)
SET IDENTITY_INSERT [dbo].[AppUsers] OFF
SET IDENTITY_INSERT [dbo].[BankDetails] ON 

INSERT [dbo].[BankDetails] ([BankDetailId], [AccountHolderName], [AccountType], [AccountNumber], [Balance], [AppUserId]) VALUES (1, N'Bhawna', N'HDFC', N'123456789', 64790, 1)
INSERT [dbo].[BankDetails] ([BankDetailId], [AccountHolderName], [AccountType], [AccountNumber], [Balance], [AppUserId]) VALUES (4, N'Chetan', N'AXIS', N'963258741', 30006, 2)
INSERT [dbo].[BankDetails] ([BankDetailId], [AccountHolderName], [AccountType], [AccountNumber], [Balance], [AppUserId]) VALUES (18, N'Rutvika', N'CANARA', N'147852369', 65204, 3)
INSERT [dbo].[BankDetails] ([BankDetailId], [AccountHolderName], [AccountType], [AccountNumber], [Balance], [AppUserId]) VALUES (19, N'Afzal', N'SBI', N'159632478', 80000, 14)
SET IDENTITY_INSERT [dbo].[BankDetails] OFF
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (1, N'Puma')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (2, N'Tommy Hilfiger')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (3, N'Forever 21')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (4, N'Being Human')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (5, N'Allen Solley')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (6, N'Fastrack')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (7, N'Iphone')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (8, N'One plus')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (9, N'Samsung')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (10, N'Formula 1')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Cards] ON 

INSERT [dbo].[Cards] ([CardId], [CardNumber], [CardType], [ExpiryDate], [Cvv], [AppUserId]) VALUES (1, N'16001200', N'Visa', N'2021-12-12 00:00:00.0000000 +05:30', 111, 1)
SET IDENTITY_INSERT [dbo].[Cards] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1, N'Red')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (2, N'Black')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (3, N'Blue')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountId], [SellerId], [ProductId], [ValidityFrom], [ValidityTill], [DiscountPrice], [ProductCategoryId]) VALUES (1, 1, 1, CAST(N'2020-01-01T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2020-01-10T00:00:00.0000000+05:30' AS DateTimeOffset), 500, 1)
INSERT [dbo].[Discounts] ([DiscountId], [SellerId], [ProductId], [ValidityFrom], [ValidityTill], [DiscountPrice], [ProductCategoryId]) VALUES (2, 1, 2, CAST(N'2020-01-01T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2020-01-10T00:00:00.0000000+05:30' AS DateTimeOffset), 200, 2)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[FeedBacks] ON 

INSERT [dbo].[FeedBacks] ([FeedBackId], [Comment], [Image], [Ratings], [AppUserId], [ProductId]) VALUES (1, NULL, NULL, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[FeedBacks] OFF
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceId], [PaymentId], [InvoiceDate]) VALUES (2, 3, CAST(N'2020-02-21T00:00:00.0000000+05:30' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Invoices] OFF
SET IDENTITY_INSERT [dbo].[LanguageContentKeys] ON 

INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (1, N'required', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (2, N'maxLength', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (3, N'range', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (4, N'unique', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (5, N'hardDelete', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (6, N'exceptionMessage', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (7, N'unauthorizedMessage', 0)
INSERT [dbo].[LanguageContentKeys] ([LanguageContentKeyId], [KeyName], [IsComponent]) VALUES (8, N'invalidTokenMessage', 0)
SET IDENTITY_INSERT [dbo].[LanguageContentKeys] OFF
SET IDENTITY_INSERT [dbo].[LanguageContents] ON 

INSERT [dbo].[LanguageContents] ([LanguageContentId], [LanguageContentKeyId], [ContentType], [En], [Fr]) VALUES (1, 1, N'g', N'The {0} field is required', NULL)
INSERT [dbo].[LanguageContents] ([LanguageContentId], [LanguageContentKeyId], [ContentType], [En], [Fr]) VALUES (2, 2, N'g', N'The allowed max length is {0}', NULL)
INSERT [dbo].[LanguageContents] ([LanguageContentId], [LanguageContentKeyId], [ContentType], [En], [Fr]) VALUES (3, 3, N'g', N'You can enter {0} to {1} length', NULL)
INSERT [dbo].[LanguageContents] ([LanguageContentId], [LanguageContentKeyId], [ContentType], [En], [Fr]) VALUES (4, 4, N'g', N'The {0} Field Should be unique', NULL)
SET IDENTITY_INSERT [dbo].[LanguageContents] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageId], [LanguageName]) VALUES (1, N'English')
INSERT [dbo].[Languages] ([LanguageId], [LanguageName]) VALUES (2, N'Hindi')
INSERT [dbo].[Languages] ([LanguageId], [LanguageName]) VALUES (3, N'French')
INSERT [dbo].[Languages] ([LanguageId], [LanguageName]) VALUES (4, N'Marathi')
INSERT [dbo].[Languages] ([LanguageId], [LanguageName]) VALUES (5, N'Gujrati')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([MaterialId], [MaterialType]) VALUES (1, N'Cotton')
INSERT [dbo].[Materials] ([MaterialId], [MaterialType]) VALUES (2, N'Wool')
INSERT [dbo].[Materials] ([MaterialId], [MaterialType]) VALUES (3, N'Rayon')
INSERT [dbo].[Materials] ([MaterialId], [MaterialType]) VALUES (4, N'Leather')
INSERT [dbo].[Materials] ([MaterialId], [MaterialType]) VALUES (5, N'Denim')
SET IDENTITY_INSERT [dbo].[Materials] OFF
SET IDENTITY_INSERT [dbo].[ModuleMasters] ON 

INSERT [dbo].[ModuleMasters] ([ModuleMasterId], [ModuleMasterName], [StatusId]) VALUES (1, N'User Management', 1)
SET IDENTITY_INSERT [dbo].[ModuleMasters] OFF
SET IDENTITY_INSERT [dbo].[MusicCategories] ON 

INSERT [dbo].[MusicCategories] ([MusicCategoryId], [MusicCategoryName]) VALUES (1, N'Albums')
INSERT [dbo].[MusicCategories] ([MusicCategoryId], [MusicCategoryName]) VALUES (2, N'Movies')
SET IDENTITY_INSERT [dbo].[MusicCategories] OFF
SET IDENTITY_INSERT [dbo].[Musics] ON 

INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (1, N'Naina', 1, N'Dangal', N'Neha Kakkar')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (2, N'Shayad', 2, N'Love Aaj Kal', N'Arijit Singh')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (3, N'LetsNacho', 3, N'Kapoor & Sons', N'Badshah')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (4, N'MannBhareya', 4, N'Mann Bhareya', N'B Praak')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (5, N'TeraChehra', 5, N'Tera Chehra', N'Adnan Shami')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (7, N'Naja', 6, N'NAJA', N'Pav Dharia')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (8, N'Rabta', 1, N'Agent Vinod', N'Arijit Singh')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (9, N'Aayat', 2, N'Bajirao Mastani', N'Arijit Singh')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (10, N'Breakup', 3, N'Ae Dil hai Mushkil', N'Arijit Singh')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (11, N'Filhall', 4, N'Filhall', N'B Praak')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (12, N'Intezaar', 5, N'Intezaar', N'Arijit Singh')
INSERT [dbo].[Musics] ([MusicId], [MusicName], [MusicSubCategoryId], [AlbumName], [ArtistName]) VALUES (13, N'Makhna', 6, N'Makhna', N'Honey Singh')
SET IDENTITY_INSERT [dbo].[Musics] OFF
SET IDENTITY_INSERT [dbo].[MusicSubCategories] ON 

INSERT [dbo].[MusicSubCategories] ([MusicSubCategoryId], [PrimeMusicId], [CategoryName], [MusicCategoryId]) VALUES (1, 1, N'Sad', 1)
INSERT [dbo].[MusicSubCategories] ([MusicSubCategoryId], [PrimeMusicId], [CategoryName], [MusicCategoryId]) VALUES (2, 1, N'Love', 1)
INSERT [dbo].[MusicSubCategories] ([MusicSubCategoryId], [PrimeMusicId], [CategoryName], [MusicCategoryId]) VALUES (3, 1, N'Party', 1)
INSERT [dbo].[MusicSubCategories] ([MusicSubCategoryId], [PrimeMusicId], [CategoryName], [MusicCategoryId]) VALUES (4, 1, N'Sad', 2)
INSERT [dbo].[MusicSubCategories] ([MusicSubCategoryId], [PrimeMusicId], [CategoryName], [MusicCategoryId]) VALUES (5, 1, N'Love', 2)
INSERT [dbo].[MusicSubCategories] ([MusicSubCategoryId], [PrimeMusicId], [CategoryName], [MusicCategoryId]) VALUES (6, 1, N'Party', 2)
SET IDENTITY_INSERT [dbo].[MusicSubCategories] OFF
SET IDENTITY_INSERT [dbo].[Offers] ON 

INSERT [dbo].[Offers] ([OfferId], [ProductId], [OfferPercentage], [DiscountId]) VALUES (1, 1, 50, 1)
SET IDENTITY_INSERT [dbo].[Offers] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [ExpectedDate], [ShippingFeeDetailId], [OrderId]) VALUES (1, CAST(N'2020-02-24T00:00:00.0000000+05:30' AS DateTimeOffset), 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CreatedDate], [TransactionId]) VALUES (1, CAST(N'2020-02-21T00:00:00.0000000+05:30' AS DateTimeOffset), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Otps] ON 

INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (1, 4249, CAST(N'2020-03-05T14:59:25.0800834+05:30' AS DateTimeOffset), CAST(N'2020-03-05T15:01:25.0800834+05:30' AS DateTimeOffset), N'987456221')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (2, 4394, CAST(N'2020-03-05T15:01:55.0817335+05:30' AS DateTimeOffset), CAST(N'2020-03-05T15:03:55.0817335+05:30' AS DateTimeOffset), N'987466321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (3, 2546, CAST(N'2020-03-05T15:05:50.5796980+05:30' AS DateTimeOffset), CAST(N'2020-03-05T15:07:50.5796980+05:30' AS DateTimeOffset), N'963257')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (4, 5414, CAST(N'2020-03-05T15:06:56.0715120+05:30' AS DateTimeOffset), CAST(N'2020-03-05T15:08:56.0715120+05:30' AS DateTimeOffset), N'989757858968')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (5, 3924, CAST(N'2020-03-05T15:17:19.8185532+05:30' AS DateTimeOffset), CAST(N'2020-03-05T15:19:19.8185532+05:30' AS DateTimeOffset), N'98757454')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (6, 3802, CAST(N'2020-03-05T15:31:01.6433244+05:30' AS DateTimeOffset), CAST(N'2020-03-05T15:33:01.6433244+05:30' AS DateTimeOffset), N'741258963')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (7, 3762, CAST(N'2020-03-05T17:05:17.8271046+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:07:17.8271046+05:30' AS DateTimeOffset), N'5656')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (8, 1612, CAST(N'2020-03-05T17:09:37.4160562+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:11:37.4160562+05:30' AS DateTimeOffset), N'9874563211')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (9, 5766, CAST(N'2020-03-05T17:14:44.6375791+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:16:44.6375791+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (10, 2356, CAST(N'2020-03-05T17:28:32.5203948+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:30:32.5203948+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (11, 9809, CAST(N'2020-03-05T17:31:03.2833111+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:33:03.2833111+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (12, 3412, CAST(N'2020-03-05T17:32:15.5723644+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:34:15.5723644+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (13, 8978, CAST(N'2020-03-05T17:34:25.1055994+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:36:25.1055994+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (14, 5848, CAST(N'2020-03-05T17:40:10.0409543+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:42:10.0409543+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (15, 6405, CAST(N'2020-03-05T17:43:16.3205291+05:30' AS DateTimeOffset), CAST(N'2020-03-05T17:45:16.3205291+05:30' AS DateTimeOffset), N'23629646')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (16, 6510, CAST(N'2020-03-06T12:41:28.8329799+05:30' AS DateTimeOffset), CAST(N'2020-03-06T12:43:28.8329799+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (17, 1740, CAST(N'2020-03-06T12:44:02.4803107+05:30' AS DateTimeOffset), CAST(N'2020-03-06T12:46:02.4803107+05:30' AS DateTimeOffset), N'56467684')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (18, 2286, CAST(N'2020-03-06T13:00:06.8175429+05:30' AS DateTimeOffset), CAST(N'2020-03-06T13:02:06.8175429+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (19, 4405, CAST(N'2020-03-09T11:51:50.2643837+05:30' AS DateTimeOffset), CAST(N'2020-03-09T11:53:50.2643837+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (20, 7435, CAST(N'2020-03-09T18:43:29.5364875+05:30' AS DateTimeOffset), CAST(N'2020-03-09T18:45:29.5364875+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (21, 8604, CAST(N'2020-03-09T18:46:02.4909779+05:30' AS DateTimeOffset), CAST(N'2020-03-09T18:48:02.4909779+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (22, 8527, CAST(N'2020-03-09T18:47:35.2210385+05:30' AS DateTimeOffset), CAST(N'2020-03-09T18:49:35.2210385+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (23, 3757, CAST(N'2020-03-09T18:50:04.5206702+05:30' AS DateTimeOffset), CAST(N'2020-03-09T18:52:04.5206702+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (24, 5329, CAST(N'2020-03-09T18:55:50.7085795+05:30' AS DateTimeOffset), CAST(N'2020-03-09T18:57:50.7085795+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (25, 9085, CAST(N'2020-03-09T18:57:09.9882061+05:30' AS DateTimeOffset), CAST(N'2020-03-09T18:59:09.9882061+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (26, 6931, CAST(N'2020-03-09T18:59:23.9844311+05:30' AS DateTimeOffset), CAST(N'2020-03-09T19:01:23.9844311+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (27, 1164, CAST(N'2020-03-09T19:04:03.3988098+05:30' AS DateTimeOffset), CAST(N'2020-03-09T19:06:03.3988098+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (28, 2511, CAST(N'2020-03-09T19:14:22.2379243+05:30' AS DateTimeOffset), CAST(N'2020-03-09T19:16:22.2379243+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (29, 8744, CAST(N'2020-03-11T17:40:21.0592798+05:30' AS DateTimeOffset), CAST(N'2020-03-11T17:42:21.0592798+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (30, 9019, CAST(N'2020-03-11T17:42:27.7544273+05:30' AS DateTimeOffset), CAST(N'2020-03-11T17:44:27.7544273+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (31, 8122, CAST(N'2020-03-11T18:00:12.8152350+05:30' AS DateTimeOffset), CAST(N'2020-03-11T18:02:12.8152350+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (32, 5712, CAST(N'2020-03-11T18:03:13.2166624+05:30' AS DateTimeOffset), CAST(N'2020-03-11T18:05:13.2166624+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (33, 7643, CAST(N'2020-03-11T18:04:40.6709431+05:30' AS DateTimeOffset), CAST(N'2020-03-11T18:06:40.6709431+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (34, 2040, CAST(N'2020-03-11T18:07:14.7572904+05:30' AS DateTimeOffset), CAST(N'2020-03-11T18:09:14.7572904+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (35, 7146, CAST(N'2020-03-11T18:09:06.2112562+05:30' AS DateTimeOffset), CAST(N'2020-03-11T18:11:06.2112562+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (36, 1447, CAST(N'2020-03-11T18:10:19.4364935+05:30' AS DateTimeOffset), CAST(N'2020-03-11T18:12:19.4364935+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (37, 3418, CAST(N'2020-03-13T13:02:35.0661385+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:04:35.0661385+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (38, 1182, CAST(N'2020-03-13T13:05:53.5859271+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:07:53.5859271+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (39, 7888, CAST(N'2020-03-13T13:09:12.5431291+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:11:12.5431291+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (41, 5817, CAST(N'2020-03-13T13:12:22.1076972+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:14:22.1076972+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (42, 2650, CAST(N'2020-03-13T13:16:54.5539982+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:18:54.5539982+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (43, 8075, CAST(N'2020-03-13T13:23:44.1235900+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:25:44.1235900+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (44, 5281, CAST(N'2020-03-13T13:26:08.5064787+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:28:08.5064787+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (45, 6806, CAST(N'2020-03-13T13:26:55.6344126+05:30' AS DateTimeOffset), CAST(N'2020-03-13T13:28:55.6344126+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (46, 7216, CAST(N'2020-03-13T15:33:22.9121252+05:30' AS DateTimeOffset), CAST(N'2020-03-13T15:35:22.9121252+05:30' AS DateTimeOffset), N'234234')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (47, 3992, CAST(N'2020-03-13T18:45:34.9463553+05:30' AS DateTimeOffset), CAST(N'2020-03-13T18:47:34.9463553+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (48, 8117, CAST(N'2020-03-13T18:48:13.9257513+05:30' AS DateTimeOffset), CAST(N'2020-03-13T18:50:13.9257513+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (49, 3828, CAST(N'2020-03-13T18:50:28.4382110+05:30' AS DateTimeOffset), CAST(N'2020-03-13T18:52:28.4382110+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (50, 6329, CAST(N'2020-03-13T18:58:44.0993826+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:00:44.0993826+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (51, 3227, CAST(N'2020-03-13T19:01:56.6182732+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:03:56.6182732+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (52, 5173, CAST(N'2020-03-13T19:03:16.6044817+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:05:16.6044817+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (53, 8767, CAST(N'2020-03-13T19:05:10.1024774+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:07:10.1024774+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (54, 8267, CAST(N'2020-03-13T19:07:02.5398436+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:09:02.5398436+05:30' AS DateTimeOffset), N'7489840787')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (55, 8734, CAST(N'2020-03-13T19:07:53.9492793+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:09:53.9492793+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (56, 4895, CAST(N'2020-03-13T19:13:02.0084378+05:30' AS DateTimeOffset), CAST(N'2020-03-13T19:15:02.0084378+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (57, 7285, CAST(N'2020-03-16T10:48:55.2143759+05:30' AS DateTimeOffset), CAST(N'2020-03-16T10:50:55.2143759+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (58, 5356, CAST(N'2020-03-16T11:56:15.0962784+05:30' AS DateTimeOffset), CAST(N'2020-03-16T11:58:15.0962784+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (59, 7140, CAST(N'2020-03-16T18:54:50.3597047+05:30' AS DateTimeOffset), CAST(N'2020-03-16T18:56:50.3597047+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (60, 5591, CAST(N'2020-03-17T11:58:19.4100298+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:00:19.4100298+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (61, 4478, CAST(N'2020-03-17T12:21:12.9801997+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:23:12.9801997+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (62, 2854, CAST(N'2020-03-17T12:23:25.8656342+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:25:25.8656342+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (63, 8770, CAST(N'2020-03-17T12:24:10.8354226+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:26:10.8354226+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (64, 1317, CAST(N'2020-03-17T12:25:08.7531869+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:27:08.7531869+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (65, 6676, CAST(N'2020-03-17T12:25:43.2811064+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:27:43.2811064+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (66, 7882, CAST(N'2020-03-17T12:26:09.8794688+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:28:09.8794688+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (67, 3740, CAST(N'2020-03-17T12:27:58.2685659+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:29:58.2685659+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (68, 8800, CAST(N'2020-03-17T12:28:43.6835182+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:30:43.6835182+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (69, 8811, CAST(N'2020-03-17T12:40:21.7692322+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:42:21.7692322+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (70, 1345, CAST(N'2020-03-17T12:43:07.0203035+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:45:07.0203035+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (71, 8136, CAST(N'2020-03-17T12:44:24.1273739+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:46:24.1273739+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (72, 5807, CAST(N'2020-03-17T12:48:42.8184655+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:50:42.8184655+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (73, 5326, CAST(N'2020-03-17T12:50:28.7937044+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:52:28.7937044+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (74, 9975, CAST(N'2020-03-17T12:56:46.2343846+05:30' AS DateTimeOffset), CAST(N'2020-03-17T12:58:46.2343846+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (75, 3723, CAST(N'2020-03-17T15:00:53.8271444+05:30' AS DateTimeOffset), CAST(N'2020-03-17T15:02:53.8271444+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (76, 5492, CAST(N'2020-03-17T15:03:19.1818905+05:30' AS DateTimeOffset), CAST(N'2020-03-17T15:05:19.1818905+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (77, 3121, CAST(N'2020-03-17T15:04:12.8199274+05:30' AS DateTimeOffset), CAST(N'2020-03-17T15:06:12.8199274+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (78, 2785, CAST(N'2020-03-17T15:07:17.1488974+05:30' AS DateTimeOffset), CAST(N'2020-03-17T15:09:17.1488974+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (79, 3535, CAST(N'2020-03-17T15:48:20.6624312+05:30' AS DateTimeOffset), CAST(N'2020-03-17T15:50:20.6624312+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (80, 7214, CAST(N'2020-03-17T16:54:08.0714179+05:30' AS DateTimeOffset), CAST(N'2020-03-17T16:56:08.0714179+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (81, 6427, CAST(N'2020-03-17T17:14:28.1945707+05:30' AS DateTimeOffset), CAST(N'2020-03-17T17:16:28.1945707+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (82, 5016, CAST(N'2020-03-17T17:29:31.4447035+05:30' AS DateTimeOffset), CAST(N'2020-03-17T17:31:31.4447035+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (83, 1610, CAST(N'2020-03-17T17:38:23.2005049+05:30' AS DateTimeOffset), CAST(N'2020-03-17T17:40:23.2005049+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (84, 6415, CAST(N'2020-03-17T17:51:15.4133436+05:30' AS DateTimeOffset), CAST(N'2020-03-17T17:53:15.4133436+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (85, 7089, CAST(N'2020-03-17T18:11:23.8628304+05:30' AS DateTimeOffset), CAST(N'2020-03-17T18:13:23.8628304+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (86, 4764, CAST(N'2020-03-17T18:44:05.0024162+05:30' AS DateTimeOffset), CAST(N'2020-03-17T18:46:05.0024162+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (87, 2825, CAST(N'2020-03-17T18:47:07.4562518+05:30' AS DateTimeOffset), CAST(N'2020-03-17T18:49:07.4562518+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (88, 2036, CAST(N'2020-03-17T18:49:15.1128354+05:30' AS DateTimeOffset), CAST(N'2020-03-17T18:51:15.1128354+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (89, 3718, CAST(N'2020-03-17T19:04:48.6999274+05:30' AS DateTimeOffset), CAST(N'2020-03-17T19:06:48.6999274+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (90, 7932, CAST(N'2020-03-17T19:19:51.6436346+05:30' AS DateTimeOffset), CAST(N'2020-03-17T19:21:51.6436346+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (91, 3496, CAST(N'2020-03-17T19:37:51.6642667+05:30' AS DateTimeOffset), CAST(N'2020-03-17T19:39:51.6642667+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (92, 2194, CAST(N'2020-03-17T19:43:55.2406121+05:30' AS DateTimeOffset), CAST(N'2020-03-17T19:45:55.2406121+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (93, 6418, CAST(N'2020-03-17T19:54:44.2374088+05:30' AS DateTimeOffset), CAST(N'2020-03-17T19:56:44.2374088+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (94, 2403, CAST(N'2020-03-17T20:00:10.7069331+05:30' AS DateTimeOffset), CAST(N'2020-03-17T20:02:10.7069331+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (95, 5527, CAST(N'2020-03-18T09:24:04.9497410+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:26:04.9497410+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (96, 9288, CAST(N'2020-03-18T09:33:00.3319405+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:35:00.3319405+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (97, 7345, CAST(N'2020-03-18T09:36:33.4890566+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:38:33.4890566+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (98, 8681, CAST(N'2020-03-18T09:49:58.3168602+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:51:58.3168602+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (99, 5224, CAST(N'2020-03-18T09:53:53.5555888+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:55:53.5555888+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (100, 6027, CAST(N'2020-03-18T09:55:00.5565729+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:57:00.5565729+05:30' AS DateTimeOffset), N'987456321')
GO
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (101, 3552, CAST(N'2020-03-18T09:55:58.7383899+05:30' AS DateTimeOffset), CAST(N'2020-03-18T09:57:58.7383899+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (102, 7835, CAST(N'2020-03-18T09:59:43.1816118+05:30' AS DateTimeOffset), CAST(N'2020-03-18T10:01:43.1816118+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (103, 1300, CAST(N'2020-03-18T10:00:41.9433969+05:30' AS DateTimeOffset), CAST(N'2020-03-18T10:02:41.9433969+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (104, 6077, CAST(N'2020-03-18T10:12:49.1290519+05:30' AS DateTimeOffset), CAST(N'2020-03-18T10:14:49.1290519+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (105, 5357, CAST(N'2020-03-18T10:44:29.8908828+05:30' AS DateTimeOffset), CAST(N'2020-03-18T10:46:29.8908828+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (106, 6160, CAST(N'2020-03-18T10:49:58.5526778+05:30' AS DateTimeOffset), CAST(N'2020-03-18T10:51:58.5526778+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (107, 4717, CAST(N'2020-03-18T10:53:32.2245371+05:30' AS DateTimeOffset), CAST(N'2020-03-18T10:55:32.2245371+05:30' AS DateTimeOffset), N'987456321')
INSERT [dbo].[Otps] ([OtpId], [OtpNumber], [ValidFrom], [ValidTill], [MobileNumber]) VALUES (108, 8655, CAST(N'2020-03-18T11:19:14.1135944+05:30' AS DateTimeOffset), CAST(N'2020-03-18T11:21:14.1135944+05:30' AS DateTimeOffset), N'987456321')
SET IDENTITY_INSERT [dbo].[Otps] OFF
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [PromoCodeId], [AppUserId]) VALUES (3, 1500, CAST(N'2020-02-21T00:00:00.0000000+05:30' AS DateTimeOffset), 1, 1)
SET IDENTITY_INSERT [dbo].[Payments] OFF
SET IDENTITY_INSERT [dbo].[PrimeMusics] ON 

INSERT [dbo].[PrimeMusics] ([PrimeMusicId], [ValidFrom], [ValidTill], [AppUserId]) VALUES (1, CAST(N'2019-01-01T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2020-01-01T00:00:00.0000000+05:30' AS DateTimeOffset), 3)
SET IDENTITY_INSERT [dbo].[PrimeMusics] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (1, N'MensClothing', 1, 1)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (2, N'WomensClothing', 1, 2)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (3, N'MensAccessories', 1, 1)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (4, N'WomensAccessories', 1, 2)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (5, N'MensShoes', 1, 1)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (6, N'WomensFootwear', 1, 2)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (7, N'Mobile', 2, 3)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (8, N'Tablets', 2, 3)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (9, N'Laptops', 2, 3)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (10, N'Refrigerator', 1, 4)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (11, N'DinningTable', 1, 4)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (12, N'Tyres', 2, 5)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (13, N'Filters', 2, 5)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (14, N'Fiction', 2, 6)
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [StoreId], [ProductMainCategoryId]) VALUES (15, N'EditorsCorner', 2, 6)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[ProductMainCategories] ON 

INSERT [dbo].[ProductMainCategories] ([ProductMainCategoryId], [ProductMainCategoryName]) VALUES (1, N'Men''s Fashion')
INSERT [dbo].[ProductMainCategories] ([ProductMainCategoryId], [ProductMainCategoryName]) VALUES (2, N'Women''s Fashion')
INSERT [dbo].[ProductMainCategories] ([ProductMainCategoryId], [ProductMainCategoryName]) VALUES (3, N'Electronics')
INSERT [dbo].[ProductMainCategories] ([ProductMainCategoryId], [ProductMainCategoryName]) VALUES (4, N'Home Accessories')
INSERT [dbo].[ProductMainCategories] ([ProductMainCategoryId], [ProductMainCategoryName]) VALUES (5, N'Cars and Motorbikes')
INSERT [dbo].[ProductMainCategories] ([ProductMainCategoryId], [ProductMainCategoryName]) VALUES (6, N'Books')
SET IDENTITY_INSERT [dbo].[ProductMainCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductSubCategoryId], [SellerId]) VALUES (1, 1, 1)
INSERT [dbo].[Products] ([ProductId], [ProductSubCategoryId], [SellerId]) VALUES (2, 4, 2)
INSERT [dbo].[Products] ([ProductId], [ProductSubCategoryId], [SellerId]) VALUES (3, 3, 5)
INSERT [dbo].[Products] ([ProductId], [ProductSubCategoryId], [SellerId]) VALUES (4, 2, 7)
INSERT [dbo].[Products] ([ProductId], [ProductSubCategoryId], [SellerId]) VALUES (5, 1, 8)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductSubCategories] ON 

INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (1, N'Shirt', 1)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (2, N'Jeans', 1)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (3, N'T-shirt', 1)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (4, N'WesternWear', 2)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (5, N'EthnicWear', 2)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (6, N'MenBags', 3)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (7, N'MenSunglasses', 3)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (8, N'WomenBags', 4)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (9, N'WomenSunglasses', 4)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (10, N'MenFormalShoes', 5)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (11, N'MenCasualShoes', 5)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (12, N'WomenHeels', 6)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (13, N'WomenSandals', 6)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (14, N'Iphone', 7)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (15, N'OnePlus', 7)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (16, N'Ipad', 8)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (17, N'SamsungTab', 8)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (18, N'Macbook', 9)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (19, N'Dell', 9)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (20, N'Refrigerator1', 10)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (21, N'Refrigerator2', 10)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (22, N'DinningTable1', 11)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (23, N'DinningTable2', 11)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (24, N'Tyres1', 12)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (25, N'Tyres2', 12)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (26, N'Filters1', 13)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (27, N'Filters2', 13)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (28, N'Novel', 14)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (29, N'ShortStory', 14)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (30, N'EditorChoice1', 15)
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [ProductCategoryId]) VALUES (31, N'EditorsChoice2', 15)
SET IDENTITY_INSERT [dbo].[ProductSubCategories] OFF
SET IDENTITY_INSERT [dbo].[PromoCodes] ON 

INSERT [dbo].[PromoCodes] ([PromoCodeId], [PromoCodeName], [Amount], [ValidFrom], [ValidTill]) VALUES (1, N'SAVE100', 100, CAST(N'2020-01-01T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2020-01-10T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[PromoCodes] ([PromoCodeId], [PromoCodeName], [Amount], [ValidFrom], [ValidTill]) VALUES (2, N'SAVE250', 250, CAST(N'2020-01-15T00:00:00.0000000+05:30' AS DateTimeOffset), CAST(N'2020-01-20T00:00:00.0000000+05:30' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[PromoCodes] OFF
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [ApplicationModuleId], [CanView], [CanAdd], [CanEdit], [CanDelete], [PermissionPriority]) VALUES (2, 1, 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [StatusId]) VALUES (1, N'Super Admin', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SellerDetails] ON 

INSERT [dbo].[SellerDetails] ([SellerDetailId], [CompanyName], [Address], [PanNumber], [ShippingFeeDetailId], [AppUserId]) VALUES (1, N'Radix', N'Ekyarth', N'ABC123', 1, 2)
INSERT [dbo].[SellerDetails] ([SellerDetailId], [CompanyName], [Address], [PanNumber], [ShippingFeeDetailId], [AppUserId]) VALUES (10, N'Rx', N'Ekyarth', N'98745', NULL, 1)
INSERT [dbo].[SellerDetails] ([SellerDetailId], [CompanyName], [Address], [PanNumber], [ShippingFeeDetailId], [AppUserId]) VALUES (11, N'Rx', N'Ekyarth', N'987456', NULL, 1)
INSERT [dbo].[SellerDetails] ([SellerDetailId], [CompanyName], [Address], [PanNumber], [ShippingFeeDetailId], [AppUserId]) VALUES (14, N'abc', N'Ekyarth', N'987', NULL, 1)
SET IDENTITY_INSERT [dbo].[SellerDetails] OFF
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([SellerId], [ProductName], [OriginalProductPrice], [SellerDetailId], [BrandId], [SizeId], [MaterialId], [ColorId], [LanguageId], [RoleId], [BankDetailId], [DiscountProductPrice], [ProductMainCategoryId]) VALUES (1, N'BeingHumanShirt', 1399, 1, 4, 1, 1, 1, NULL, 1, 1, 1199, 1)
INSERT [dbo].[Sellers] ([SellerId], [ProductName], [OriginalProductPrice], [SellerDetailId], [BrandId], [SizeId], [MaterialId], [ColorId], [LanguageId], [RoleId], [BankDetailId], [DiscountProductPrice], [ProductMainCategoryId]) VALUES (2, N'Forever21Jeans', 1599, 1, 3, 1, 4, 1, NULL, 1, 1, 1399, 2)
INSERT [dbo].[Sellers] ([SellerId], [ProductName], [OriginalProductPrice], [SellerDetailId], [BrandId], [SizeId], [MaterialId], [ColorId], [LanguageId], [RoleId], [BankDetailId], [DiscountProductPrice], [ProductMainCategoryId]) VALUES (5, N'PumaT-shirt', 2599, 1, 1, 1, 1, 1, NULL, 1, 1, 2399, 1)
INSERT [dbo].[Sellers] ([SellerId], [ProductName], [OriginalProductPrice], [SellerDetailId], [BrandId], [SizeId], [MaterialId], [ColorId], [LanguageId], [RoleId], [BankDetailId], [DiscountProductPrice], [ProductMainCategoryId]) VALUES (7, N'TommyHilfigerJeans', 3999, 1, 2, 3, 5, 2, NULL, 1, 1, 3799, 1)
INSERT [dbo].[Sellers] ([SellerId], [ProductName], [OriginalProductPrice], [SellerDetailId], [BrandId], [SizeId], [MaterialId], [ColorId], [LanguageId], [RoleId], [BankDetailId], [DiscountProductPrice], [ProductMainCategoryId]) VALUES (8, N'RaymondShirt', 1599, 1, NULL, 2, 1, 2, NULL, 1, 1, 1399, 1)
SET IDENTITY_INSERT [dbo].[Sellers] OFF
SET IDENTITY_INSERT [dbo].[ShippingFeeDetails] ON 

INSERT [dbo].[ShippingFeeDetails] ([ShippingFeeDetailId], [LocalAmount], [RegionalAmount], [NationalAmount], [ApplicationObjectId]) VALUES (1, 20, 50, 150, 20)
SET IDENTITY_INSERT [dbo].[ShippingFeeDetails] OFF
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([SizeId], [SizeType]) VALUES (1, N'S')
INSERT [dbo].[Sizes] ([SizeId], [SizeType]) VALUES (2, N'M')
INSERT [dbo].[Sizes] ([SizeId], [SizeType]) VALUES (3, N'L')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([StoreId], [StoreName], [TaxDetails], [Gst], [Signature], [CreatedDate]) VALUES (1, N'Radix', N'Gujarat', N'123-456-789', NULL, CAST(N'2020-01-20T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Stores] ([StoreId], [StoreName], [TaxDetails], [Gst], [Signature], [CreatedDate]) VALUES (2, N'Rx', N'Maharashtra', N'147-852-369', NULL, CAST(N'2020-01-22T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Stores] ([StoreId], [StoreName], [TaxDetails], [Gst], [Signature], [CreatedDate]) VALUES (3, N'HOF', N'Rajasthan', N'741-258-963', NULL, CAST(N'2020-01-25T00:00:00.0000000+05:30' AS DateTimeOffset))
INSERT [dbo].[Stores] ([StoreId], [StoreName], [TaxDetails], [Gst], [Signature], [CreatedDate]) VALUES (4, N'CNB', N'M.P.', N'963-852-147', NULL, CAST(N'2020-01-26T00:00:00.0000000+05:30' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Stores] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (1, 1, 1, 500, CAST(N'2020-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (8, 1, 1, 4997, CAST(N'2020-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (9, 1, 1, 4997, CAST(N'2020-02-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (11, 2, 1, 4997, CAST(N'2020-02-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (12, 2, 1, 4997, CAST(N'2020-02-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (13, 2, 1, 4997, CAST(N'2020-03-13T10:35:27.363' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (14, 3, 1, 1199, CAST(N'2020-03-13T14:08:06.650' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (15, 3, 1, 1199, CAST(N'2020-03-13T19:39:48.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (16, 3, 1, 1199, CAST(N'2020-03-16T18:55:39.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionId], [AppUserId], [SellerDetailId], [Amount], [TransactionDate]) VALUES (17, 3, 1, 1199, CAST(N'2020-03-17T11:22:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
SET IDENTITY_INSERT [dbo].[UserAddresses] ON 

INSERT [dbo].[UserAddresses] ([UserAddressId], [HouseNumber], [Area], [Landmark], [City], [State], [AddressType], [AppUserId]) VALUES (5, NULL, N'Vaishnodevi', N'Malabar hills', N'Ahmedabad', N'Gujarat', N'Home', 1)
INSERT [dbo].[UserAddresses] ([UserAddressId], [HouseNumber], [Area], [Landmark], [City], [State], [AddressType], [AppUserId]) VALUES (8, NULL, N'98', N'Malabar Hills', N'Ahmedabad', N'Gujarat', N'Home', 1)
SET IDENTITY_INSERT [dbo].[UserAddresses] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (2, 5, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [ApplicationLocaleId], [ApplicationTimeZoneId], [LanguageCode], [UserName], [Password], [Salt], [LoginBlocked], [StatusId]) VALUES (5, 144, 362, N'en', N'admin', 0x01A508148A63F344F3A52C5B9F065CB3166788F713EF1C6831D4218937C259740CB2ABF9F20D2CC0FCEC4769496A0B35103CA91DEE84C61F2E0F01D7110D01702D35019B0F7CECD7DDB282C6EEE3C75049D069775903D9CBC044527F1C648BBAF3D96B24070CAD7F6BC79AD739C101CF2DD2D54EEAE7198B44D53985C1787D320F6A1A22, 0x4543533542000000019E5F0EFB0E97B45F0DCCAE88F38A88D1E9707F7B54479D351D2A402D27911955859B99DD02A70689A550B6341958A06C4A1E74D9FFF78B01791EB99EE0AB0603440118EBDAA1BC51919C6B4BA455EF9448BCAF1CB0A92674E612EDB51B99DA2C99F31B6348350E38740E64D71C6AEE5ECA20D025FB7E387895BB0EC104C4ACD8F1296E, 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__NoAcc__114A936A]  DEFAULT ((0)) FOR [CanView]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__Reado__123EB7A3]  DEFAULT ((0)) FOR [CanAdd]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF_RolePermissions_AllowView]  DEFAULT ((0)) FOR [CanEdit]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__FullA__1332DBDC]  DEFAULT ((0)) FOR [CanDelete]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LoginBlocked]  DEFAULT ((0)) FOR [LoginBlocked]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_Roles]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_ApplicationObjects]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_Offers] FOREIGN KEY([OfferId])
REFERENCES [dbo].[Offers] ([OfferId])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_Offers]
GO
ALTER TABLE [dbo].[ApplicationLocales]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationLocales_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ApplicationLocales] CHECK CONSTRAINT [FK_ApplicationLocales_ApplicationObjects]
GO
ALTER TABLE [dbo].[ApplicationModules]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationModules_ModuleMasters] FOREIGN KEY([ModuleMasterId])
REFERENCES [dbo].[ModuleMasters] ([ModuleMasterId])
GO
ALTER TABLE [dbo].[ApplicationModules] CHECK CONSTRAINT [FK_ApplicationModules_ModuleMasters]
GO
ALTER TABLE [dbo].[ApplicationObjects]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[ApplicationObjects] CHECK CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes]
GO
ALTER TABLE [dbo].[ApplicationTimeZones]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationTimeZones_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ApplicationTimeZones] CHECK CONSTRAINT [FK_ApplicationTimeZones_ApplicationObjects]
GO
ALTER TABLE [dbo].[ApplicationUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserTokens_AppUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[ApplicationUserTokens] CHECK CONSTRAINT [FK_ApplicationUserTokens_AppUsers]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_Roles]
GO
ALTER TABLE [dbo].[BankDetails]  WITH CHECK ADD  CONSTRAINT [FK_BankDetails_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[BankDetails] CHECK CONSTRAINT [FK_BankDetails_AppUsers]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_AppUsers]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_AppUsers]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
ALTER TABLE [dbo].[ComponentLanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_ComponentLanguageContents_LanguageContentKeys] FOREIGN KEY([ComponentKeyId])
REFERENCES [dbo].[LanguageContentKeys] ([LanguageContentKeyId])
GO
ALTER TABLE [dbo].[ComponentLanguageContents] CHECK CONSTRAINT [FK_ComponentLanguageContents_LanguageContentKeys]
GO
ALTER TABLE [dbo].[ComponentLanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_ComponentLanguageContents_LanguageContents] FOREIGN KEY([LanguageContentId])
REFERENCES [dbo].[LanguageContents] ([LanguageContentId])
GO
ALTER TABLE [dbo].[ComponentLanguageContents] CHECK CONSTRAINT [FK_ComponentLanguageContents_LanguageContents]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_ProductCategories]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Sellers]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_AppUsers]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Payments] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Payments]
GO
ALTER TABLE [dbo].[LanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_LanguageContents_LanguageContentKeys] FOREIGN KEY([LanguageContentKeyId])
REFERENCES [dbo].[LanguageContentKeys] ([LanguageContentKeyId])
GO
ALTER TABLE [dbo].[LanguageContents] CHECK CONSTRAINT [FK_LanguageContents_LanguageContentKeys]
GO
ALTER TABLE [dbo].[ModuleMasters]  WITH CHECK ADD  CONSTRAINT [FK_ModuleMasters_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ModuleMasters] CHECK CONSTRAINT [FK_ModuleMasters_ApplicationObjects]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_MusicSubCategories] FOREIGN KEY([MusicSubCategoryId])
REFERENCES [dbo].[MusicSubCategories] ([MusicSubCategoryId])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_MusicSubCategories]
GO
ALTER TABLE [dbo].[MusicSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_MusicSubCategories_MusicSubCategories] FOREIGN KEY([MusicSubCategoryId])
REFERENCES [dbo].[MusicSubCategories] ([MusicSubCategoryId])
GO
ALTER TABLE [dbo].[MusicSubCategories] CHECK CONSTRAINT [FK_MusicSubCategories_MusicSubCategories]
GO
ALTER TABLE [dbo].[MusicSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_MusicSubCategories_PrimeMusics] FOREIGN KEY([PrimeMusicId])
REFERENCES [dbo].[PrimeMusics] ([PrimeMusicId])
GO
ALTER TABLE [dbo].[MusicSubCategories] CHECK CONSTRAINT [FK_MusicSubCategories_PrimeMusics]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Discounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([DiscountId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Discounts]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_ShippingFeeDetails] FOREIGN KEY([ShippingFeeDetailId])
REFERENCES [dbo].[ShippingFeeDetails] ([ShippingFeeDetailId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_ShippingFeeDetails]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([TransactionId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Transactions]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_AppUsers]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PromoCodes] FOREIGN KEY([PromoCodeId])
REFERENCES [dbo].[PromoCodes] ([PromoCodeId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PromoCodes]
GO
ALTER TABLE [dbo].[PrimeMusics]  WITH CHECK ADD  CONSTRAINT [FK_PrimeMusics_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[PrimeMusics] CHECK CONSTRAINT [FK_PrimeMusics_AppUsers]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_ProductMainCategories] FOREIGN KEY([ProductMainCategoryId])
REFERENCES [dbo].[ProductMainCategories] ([ProductMainCategoryId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_ProductMainCategories]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Stores]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductSubCategories] FOREIGN KEY([ProductSubCategoryId])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductSubCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sellers]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategories_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategories_ProductCategories]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_ApplicationModules] FOREIGN KEY([ApplicationModuleId])
REFERENCES [dbo].[ApplicationModules] ([ApplicationModuleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_ApplicationModules]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_ApplicationObjects]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_ApplicationObjects1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_ApplicationObjects1]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_AppUsers] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_AppUsers]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_BankDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[BankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_BankDetails]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Brands]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([ColorId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Colors]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Languages]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Materials]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_ProductMainCategories] FOREIGN KEY([ProductMainCategoryId])
REFERENCES [dbo].[ProductMainCategories] ([ProductMainCategoryId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_ProductMainCategories]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Roles]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_SellerDetails] FOREIGN KEY([SellerDetailId])
REFERENCES [dbo].[SellerDetails] ([SellerDetailId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_SellerDetails]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Sizes] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([SizeId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Sizes]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_Sellers]
GO
ALTER TABLE [dbo].[ShippingFeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingFeeDetails_ApplicationObjects] FOREIGN KEY([ApplicationObjectId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ShippingFeeDetails] CHECK CONSTRAINT [FK_ShippingFeeDetails_ApplicationObjects]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_AppUsers]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_SellerDetails] FOREIGN KEY([SellerDetailId])
REFERENCES [dbo].[SellerDetails] ([SellerDetailId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_SellerDetails]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_AppUsers]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_ApplicationObjects]
GO
/****** Object:  StoredProcedure [dbo].[spBuyNowTransactions]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuyNowTransactions]
	-- Add the parameters for the stored procedure here
	@AppUserId int,
	@SellerDetailId int,
	@Amount int,
	@TransactionDate datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update BankDetails SET  Balance  = Balance-@amount  Where   AppUserId = @AppUserId  ;
	insert into Transactions(AppUserId,SellerDetailId,Amount,TransactionDate) values (@AppUserId,@SellerDetailId,@amount,@TransactionDate);
	update BankDetails SET Balance = Balance+@amount where AppUserId = @SellerDetailId;
END
GO
/****** Object:  StoredProcedure [dbo].[spCanDeleteRecord]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spCanDeleteRecord](@TableName nvarchar(50), @RecordId int)
AS
BEGIN
			--DECLARE @RecordId INT=1
			--DECLARE @TableName nvarchar(50)='ApplicationModules'

			DECLARE @FkName nvarchar(250)
			DECLARE @ParentTable nvarchar(100)
			DECLARE @KeyName nvarchar(100)
			DECLARE @ReferenceTable nvarchar(100)
			DECLARE @TableSchema nvarchar(100)

			DECLARE @DynSql nvarchar(max)
			DECLARE @ReturnValue bit = 0
			CREATE TABLE #myTable(Cnt int)

			DECLARE RefCursor Cursor FOR
							SELECT
								    fk.name 'FkName',
								    tp.name 'ParentTable',
								    cp.name 'KeyName', 
									tr.name 'RefrenceTable',
									info.TABLE_SCHEMA 'TableSchema'
							FROM 
									sys.foreign_keys fk
									INNER JOIN 
									    sys.tables tp ON fk.parent_object_id = tp.object_id
									INNER JOIN 
										sys.tables tr ON fk.referenced_object_id = tr.object_id
									INNER JOIN 
										sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
									INNER JOIN 
										sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
									INNER JOIN 
										sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
						             INNER JOIN 
									    INFORMATION_SCHEMA.COLUMNS info ON tp.[name] =info.TABLE_NAME
							WHERE 
									tr.name=@TableName
									and tp.name!='Addresses' --To be removed once actual implementation done with Archi. 14-07-2017

			OPEN RefCursor
			FETCH NEXT FROM RefCursor INTO @FkName, @ParentTable, @KeyName, @ReferenceTable,@TableSchema
			WHILE @@FETCH_STATUS=0
			BEGIN
					--SELECT 	@FkName, @ParentTable, @KeyName, @ReferenceTable
					SET @DynSql	='	SELECT COUNT(*) Cnt FROM ' +@TableSchema+'.' + @ParentTable + '  WHERE ' + @KeyName + ' = ' + Cast(@RecordId as nvarchar(5))

					INSERT INTO #myTable(Cnt)
					EXEC (@DynSQL)  

					IF EXISTS(Select CNT from #myTable WHERE CNT>0)
					BEGIN
							SET @ReturnValue =1
							BREAK;
					END
					SET @DynSql=''		
					FETCH NEXT FROM RefCursor INTO @FkName, @ParentTable, @KeyName, @ReferenceTable,@TableSchema
			END
			CLOSE RefCursor
			Deallocate RefCursor
			DROP TABLE #myTable
			SELECT 1 as Id,  @ReturnValue as Result

END
GO
/****** Object:  StoredProcedure [dbo].[spCartitems]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCartitems] 
	-- Add the parameters for the stored procedure here
	@ProductId int,
	@AppUserId int,
	@ProductQuantity int,
	@TotalPrice int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @ProductPrice int,@CartValue int,	@CartQuantity int;

    -- Insert statements for procedure here
	set @ProductPrice = (select DiscountProductPrice from Sellers where SellerId =(select SellerId from Products where ProductId = @ProductId));

	if not exists(select AppUserId,ProductId from CartItems where AppUserId=@AppUserId and ProductId=@ProductId)
	begin 
	set @TotalPrice =(@ProductPrice*@ProductQuantity);
	insert into CartItems (ProductId,ProductQuantity,AppUserId,TotalPrice)values(@ProductId,@ProductQuantity,@AppUserId,@TotalPrice);
	END
	else
	update CartItems set ProductQuantity=(ProductQuantity+@ProductQuantity) where @AppUserId=AppUserId and @ProductId=ProductId;
	update CartItems set TotalPrice=(@ProductPrice*ProductQuantity) where @AppUserId=AppUserId and @ProductId=ProductId;

	set @CartValue = (select SUM(TotalPrice) from CartItems where AppUserId=@AppUserId)  ;
	set @CartQuantity = (Select COUNT(CartItemId) from CartItems where AppUserId=@AppUserId)  ;
	update CartItems set CartValue= @CartValue where AppUserId=@AppUserId;
	update CartItems set CartQuantity = @CartQuantity where AppUserId=@AppUserId;
END
GO
/****** Object:  StoredProcedure [dbo].[spCartRemove]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCartRemove] 
	-- Add the parameters for the stored procedure here
		@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from CartItems where ProductId=@ProductId
	update CartItems set CartValue=(select SUM(TotalPrice) from CartItems where AppUserId=3);
	update CartItems set CartQuantity = (Select COUNT(CartItemId) from CartItems where AppUserId=3);
END
GO
/****** Object:  StoredProcedure [dbo].[spCarts]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCarts]	
	@ProductId int,
	@CartItemId int,
	@AppUserId int
	
	
	
AS

	
BEGIN
	declare @ProductPrice int,@CartValue int,	@CartQuantity int;
	SET NOCOUNT ON;
	set @ProductPrice = (select DiscountProductPrice from Sellers where SellerId =(select SellerId from Products where ProductId = @ProductId));
    -- Insert statements for procedure here
	UPDATE CartItems set TotalPrice = @ProductPrice*ProductQuantity where CartItemId = @CartItemId;
	set @CartValue = (select SUM(TotalPrice) from CartItems where AppUserId=@AppUserId)  ;
	set @CartQuantity = (Select COUNT(CartItemId) from CartItems where AppUserId=@AppUserId)  ;
	update CartItems set CartValue= @CartValue;
	update CartItems set CartQuantity = @CartQuantity;
	
END
GO
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChangePassword]
	-- Add the parameters for the stored procedure here
	@UserId int,
	@NewPassword binary(132)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update AppUsers SET Password=@NewPassword where (AppUserId=@UserId);
	
END
GO
/****** Object:  StoredProcedure [dbo].[spDiscounts]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDiscounts]
	-- Add the parameters for the stored procedure here
	
	@Discountprice int,
	@ProductId int
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--set @ProductId = (select ProductId from Products where SellerId = @SellerId) ;
    -- Insert statements for procedure here
	update Sellers SET DiscountProductPrice=OriginalProductPrice-@Discountprice where SellerId = (select SellerId from Products where ProductId =  @ProductId);
	--ProductId= (select ProductId from Products where SellerId =(select SellerId from Sellers where SellerId = @SellerId)) @Category;
END
GO
/****** Object:  StoredProcedure [dbo].[spFilterBrands]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFilterBrands]
	-- Add the parameters for the stored procedure here
	@Puma varchar(20),
	@TommyHilfiger varchar(20),
	@Forever21 varchar(20),
	@BeingHuman varchar(20),
	@AllenSolley varchar(20)
	



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (Select * from vBrands where BrandName=@Puma or BrandName=@TommyHilfiger or BrandName=@Forever21 or BrandName=@BeingHuman or BrandName=@AllenSolley for json path) as result
END
GO
/****** Object:  StoredProcedure [dbo].[spFilterColors]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFilterColors]
	-- Add the parameters for the stored procedure here
	@Red varchar(20),
	@Black varchar(20),
	@Blue varchar(20)
	



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (Select * from vColors where ColorName=@Red or ColorName=@Black or ColorName=@Blue  for json path) as result
END
GO
/****** Object:  StoredProcedure [dbo].[spFilterLanguages]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFilterLanguages]
	-- Add the parameters for the stored procedure here
	@English varchar(20),
	@Hindi varchar(20),
	@French varchar(20),
	@Marathi varchar(20),
	@Gujarati varchar(20)
	



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (Select * from vLanguages where LanguageName=@English or LanguageName=@Hindi or LanguageName=@French or LanguageName=@Marathi or LanguageName=@Gujarati  for json path) as result
END
GO
/****** Object:  StoredProcedure [dbo].[spFilterMaterials]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFilterMaterials]
	-- Add the parameters for the stored procedure here
	@Cotton varchar(20),
	@Wool varchar(20),
	@Rayon varchar(20)
	



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (Select * from vMaterials where MaterialType=@Cotton or MaterialType=@Wool or MaterialType=@Rayon  for json path) as result
END
GO
/****** Object:  StoredProcedure [dbo].[spFilterSizes]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFilterSizes]
	-- Add the parameters for the stored procedure here
	@S varchar(20),
	@M varchar(20),
	@L varchar(20)



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (Select * from vSizes where SizeType=@S or SizeType=@M or SizeType=@L  for json path) as result
END
GO
/****** Object:  StoredProcedure [dbo].[spPromoCodes]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spPromoCodes]
-- Add the parameters for the stored procedure here
	@PromoCodeName varchar(50),
	 --@Amount int,
	@AppUserId int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Amount int
    -- Insert statements for procedure here
	set @Amount=(select Amount from PromoCodes where PromoCodeName=@PromoCodeName);
	UPDATE CartItems set CartValue = CartValue-@Amount where AppUserId = @AppUserId;
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchProducts]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchProducts]
	-- Add the parameters for the stored procedure here
	@Product varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select(SELECT * from vProducts where (ProductName like @Product + '%' )for json path) as result
END
GO
/****** Object:  StoredProcedure [dbo].[spSellers]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSellers]
	-- Add the parameters for the stored procedure here
	@appuserid int,
	@companyName varchar(50),
	@address varchar(50),
	@panNumber varchar(10),
	@area varchar(50),
	@landmark varchar(50),
	@city varchar(50),
	@state varchar(50),
	@addressType varchar(50),
	@accountHolder varchar(50),
	@accountType varchar(50),
	@accountNumber varchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SellerDetails(CompanyName,Address,PanNumber,AppUserId)values(@companyName,@address,@panNumber,@appuserid);
	insert into UserAddresses(Area,Landmark,City,State,AddressType,AppUserId)values(@area,@landmark,@city,@state,@addressType,@appuserid);
	insert into BankDetails(AccountHolderName,AccountType,AccountNumber,AppUserId)values(@accountHolder,@accountType,@accountNumber,@appuserid);
END
GO
/****** Object:  StoredProcedure [dbo].[spTransactions]    Script Date: 18-03-2020 16:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransactions]
	-- Add the parameters for the stored procedure here
	@AppUserId int,
	@SellerDetailId int,
	@TransactionDate datetime
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @amount int

	set @amount = (select top 1 CartValue from CartItems where AppUserId=@AppUserId);

    -- Insert statements for procedure here
	BEGIN 

	update BankDetails SET  Balance  = Balance-@amount  Where   AppUserId = @AppUserId  ;
	insert into Transactions(AppUserId,SellerDetailId,Amount,TransactionDate) values (@AppUserId,@SellerDetailId,@amount,@TransactionDate);
	update BankDetails SET Balance = Balance+@amount where AppUserId = @SellerDetailId;
	
	
	
	END 


Return
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent Application Module' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationModules', @level2type=N'COLUMN',@level2name=N'ParentApplicationModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Main Primary Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationObjects', @level2type=N'COLUMN',@level2name=N'ApplicationObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application Objects is used Application wide' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationObjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thid field is the reference of LanguageContentKeys table, This stores only those ids of the respective IsComponent column value is true.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ComponentLanguageContents', @level2type=N'COLUMN',@level2name=N'ComponentKeyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'only respective values are allowed  like for placeholder ''p'', label ''l'',gridHeader ''gh''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LanguageContents', @level2type=N'COLUMN',@level2name=N'ContentType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Advertisements"
            Begin Extent = 
               Top = 210
               Left = 59
               Bottom = 340
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Offers"
            Begin Extent = 
               Top = 115
               Left = 327
               Bottom = 245
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discounts"
            Begin Extent = 
               Top = 28
               Left = 580
               Bottom = 156
               Right = 750
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdvertisements'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdvertisements'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[37] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -23
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 66
               Left = 554
               Bottom = 179
               Right = 763
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 15
               Left = 809
               Bottom = 326
               Right = 1003
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CartItems"
            Begin Extent = 
               Top = 91
               Left = 280
               Bottom = 320
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -117
      End
      Begin Tables = 
         Begin Table = "Payments"
            Begin Extent = 
               Top = 6
               Left = 877
               Bottom = 136
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Invoices"
            Begin Extent = 
               Top = 6
               Left = 669
               Bottom = 128
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 1110
               Bottom = 136
               Right = 1280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AppUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CartItems"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 175
               Left = 552
               Bottom = 305
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SellerDetails"
            Begin Extent = 
               Top = 169
               Left = 98
               Bottom = 299
               Right = 292
            End
            DisplayF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Musics"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MusicSubCategories"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 136
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MusicCategories"
            Begin Extent = 
               Top = 6
               Left = 512
               Bottom = 102
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMusics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMusics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProductCategories"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 262
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProductCategoryLookups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProductCategoryLookups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AppUsers"
            Begin Extent = 
               Top = 6
               Left = 527
               Bottom = 136
               Right = 697
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProducts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProducts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "PromoCodes"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPromoCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPromoCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "appuser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "locale"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 136
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "timezone"
            Begin Extent = 
               Top = 6
               Left = 521
               Bottom = 136
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
USE [master]
GO
ALTER DATABASE [RadixDb] SET  READ_WRITE 
GO
