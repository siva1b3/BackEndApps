USE [TestMain]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 5/28/2024 11:35:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[EmployeeID] [int] NOT NULL,
	[FullName] [VARCHAR](100) NULL,
	[Email] [VARCHAR](100) NULL,
	[Age] [int] NULL,
	[Gender] [VARCHAR](10) NULL,
	[JoiningDate] [DATETIME] NULL,
	[RelievingDate] [DATETIME] NULL,
	[CreatedByEmployeeID] [int] NULL,
	[IsActive] [BIT] NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedByEmployeeID] [int] NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [nVARCHAR](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeRoleHistory]    Script Date: 5/28/2024 11:35:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeRoleHistory](
	[RoleHistoryID] [int] NOT NULL,
	[RoleHierarchyID] [hierarchyid] NOT NULL,
	[EmployeeID] [int] NULL,
	[RoleName] [VARCHAR](100) NULL,
	[RoleLevel] [VARCHAR](50) NULL,
	[StartDateInRole] [DATETIME] NULL,
	[EndDateInRole] [DATETIME] NULL,
	[IsLastRole] [BIT] NULL,
	[IsActive] [BIT] NULL,
	[CreatedByEmployeeID] [int] NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedByEmployeeID] [int] NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [nVARCHAR](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stcLocation]    Script Date: 5/28/2024 11:35:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stcLocation](
	[locationId] [int] IDENTITY(10000,1) NOT NULL,
	[City] [VARCHAR](50) NULL,
	[State] [VARCHAR](50) NULL,
	[Zipcode] [VARCHAR](10) NULL,
	[Country] [VARCHAR](50) NULL,
	[Planet] [VARCHAR](50) NULL,
	[IsActive] [BIT] NULL,
	[CreatedBy] [VARCHAR](100) NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedBy] [VARCHAR](100) NULL,
	[ModifiedDate] [DATETIME] NULL,
	[ModifiedReason] [VARCHAR](100) NULL,
 CONSTRAINT [PK_stcLocation_locationId] PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stcRoleLevel]    Script Date: 5/28/2024 11:35:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stcRoleLevel](
	[RoleLevel] [VARCHAR](50) NOT NULL,
	[SortOrder] [int] NULL,
	[IsActive] [BIT] NULL,
	[CreatedBy] [VARCHAR](50) NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedBy] [VARCHAR](50) NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [VARCHAR](255) NULL,
 CONSTRAINT [PK_stcRoleLevel_RoleLevel] PRIMARY KEY CLUSTERED 
