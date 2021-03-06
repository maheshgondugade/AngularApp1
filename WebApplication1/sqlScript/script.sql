USE [master]
GO
/****** Object:  Database [NHP]    Script Date: 7/23/2018 5:31:30 AM ******/
CREATE DATABASE [NHP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHP', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NHP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NHP_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NHP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NHP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NHP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NHP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NHP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NHP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NHP] SET ARITHABORT OFF 
GO
ALTER DATABASE [NHP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NHP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NHP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NHP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NHP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NHP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NHP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NHP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NHP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NHP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NHP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NHP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NHP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NHP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NHP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NHP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NHP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NHP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NHP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NHP] SET  MULTI_USER 
GO
ALTER DATABASE [NHP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NHP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NHP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NHP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NHP]
GO
/****** Object:  UserDefinedTableType [dbo].[PatientInformationDetails]    Script Date: 7/23/2018 5:31:30 AM ******/
CREATE TYPE [dbo].[PatientInformationDetails] AS TABLE(
	[ClaimID] [int] NULL,
	[PatientID] [int] NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[ServiceCode] [nvarchar](1000) NULL,
	[Description] [nvarchar](1000) NULL,
	[RevenueCode] [nvarchar](1000) NULL,
	[RevenueDescription] [nvarchar](1000) NULL,
	[DiagosisCode] [nvarchar](1000) NULL,
	[MaritalStatus] [nvarchar](1000) NULL,
	[Smoking] [nvarchar](1000) NULL,
	[Alcohol] [nvarchar](1000) NULL,
	[PrescribedDrugs] [nvarchar](1000) NULL,
	[Geography] [nvarchar](1000) NULL,
	[HCCCode] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[GetClaimData]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetClaimData]
As
BEGIN
SELECT [ClaimID]
      ,[PatientID]
      ,[Age]
      ,[Gender]
      ,[ServiceCode]
      ,[Description]
      ,[RevenueCode]
      ,[RevenueDescription]
      ,[DiagosisCode]
  FROM [NHP].[dbo].[PatientInformation]
 END
GO
/****** Object:  StoredProcedure [dbo].[GetClinicData]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetClinicData]
As
BEGIN
SELECT  [ClaimID]
      ,[PatientID]
      
      ,[MaritalStatus]
      ,[Smoking]
      ,[Alcohol]
      ,[PrescribedDrugs]
      ,[Geography]
      ,[HCCCode]
  FROM [NHP].[dbo].[PatientInformation]
  END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientData]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[GetPatientData]

As 

BEGIN

SELECT [ClaimID]

      ,[PatientID]

      ,[Age]

      ,[Gender]

      ,[ServiceCode]

      ,[Description]

      ,[RevenueCode]

      ,[RevenueDescription]

      ,[DiagosisCode]

      ,[MaritalStatus]

      ,[Smoking]

      ,[Alcohol]

      ,[PrescribedDrugs]

      ,[Geography]

      ,[HCCCode]

  FROM [NHP].[dbo].[PatientInformation]

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Patients]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_Patients]
      @tblPatient PatientInformationDetails READONLY
AS
BEGIN
      SET NOCOUNT ON;
     
      INSERT INTO PatientInformation(
	  
	  ClaimID	
	   ,PatientID	
	   ,Age		
	   ,Gender 
	   ,ServiceCode 
	   ,[Description] 
	   ,RevenueCode 
	   ,RevenueDescription 
	   ,DiagosisCode 
	   ,MaritalStatus
	   ,Smoking 
	   ,Alcohol 
	   ,PrescribedDrugs 
	   ,[Geography]
	   ,HCCCode  
	  )
      SELECT 
			ClaimID	
			 ,PatientID	
			 ,Age		
			 ,Gender 
			 ,ServiceCode 
			 ,[Description] 
			 ,RevenueCode 
			 ,RevenueDescription 
			 ,DiagosisCode 
			 ,MaritalStatus
			 ,Smoking 
			 ,Alcohol 
			 ,PrescribedDrugs 
			 ,[Geography]
			 ,HCCCode  
	 FROM @tblPatient
END
GO
/****** Object:  Table [dbo].[claim_data]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claim_data](
	[clm_id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[clinic_data]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clinic_data](
	[cln_id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientInformation]    Script Date: 7/23/2018 5:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientInformation](
	[ClaimID] [int] NULL,
	[PatientID] [int] NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[ServiceCode] [nvarchar](1000) NULL,
	[Description] [nvarchar](1000) NULL,
	[RevenueCode] [nvarchar](1000) NULL,
	[RevenueDescription] [nvarchar](1000) NULL,
	[DiagosisCode] [nvarchar](1000) NULL,
	[MaritalStatus] [nvarchar](1000) NULL,
	[Smoking] [nvarchar](1000) NULL,
	[Alcohol] [nvarchar](1000) NULL,
	[PrescribedDrugs] [nvarchar](1000) NULL,
	[Geography] [nvarchar](1000) NULL,
	[HCCCode] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (1, 1, 38, N'Female', N'99202', N'OFFICE/OUTPATIENT VISIT NEW', N'', N'Undefined', N'E11.62', N'Married', N'Yes', N'Yes', N'Metformin', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (2, 2, 37, N'Female', N'S9131', N'PHYSICAL THERAPY; HOME PER DIEM', N'0421', N'Physical Therapy - Visit Charge', N'E11.9', N'Divorced', N'Yes', N'Yes', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (3, 3, 61, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.8', N'Married', N'No', N'No', N'Metformin', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (4, 4, 74, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.63', N'Married', N'Yes', N'Yes', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (5, 5, 44, N'Male', N'92226', N'SPECIAL EYE EXAM SUBSEQUENT', N'0761', N'Treatment Room', N'E11.3513', N'Married', N'Yes', N'Yes', N'Metformin', N'Massachusets', 1)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (6, 6, 49, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.9', N'Married', N'Yes', N'Yes', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (7, 7, 52, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.8', N'Married', N'No', N'No', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (8, 8, 59, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.9', N'Married', N'No', N'Yes', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (9, 9, 72, N'Male', N'99211', N'OFFICE/OUTPATIENT VISIT EST', N'0510', N'Clinic', N'E11.63', N'Married', N'Yes', N'Yes', N'Glimpiride', N'Massachusets', 3)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (10, 10, 79, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'0983', N'Professional Fees - Clinic', N'E11.5', N'Married', N'No', N'No', N'Glimpiride', N'Massachusets', 3)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (11, 11, 21, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.40', N'Single', N'Yes', N'Yes', N'Metformin', N'Massachusets', 3)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (12, 12, 59, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.352', N'Married', N'Yes', N'Yes', N'Metformin', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (13, 13, 51, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.3531', N'Married', N'No', N'No', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (14, 14, 73, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.1', N'Married', N'No', N'No', N'Metformin', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (15, 15, 81, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'0516', N'Urgent Care Clinic', N'E11.34', N'Widowed', N'No', N'No', N'Glimpiride', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (16, 16, 56, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'E11.33', N'Married', N'No', N'No', N'Glimpiride', N'Massachusets', 5)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (17, 17, 63, N'Female', N'99212', N'OFFICE/OUTPATIENT VISIT EST', N'0510', N'Clinic', N'I10', N'Married', N'No', N'No', N'Lisonopril', N'Massachusets', 5)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (18, 18, 63, N'Female', N'99212', N'OFFICE/OUTPATIENT VISIT EST', N'0510', N'Clinic', N'I15', N'Married', N'No', N'No', N'Vasotec', N'Massachusets', 5)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (19, 19, 38, N'Female', N'99202', N'OFFICE/OUTPATIENT VISIT NEW', N'', N'Undefined', N'I15', N'Married', N'No', N'Yes', N'Capoten', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (20, 20, 38, N'Female', N'99202', N'OFFICE/OUTPATIENT VISIT NEW', N'', N'Undefined', N'I12', N'Married', N'Yes', N'Yes', N'Lisonopril', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (21, 21, 37, N'Female', N'92004', N'EYE EXAM NEW PATIENT', N'', N'Undefined', N'I13', N'Divorced', N'Yes', N'Yes', N'Capoten', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (22, 22, 61, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I15', N'Married', N'No', N'No', N'Vasotec', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (23, 23, 74, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I10', N'Married', N'Yes', N'Yes', N'Capoten', N'Massachusets', 5)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (24, 24, 44, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I13', N'Married', N'Yes', N'Yes', N'Capoten', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (25, 25, 49, N'Male', N'80053', N'COMPREHEN METABOLIC PANEL', N'0300', N'Laboratory', N'I10', N'Married', N'Yes', N'Yes', N'Mavik', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (26, 26, 52, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I11', N'Married', N'No', N'No', N'Vasotec', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (27, 27, 59, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I12', N'Married', N'No', N'Yes', N'Lisonopril', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (28, 28, 72, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I10', N'Married', N'Yes', N'Yes', N'Capoten', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (29, 29, 79, N'Male', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I13', N'Married', N'No', N'No', N'Lisonopril', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (30, 30, 41, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I10', N'Single', N'Yes', N'Yes', N'Mavik', N'Massachusets', 2)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (31, 31, 59, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I15', N'Married', N'Yes', N'Yes', N'Capoten', N'Massachusets', 4)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (32, 32, 51, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I15', N'Married', N'No', N'No', N'Lisonopril', N'Massachusets', 5)
INSERT [dbo].[PatientInformation] ([ClaimID], [PatientID], [Age], [Gender], [ServiceCode], [Description], [RevenueCode], [RevenueDescription], [DiagosisCode], [MaritalStatus], [Smoking], [Alcohol], [PrescribedDrugs], [Geography], [HCCCode]) VALUES (33, 33, 73, N'Female', N'99213', N'OFFICE/OUTPATIENT VISIT EST', N'', N'Undefined', N'I15', N'Married', N'No', N'No', N'Lisonopril', N'Massachusets', 3)
USE [master]
GO
ALTER DATABASE [NHP] SET  READ_WRITE 
GO
