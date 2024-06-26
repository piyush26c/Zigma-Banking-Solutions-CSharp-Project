USE [master]
GO
/****** Object:  Database [ZBSDB]    Script Date: 5/17/2022 1:02:36 AM ******/
CREATE DATABASE [ZBSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ZBSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ZBSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ZBSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ZBSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ZBSDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZBSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZBSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZBSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZBSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZBSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZBSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZBSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZBSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZBSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZBSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZBSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZBSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZBSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZBSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZBSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZBSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZBSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZBSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZBSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZBSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZBSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZBSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZBSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZBSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ZBSDB] SET  MULTI_USER 
GO
ALTER DATABASE [ZBSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZBSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZBSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZBSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ZBSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ZBSDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ZBSDB', N'ON'
GO
ALTER DATABASE [ZBSDB] SET QUERY_STORE = OFF
GO
USE [ZBSDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNo] [bigint] IDENTITY(60000,1) NOT NULL,
	[CRN] [bigint] NOT NULL,
	[AccountBalance] [float] NOT NULL,
	[AccountStatus] [varchar](100) NOT NULL,
	[BranchIFSCNo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[AdministratorID] [bigint] NOT NULL,
	[AdministratorFirstName] [varchar](100) NOT NULL,
	[AdministratorLastName] [varchar](100) NOT NULL,
	[AdministratorAddress] [varchar](100) NOT NULL,
	[AdministratorMobileNo] [varchar](100) NOT NULL,
	[AdministratorEmailID] [varchar](100) NOT NULL,
	[AdministratorDOB] [date] NOT NULL,
	[AdministratorGender] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficiary]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiary](
	[BeneficiaryAccountNo] [varchar](100) NOT NULL,
	[AccountNo] [bigint] NOT NULL,
	[BeneficiaryFirstName] [varchar](100) NOT NULL,
	[BeneficiaryLastName] [varchar](100) NOT NULL,
	[BeneficiaryIFSCNo] [varchar](100) NOT NULL,
	[BeneficiaryBankName] [varchar](100) NOT NULL,
	[BeneficiaryBankAddress] [varchar](100) NOT NULL,
	[BeneficiaryAccountStatus] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Beneficiary] PRIMARY KEY CLUSTERED 
(
	[BeneficiaryAccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchIFSCNo] [varchar](100) NOT NULL,
	[BranchName] [varchar](100) NOT NULL,
	[BranchAddress] [varchar](100) NOT NULL,
	[BranchPincode] [bigint] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchIFSCNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[AdministratorID] [bigint] NULL,
	[CRN] [bigint] NULL,
	[UserName] [varchar](100) NOT NULL,
	[DefaultPassword] [varchar](100) NULL,
	[AccountPassword] [varchar](100) NULL,
	[TransactionPassword] [varchar](100) NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CRN] [bigint] IDENTITY(1001,1) NOT NULL,
	[CustomerFirstName] [varchar](100) NOT NULL,
	[CustomerLastName] [varchar](100) NOT NULL,
	[CustomerAddress] [varchar](100) NOT NULL,
	[CustomerMobileNo] [varchar](100) NOT NULL,
	[CustomerEmailID] [varchar](100) NOT NULL,
	[CustomerDOB] [date] NOT NULL,
	[CustomerGender] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CRN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[CRN] [bigint] NULL,
	[AdministratorID] [bigint] NULL,
	[LoginDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[LoginDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 5/17/2022 1:02:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionID] [bigint] IDENTITY(11000,1) NOT NULL,
	[AccountNo] [bigint] NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[TransactionType] [varchar](100) NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[TransactionComment] [varchar](100) NOT NULL,
	[ToAccount] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60001, 1001, 500, N'Active', N'ZBS7878')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60002, 0, 0, N'ACTIVE', N'ZBS7878')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60003, 0, 0, N'ACTIVE', N'ZBS2222')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60004, 0, 0, N'ACTIVE', N'ZBS2222')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60005, 1033, 0, N'ACTIVE', N'ZBS4444')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60006, 1034, 0, N'ACTIVE', N'ZBS4444')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60007, 1035, 0, N'ACTIVE', N'ZBS7878')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60008, 1036, 0, N'ACTIVE', N'ZBS4444')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60009, 1037, 0, N'ACTIVE', N'ZBS2222')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60010, 1038, 0, N'ACTIVE', N'ZBS4444')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60011, 1039, 200, N'ACTIVE', N'ZBS2222')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60012, 1040, 49999276, N'ACTIVE', N'ZBS4444')
