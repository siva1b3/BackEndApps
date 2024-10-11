USE [MyDataBase]
GO 

SET ANSI_NULLS ON 
GO 

SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [dbo].[LkpGender] (
    [gender] [VARCHAR](50) NOT NULL,
    [is_active] [BIT] NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_name] [NVARCHAR](122) NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_name] [NVARCHAR](122) NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](255) NULL,
    
    CONSTRAINT [PK_LkpGender__gender]
    PRIMARY KEY CLUSTERED ([gender] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpGender]
ADD CONSTRAINT [DF_LkpGender__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO 

ALTER TABLE [MyDataBase].[dbo].[LkpGender]
ADD CONSTRAINT [DF_LkpGender__is_active]
DEFAULT ((1))
FOR [is_active]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpGender]
WITH CHECK ADD CONSTRAINT [FK_LkpGender_User__created_id__user_id]
FOREIGN KEY ([created_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpGender]
CHECK CONSTRAINT [FK_LkpGender_User__created_id__user_id]
GO


ALTER TABLE [MyDataBase].[dbo].[LkpGender]
WITH CHECK ADD CONSTRAINT [FK_LkpGender_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpGender]
CHECK CONSTRAINT [FK_LkpGender_User__modified_id__user_id]
GO


INSERT INTO [MyDataBase].[dbo].[LkpGender]
([gender],[created_id])
VALUES
('Male',1001),
('Female',1001),
('Non-binary',1001),
('Genderqueer',1001),
('Agender',1001),
('Genderfluid',1001),
('Two-Spirit',1001),
('Other',1001);


SELECT [gender]
FROM [MyDataBase].[dbo].[LkpGender]
WHERE [is_active] = 1

