create table EmployeeInfo(
EmpID int,
EmpFname varchar(20),
EmpLname varchar(20),
Department varchar(20),
Project varchar(10),
Address varchar(20),
DOB date,
Gender Varchar(20)
)

insert into EmployeeInfo values(
1,
'Vidyanand',
'Sawai',
'Admin',
'P1',
'Amravati',
'1999-06-17',
'Male'
)

update EmployeeInfo set Project = 'P2' where Project = 'P1'

insert into EmployeeInfo values(
2,
'Siraj',
'Pathan',
'Admin',
'P1',
'Pune',
'1999-10-24',
'Male'
)

insert into EmployeeInfo values(
3,
'Rushikesh',
'Mehare',
'HR',
'P3',
'Nagpur',
'1999-03-05',
'Male'
)

insert into EmployeeInfo values(
3,
'Rushikesh',
'Mehare',
'HR',
'P3',
'Nagpur',
'1999-03-05',
'Male'
)

insert into EmployeeInfo values(
4,
'Arpit',
'Gulhane',
'HR',
'P4',
'Yewatmal',
'1999-06-09',
'Male'
)

insert into EmployeeInfo values(
5,
'Prajwal',
'Lavankar',
'HR',
'P5',
'Mumbai',
'2000-01-19',
'Male'
)

select * from EmployeeInfo

create table EmployeePostion(
EmpID int,
EmpPosition varchar(20),
DateOfJoining date,
Salary int
)

Insert into EmployeePostion values(
1,
'Executive',
'2020-04-01',
75000
)

Insert into EmployeePostion values(
2,
'Manager',
'2020-04-03',
50000
)

Insert into EmployeePostion values(
3,
'Manager',
'2020-04-02',
60000
)

Insert into EmployeePostion values(
2,
'Officer',
'2020-04-02',
80000
)

Insert into EmployeePostion values(
1,
'Manager',
'2020-04-03',
850000
)

select * from EmployeePostion

-------------------------------------------------------------------------------------------------------------------------


--1. Create a query to generate the first records from the EmployeeInfo table.

select Top 1 * from EmployeeInfo

--2. Create a query to generate the last records from the EmployeeInfo table.

select Top 1 * from EmployeeInfo order by EmpID desc

--3. Create a query to fetch the third-highest salary from the EmpPosition table.

select * from EmployeePostion order by salary desc
offset 2 rows
fetch next 1 row only

--4. Write a query to find duplicate records from a table.

select EmpPosition, COUNT(*) as 'Position' from EmployeePostion Group by EmpPosition

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.

select EmpPosition, Salary from EmployeePostion group by Salary, EmpPosition

--6. Create a query to obtain display employees having salaries equal to or greater than 70000.

select EmployeeInfo.EmpID,EmployeeInfo.EmpLname, EmployeePostion.EmpPosition, EmployeePostion.Salary from EmployeeInfo inner join  EmployeePostion on EmployeeInfo.EmpID  = EmployeePostion.EmpID where Salary >= 75000

--7. Create a query to fetch the list of employees of the same department

select * from EmployeeInfo where Department in(select Department from EmployeeInfo group by Department)


