USE [MyDataBase]
GO 

SET ANSI_NULLS ON 
GO 

SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [dbo].[LkpRace] (
    [race] [VARCHAR](50) NOT NULL,
    [is_active] [BIT] NOT NULL,
    [created_id] [INT] NOT NULL,
    [created_name] [NVARCHAR](122) NULL,
    [created_time] [DATETIME] NOT NULL,
    [modified_id] [INT] NULL,
    [modified_name] [NVARCHAR](122) NULL,
    [modified_time] [DATETIME] NULL,
    [modified_reason] [VARCHAR](255) NULL,
    
    CONSTRAINT [PK_LkpRace__race]
    PRIMARY KEY CLUSTERED ([race] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpRace]
ADD CONSTRAINT [DF_LkpRace__created_time]
DEFAULT GETDATE()
FOR [created_time]
GO 

ALTER TABLE [MyDataBase].[dbo].[LkpRace]
ADD CONSTRAINT [DF_LkpRace__is_active]
DEFAULT ((1))
FOR [is_active]
GO

ALTER TABLE [MyDataBase].[dbo].[LkpRace]
WITH CHECK ADD CONSTRAINT [FK_LkpRace_User__created_id__user_id]
FOREIGN KEY ([created_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpRace]
CHECK CONSTRAINT [FK_LkpRace_User__created_id__user_id]
GO


ALTER TABLE [MyDataBase].[dbo].[LkpRace]
WITH CHECK ADD CONSTRAINT [FK_LkpRace_User__modified_id__user_id]
FOREIGN KEY ([modified_id])
REFERENCES [dbo].[User]([user_id])
GO

ALTER TABLE [MyDataBase].[dbo].[LkpRace]
CHECK CONSTRAINT [FK_LkpRace_User__modified_id__user_id]
GO


INSERT INTO [MyDataBase].[dbo].[LkpRace]
([race],[created_id])
VALUES
('Latino',1001),
('African American',1001),
('Asian',1001),
('Native American',1001),
('Pacific Islander',1001),
('Biracial',1001),
('Middle Eastern',1001),
('Southeast Asian',1001),
('Caucasian',1001);


SELECT [race]
FROM [MyDataBase].[dbo].[LkpRace]
WHERE [is_active] = 1

