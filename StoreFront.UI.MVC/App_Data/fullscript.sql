/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [PickleBall_Store]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductCategories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductStatus]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductCategories]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/8/2022 1:52:21 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[DirectReportID] [int] NULL,
	[Title] [varchar](50) NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategory] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDesc] [varchar](200) NULL,
	[ProductStatusID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductImage] [varchar](100) NULL,
	[ProductPrice] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStatus](
	[ProductStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ProductStatusName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[ProductStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 4/8/2022 1:52:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
	[FavoritePlayer] [varchar](100) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c4b80dab-94b5-4a70-a40c-8adfbb8c25e0', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'29f83868-9858-4512-be5e-a3293c896795', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'06941b90-56bc-4ab8-8e27-7fc5ddf54158', N'29f83868-9858-4512-be5e-a3293c896795')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3227aab4-5bfd-47b1-896e-da6400a81e86', N'29f83868-9858-4512-be5e-a3293c896795')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'96d53cb0-639d-449b-b9ed-54e4a9b633e8', N'29f83868-9858-4512-be5e-a3293c896795')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e8b9fd99-8e80-45c3-824f-aa7fe6a9273f', N'29f83868-9858-4512-be5e-a3293c896795')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8e871cd3-08d8-476d-98fb-8b6aa4d8efcc', N'c4b80dab-94b5-4a70-a40c-8adfbb8c25e0')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'06941b90-56bc-4ab8-8e27-7fc5ddf54158', N'person@example.com', 0, N'AJmteUAk3AzPMW1hUwXhHsXn6oxc2Oac6xT/TyZJ7e7zUqTonB+ZzjR5zR+gdmCYMw==', N'66689914-a1e0-4bb9-a84d-b3f1c7c3a735', NULL, 0, 0, NULL, 1, 0, N'person@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3227aab4-5bfd-47b1-896e-da6400a81e86', N'bittyb@email.com', 0, N'AO57MWvznU3vlWGzi8oEDQPyZ1enCj7hFyALDQw0xeTyssIfkg8yF2qMO47gs+o68w==', N'4a53b9e5-1042-44e1-8049-8840fd17be9a', NULL, 0, 0, NULL, 1, 0, N'bittyb@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8e871cd3-08d8-476d-98fb-8b6aa4d8efcc', N'seanamckinney8@outlook.com', 0, N'AMo/c8GftBbNZY6Ux24oBVUYa20RzgCY9gY8GAqwXj8cfoTzyH1pGcVd6sDskoX6Zg==', N'544d55d0-0551-414e-a1c0-88a2ca3868c1', NULL, 0, 0, NULL, 1, 0, N'seanamckinney8@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'96d53cb0-639d-449b-b9ed-54e4a9b633e8', N'test@example.com', 0, N'AOgt62eva0U+rfqADJB67Omhae+KnDee98D962ReGlxGov7JVoM9z8k3byOHkiuvKA==', N'64837451-478a-497e-80aa-cc2fa82e1004', NULL, 0, 0, NULL, 1, 0, N'test@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e8b9fd99-8e80-45c3-824f-aa7fe6a9273f', N'fake@email.com', 0, N'ALDOsBkyecKjCkMfdfB+I6zDy8OAkmG5wJjOmlRixW1HlKFgGCY3GIrL+8RuNGr2Fw==', N'153e3d4a-73ad-4e20-9652-e9a69745ffaf', NULL, 0, 0, NULL, 1, 0, N'fake@email.com')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Sales')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Shipping')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'I.T.')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Customer Service')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (5, N'Human Resources')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (6, N'Executive')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (2, N'Sean', N'McKinney', NULL, N'President/CEO', 6)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (3, N'Betty', N'Smith', 2, N'VicePresident_Sales', 6)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (4, N'Jen', N'Fuller', 2, N'CFO', 6)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (5, N'Sam', N'Dunn', 3, N'SalesMGR', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (6, N'Danny', N'Brown', 2, N'BackEndMGR', 6)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (8, N'Ren', N'Koichi', 6, N'ShippingMGR', 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (9, N'Jimmy', N'Valentine', 5, N'CustomerServiceMGR', 4)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (10, N'Derick', N'West', 2, N'HumanResourceMGR', 5)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (11, N'Anne', N'Renolds', 8, N'ShippingClerk', 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (12, N'Adam', N'Wild', 8, N'WarehouseClerk', 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (13, N'Wilma', N'Van Ryan', 2, N'I.T.MGR', 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (14, N'Mark', N'King', 13, N'WebSecurity', 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (15, N'Ned', N'Ryerson', 13, N'SystemsAdmin', 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (16, N'Alice', N'Wright', 13, N'FrontEndDev', 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (17, N'Ben', N'Star', 13, N'Data/Dev1', 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (18, N'Jesus', N'Vasques', 9, N'CustomerServiceRep', 4)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (19, N'Shaundra', N'Cummings', 9, N'CustomerServiceRep', 4)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (20, N'Niel', N'Fricks', 10, N'Standards/Practices''sRep', 5)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DirectReportID], [Title], [DepartmentID]) VALUES (2004, N'Bitty', N'B', 2, N'President of Mascots', 6)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (1, N'Paddles')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (2, N'Balls')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (3, N'Shoes')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (1, N'Onix Composite Z5 Widebody Paddle', N'Good power paddle. Weight: 8.4-8.7 oz', 1, 1, N'3e39de46-b379-4f6e-86fb-19c42e31c408.jpg', 99.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (5, N'Pro-Lite Illuminate 2.0 Paddle', N'Heavy, control paddle. Weight: 7.6-8.0 oz', 1, 1, N'576cd0d1-1379-4937-a766-9c718c903115.jpg', 89.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (6, N'Head Gravity Graphite Paddle', N'Sweet spot power core. Weight: 8.1 oz', 1, 1, N'93c2176a-35e7-49d6-a350-f058b3e70c16.jpg', 139.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (7, N'Wilson Echo Energy Paddle', N'Extended handle. Weight: 7.7-8.1 oz', 1, 1, N'8f46f4b2-0ed6-4b59-9a07-07b121488191.jpg', 84.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (8, N'Wilson Juice Paddle', N'Power/Spin Surface. Weight: 7.6-8.0 oz', 2, 1, N'6418617b-0bd9-4d5a-9e77-e39de3a71e0f.jpeg', 89.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (9, N'Onix Voyager Graphite Paddle', N'Incredible touch. Weight: 7.8 oz', 3, 1, N'eff8fd14-b8da-44c7-80c4-30486e2331f2.jpg', 114.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (10, N'Diadora Contact Paddle', N'Power shot paddle. Weight: 8.0 oz', 1, 1, N'e97a2043-1529-4868-b1ac-5211c0af1a68.jpg', 105.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (11, N'Selkirk AMPED Invikta MW Electrify Paddle', N'Power/Control/Spin. Weight: 8.1 oz', 1, 1, N'26f8df10-44ea-4d54-a5b3-556f0dbd470a.jpg', 112.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (13, N'ProKennex Pro Flight Paddle', N'Higher seeet spot. Weight: 7.3-7.6 oz', 1, 1, N'25a1f76c-d52b-49f5-9b8d-05c7770429ff.jpg', 101.4900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (15, N'Head Extreme Tour Max', N'Touch and control. Weight: 8.1 oz', 1, 1, N'6f43172d-dd86-451b-aa4c-539e04dfb383.jpg', 114.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (16, N'Franklin Sports X-40 Outdoor Pickleballs 6pk', N'Outdoor 40 hole optic pickleball', 1, 2, N'27c43818-7d4b-4169-b436-42a6a738dba8.jpg', 9.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (37, N'Franklin X-26 Indoor Pickleballs 3pk', N'Indoor 26 hole blue pickleball', 1, 2, N'bc25f087-845b-4df5-9590-4dec0383e967.png', 9.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (38, N'Recruit by ONIX Pickleball Pure Outdoor Balls 3pk', N'40 hole outdoor pickleball', 1, 2, N'b6899bb7-6eac-4a91-8238-cf5117e2f948.jpeg', 9.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (39, N'GAMMA Photon Indoor Pickleballs 3pk', N'26 hole indoor pickleball', 3, 2, N'f2edd424-b87a-4a84-af53-fc23ab141f36.jpeg', 9.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (41, N'GAMMA Photon Outdoor Pickleballs 3pk', N'40 hole outdoor pickleball', 2, 2, N'ecf20625-ba63-4815-b9a2-9e163a5dfff6.jpeg', 8.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (42, N'Penn 40 Outdoor Picklball 3pk', N'40 hole outdoor pickleball', 1, 2, N'6a795de7-ce84-411a-b37d-92f32bd47a20.jpg', 10.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (43, N'Dura Fast 40 Pickleball 4pk', N'40 hole outdoor pickleball', 1, 2, N'4f479f18-0fba-420b-99e5-2fb0c2b18347.jpg', 13.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (44, N'HEAD Sprint Pro 3.5 Shoe - Men''s', N'Lightweigth Court Shoe', 1, 3, N'8c0cbf90-052c-4ece-a5af-a3034fe11619.jpg', 104.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (45, N'Head Revolt Pro 4.0 Shoe - Men''s', N'Fitted feel / stable injury reducer', 1, 3, N'36f486fe-ee70-4425-b9fd-5083cced017a.jpg', 119.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (46, N'Babolat Jet March 3 All Court Shoe - Men''s ', N'Average weight / midsole support', 1, 3, N'c1377973-52e4-4a08-b84d-644a8f17d072.jpg', 119.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (47, N'K-Swiss Express Light Pickleball Shoe - Women''s', N'All round court shoe', 1, 3, N'53cbcec3-0441-438b-a6fe-909424934f60.jpg', 104.9900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (48, N'Fila Volley Zone Shoe - Women''s', N'Responsive and durable', 1, 3, N'fb621646-5160-4e78-ba45-93a98de2369b.jpg', 105.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDesc], [ProductStatusID], [ProductCategoryID], [ProductImage], [ProductPrice]) VALUES (49, N'Tyrol Drive-V Shoe - Women''s', N'Wide toe / durable / stable', 2, 3, N'343eeff0-0b9d-4382-a265-8bae57a00461.jpg', 113.9900)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([ProductStatusID], [ProductStatusName]) VALUES (1, N'InStock')
INSERT [dbo].[ProductStatus] ([ProductStatusID], [ProductStatusName]) VALUES (2, N'OutofStock')
INSERT [dbo].[ProductStatus] ([ProductStatusID], [ProductStatusName]) VALUES (3, N'BackOrdered')
INSERT [dbo].[ProductStatus] ([ProductStatusID], [ProductStatusName]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoritePlayer]) VALUES (N'e8b9fd99-8e80-45c3-824f-aa7fe6a9273f', N'Ben', N'Ben Benny', N'Collin Johns')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees1] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductStatus] FOREIGN KEY([ProductStatusID])
REFERENCES [dbo].[ProductStatus] ([ProductStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
