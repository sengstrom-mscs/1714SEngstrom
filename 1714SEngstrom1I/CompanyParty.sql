USE [master]
GO
/****** Object:  Database [Company Party]    Script Date: 10/10/2020 5:18:11 PM ******/
CREATE DATABASE [Company Party]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company Party', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Company Party.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company Party_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Company Party_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Company Party] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company Party].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company Party] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Company Party] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Company Party] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Company Party] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Company Party] SET ARITHABORT OFF 
GO
ALTER DATABASE [Company Party] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Company Party] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company Party] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company Party] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company Party] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Company Party] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Company Party] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company Party] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Company Party] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company Party] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Company Party] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company Party] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company Party] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company Party] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company Party] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company Party] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company Party] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company Party] SET RECOVERY FULL 
GO
ALTER DATABASE [Company Party] SET  MULTI_USER 
GO
ALTER DATABASE [Company Party] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Company Party] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company Party] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company Party] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Company Party] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Company Party', N'ON'
GO
ALTER DATABASE [Company Party] SET QUERY_STORE = OFF
GO
USE [Company Party]
GO
/****** Object:  Table [dbo].[Caterer]    Script Date: 10/10/2020 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caterer](
	[CatererID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Caterer] PRIMARY KEY CLUSTERED 
(
	[CatererID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/10/2020 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartID] [int] NOT NULL,
	[DeptName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/10/2020 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[LName] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[DepartID] [int] NOT NULL,
	[EmpStatID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employment Status]    Script Date: 10/10/2020 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employment Status](
	[EmpStatID] [int] NOT NULL,
	[EmpStatDesc] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Employment Status] PRIMARY KEY CLUSTERED 
(
	[EmpStatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/10/2020 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] NOT NULL,
	[Item] [varchar](50) NOT NULL,
	[Cost] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Caterer] ([CatererID], [Name], [Address], [Phone], [Email]) VALUES (1, N'UpStart Catering', N'1111 West First St', N'111-111-1111', N'upstartcatering@gmail.com')
GO
INSERT [dbo].[Department] ([DepartID], [DeptName]) VALUES (101, N'QC Hematology')
INSERT [dbo].[Department] ([DepartID], [DeptName]) VALUES (102, N'BioTech Cust Serv')
INSERT [dbo].[Department] ([DepartID], [DeptName]) VALUES (103, N'Purchasing')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FName], [LName], [Phone], [DepartID], [EmpStatID]) VALUES (1, N'Bob', N'Smith', N'111-111-1111', 103, 101)
INSERT [dbo].[Employee] ([EmployeeID], [FName], [LName], [Phone], [DepartID], [EmpStatID]) VALUES (2, N'Karen', N'Lee', N'222-222-2222', 102, 102)
GO
INSERT [dbo].[Employment Status] ([EmpStatID], [EmpStatDesc]) VALUES (101, N'Full Time')
INSERT [dbo].[Employment Status] ([EmpStatID], [EmpStatDesc]) VALUES (102, N'Part Time')
INSERT [dbo].[Employment Status] ([EmpStatID], [EmpStatDesc]) VALUES (103, N'Retired')
GO
INSERT [dbo].[Menu] ([MenuID], [Item], [Cost]) VALUES (101, N'BBQ Chicken', 8.5000)
INSERT [dbo].[Menu] ([MenuID], [Item], [Cost]) VALUES (102, N'Chicken Cordon Blue', 9.0000)
GO
ALTER TABLE [dbo].[Employment Status] ADD  CONSTRAINT [DF_Employment Status_EmpStatID]  DEFAULT ((101)) FOR [EmpStatID]
GO
USE [master]
GO
ALTER DATABASE [Company Party] SET  READ_WRITE 
GO
