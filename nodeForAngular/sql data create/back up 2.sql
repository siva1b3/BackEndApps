USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stcRoleLevel](
	[RoleLevel] [varchar](50) NOT NULL,
	[ManagementLevel] [INT] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedReason] [varchar](255) NULL,
 CONSTRAINT [PK_stcRoleLevel_RoleLevel] PRIMARY KEY CLUSTERED 
(
	[RoleLevel] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[stcRoleLevel] ADD  CONSTRAINT [DF_stcRoleLevel_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[stcRoleLevel] ADD  CONSTRAINT [DF_stcRoleLevel_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO


INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'CEO', 1, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Other Chiefs', 2, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Vice Presidents', 3, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'President', 4, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Executive Directors', 5, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Managers', 6, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Supervisors', 7, 1, 'SYSADMIN')
GO
INSERT [dbo].[stcRoleLevel] ([RoleLevel], [ManagementLevel], [IsActive], [CreatedBy]) VALUES (N'Employees', 8, 1, 'SYSADMIN')
GO








USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stcRoles](
	[Role] [VARCHAR](100) NOT NULL,
	[RoleLevel] [VARCHAR](50) NOT NULL,
	[SortOrder] [INT] NULL,
	[IsActive] [BIT] NOT NULL,
	[CreatedBy] [VARCHAR](50) NOT NULL,
	[CreatedTime] [DATETIME] NOT NULL,
	[ModifiedBy] [VARCHAR](50) NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [VARCHAR](255) NULL,
 CONSTRAINT [PK_stcRoles_Role] PRIMARY KEY CLUSTERED 
(
	[Role]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[stcRoles] ADD  CONSTRAINT [DF_stcRoles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[stcRoles] ADD  CONSTRAINT [DF_stcRoles_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO

ALTER TABLE [dbo].[stcRoles]  WITH CHECK ADD  CONSTRAINT [FK_stcRoles_stcRoleLevel_RoleLevel] FOREIGN KEY([RoleLevel])
REFERENCES [dbo].[stcRoleLevel] ([RoleLevel])
GO

ALTER TABLE [dbo].[stcRoles] CHECK CONSTRAINT [FK_stcRoles_stcRoleLevel_RoleLevel]
GO

CREATE UNIQUE INDEX IX_stcRoles_Role_RoleLevel ON [dbo].[stcRoles]([Role], [RoleLevel]);



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








USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stcLocation](
	[locationId] [INT] IDENTITY(10000,1) NOT NULL,
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

ALTER TABLE [dbo].[stcLocation] ADD  CONSTRAINT [DF_stcLocation_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[stcLocation] ADD  CONSTRAINT [DF_stcLocation_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO

ALTER TABLE [dbo].[stcLocation] ADD CONSTRAINT [UC_CityStateCountryZipcodePlanet] UNIQUE NONCLUSTERED 
(
	[City] ASC,
	[State] ASC,
	[Country] ASC,
	[Zipcode] ASC,
	[Planet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Bangalore', N'Karnataka', N'560001', N'India', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'New York', N'New York', N'10001', N'USA', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'London', N'England', N'SW1A 1AA', N'United Kingdom', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Paris', N'Île-de-France', N'75001', N'France', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Sydney', N'New South Wales', N'2000', N'Australia', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Tokyo', N'Tokyo', N'100-0001', N'Japan', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Dubai', N'Dubai', N'00000', N'United Arab Emirates', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Mumbai', N'Maharashtra', N'400001', N'India', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Berlin', N'Berlin', N'10178', N'Germany', N'Earth', N'SYSADMIN')
GO
INSERT [dbo].[stcLocation] ([City], [State], [Zipcode], [Country], [Planet], [CreatedBy]) VALUES (N'Toronto', N'Ontario', N'M5G 2C2', N'Canada', N'Earth', N'SYSADMIN')
GO






USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeDetails](
	[EmployeeID] [INT] IDENTITY(1,1) NOT NULL,
	[FullName] [VARCHAR](100) NULL,
	[Email] [VARCHAR](100) NULL,
	[Age] [INT] NULL,
	[Gender] [VARCHAR](10) NULL,
	[JoiningDate] [DATETIME] NULL,
	[LeavingDate] [DATETIME] NULL,
	[CreatedByEmployeeID] [INT] NOT NULL,
	[CreatedTime] [DATETIME] NOT NULL,
	[ModifiedByEmployeeID] [INT] NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [VARCHAR](255) NULL,
 CONSTRAINT [PK_EmployeeDetails_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmployeeDetails] ADD CONSTRAINT [DF_EmployeeDetails_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO

ALTER TABLE [dbo].[EmployeeDetails] WITH CHECK ADD CONSTRAINT [Fk_EmployeeDetails_CreatedByEmployeeID_EmployeeID] FOREIGN KEY ([CreatedByEmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID])

ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [Fk_EmployeeDetails_CreatedByEmployeeID_EmployeeID]

ALTER TABLE [dbo].[EmployeeDetails] WITH CHECK ADD CONSTRAINT [Fk_EmployeeDetails_ModifiedByEmployeeID_EmployeeID] FOREIGN KEY ([ModifiedByEmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID])

ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [Fk_EmployeeDetails_ModifiedByEmployeeID_EmployeeID]



INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'John Doe', N'john@example.com', 30, N'Male', CAST(N'2022-01-01T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Jane Smith', N'jane@example.com', 28, N'Female', CAST(N'2022-02-15T00:00:00.000' AS DATETIME), NULL, 2)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'David Johnson', N'david@example.com', 35, N'Male', CAST(N'2021-12-10T00:00:00.000' AS DATETIME), CAST(N'2023-03-20T00:00:00.000' AS DATETIME), 3)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Alice Johnson', N'alice@example.com', 29, N'Female', CAST(N'2022-03-05T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Michael Brown', N'michael@example.com', 32, N'Male', CAST(N'2022-04-12T00:00:00.000' AS DATETIME), NULL, 2)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Sarah Lee', N'sarah@example.com', 27, N'Female', CAST(N'2022-05-20T00:00:00.000' AS DATETIME), NULL, 3)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Christopher Wilson', N'chris@example.com', 35, N'Male', CAST(N'2021-11-15T00:00:00.000' AS DATETIME), NULL, 4)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Emily Martinez', N'emily@example.com', 31, N'Female', CAST(N'2022-06-30T00:00:00.000' AS DATETIME), NULL, 5)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Daniel Taylor', N'daniel@example.com', 33, N'Male', CAST(N'2022-07-10T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Jessica Garcia', N'jessica@example.com', 28, N'Female', CAST(N'2022-08-25T00:00:00.000' AS DATETIME), NULL, 2)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Matthew Rodriguez', N'matthew@example.com', 34, N'Male', CAST(N'2021-10-03T00:00:00.000' AS DATETIME), NULL, 3)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Ashley Smith', N'ashley@example.com', 30, N'Female', CAST(N'2022-09-15T00:00:00.000' AS DATETIME), NULL, 4)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'David Thomas', N'david@example.com', 36, N'Male', CAST(N'2022-10-20T00:00:00.000' AS DATETIME), NULL, 5)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Jennifer Jackson', N'jennifer@example.com', 26, N'Female', CAST(N'2022-11-10T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'James White', N'james@example.com', 37, N'Male', CAST(N'2022-12-05T00:00:00.000' AS DATETIME), NULL, 2)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Amanda Harris', N'amanda@example.com', 25, N'Female', CAST(N'2022-01-15T00:00:00.000' AS DATETIME), NULL, 3)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Robert Clark', N'robert@example.com', 38, N'Male', CAST(N'2022-02-20T00:00:00.000' AS DATETIME), NULL, 4)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Brittany Lopez', N'brittany@example.com', 24, N'Female', CAST(N'2021-09-30T00:00:00.000' AS DATETIME), NULL, 5)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'William Hall', N'william@example.com', 39, N'Male', CAST(N'2022-03-01T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Megan Young', N'megan@example.com', 23, N'Female', CAST(N'2022-04-10T00:00:00.000' AS DATETIME), NULL, 2)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Anthony King', N'anthony@example.com', 40, N'Male', CAST(N'2022-05-05T00:00:00.000' AS DATETIME), NULL, 3)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Stephanie Turner', N'stephanie@example.com', 22, N'Female', CAST(N'2021-08-20T00:00:00.000' AS DATETIME), NULL, 4)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'John Harris', N'john@example.com', 41, N'Male', CAST(N'2022-06-15T00:00:00.000' AS DATETIME), NULL, 5)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Nicole Rodriguez', N'nicole@example.com', 21, N'Female', CAST(N'2022-07-30T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Charles Martinez', N'charles@example.com', 42, N'Male', CAST(N'2022-08-05T00:00:00.000' AS DATETIME), NULL, 2)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Samantha Adams', N'samantha@example.com', 20, N'Female', CAST(N'2022-09-20T00:00:00.000' AS DATETIME), NULL, 3)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Andrew Wood', N'andrew@example.com', 43, N'Male', CAST(N'2022-10-25T00:00:00.000' AS DATETIME), NULL, 4)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Lauren Scott', N'lauren@example.com', 19, N'Female', CAST(N'2021-07-10T00:00:00.000' AS DATETIME), NULL, 5)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Ryan Green', N'ryan@example.com', 44, N'Male', CAST(N'2022-11-01T00:00:00.000' AS DATETIME), NULL, 1)
GO
INSERT [dbo].[EmployeeDetails] ( [FullName], [Email], [Age], [Gender], [JoiningDate], [LeavingDate], [CreatedByEmployeeID]) VALUES (N'Victoria Phillips', N'victoria@example.com', 18, N'Female', CAST(N'2022-12-10T00:00:00.000' AS DATETIME), NULL, 2)
GO




USE [TestMain];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.GetManagerIDByRoleHierarchyID (
    @RoleHierarchyID hierarchyid
)
RETURNS INT
AS
BEGIN
    DECLARE @EmployeeID INT;
    
    SELECT @EmployeeID = EmployeeID
    FROM [TestMain].[dbo].[EmployeeRoleHistory]
    WHERE RoleHierarchyID = @RoleHierarchyID.GetAncestor(1);
    
    RETURN @EmployeeID;
END;
GO



USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeRoleHistory](
	[RoleHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[RoleHierarchyID] [hierarchyid] NOT NULL,
	[EmployeeID] [int] NULL,
	[Role] [VARCHAR](100) NULL,
	[RoleLevel] [VARCHAR](50) NULL,
	[StartDateInRole] [DATETIME] NULL,
	[EndDateInRole] [DATETIME] NULL,
    [RoleHierarchyLevel]  AS ([RoleHierarchyID].[GetLevel]()) PERSISTED,
    [RoleHierarchyManager]  AS ([RoleHierarchyID].[GetAncestor](1)) PERSISTED,
	[IsLastRole] [BIT] NULL,
	[IsActive] [BIT] NULL,
	[CreatedByEmployeeID] [int] NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedByEmployeeID] [int] NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [nVARCHAR](255) NULL,
 CONSTRAINT [PK_EmployeeRoleHistory_RoleHistoryID] PRIMARY KEY CLUSTERED 
(
	[RoleHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] ADD  CONSTRAINT [DF_EmployeeRoleHistory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] ADD CONSTRAINT [DF_EmployeeRoleHistory_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] WITH CHECK ADD CONSTRAINT [Fk_EmployeeRoleHistory_EmployeeDetails_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID]) 
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] CHECK CONSTRAINT  [Fk_EmployeeRoleHistory_EmployeeDetails_EmployeeID] 
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] WITH CHECK ADD CONSTRAINT [Fk_EmployeeRoleHistory_EmployeeDetails_CreatedByEmployeeID_EmployeeID] FOREIGN KEY ([CreatedByEmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID])
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] CHECK CONSTRAINT  [Fk_EmployeeRoleHistory_EmployeeDetails_CreatedByEmployeeID_EmployeeID]
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] WITH CHECK ADD CONSTRAINT [Fk_EmployeeRoleHistory_EmployeeDetails_ModifiedByEmployeeID_EmployeeID] FOREIGN KEY ([ModifiedByEmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID])
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] CHECK CONSTRAINT  [Fk_EmployeeRoleHistory_EmployeeDetails_ModifiedByEmployeeID_EmployeeID]
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] WITH CHECK ADD CONSTRAINT [Fk_EmployeeRoleHistory_stcRoles_RoleRoleLevel] FOREIGN KEY ([Role],[RoleLevel]) REFERENCES [dbo].[stcRoles]([Role],[RoleLevel])
GO

