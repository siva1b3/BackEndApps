USE [MyDataBase]
GO 

SET ANSI_NULLS ON 
GO 

SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [dbo].[LkpBloodGroup] (
    [blood_group] [VARCHAR](7) NOT NULL,
    [is_active] [BIT] NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_name] [NVARCHAR](MAX) NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_name] [NVARCHAR](MAX) NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](MAX) NULL,
    
    CONSTRAINT [PK_LkpBloodGroup__blood_group]
    PRIMARY KEY CLUSTERED ([blood_group] ASC)

) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpBloodGroup]
ADD CONSTRAINT [DF_LkpBloodGroup__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO 

ALTER TABLE [MyDataBase].[dbo].[LkpBloodGroup]
ADD CONSTRAINT [DF_LkpBloodGroup__is_active]
DEFAULT ((1))
FOR [is_active]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpBloodGroup]
WITH CHECK ADD CONSTRAINT [FK_LkpBloodGroup_User__created_id__user_id]
FOREIGN KEY ([created_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpBloodGroup]
CHECK CONSTRAINT [FK_LkpBloodGroup_User__created_id__user_id]
GO


ALTER TABLE [MyDataBase].[dbo].[LkpBloodGroup]
WITH CHECK ADD CONSTRAINT [FK_LkpBloodGroup_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpBloodGroup]
CHECK CONSTRAINT [FK_LkpBloodGroup_User__modified_id__user_id]
GO


INSERT INTO [MyDataBase].[dbo].[LkpBloodGroup]
([blood_group],[created_id])
VALUES
('A+',1002),
('O-',1002),
('B+',1002),
('AB-',1002),
('O+',1002),
('A-',1002),
('B-',1002),
('AB+',1002);


SELECT [blood_group]
FROM [MyDataBase].[dbo].[LkpBloodGroup]
WHERE [is_active] = 1

