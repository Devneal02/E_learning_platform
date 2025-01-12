USE [master]
GO
/****** Object:  Database [E_Learning_Platform]    Script Date: 12/18/2024 10:01:41 PM ******/
CREATE DATABASE [E_Learning_Platform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E_Learning_Platform', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\E_Learning_Platform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E_Learning_Platform_log', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\E_Learning_Platform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E_Learning_Platform] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_Learning_Platform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_Learning_Platform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET ARITHABORT OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E_Learning_Platform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E_Learning_Platform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E_Learning_Platform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E_Learning_Platform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E_Learning_Platform] SET  MULTI_USER 
GO
ALTER DATABASE [E_Learning_Platform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E_Learning_Platform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E_Learning_Platform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E_Learning_Platform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E_Learning_Platform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E_Learning_Platform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E_Learning_Platform] SET QUERY_STORE = ON
GO
ALTER DATABASE [E_Learning_Platform] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E_Learning_Platform]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[Admin_id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](20) NULL,
	[Middle_name] [varchar](20) NULL,
	[Last_name] [varchar](20) NULL,
	[Email] [nvarchar](30) NULL,
	[Gender] [varchar](6) NULL,
	[Age] [int] NULL,
	[Phone_number] [varchar](15) NULL,
	[Addresses] [varchar](50) NULL,
	[Username] [varchar](20) NULL,
	[Passwords] [nvarchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Course_id] [int] IDENTITY(1,1) NOT NULL,
	[Instructor_id] [int] NULL,
	[Name] [varchar](30) NULL,
	[Descriptions] [varchar](100) NULL,
	[Assignment_posted] [varchar](3) NULL,
	[Quiz_posted] [varchar](3) NULL,
	[Exam_posted] [varchar](3) NULL,
 CONSTRAINT [PK__Course__37E309C33372E71E] PRIMARY KEY CLUSTERED 
(
	[Course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[Enrollment_id] [int] IDENTITY(1,1) NOT NULL,
	[Course_id] [int] NULL,
	[Student_id] [int] NULL,
	[Enrollment_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[Grade_id] [int] IDENTITY(1,1) NOT NULL,
	[Student_id] [int] NULL,
	[Course_id] [int] NULL,
	[Assignment_score] [int] NULL,
	[Quiz_score] [int] NULL,
	[Exam_score] [int] NULL,
	[Final_grade] [decimal](6, 2) NULL,
	[Grade_status] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[Instructor_id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](20) NULL,
	[Middle_name] [varchar](20) NULL,
	[Last_name] [varchar](20) NULL,
	[Email] [nvarchar](30) NULL,
	[Gender] [varchar](6) NULL,
	[Age] [int] NULL,
	[Phone_number] [varchar](15) NULL,
	[Addresses] [varchar](50) NULL,
	[Username] [varchar](20) NULL,
	[Passwords] [nvarchar](15) NULL,
 CONSTRAINT [PK__Instruct__DD4A9EC2E8701AFC] PRIMARY KEY CLUSTERED 
(
	[Instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[Course_id] [int] NULL,
	[Time_sched] [time](7) NULL,
	[Week_day] [varchar](15) NULL,
	[Schedule_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/18/2024 10:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Student_id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](20) NULL,
	[Middle_name] [varchar](20) NULL,
	[Last_name] [varchar](20) NULL,
	[Email] [nvarchar](30) NULL,
	[Gender] [varchar](6) NULL,
	[Age] [int] NULL,
	[Phone_number] [varchar](15) NULL,
	[Addresses] [varchar](50) NULL,
	[Username] [varchar](20) NULL,
	[Passwords] [nvarchar](15) NULL,
 CONSTRAINT [PK__Student__A2F7EDF4866D5C1B] PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK__Course__Instruct__3D5E1FD2] FOREIGN KEY([Instructor_id])
REFERENCES [dbo].[Instructors] ([Instructor_id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK__Course__Instruct__3D5E1FD2]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([Student_id])
REFERENCES [dbo].[Students] ([Student_id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([Student_id])
REFERENCES [dbo].[Students] ([Student_id])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
USE [master]
GO
ALTER DATABASE [E_Learning_Platform] SET  READ_WRITE 
GO
