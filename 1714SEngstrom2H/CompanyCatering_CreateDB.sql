USE [master]
GO
/****** Object:  Database [CompanyCatering]    Script Date: 11/8/2020 6:03:38 PM ******/
CREATE DATABASE [CompanyCatering]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyCatering', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CompanyCatering.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CompanyCatering_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CompanyCatering_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CompanyCatering] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyCatering].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyCatering] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyCatering] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyCatering] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyCatering] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyCatering] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyCatering] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyCatering] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [CompanyCatering] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyCatering] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyCatering] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyCatering] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyCatering] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyCatering] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyCatering] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyCatering] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyCatering] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyCatering] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyCatering] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyCatering] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyCatering] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyCatering] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyCatering] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyCatering] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CompanyCatering] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyCatering] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyCatering] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyCatering] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyCatering] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CompanyCatering] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompanyCatering', N'ON'
GO
ALTER DATABASE [CompanyCatering] SET QUERY_STORE = OFF
GO
USE [CompanyCatering]
GO
/****** Object:  Table [dbo].[Caterers]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caterers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](35) NOT NULL,
	[Address] [nvarchar](35) NOT NULL,
	[City] [nvarchar](35) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[Zip] [int] NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](35) NOT NULL,
 CONSTRAINT [PK_Caterers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Caterer_Id] [int] NOT NULL,
	[Menu_Id] [int] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Person_Id] [int] NOT NULL,
	[Department_Id] [int] NOT NULL,
	[Employment_Id] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpStatus]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmpStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item] [nvarchar](25) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/8/2020 6:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Caterers] ON 
GO
INSERT [dbo].[Caterers] ([Id], [Name], [Address], [City], [State], [Zip], [Phone], [Email]) VALUES (1, N'UpStart Catering', N'1111 West First St', N'Waconia', N'MN', 55387, N'111-111-1111', N'upstartcatering@gmail.com')
GO
INSERT [dbo].[Caterers] ([Id], [Name], [Address], [City], [State], [Zip], [Phone], [Email]) VALUES (2, N'Creative Cusine', N'97 4th St', N'New Germany', N'MN', 55367, N'222-222-2222', N'creativecusune@email.com')
GO
INSERT [dbo].[Caterers] ([Id], [Name], [Address], [City], [State], [Zip], [Phone], [Email]) VALUES (3, N'RC Catering', N'577 Lake St', N'Mayer', N'MN', 55360, N'333-333-3333', N'rccatering@email.com')
GO
SET IDENTITY_INSERT [dbo].[Caterers] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 
GO
INSERT [dbo].[Contracts] ([Id], [Date], [Total], [Caterer_Id], [Menu_Id]) VALUES (1, CAST(N'2019-11-08T00:00:00.000' AS DateTime), CAST(3500 AS Decimal(18, 0)), 1, 1)
GO
INSERT [dbo].[Contracts] ([Id], [Date], [Total], [Caterer_Id], [Menu_Id]) VALUES (2, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(6500 AS Decimal(18, 0)), 2, 3)
GO
INSERT [dbo].[Contracts] ([Id], [Date], [Total], [Caterer_Id], [Menu_Id]) VALUES (3, CAST(N'2019-07-05T00:00:00.000' AS DateTime), CAST(10000 AS Decimal(18, 0)), 3, 2)
GO
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (1, N'Qc Hematology')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (2, N'BioTech Customer Service')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (3, N'Purchasing')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (4, N'Hematology Tech Service')
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [Person_Id], [Department_Id], [Employment_Id]) VALUES (1, 1, 2, 3)
GO
INSERT [dbo].[Employees] ([Id], [Person_Id], [Department_Id], [Employment_Id]) VALUES (2, 2, 3, 2)
GO
INSERT [dbo].[Employees] ([Id], [Person_Id], [Department_Id], [Employment_Id]) VALUES (3, 3, 1, 1)
GO
INSERT [dbo].[Employees] ([Id], [Person_Id], [Department_Id], [Employment_Id]) VALUES (4, 4, 1, 1)
GO
INSERT [dbo].[Employees] ([Id], [Person_Id], [Department_Id], [Employment_Id]) VALUES (5, 5, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EmpStatus] ON 
GO
INSERT [dbo].[EmpStatus] ([Id], [Description]) VALUES (1, N'Full Time')
GO
INSERT [dbo].[EmpStatus] ([Id], [Description]) VALUES (2, N'Part Time')
GO
INSERT [dbo].[EmpStatus] ([Id], [Description]) VALUES (3, N'Retired')
GO
SET IDENTITY_INSERT [dbo].[EmpStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([Id], [Item], [Price]) VALUES (1, N'BBQ Chicken', CAST(9 AS Decimal(18, 0)))
GO
INSERT [dbo].[Menus] ([Id], [Item], [Price]) VALUES (2, N'Chicken Cordon Blue', CAST(10 AS Decimal(18, 0)))
GO
INSERT [dbo].[Menus] ([Id], [Item], [Price]) VALUES (3, N'Mashed Potatoes', CAST(3 AS Decimal(18, 0)))
GO
INSERT [dbo].[Menus] ([Id], [Item], [Price]) VALUES (4, N'Steamed Vegatabels', CAST(3 AS Decimal(18, 0)))
GO
INSERT [dbo].[Menus] ([Id], [Item], [Price]) VALUES (5, N'Pot Roast', CAST(8 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (1, N'Bob', N'Smith')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (2, N'Karen', N'Lee')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (3, N'Stacey', N'Engstrom')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (4, N'Sarah', N'Paige')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (5, N'Amber', N'Frevel')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (6, N'Deb', N'Privett')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName]) VALUES (7, N'Ashleigh', N'Hakes')
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
/****** Object:  Index [IX_FK_CatererContract]    Script Date: 11/8/2020 6:03:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CatererContract] ON [dbo].[Contracts]
(
	[Caterer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_MenuContract]    Script Date: 11/8/2020 6:03:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_MenuContract] ON [dbo].[Contracts]
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DepartmentEmployee]    Script Date: 11/8/2020 6:03:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DepartmentEmployee] ON [dbo].[Employees]
(
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EmploymentEmployee]    Script Date: 11/8/2020 6:03:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_EmploymentEmployee] ON [dbo].[Employees]
(
	[Employment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonEmployee]    Script Date: 11/8/2020 6:03:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonEmployee] ON [dbo].[Employees]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_CatererContract] FOREIGN KEY([Caterer_Id])
REFERENCES [dbo].[Caterers] ([Id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_CatererContract]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_MenuContract] FOREIGN KEY([Menu_Id])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_MenuContract]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentEmployee] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_DepartmentEmployee]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentEmployee] FOREIGN KEY([Employment_Id])
REFERENCES [dbo].[EmpStatus] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_EmploymentEmployee]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployee] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_PersonEmployee]
GO
USE [master]
GO
ALTER DATABASE [CompanyCatering] SET  READ_WRITE 
GO
