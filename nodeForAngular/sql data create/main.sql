
USE [TestMain]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TestHierachy](
	[EmpId] [int] NOT NULL,
	[EmpName] [varchar](100) NULL,
	[ManagerId] [int] NOT NULL,
	[OrgNode] [hierarchyid] NOT NULL
) ON [PRIMARY]
GO

INSERT INTO [TestMain].[dbo].[TestHierachy]
([EmpId],[EmpName],[ManagerId],[OrgNode])
VALUES
(1,'CEO',0,'/'),
(2,'tech manager1',1,'/1/'),
(3,'Sales manager2',1,'/2/'),
(4,'staff enginneer 1',2,'/1/1/'),
(5,'staff enginneer 2',2,'/1/2/'),
(6,'staff enginneer 3',2,'/1/3/'),
(7,'Sales executive 1',3,'/2/1/'),
(8,'Sales executive 2',3,'/2/2/'),
(9,'Sales executive 3',3,'/2/3/'),
(10,'team 1 senior enginneer 1',4,'/1/1/1/'),
(11,'team 1 senior enginneer 2',4,'/1/1/2/'),
(12,'team 1 senior enginneer 3',4,'/1/1/3/'),
(13,'team 2 senior enginneer 1',5,'/1/2/1/'),
(14,'team 2 senior enginneer 2',5,'/1/2/2/'),
(15,'team 2 senior enginneer 3',5,'/1/2/3/'),
(16,'Sales Team 1 emp 1',7,'/2/1/1/'),
(17,'Sales Team 1 emp 2',7,'/2/1/2/'),
(18,'Sales Team 1 emp 3',7,'/2/1/3/'),
(19,'Sales Team 1 emp 1',8,'/2/2/1/'),
(20,'Sales Team 1 emp 2',8,'/2/2/2/'),
(21,'Sales Team 1 emp 3',8,'/2/2/3/'),
(22,'team 1 enginneer 1',10,'/1/1/1/1/'),
(23,'team 1 enginneer 2',10,'/1/1/1/2/'),
(24,'team 1 enginneer 3',10,'/1/1/1/3/'),
(25,'team 1 enginneer 4',11,'/1/1/2/1/'),
(26,'team 1 enginneer 5',11,'/1/1/2/2/'),
(27,'team 1 enginneer 6',11,'/1/1/2/3/'),
(28,'team 1 enginneer 7',12,'/1/1/3/1/'),
(29,'team 1 enginneer 8',12,'/1/1/3/2/'),
(30,'team 1 enginneer 9',12,'/1/1/3/3/'),
(31,'level 4 enginneer 1',22,'/1/1/1/1/1/'),
(32,'level 4 enginneer 2',22,'/1/1/1/1/2/'),
(33,'level 4 enginneer 3',22,'/1/1/1/1/3/'),
(34,'level 4 enginneer 4',23,'/1/1/1/2/1/'),
(35,'level 4 enginneer 5',23,'/1/1/1/2/2/'),
(36,'level 4 enginneer 6',23,'/1/1/1/2/3/'),
(37,'level 4 enginneer 7',24,'/1/1/1/3/1/'),
(38,'level 4 enginneer 8',24,'/1/1/1/3/2/'),
(39,'level 4 enginneer 9',24,'/1/1/1/3/3/'),
(40,'level 4 enginneer 10',25,'/1/1/2/1/1/'),
(41,'level 4 enginneer 11',25,'/1/1/2/1/2/'),
(42,'level 4 enginneer 12',25,'/1/1/2/1/3/'),
(43,'level 4 enginneer 13',26,'/1/1/2/2/1/'),
(44,'level 4 enginneer 14',26,'/1/1/2/2/2/'),
(45,'level 4 enginneer 15',26,'/1/1/2/2/3/'),
(46,'level 4 enginneer 16',27,'/1/1/2/3/1/'),
(47,'level 4 enginneer 17',27,'/1/1/2/3/2/'),
(48,'level 4 enginneer 18',27,'/1/1/2/3/3/'),
(49,'level 4 enginneer 19',28,'/1/1/3/1/1/'),
(50,'level 4 enginneer 20',28,'/1/1/3/1/2/')
(51,'extra 1',4,'/3/1/'),
(52,'extra 2',4,'/3/2/'),

SELECT 
    EmpId
    , OrgNode
    , OrgNode.ToString()
    , ManagerId
    , OrgNode.GetLevel()
FROM [TestMain].[dbo].[TestHierachy]



CREATE TABLE EmployeesNew (
    empId INT NOT NULL PRIMARY KEY,
    empName NVARCHAR(50) NOT NULL,
    empHierarchy hierarchyid NOT NULL,
    empLevel AS empHierarchy.GetLevel(),
    UNIQUE(empHierarchy)
);


DECLARE @CEO hierarchyid = hierarchyid::GetRoot();

-- Insert the CEO
INSERT INTO EmployeesNew (empId, empName, empHierarchy)
VALUES (1, 'CEO', @CEO);

SELECT @CEO = empHierarchy FROM EmployeesNew WHERE empId = 1

DECLARE @vpSales hierarchyid = @CEO.GetDescendant(NULL, NULL);
DECLARE @vpTech hierarchyid = @CEO.GetDescendant(@vpSales, NULL);
DECLARE @vpFinance hierarchyid = @CEO.GetDescendant(@vpTech, NULL);

-- Insert Level 2 employeesNew
INSERT INTO EmployeesNew (empId, empName, empHierarchy)
VALUES 
(2, 'vpSales', @vpSales),
(3, 'vpTech', @vpTech),
(4, 'vpFinance', @vpFinance);

SELECT @vpSales = empHierarchy FROM EmployeesNew WHERE empId = 2

-- Insert Level 3 employeesNew under vpSales
DECLARE @SalesExec1 hierarchyid = @vpSales.GetDescendant(NULL, NULL);
DECLARE @SalesExec2 hierarchyid = @vpSales.GetDescendant(@SalesExec1, NULL);
DECLARE @SalesExec3 hierarchyid = @vpSales.GetDescendant(@SalesExec2, NULL);

INSERT INTO EmployeesNew (empId, empName, empHierarchy)
VALUES 
(5, 'SalesExec1', @SalesExec1),
(6, 'SalesExec2', @SalesExec2),
(7, 'SalesExec3', @SalesExec3);

SELECT @vpTech = empHierarchy FROM EmployeesNew WHERE empId = 3

-- Insert Level 3 employeesNew under vpTech
DECLARE @SQLDev1 hierarchyid = @vpTech.GetDescendant(NULL, NULL);
DECLARE @SQLDev2 hierarchyid = @vpTech.GetDescendant(@SQLDev1, NULL);
DECLARE @SQLDev3 hierarchyid = @vpTech.GetDescendant(@SQLDev2, NULL);

INSERT INTO EmployeesNew (empId, empName, empHierarchy)
VALUES 
(8, 'SQLDev1', @SQLDev1),
(9, 'SQLDev2', @SQLDev2),
(10, 'SQLDev3', @SQLDev3);

-- Insert Level 3 employeesNew under vpFinance
DECLARE @Accountant1 hierarchyid = @vpFinance.GetDescendant(NULL, NULL);
DECLARE @Accountant2 hierarchyid = @vpFinance.GetDescendant(@Accountant1, NULL);

INSERT INTO EmployeesNew (empId, empName, empHierarchy)
VALUES 
(11, 'Accountant1', @Accountant1),
(12, 'Accountant2', @Accountant2);