(
	[RoleLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stcRoles]    Script Date: 5/28/2024 11:35:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stcRoles](
	[Role] [VARCHAR](100) NOT NULL,
	[RoleLevel] [VARCHAR](50) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [BIT] NULL,
	[CreatedBy] [VARCHAR](50) NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedBy] [VARCHAR](50) NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [VARCHAR](255) NULL,
 CONSTRAINT [PK_stcRoles_Role] PRIMARY KEY CLUSTERED 
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (1, N'John Doe', N'john@example.com', 30, N'Male', CAST(N'2022-01-01T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:06.613' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (2, N'Jane Smith', N'jane@example.com', 28, N'Female', CAST(N'2022-02-15T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:06.623' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (3, N'David Johnson', N'david@example.com', 35, N'Male', CAST(N'2021-12-10T00:00:00.000' AS DATETIME), CAST(N'2023-03-20T00:00:00.000' AS DATETIME), 3, 1, CAST(N'2024-05-27T23:36:06.627' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (4, N'Alice Johnson', N'alice@example.com', 29, N'Female', CAST(N'2022-03-05T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (5, N'Michael Brown', N'michael@example.com', 32, N'Male', CAST(N'2022-04-12T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (6, N'Sarah Lee', N'sarah@example.com', 27, N'Female', CAST(N'2022-05-20T00:00:00.000' AS DATETIME), NULL, 3, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (7, N'Christopher Wilson', N'chris@example.com', 35, N'Male', CAST(N'2021-11-15T00:00:00.000' AS DATETIME), NULL, 4, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (8, N'Emily Martinez', N'emily@example.com', 31, N'Female', CAST(N'2022-06-30T00:00:00.000' AS DATETIME), NULL, 5, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (9, N'Daniel Taylor', N'daniel@example.com', 33, N'Male', CAST(N'2022-07-10T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (10, N'Jessica Garcia', N'jessica@example.com', 28, N'Female', CAST(N'2022-08-25T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (11, N'Matthew Rodriguez', N'matthew@example.com', 34, N'Male', CAST(N'2021-10-03T00:00:00.000' AS DATETIME), NULL, 3, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (12, N'Ashley Smith', N'ashley@example.com', 30, N'Female', CAST(N'2022-09-15T00:00:00.000' AS DATETIME), NULL, 4, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (13, N'David Thomas', N'david@example.com', 36, N'Male', CAST(N'2022-10-20T00:00:00.000' AS DATETIME), NULL, 5, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (14, N'Jennifer Jackson', N'jennifer@example.com', 26, N'Female', CAST(N'2022-11-10T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (15, N'James White', N'james@example.com', 37, N'Male', CAST(N'2022-12-05T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (16, N'Amanda Harris', N'amanda@example.com', 25, N'Female', CAST(N'2022-01-15T00:00:00.000' AS DATETIME), NULL, 3, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (17, N'Robert Clark', N'robert@example.com', 38, N'Male', CAST(N'2022-02-20T00:00:00.000' AS DATETIME), NULL, 4, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (18, N'Brittany Lopez', N'brittany@example.com', 24, N'Female', CAST(N'2021-09-30T00:00:00.000' AS DATETIME), NULL, 5, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (19, N'William Hall', N'william@example.com', 39, N'Male', CAST(N'2022-03-01T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (20, N'Megan Young', N'megan@example.com', 23, N'Female', CAST(N'2022-04-10T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (21, N'Anthony King', N'anthony@example.com', 40, N'Male', CAST(N'2022-05-05T00:00:00.000' AS DATETIME), NULL, 3, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (22, N'Stephanie Turner', N'stephanie@example.com', 22, N'Female', CAST(N'2021-08-20T00:00:00.000' AS DATETIME), NULL, 4, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (23, N'John Harris', N'john@example.com', 41, N'Male', CAST(N'2022-06-15T00:00:00.000' AS DATETIME), NULL, 5, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (24, N'Nicole Rodriguez', N'nicole@example.com', 21, N'Female', CAST(N'2022-07-30T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (25, N'Charles Martinez', N'charles@example.com', 42, N'Male', CAST(N'2022-08-05T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (26, N'Samantha Adams', N'samantha@example.com', 20, N'Female', CAST(N'2022-09-20T00:00:00.000' AS DATETIME), NULL, 3, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (27, N'Andrew Wood', N'andrew@example.com', 43, N'Male', CAST(N'2022-10-25T00:00:00.000' AS DATETIME), NULL, 4, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (28, N'Lauren Scott', N'lauren@example.com', 19, N'Female', CAST(N'2021-07-10T00:00:00.000' AS DATETIME), NULL, 5, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (29, N'Ryan Green', N'ryan@example.com', 44, N'Male', CAST(N'2022-11-01T00:00:00.000' AS DATETIME), NULL, 1, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeID], [FullName], [Email], [Age], [Gender], [JoinedCompanyDate], [LeftCompanyDate], [CreatedByEmployeeID], [IsActive], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (30, N'Victoria Phillips', N'victoria@example.com', 18, N'Female', CAST(N'2022-12-10T00:00:00.000' AS DATETIME), NULL, 2, 1, CAST(N'2024-05-27T23:36:12.393' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeRoleHistory] ([RoleHistoryID], [RoleHierarchyID], [EmployeeID], [RoleName], [RoleLevel], [StartDateInRole], [EndDateInRole], [IsLastRole], [IsActive], [CreatedByEmployeeID], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (1, N'/', 1, N'Chief Executive Officer', N'CEO', CAST(N'2023-01-01T00:00:00.000' AS DATETIME), NULL, 1, 1, 1, CAST(N'2024-05-28T00:01:33.687' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeRoleHistory] ([RoleHistoryID], [RoleHierarchyID], [EmployeeID], [RoleName], [RoleLevel], [StartDateInRole], [EndDateInRole], [IsLastRole], [IsActive], [CreatedByEmployeeID], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (2, N'/1/', 2, N'Chief Technology Officer', N'Other Chiefs', CAST(N'2023-01-15T00:00:00.000' AS DATETIME), NULL, 1, 1, 1, CAST(N'2024-05-28T00:09:20.003' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeRoleHistory] ([RoleHistoryID], [RoleHierarchyID], [EmployeeID], [RoleName], [RoleLevel], [StartDateInRole], [EndDateInRole], [IsLastRole], [IsActive], [CreatedByEmployeeID], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (3, N'/2/', 3, N'Chief Information Officer', N'Other Chiefs', CAST(N'2023-02-01T00:00:00.000' AS DATETIME), NULL, 1, 1, 1, CAST(N'2024-05-28T00:10:06.387' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeRoleHistory] ([RoleHistoryID], [RoleHierarchyID], [EmployeeID], [RoleName], [RoleLevel], [StartDateInRole], [EndDateInRole], [IsLastRole], [IsActive], [CreatedByEmployeeID], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (4, N'/3/', 4, N'Chief Financial Officer', N'Other Chiefs', CAST(N'2023-02-15T00:00:00.000' AS DATETIME), NULL, 1, 1, 1, CAST(N'2024-05-28T00:11:28.827' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeRoleHistory] ([RoleHistoryID], [RoleHierarchyID], [EmployeeID], [RoleName], [RoleLevel], [StartDateInRole], [EndDateInRole], [IsLastRole], [IsActive], [CreatedByEmployeeID], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (5, N'/4/', 29, N'Chief Marketing Officer', N'Other Chiefs', CAST(N'2024-05-28T09:53:55.183' AS DATETIME), NULL, 1, 1, 2, CAST(N'2024-05-28T09:53:55.183' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeRoleHistory] ([RoleHistoryID], [RoleHierarchyID], [EmployeeID], [RoleName], [RoleLevel], [StartDateInRole], [EndDateInRole], [IsLastRole], [IsActive], [CreatedByEmployeeID], [CreatedTime], [ModifiedByEmployeeID], [ModifiedTime], [ModifiedReason]) VALUES (7, N'/5/', 10, N'Chief Marketing Officer', N'Other Chiefs', CAST(N'2024-05-28T10:06:28.907' AS DATETIME), NULL, 1, 1, 2, CAST(N'2024-05-28T10:06:28.907' AS DATETIME), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[stcLocation] ON 
GO













INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10000, N'Bangalore', N'Karnataka', N'560001', N'India', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.207' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10001, N'New York', N'New York', N'10001', N'USA', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.217' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10002, N'London', N'England', N'SW1A 1AA', N'United Kingdom', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.217' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10003, N'Paris', N'Île-de-France', N'75001', N'France', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.217' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10004, N'Sydney', N'New South Wales', N'2000', N'Australia', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.217' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10005, N'Tokyo', N'Tokyo', N'100-0001', N'Japan', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.217' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10006, N'Dubai', N'Dubai', N'00000', N'United Arab Emirates', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.220' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10007, N'Mumbai', N'Maharashtra', N'400001', N'India', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.220' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10008, N'Berlin', N'Berlin', N'10178', N'Germany', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.220' AS DATETIME), NULL, NULL, NULL)
GO
INSERT [dbo].[stcLocation] ([locationId], [City], [State], [Zipcode], [Country], [Planet], [IsActive], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedDate], [ModifiedReason]) VALUES (10009, N'Toronto', N'Ontario', N'M5G 2C2', N'Canada', N'Earth', NULL, N'SYSADMIN', CAST(N'2024-05-26T20:06:09.220' AS DATETIME), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[stcLocation] OFF
GO

INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'CEO', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Employees', 8, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Executive Directors', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Managers', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Other Chiefs', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'President', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Supervisors', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Vice Presidents', 3, 1, 'SYSADMIN')
GO













INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Chief Executive Officer', N'CEO', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Chief Financial Officer', N'Other Chiefs', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Chief Information Officer', N'Other Chiefs', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Chief Marketing Officer', N'Other Chiefs', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Chief Technology Officer', N'Other Chiefs', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Engineering', N'Executive Directors', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Finance', N'Executive Directors', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Human Resources', N'Executive Directors', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Legal', N'Executive Directors', 8, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Marketing', N'Executive Directors', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Operations', N'Executive Directors', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Research and Development', N'Executive Directors', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Director of Sales', N'Executive Directors', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Engineering', N'Employees', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Finance', N'Employees', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Human Resources', N'Employees', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Legal', N'Employees', 8, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Marketing', N'Employees', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Operations', N'Employees', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Research and Development', N'Employees', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Employee in Sales', N'Employees', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Intern in Engineering', N'Employees', 9, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Intern in Marketing', N'Employees', 10, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Engineering', N'Managers', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Finance', N'Managers', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Human Resources', N'Managers', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Legal', N'Managers', 8, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Marketing', N'Managers', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Operations', N'Managers', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Research and Development', N'Managers', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Manager of Sales', N'Managers', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Engineering', N'President', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Finance', N'President', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Human Resources', N'President', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Legal', N'President', 8, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Marketing', N'President', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Operations', N'President', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Research and Development', N'President', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'President of Sales', N'President', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Engineering', N'Supervisors', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Finance', N'Supervisors', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Human Resources', N'Supervisors', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Legal', N'Supervisors', 8, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Marketing', N'Supervisors', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Operations', N'Supervisors', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Research and Development', N'Supervisors', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Supervisor of Sales', N'Supervisors', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Vice President of Engineering', N'Vice Presidents', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Vice President of Finance', N'Vice Presidents', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Vice President of Marketing', N'Vice Presidents', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Vice President of Operations', N'Vice Presidents', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoles] ([Role], [RoleLevel], [SortOrder], [IsActive], [CreatedBy]) VALUES (N'Vice President of Sales', N'Vice Presidents', 3, 1, 'SYSADMIN')
GO














SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_CityStateCountryZipcodePlanet]    Script Date: 5/28/2024 11:35:59 AM ******/
ALTER TABLE [dbo].[stcLocation] ADD  CONSTRAINT [UC_CityStateCountryZipcodePlanet] UNIQUE NONCLUSTERED 
(
	[City] ASC,
	[State] ASC,
	[Country] ASC,
	[Zipcode] ASC,
	[Planet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeDetails] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeDetails] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[EmployeeRoleHistory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeRoleHistory] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[stcLocation] ADD  CONSTRAINT [DF_stcLocation_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[stcRoleLevel] ADD  CONSTRAINT [DF_stcRoleLevel_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[stcRoleLevel] ADD  CONSTRAINT [DF_stcRoleLevel_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[stcRoles] ADD  CONSTRAINT [DF_stcRoles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[stcRoles] ADD  CONSTRAINT [DF_stcRoles_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD FOREIGN KEY([CreatedByEmployeeID])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD FOREIGN KEY([ModifiedByEmployeeID])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRoleHistory]  WITH CHECK ADD FOREIGN KEY([CreatedByEmployeeID])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRoleHistory]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRoleHistory]  WITH CHECK ADD FOREIGN KEY([ModifiedByEmployeeID])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRoleHistory]  WITH CHECK ADD FOREIGN KEY([RoleName], [RoleLevel])
REFERENCES [dbo].[stcRoles] ([Role], [RoleLevel])
GO
ALTER TABLE [dbo].[stcRoles]  WITH CHECK ADD  CONSTRAINT [FK_stcRoles_stcRoleLevel] FOREIGN KEY([RoleLevel])
REFERENCES [dbo].[stcRoleLevel] ([RoleLevel])
GO
ALTER TABLE [dbo].[stcRoles] CHECK CONSTRAINT [FK_stcRoles_stcRoleLevel]
GO
