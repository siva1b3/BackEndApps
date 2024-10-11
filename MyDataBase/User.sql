
USE [MyDataBase]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
    [user_id] [INT] IDENTITY(1000,1) NOT NULL,
    [user_name] [VARCHAR](50) NOT NULL,
    [password_hash] [NVARCHAR](128) NOT NULL,
    [password_salt] [VARCHAR](32) NOT NULL,
    [two_factor_enabled] [BIT] NOT NULL,
    [last_password_reset_date] [DATETIME] NOT NULL,
    [last_login_time] [DATETIME] NULL,
    [is_active_account] [BIT] NOT NULL,
    [is_premium_account] [BIT] NOT NULL,
    [profile_picture_url] [NVARCHAR](255) NOT NULL,
    [created_id] [INT] NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](MAX) NULL,

    CONSTRAINT [PK_User__user_id]
    PRIMARY KEY CLUSTERED ([user_id] ASC),

    CONSTRAINT [UQ_User__user_name]
    UNIQUE NONCLUSTERED ([user_name])

) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[User]
ADD CONSTRAINT [DF_User__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO

INSERT INTO [dbo].[User] (
    [user_name],
    [password_hash],
    [password_salt],
    [two_factor_enabled],
    [last_password_reset_date],
    [last_login_time],
    [is_active_account],
    [is_premium_account],
    [profile_picture_url],
    [created_id],
    [modified_id],
    [modified_reason]
) VALUES 
('john_doe', 'hashed_password_1', 'salt_1', 0, GETDATE(), NULL, 1, 0, 'http://example.com/profiles/john.jpg', 1000, NULL, NULL),
('jane_smith', 'hashed_password_2', 'salt_2', 1, GETDATE(), GETDATE(), 1, 1, 'http://example.com/profiles/jane.jpg', 1000, NULL, NULL),
('alice_johnson', 'hashed_password_3', 'salt_3', 0, GETDATE(), NULL, 1, 0, 'http://example.com/profiles/alice.jpg', 1000, NULL, NULL),
('bob_brown', 'hashed_password_4', 'salt_4', 1, GETDATE(), GETDATE(), 1, 1, 'http://example.com/profiles/bob.jpg', 1000, NULL, NULL);


ALTER TABLE [MyDataBase].[dbo].[User]
ALTER COLUMN [created_id] [INT] NOT NULL

ALTER TABLE [MyDataBase].[dbo].[User]
WITH CHECK ADD CONSTRAINT [FK_User_User__created_id__user_id]
FOREIGN KEY ([created_id])
REFERENCES [MyDataBase].[dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[User]
CHECK CONSTRAINT [FK_User_User__created_id__user_id]
GO

ALTER TABLE [MyDataBase].[dbo].[User]
WITH CHECK ADD CONSTRAINT [FK_User_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [MyDataBase].[dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[User]
CHECK CONSTRAINT [FK_User_User__modified_id__user_id]
GO


SELECT [user_id]
    ,[user_name]
    ,[password_hash]
    ,[password_salt]
    ,[two_factor_enabled]
    ,[last_password_reset_date]
    ,[last_login_time]
    ,[is_active_account]
    ,[is_premium_account]
    ,[profile_picture_url]
    ,[created_id]
    ,[created_time]
    ,[modified_id]
    ,[modified_time]
    ,[modified_reason]
FROM [MyDataBase].[dbo].[User]