INSERT [dbo].[Account] ([AccountNo], [CRN], [AccountBalance], [AccountStatus], [BranchIFSCNo]) VALUES (60013, 1041, 524, N'ACTIVE', N'ZBS4444')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Administrator] ([AdministratorID], [AdministratorFirstName], [AdministratorLastName], [AdministratorAddress], [AdministratorMobileNo], [AdministratorEmailID], [AdministratorDOB], [AdministratorGender]) VALUES (1, N'Piyush', N'Chaudhari', N'Ravet, Pune', N'9881432568', N'samrat@outlook.com', CAST(N'1999-05-27' AS Date), N'MALE')
GO
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'ICICI1999012', 60012, N'Bharti', N'Narkhede', N'ICICI0001222', N'ICICI JALGAON', N'JALGAON', N'APPROVED')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'ICICI199991', 60009, N'Gary', N'Watson', N'ICICI0001212', N'ICIC KERALA', N'KERALA', N'REJECT')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'ICICI199992', 60009, N'Hari', N'Har', N'ICICI001232', N'ICICI GOA', N'GOA', N'APPROVED')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'ICICI199993', 60009, N'Chan', N'Wang', N'ICICI0001231', N'ICICI CHINA', N'CHINA', N'UNAPPROVED')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'IDBI999991', 60001, N'Yamini', N'Chaudhari', N'IDBI000145', N'IDBI', N'Bhuldhana', N'UNAPPROVED')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'KOTAK0001', 60001, N'Shubham', N'Pandey', N'KOTAK1111', N'KOTAK MAHINDRA', N'PUNJAB', N'APPROVED')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'KOTAK000558', 60011, N'Gam', N'Fam', N'KOTAK0001231', N'KOTAK MAHINDRA', N'DELHI', N'REJECT')
INSERT [dbo].[Beneficiary] ([BeneficiaryAccountNo], [AccountNo], [BeneficiaryFirstName], [BeneficiaryLastName], [BeneficiaryIFSCNo], [BeneficiaryBankName], [BeneficiaryBankAddress], [BeneficiaryAccountStatus]) VALUES (N'SBI8789234', 60010, N'Advait', N'Borole', N'SBI000123', N'SBI Haridwar', N'1/2 Mill Corner, Haridwar', N'APPROVED')
GO
INSERT [dbo].[Branch] ([BranchIFSCNo], [BranchName], [BranchAddress], [BranchPincode]) VALUES (N'ZBS2222', N'ZIGMA-KOLHAPUR', N'KOLHAPUR', 333333)
INSERT [dbo].[Branch] ([BranchIFSCNo], [BranchName], [BranchAddress], [BranchPincode]) VALUES (N'ZBS4444', N'ZIGMA-PUNE', N'PUNE', 111111)
INSERT [dbo].[Branch] ([BranchIFSCNo], [BranchName], [BranchAddress], [BranchPincode]) VALUES (N'ZBS7878', N'ZIGMA-RAVET', N'Ravet', 431001)
GO
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1032, N'aaaAshnir0', NULL, N'Piyush@123', N'Piyush@123')
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (1, NULL, N'admin001', N'', N'admin@123', NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1035, N'Alex0', N'Alex@123', NULL, NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1030, N'Ashnir0', N'Ashnir@123', NULL, NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1039, N'Badri1039', NULL, N'Piyush@123', N'Piyush@123')
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1036, N'Balu1036', N'Balu@123', NULL, NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1031, N'Jio0', N'Jio@123', NULL, NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1001, N'pc1001', N'1001pc', NULL, NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1040, N'Prashant1040', NULL, N'Piyush@123', N'Piyush@123')
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1034, N'Raj0', N'Raj@123', NULL, NULL)
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1037, N'Shubham1037', NULL, N'Piyush@123', N'Piyush@123')
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1041, N'Suyash1041', NULL, N'Piyush@123', N'Piyush@123')
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1038, N'Swati1038', NULL, N'Piyush@123', N'Piyush@123')
INSERT [dbo].[Credential] ([AdministratorID], [CRN], [UserName], [DefaultPassword], [AccountPassword], [TransactionPassword]) VALUES (NULL, 1033, N'Yiu0', NULL, N'Piyush@123', N'Piyush@123')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (0, N'Kaustubh', N'Kakade', N'Pune', N'9999999999', N'kk@gmail.com', CAST(N'2020-05-01' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1001, N'Piyush', N'Chaudhari', N'Pune', N'999999999', N'piyush@gmail.com', CAST(N'1999-05-26' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1002, N'Anupam', N'Mittal', N'MUMBAI, MAHARASHTRA, INDIA', N'9999999999', N'Piyush.Chaudhari@icertis.com', CAST(N'2020-05-02' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1029, N'Yiu', N'Wang', N'China', N'9191919191', N'yiu@gmail.com', CAST(N'2021-09-01' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1030, N'Ashnir', N'Grover', N'Pune, MAHARASHTRA', N'9999999999', N'ashnir@gmail.com', CAST(N'2021-09-08' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1031, N'Jio', N'Ambani', N'Mumbai', N'9696969698', N'jj@gmail.com', CAST(N'2021-06-29' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1032, N'aaaAshnir', N'Grover', N'Pune, MAHARASHTRA', N'9999999999', N'Piyush.Chaudhari@icertis.com', CAST(N'2022-01-11' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1033, N'Yiu', N'Wang', N'China', N'9191919191', N'yiu@gmail.com', CAST(N'2021-09-28' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1034, N'Raj', N'Mashalkar', N'Amravati', N'9191919191', N'raj@gmail.com', CAST(N'2021-06-29' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1035, N'Alex', N'Watson', N'Germany', N'9189898989', N'alex@gmail.com', CAST(N'2021-09-08' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1036, N'Balu', N'Singh', N'Punjab', N'9232323232', N'balu@gmail.com', CAST(N'2021-12-30' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1037, N'Shubham', N'Pandey', N'Pune', N'7689592342', N'shubham@gmail.com', CAST(N'2021-09-09' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1038, N'Swati', N'Thakur', N'Mumbai', N'8888844444', N'swati@gmail.com', CAST(N'2021-12-27' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1039, N'Badri', N'Jog', N'Pune', N'9898989898', N'badri@gmail.co', CAST(N'2000-05-02' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1040, N'Prashant', N'Narkhede', N'Jalgaon', N'9898989898', N'prashant@gmail.com', CAST(N'1998-06-06' AS Date), N'Male')
INSERT [dbo].[Customer] ([CRN], [CustomerFirstName], [CustomerLastName], [CustomerAddress], [CustomerMobileNo], [CustomerEmailID], [CustomerDOB], [CustomerGender]) VALUES (1041, N'Suyash', N'Jog', N'Pune', N'9696584123', N'suyash@gmail.com', CAST(N'2021-01-01' AS Date), N'Male')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-26T23:12:58.430' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-26T23:16:31.353' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-26T23:18:49.713' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-26T23:19:34.697' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-26T23:22:34.193' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T01:36:56.323' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1032, NULL, CAST(N'2022-01-27T01:37:27.840' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1032, NULL, CAST(N'2022-01-27T01:42:23.530' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1033, NULL, CAST(N'2022-01-27T01:47:36.670' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T01:58:36.920' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T02:01:08.123' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1033, NULL, CAST(N'2022-01-27T02:01:24.783' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1033, NULL, CAST(N'2022-01-27T02:03:17.573' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T02:07:26.407' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1033, NULL, CAST(N'2022-01-27T02:07:53.367' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1033, NULL, CAST(N'2022-01-27T02:09:03.807' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1033, NULL, CAST(N'2022-01-27T08:42:28.737' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T09:36:20.477' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T09:43:34.753' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T09:45:06.470' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T09:53:29.767' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T09:55:28.290' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T09:58:46.280' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1037, NULL, CAST(N'2022-01-27T10:08:47.347' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T10:20:26.217' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T10:24:35.717' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T10:31:20.637' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T10:34:36.647' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1039, NULL, CAST(N'2022-01-27T10:42:39.177' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T10:48:52.873' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T10:55:05.630' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:02:34.900' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:10:22.340' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:18:04.060' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:23:41.360' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:30:24.953' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:32:52.990' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T11:35:12.280' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T11:35:49.210' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T11:54:42.647' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:02:10.140' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:03:07.303' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:07:33.863' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:11:38.260' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:13:03.707' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:28:06.087' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T12:32:02.880' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-01-27T12:41:25.903' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-27T12:45:10.287' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-27T12:46:06.727' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T12:47:12.037' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-27T12:47:52.520' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-27T12:51:15.043' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-27T12:54:55.783' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T13:21:39.907' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-27T13:23:59.667' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1041, NULL, CAST(N'2022-01-27T13:37:25.343' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T13:39:14.610' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1041, NULL, CAST(N'2022-01-27T13:41:03.100' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T19:03:48.880' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T19:19:53.073' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T19:44:31.547' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T21:20:17.027' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T21:22:18.460' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T21:28:49.217' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T21:33:58.087' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T21:36:02.613' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:08:31.033' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:15:22.253' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:22:49.937' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:35:51.893' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:40:51.233' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:45:45.867' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:53:27.550' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:55:17.950' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T22:59:56.680' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T23:05:59.997' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T23:11:38.657' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T23:15:58.900' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T23:19:01.760' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-27T23:21:48.537' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T17:36:49.017' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T17:39:54.543' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T17:50:30.957' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T18:13:17.837' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T18:17:19.763' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T18:19:37.520' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T18:48:36.377' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T18:58:21.117' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:04:04.780' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:05:57.493' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:08:42.627' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:12:44.033' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:17:56.113' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:24:27.913' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:27:17.660' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:32:45.803' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:43:28.460' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T19:45:03.687' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T23:29:36.293' AS DateTime))
GO
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T23:32:45.630' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T23:34:59.117' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-29T23:35:46.170' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T23:37:21.347' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-29T23:58:59.073' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-30T00:01:32.423' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-30T00:07:35.780' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-01-30T00:08:12.290' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-30T00:09:34.287' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-30T00:13:17.803' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-30T00:23:30.407' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-01-30T00:28:58.690' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-05-17T00:36:00.433' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-05-17T00:42:26.833' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-05-17T00:48:25.850' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-05-17T00:49:08.183' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-05-17T00:51:11.570' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1038, NULL, CAST(N'2022-05-17T00:56:44.413' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-05-17T00:57:54.953' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (NULL, 1, CAST(N'2022-05-17T00:58:59.923' AS DateTime))
INSERT [dbo].[LoginHistory] ([CRN], [AdministratorID], [LoginDateTime]) VALUES (1040, NULL, CAST(N'2022-05-17T01:00:48.637' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([TransactionID], [AccountNo], [TransactionDateTime], [TransactionType], [TransactionAmount], [TransactionComment], [ToAccount]) VALUES (11000, 60012, CAST(N'2022-01-01T09:09:44.000' AS DateTime), N'CREDIT', 12554.36, N'Business Money', N'60011')
INSERT [dbo].[Transaction] ([TransactionID], [AccountNo], [TransactionDateTime], [TransactionType], [TransactionAmount], [TransactionComment], [ToAccount]) VALUES (11002, 60012, CAST(N'2022-01-29T01:01:12.000' AS DateTime), N'DEBIT', 22000, N'College Fees', N'60010')
INSERT [dbo].[Transaction] ([TransactionID], [AccountNo], [TransactionDateTime], [TransactionType], [TransactionAmount], [TransactionComment], [ToAccount]) VALUES (11003, 60012, CAST(N'2022-01-29T23:59:17.377' AS DateTime), N'DEBIT', 200, N'First Testing', N'60013')
INSERT [dbo].[Transaction] ([TransactionID], [AccountNo], [TransactionDateTime], [TransactionType], [TransactionAmount], [TransactionComment], [ToAccount]) VALUES (11004, 60012, CAST(N'2022-01-30T00:02:17.497' AS DateTime), N'DEBIT', 323, N'Second Testing', N'60013')
INSERT [dbo].[Transaction] ([TransactionID], [AccountNo], [TransactionDateTime], [TransactionType], [TransactionAmount], [TransactionComment], [ToAccount]) VALUES (11005, 60012, CAST(N'2022-01-30T00:03:47.477' AS DateTime), N'DEBIT', 200, N'First Testing-1', N'60011')
INSERT [dbo].[Transaction] ([TransactionID], [AccountNo], [TransactionDateTime], [TransactionType], [TransactionAmount], [TransactionComment], [ToAccount]) VALUES (11006, 60012, CAST(N'2022-01-30T00:08:57.870' AS DateTime), N'DEBIT', 1, N'ThirdTesting', N'60013')
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Branch_BranchIFSCNo] FOREIGN KEY([BranchIFSCNo])
REFERENCES [dbo].[Branch] ([BranchIFSCNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Branch_BranchIFSCNo]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer_CRN] FOREIGN KEY([CRN])
REFERENCES [dbo].[Customer] ([CRN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer_CRN]
GO
ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiary_Account_AccountNo] FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Beneficiary] CHECK CONSTRAINT [FK_Beneficiary_Account_AccountNo]
GO
USE [master]
GO
ALTER DATABASE [ZBSDB] SET  READ_WRITE 
GO
