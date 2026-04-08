--1
create table EMPLOYEE ( EmployeeID serial,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
PhoneNumber bigint,
HireDate date,
Salary numeric(10,2),
DepartmentID int,
IsActive bool,
JobTitle varchar(100)
)
--2
insert into EMPLOYEE
(FirstName,LastName,Email,PhoneNumber,HireDate,Salary,DepartmentID,IsActive,JobTitle)
values ('Rohan', 'Chauhan', 'rohan.chauhan@gmail.com', 856483210, '2022-01-15', 55500.00,
101, TRUE, 'Software Engineer'),
('Pritesh', 'joshi', 'pritesh.joshi@gmail.com', 5689456823, '2021-07-10', 52000.00, 102,
TRUE, 'Developer'),
('Rakesh', 'Tank', 'rakesh.tank@gmail.com', 8546974125, '2020-03-22', 48000.00, 103, TRUE,
'Project Manage'),
('Sumit', 'Gada', 'sumit.gada@gmail.com',2365485213, '2023-06-01', 60000.00, 101, TRUE,
'Junior Developer'),
('Karan', 'Mehta', 'karan.mehta@gmail.com', 9871234567, '2019-11-30', 75000.00, 104,
FALSE, 'Senior Analyst')
SET datestyle = 'ISO, DMY';

--3
copy EMPLOYEE from 'D:\SQL SOFTRONIX\Excel,csv files\Employee_Details1.csv' DELIMITER ',' CSV
HEADER

--4
update EMPLOYEE set DepartmentID=0 where IsActive= FALSE

--5
UPDATE EMPLOYEE SET Salary = Salary * 1.08 WHERE IsActive = FALSE AND
DepartmentID= 0 AND JobTitle IN ('HR Manager')

--6
select FirstName as NAME,LastName as SURNAME from EMPLOYEE where salary
between 30000 and 50000

--7
select * from EMPLOYEE where FirstName like '%A%'

--8
delete from EMPLOYEE where EmployeeID between 1 and 5

9.1
alter table EMPLOYEE rename to Employee_Database
--9.2
alter table Employee_Database rename column FirstName to NAME
alter table Employee_Database rename column LastName to SURNAME

10.1
alter table Employee_Database add column STATE varchar not null default 'INDIA'

10.2
update Employee_Database set STATE= 'USA' where IsActive= FALSE
update Employee_Database set STATE= 'INDIA' where IsActive= TRUE