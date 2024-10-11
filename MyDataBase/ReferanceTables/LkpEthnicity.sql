USE [MyDataBase]
GO 

SET ANSI_NULLS ON 
GO 

SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [dbo].[LkpEthnicity] (
    [ethnicity] [VARCHAR](50) NOT NULL,
    [is_active] [BIT] NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_name] [NVARCHAR](122) NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_name] [NVARCHAR](122) NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](255) NULL,
    
    CONSTRAINT [PK_LkpEthnicity__ethinicity]
    PRIMARY KEY CLUSTERED ([ethnicity] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpEthnicity]
ADD CONSTRAINT [DF_LkpEthnicity__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO 

ALTER TABLE [MyDataBase].[dbo].[LkpEthnicity]
ADD CONSTRAINT [DF_LkpEthnicity__is_active]
DEFAULT ((1))
FOR [is_active]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpEthnicity]
WITH CHECK ADD CONSTRAINT [FK_LkpEthnicity_User__created_id__user_id]
FOREIGN KEY ([created_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpEthnicity]
CHECK CONSTRAINT [FK_LkpEthnicity_User__created_id__user_id]
GO


ALTER TABLE [MyDataBase].[dbo].[LkpEthnicity]
WITH CHECK ADD CONSTRAINT [FK_LkpEthnicity_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpEthnicity]
CHECK CONSTRAINT [FK_LkpEthnicity_User__modified_id__user_id]
GO


INSERT INTO [MyDataBase].[dbo].[LkpEthnicity]
([ethnicity],[created_id])
VALUES
('Hispanic or Latino',1003),
('Non-Hispanic White',1003),
('Black or African American',1003),
('Asian',1003),
('Native American',1003),
('Pacific Islander',1003),
('Mixed Race',1003),
('Middle Eastern',1003),
('Southeast Asian',1003),
('European',1003);


SELECT [ethnicity]
FROM [MyDataBase].[dbo].[LkpEthnicity]
WHERE [is_active] = 1

