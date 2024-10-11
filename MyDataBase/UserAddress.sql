USE [MyDataBase]
GO 

SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [dbo].[UserAddress] (
    [user_address_id] INT IDENTITY(1000,1) NOT NULL,
    [user_id] INT NOT NULL,
    [street] NVARCHAR(100) NULL,
    [zip_code] INT NULL,
    [city] VARCHAR(50) NULL,
    [county] VARCHAR(50) NULL,
    [state] VARCHAR(50) NULL,
    [country] VARCHAR(50) NULL,
    [is_current_address] BIT NOT NULL,
    [begin_date] [DATE] NOT NULL,
    [begin_time] [TIME](0) NOT NULL,
    [end_date] [DATE] NOT NULL,
    [end_time] [TIME](0) NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](MAX) NULL,

    CONSTRAINT [PK_UserAddress__user_address_id]
    PRIMARY KEY CLUSTERED ([user_address_id] ASC)

) ON [PRIMARY]
GO 

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
ADD CONSTRAINT [DF_UserAddress__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
ADD CONSTRAINT [DF_UserAddress__end_date]
DEFAULT (CAST('3000-12-31' AS DATE))
FOR [end_date]
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
ADD CONSTRAINT [DF_UserAddress__end_time]
DEFAULT (CAST('23:59:59' AS TIME(0)))
FOR [end_time]
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
ADD CONSTRAINT [DF_UserAddress__is_current_address]
DEFAULT ((1))
FOR [is_current_address]
GO


ALTER TABLE [MyDataBase].[dbo].[UserAddress]
WITH CHECK ADD CONSTRAINT [FK_UserAddress_User__user_id]
FOREIGN KEY ([user_id])
REFERENCES [dbo].[User]([user_id])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
CHECK CONSTRAINT [FK_UserAddress_User__user_id]
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
WITH CHECK ADD CONSTRAINT [FK_UserAddress_User__Created_ID__user_id]
FOREIGN KEY ([Created_ID])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
CHECK CONSTRAINT [FK_UserAddress_User__Created_ID__user_id]
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
WITH CHECK ADD CONSTRAINT [FK_UserAddress_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
CHECK CONSTRAINT [FK_UserAddress_User__modified_id__user_id]
GO

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
WITH CHECK ADD CONSTRAINT [FK_UserAddress_LkpLocation__zip_code__city__county__state__country]
FOREIGN KEY ([zip_code], [city], [county], [state], [country])
REFERENCES [dbo].[LkpLocation] ([zip_code], [city], [county], [state], [country])
ON UPDATE CASCADE
GO 

ALTER TABLE [MyDataBase].[dbo].[UserAddress]
CHECK CONSTRAINT [FK_UserAddress_LkpLocation__zip_code__city__county__state__country]
GO

SELECT [user_address_id]
    ,[user_id]
    ,[street]
    ,[zip_code]
    ,[city]
    ,[county]
    ,[state]
    ,[country]
    ,[is_current_address]
    ,[begin_date]
    ,[begin_time]
    ,[end_date]
    ,[end_time]
    ,[created_id]
    ,[created_time]
    ,[modified_id]
    ,[modified_time]
    ,[modified_reason]
FROM [MyDataBase].[dbo].[UserAddress]


