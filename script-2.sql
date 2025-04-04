USE [master]
GO
/****** Object:  Database [Product]    Script Date: 18.03.2025 22:32:55 ******/
CREATE DATABASE [Product]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Product', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Product.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Product_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Product_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Product] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Product].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Product] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Product] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Product] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Product] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Product] SET ARITHABORT OFF 
GO
ALTER DATABASE [Product] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Product] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Product] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Product] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Product] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Product] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Product] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Product] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Product] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Product] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Product] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Product] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Product] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Product] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Product] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Product] SET RECOVERY FULL 
GO
ALTER DATABASE [Product] SET  MULTI_USER 
GO
ALTER DATABASE [Product] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Product] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Product] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Product] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Product] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Product] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Product', N'ON'
GO
ALTER DATABASE [Product] SET QUERY_STORE = ON
GO
ALTER DATABASE [Product] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Product]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [float] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 18.03.2025 22:32:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (1, N'вул. Центральна', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'вул. Горизонтальна', 2)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'вул. Вертикальна', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'вул. Перпендикулярна', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'вул. Прямокутна', 5)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Молочна продукція')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'М''ясна продукція')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Крупи')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Кондитерські вироби')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Напої')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Київ', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Харків', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Полтава', 3)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Одеса', 4)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Львів', 5)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Україна')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 1, 65, 1, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 1, 55, 2, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 3, 1, 60, 4, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 4, 2, 110, 4, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 5, 2, 38, 2, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (6, 6, 3, 29, 2, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (7, 7, 3, 20, 3, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (8, 8, 4, 25, 1, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (9, 9, 4, 15, 5, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (10, 10, 5, 100, 3, CAST(N'2025-03-20' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Markup] ON 

INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (1, N'ПДВ', 20)
SET IDENTITY_INSERT [dbo].[Markup] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (1, N'кг', N'вага')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (2, N'шт', N'кількість')
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (1, N'Весела корівка', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (2, N'М''ясний барон', 4)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (3, N'Хобі Попелюшки', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (4, N'Солодкий світ', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (5, N'Наш сік', 1)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (1, N'Кефір', 1, 60, 15, 1, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (2, N'Молоко', 1, 50, 20, 1, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (3, N'Ряженка', 1, 55, 25, 1, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (4, N'Ковбаска', 2, 105, 11, 2, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (5, N'Сосиски', 2, 110.5, 5, 2, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (6, N'Гречка', 3, 35.5, 10, 3, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (7, N'Рис', 3, 25.5, 15, 3, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (8, N'Пончик', 4, 15, 8, 4, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (9, N'Бублик', 4, 10, 12, 4, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (10, N'Сік', 5, 95, 33, 5, 2, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Київська обл.', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Харківська обл.', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Полтавська обл.', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Одеська обл.', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Львівська обл.', 1)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 1, 55, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 2, 45, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 3, 50, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 4, 100, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 5, 105, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (6, 6, 30, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (7, 7, 20, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (8, 8, 10, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (9, 9, 8, 5, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (10, 10, 90, 5, CAST(N'2025-03-25' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (1, N'Молочні традиції', 1)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (2, N'Шашлична  у Ашота', 2)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'Колобок', 3)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (4, N'Не злипнеться', 4)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (5, N'Налий і відійди', 5)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Product] SET  READ_WRITE 
GO