ALTER TABLE [dbo].[EmployeeRoleHistory] CHECK CONSTRAINT [Fk_EmployeeRoleHistory_stcRoles_RoleRoleLevel]
GO


-- SELECT  
-- 	[df1].[EmployeeID]
-- 	, [df1].[RoleLevel] AS [EmpLevel]
-- 	, [df2].[EmployeeID] AS [ManagerID]
-- 	, [df2].[RoleLevel] AS [ManagerLevel]
-- INTO [dbo].[ParentChild]
-- FROM [TestMain].[dbo].[EmployeeRoleHistory] [df1]
-- LEFT JOIN [TestMain].[dbo].[EmployeeRoleHistory] [df2]
-- ON [df2].[RoleHierarchyID] = [df1].[RoleHierarchyID].GetAncestor(1)



INSERT INTO [TestMain].[dbo].[EmployeeRoleHistory]
([RoleHierarchyID]
,[EmployeeID]
,[Role]
,[RoleLevel]
,[StartDateInRole]
,[IsLastRole]
,[CreatedByEmployeeID])
VALUES
('/',1,'Chief Executive Officer','CEO',GETDATE(),1,1),
('/1/',2,'Chief Financial Officer','Other Chiefs',GETDATE(),1,1),
('/3/',3,'Chief Marketing Officer','Other Chiefs',GETDATE(),1,1),
('/4/',4,'Chief Technology Officer','Other Chiefs',GETDATE(),1,1),
('/4/1/',5,'Vice President of Engineering','Vice Presidents',GETDATE(),1,4),
('/4/2/',6,'Vice President of Engineering','Vice Presidents',GETDATE(),1,4),
('/1/1/',7,'Vice President of Finance','Vice Presidents',GETDATE(),1,1),
('/1/2/',8,'Vice President of Finance','Vice Presidents',GETDATE(),1,1),
('/3/1/',9,'Vice President of Marketing','Vice Presidents',GETDATE(),1,3),
('/3/2/',10,'Vice President of Sales','Vice Presidents',GETDATE(),1,3),
('/4/1/1/',11,'President of Engineering','President',GETDATE(),1,5),
('/4/1/2/',12,'President of Engineering','President',GETDATE(),1,5),
('/4/2/1/',13,'President of Engineering','President',GETDATE(),1,6),
('/4/2/2/',14,'President of Engineering','President',GETDATE(),1,6),
('/1/1/1/',15,'President of Finance','President',GETDATE(),1,7),
('/1/1/2/',16,'President of Finance','President',GETDATE(),1,7),
('/1/2/1/',17,'President of Finance','President',GETDATE(),1,8),
('/1/2/1/',18,'President of Finance','President',GETDATE(),1,8),
('/3/1/1/',19,'President of Marketing','President',GETDATE(),1,9),
('/3/1/2/',20,'President of Marketing','President',GETDATE(),1,9),
('/3/2/1/',21,'President of Sales','President',GETDATE(),1,10),
('/3/2/2/',22,'President of Sales','President',GETDATE(),1,10),
('/4/1/1/1/',23,'Director of Engineering','Executive Directors',GETDATE(),1,11),
('/4/1/1/2/',24,'Director of Engineering','Executive Directors',GETDATE(),1,11),
('/4/1/2/1/',25,'Director of Engineering','Executive Directors',GETDATE(),1,12),
('/4/1/2/2/',26,'Director of Engineering','Executive Directors',GETDATE(),1,12),





USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeAuth](
	[AuthID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
    [Password] [VARCHAR](20) NOT NULL,
    [AuthBeginDate] [DATETIME] NOT NULL,
    [AuthEndDate] [DATETIME] NOT NULL,
    [IsLatest] [BIT] NOT NULL,
	[CreatedByEmployeeID] [int] NULL,
	[CreatedTime] [DATETIME] NULL,
	[ModifiedByEmployeeID] [int] NULL,
	[ModifiedTime] [DATETIME] NULL,
	[ModifiedReason] [nVARCHAR](255) NULL,
 CONSTRAINT [PK_EmployeeAuth_AuthID] PRIMARY KEY CLUSTERED 
(
	[AuthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmployeeAuth] ADD  CONSTRAINT [DF_EmployeeAuth_IsLatest]  DEFAULT ((1)) FOR [IsLatest]
GO

ALTER TABLE [dbo].[EmployeeAuth] ADD CONSTRAINT [DF_EmployeeAuth_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO

ALTER TABLE [dbo].[EmployeeAuth] WITH CHECK ADD CONSTRAINT [Fk_EmployeeAuth_EmployeeDetails_EmployeeID] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID]) 
GO

ALTER TABLE [dbo].[EmployeeAuth] CHECK CONSTRAINT  [Fk_EmployeeAuth_EmployeeDetails_EmployeeID] 
GO

ALTER TABLE [dbo].[EmployeeAuth] WITH CHECK ADD CONSTRAINT [Fk_EmployeeAuth_EmployeeDetails_CreatedByEmployeeID_EmployeeID] FOREIGN KEY ([CreatedByEmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID])
GO

ALTER TABLE [dbo].[EmployeeAuth] CHECK CONSTRAINT  [Fk_EmployeeAuth_EmployeeDetails_CreatedByEmployeeID_EmployeeID]
GO

ALTER TABLE [dbo].[EmployeeAuth] WITH CHECK ADD CONSTRAINT [Fk_EmployeeAuth_EmployeeDetails_ModifiedByEmployeeID_EmployeeID] FOREIGN KEY ([ModifiedByEmployeeID]) REFERENCES [dbo].[EmployeeDetails]([EmployeeID])
GO


USE [TestMain]
GO

INSERT INTO [dbo].[EmployeeAuth]
           ([EmployeeID]
           ,[Password]
           ,[AuthBeginDate]
           ,[AuthEndDate]
           ,[IsLatest])
     VALUES
           (1,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (2,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (3,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (4,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (5,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (6,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (7,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (8,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (9,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (10,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (11,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (12,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (13,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1),
           (14,'siva',GETDATE(),DATEADD(MONTH,6,GETDATE()),1)
GO













