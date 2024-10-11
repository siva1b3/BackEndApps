USE [MyDataBase]
GO 

SET ANSI_NULLS ON 
GO 

SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [dbo].[LkpLocation] (
    [zip_code] INT NOT NULL,
    [city] VARCHAR(50) NOT NULL,
    [county] VARCHAR(50) NOT NULL,
    [state] VARCHAR(50) NOT NULL,
    [country] VARCHAR(50) NOT NULL,
    [is_active] [BIT] NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_name] [NVARCHAR](122) NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_name] [NVARCHAR](122) NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](255) NULL,
    
    CONSTRAINT [PK_LkpLocation__country]
    PRIMARY KEY CLUSTERED ([zip_code],[city],[county],[state],[country])
    
) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpLocation]
ADD CONSTRAINT [DF_LkpLocation__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO 

ALTER TABLE [MyDataBase].[dbo].[LkpLocation]
ADD CONSTRAINT [DF_LkpLocation__is_active]
DEFAULT ((1))
FOR [is_active]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpLocation]
WITH CHECK ADD CONSTRAINT [FK_LkpLocation_User__created_id__user_id]
FOREIGN KEY ([created_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpLocation]
CHECK CONSTRAINT [FK_LkpLocation_User__created_id__user_id]
GO


ALTER TABLE [MyDataBase].[dbo].[LkpLocation]
WITH CHECK ADD CONSTRAINT [FK_LkpLocation_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpLocation]
CHECK CONSTRAINT [FK_LkpLocation_User__modified_id__user_id]
GO

INSERT INTO [dbo].[LkpLocation] 
    ([zip_code], [city], [county], [state], [country], [is_active], [created_id], [created_name], [created_time]) 
VALUES 
    (110001, 'New York', 'New York', 'NY', 'USA', 1, 1001, NULL, GETDATE()),
    (290001, 'Los Angeles', 'Los Angeles', 'CA', 'USA', 1, 1001, NULL, GETDATE()),
    (360601, 'Chicago', 'Cook', 'IL', 'USA', 1, 1001, NULL, GETDATE()),
    (433101, 'Miami', 'Miami-Dade', 'FL', 'USA', 1, 1001, NULL, GETDATE()),
    (577001, 'Houston', 'Harris', 'TX', 'USA', 1, 1001, NULL, GETDATE()),
    (611223, 'Brooklyn', 'Kings', 'NY', 'USA', 1, 1001, NULL, GETDATE()),
    (733139, 'Miami Beach', 'Miami-Dade', 'FL', 'USA', 1, 1001, NULL, GETDATE()),
    (894103, 'San Francisco', 'San Francisco', 'CA', 'USA', 1, 1001, NULL, GETDATE()),
    (973301, 'Austin', 'Travis', 'TX', 'USA', 1, 1001, NULL, GETDATE()),
    (002101, 'Boston', 'Suffolk', 'MA', 'USA', 1, 1001, NULL, GETDATE()),
    (130301, 'Atlanta', 'Fulton', 'GA', 'USA', 1, 1001, NULL, GETDATE()),
    (248201, 'Detroit', 'Wayne', 'MI', 'USA', 1, 1001, NULL, GETDATE()),
    (360290, 'Chicago', 'Cook', 'IL', 'USA', 1, 1001, NULL, GETDATE()),
    (473301, 'Austin', 'Travis', 'TX', 'USA', 1, 1001, NULL, GETDATE()),
    (592101, 'San Diego', 'San Diego', 'CA', 'USA', 1, 1001, NULL, GETDATE()),
    (655401, 'Minneapolis', 'Hennepin', 'MN', 'USA', 1, 1001, NULL, GETDATE()),
    (764101, 'Kansas City', 'Jackson', 'MO', 'USA', 1, 1001, NULL, GETDATE()),
    (877002, 'Houston', 'Harris', 'TX', 'USA', 1, 1001, NULL, GETDATE()),
    (946201, 'Indianapolis', 'Marion', 'IN', 'USA', 1, 1001, NULL, GETDATE()),
    (094107, 'San Francisco', 'San Francisco', 'CA', 'USA', 1, 1001, NULL, GETDATE()),
    (198101, 'Seattle', 'King', 'WA', 'USA', 1, 1001, NULL, GETDATE()),
    (220785, 'Hyattsville', 'Prince Georges', 'MD', 'USA', 1, 1001, NULL, GETDATE()),
    (360605, 'Chicago', 'Cook', 'IL', 'USA', 1, 1001, NULL, GETDATE()),
    (437201, 'Nashville', 'Davidson', 'TN', 'USA', 1, 1001, NULL, GETDATE()),
    (543215, 'Columbus', 'Franklin', 'OH', 'USA', 1, 1001, NULL, GETDATE()),
    (602110, 'Boston', 'Suffolk', 'MA', 'USA', 1, 1001, NULL, GETDATE()),
    (730303, 'Atlanta', 'Fulton', 'GA', 'USA', 1, 1001, NULL, GETDATE()),
    (889101, 'Las Vegas', 'Clark', 'NV', 'USA', 1, 1001, NULL, GETDATE());


SELECT [zip_code]
    ,[city]
    ,[county]
    ,[state]
    ,[country]
FROM [MyDataBase].[dbo].[LkpLocation]
WHERE [is_active] = 1


