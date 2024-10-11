USE [MyDataBase]
GO 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserDetail](
    [user_detail_id] [INT] IDENTITY(1000,1) NOT NULL,
    [user_id] [INT] NOT NULL,
    [first_name] [NVARCHAR](40) NOT NULL,
    [last_name] [NVARCHAR](40) NULL,
    [middle_name] [NVARCHAR](40) NULL,
    [full_name] AS (
        CASE
            WHEN [middle_name] IS NULL AND [last_name] IS NULL 
            THEN [first_name]
            WHEN [middle_name] IS NULL AND [last_name] IS NOT NULL 
            THEN [last_name] + ' ' + [first_name]
            WHEN [middle_name] IS NOT NULL AND [last_name] IS NULL 
            THEN [middle_name] + ' ' + [first_name]
            ELSE [last_name] + ' ' + [middle_name] + ' ' + [first_name]
        END
    ) PERSISTED,
    [date_of_birth] [DATETIME] NOT NULL,
    [gender] [VARCHAR](50) NOT NULL,
    [ethnicity] [VARCHAR](50) NULL,
    [race] [VARCHAR](50) NULL,
    [blood_group] [VARCHAR](7) NULL,
    [is_latest] [BIT] NOT NULL,
    [begin_date] [DATE] NOT NULL,
    [begin_time] [TIME](0) NOT NULL,
    [end_date] [DATE] NOT NULL,
    [end_time] [TIME](0) NOT NULL,
    [email_id] [VARCHAR](50) NOT NULL,
    [phone_number] [VARCHAR](15) NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](MAX) NULL,

    CONSTRAINT [PK_UserDetail__user_detail_id]
    PRIMARY KEY CLUSTERED ([user_detail_id] ASC),

    CONSTRAINT [UQ_UserDetail__email_id]
    UNIQUE NONCLUSTERED ([email_id]),

    CONSTRAINT [UQ_UserDetail__phone_number]
    UNIQUE NONCLUSTERED ([phone_number])

) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
ADD CONSTRAINT [DF_UserDetail__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
ADD CONSTRAINT [DF_UserDetail__end_date]
DEFAULT (CAST('3000-12-31' AS DATE))
FOR [end_date]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
ADD CONSTRAINT [DF_UserDetail__end_time]
DEFAULT (CAST('23:59:59' AS TIME(0)))
FOR [end_time]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
ADD CONSTRAINT [DF_UserDetail__is_latest]
DEFAULT ((1))
FOR [is_latest]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_User__user_id]
FOREIGN KEY ([user_id])
REFERENCES [dbo].[User]([user_id])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_User__user_id]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_User__Created_ID__user_id]
FOREIGN KEY ([Created_ID])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_User__Created_ID__user_id]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_User__modified_id__user_id]
GO


ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_LkpBloodGroup__blood_group]
FOREIGN KEY ([blood_group])
REFERENCES [dbo].[LkpBloodGroup]([blood_group])
ON UPDATE CASCADE
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_LkpBloodGroup__blood_group]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_LkpRace__race]
FOREIGN KEY ([race])
REFERENCES [dbo].[LkpRace]([race])
ON UPDATE CASCADE
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_LkpRace__race]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_LkpEthnicity__ethinicity]
FOREIGN KEY ([ethnicity])
REFERENCES [dbo].[LkpEthnicity]([ethnicity])
ON UPDATE CASCADE
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_LkpEthnicity__ethinicity]
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
WITH CHECK ADD CONSTRAINT [FK_UserDetail_LkpGender__gender]
FOREIGN KEY ([gender])
REFERENCES [dbo].[LkpGender]([gender])
ON UPDATE CASCADE
GO

ALTER TABLE [MyDataBase].[dbo].[UserDetail]
CHECK CONSTRAINT [FK_UserDetail_LkpGender__gender]
GO

SELECT [user_detail_id]
    ,[user_id]
    ,[first_name]
    ,[last_name]
    ,[middle_name]
    ,[full_name]
    ,[date_of_birth]
    ,[gender]
    ,[ethnicity]
    ,[race]
    ,[blood_group]
    ,[is_latest]
    ,[begin_date]
    ,[begin_time]
    ,[end_date]
    ,[end_time]
    ,[email_id]
    ,[phone_number]
    ,[created_id]
    ,[created_time]
    ,[modified_id]
    ,[modified_time]
    ,[modified_reason]
FROM [MyDataBase].[dbo].[UserDetail]

