

-- Homework 1: Use a Temporary Table
-- Create a temporary table to store employees hired in the last year and their department names.
-- Then return the contents of the temporary table.
-- DDL Script for Tables

create database hw2ndmnth5thlssn

use hw2ndmnth5thlssn

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, HireDate, Salary) VALUES
(101, 'Alice', 1, '2022-01-15', 60000.00),
(102, 'Bob', 2, '2021-06-20', 75000.00),
(103, 'Charlie', 3, '2020-03-01', 50000.00),
(104, 'Diana', 2, '2019-07-10', 80000.00),
(105, 'Eve', 1, '2023-02-25', 55000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');


select * from Employees
select * from Departments

--------------------------------------------------------------------------------
create table ##EmployeesHiredLastYear (
    Name nvarchar(max),
    HireDate date,
    DepartmentName nvarchar(max)
) 
insert into ##EmployeesHiredLastYear
select
    e.Name,
    e.HireDate,
    d.DepartmentName
from
    Employees e
join
    Departments d ON e.DepartmentID = d.departmentID
where
    e.HireDate >= DATEADD(year, -2, GETDATE());

SELECT * FROM ##EmployeesHiredLastYear;
---------------------------------------------------------------------------------------------
-- Homework 2: Advanced Stored Procedure
-- Create a stored procedure that assigns an employee to a project.
-- Input: EmployeeID, ProjectID, HoursWorked
-- Output: Success/Failure Message

alter procedure AssignEmployeeToProject 
@employeeID int,
@projectID int

as 
Begin
insert into Employees (EmployeeID)  values (@employeeID)
insert into EmployeeProjects values (@employeeID,@projectID,0)
if exists(select EmployeeID from Employees where EmployeeID = @employeeID) and
  exists(select projectID from projects as P where P.ProjectID = @projectID )
  --insert into EmployeeProjects values (@employeeID,@projectID,0)
  print concat('Success',' ', @employeeID, ' ','Employee',' ', 'is successfullefy inserted to', ' ', @projectID,' ', 'Project')
  
else
print  'Fail'

end


exec AssignEmployeeToProject @employeeID = 116, @projectID = 203
 





____________________________________________________________________________
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate) VALUES
(201, 'Project Alpha', '2023-01-01', '2023-12-31'),
(202, 'Project Beta', '2022-05-15', NULL),
(203, 'Project Gamma', '2021-09-01', '2022-12-31');

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(101, 201, 120),
(102, 202, 200),
(103, 203, 150),
(104, 201, 100),
(105, 202, 180);


SELECT * FROM EmployeeProjects;
select * from Employees
select * from Departments
select * from Projects;


----------------------------------------------------------------------------------------------
-- Homework 3: Create a View for Analysis
-- Create a view that lists all active projects (projects that have not ended yet)
-- and the number of employees assigned to each project
----------------------------------------------------------------------------------------------------------------
create view ActiveProjectEmployeeCount as
select
    p.ProjectName,
    count(ep.EmployeeID) as NumberOfEmployees
from Projects p left join
    EmployeeProjects ep on p.ProjectID = ep.ProjectID
where p.EndDate IS NULL OR p.EndDate > GETDATE() 
group by p.ProjectName;
-- To test the view:
select * from ActiveProjectEmployeeCount;
