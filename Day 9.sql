select * from tblemployee

drop table tblproject
truncate table tblproject
create table tblProject
(
empid int,
empname varchar(40),
city varchar(40)
)

select * from tblProject


insert into tblProject select empid,empname,city from tblemployee where salary < all
(
select avg(salary) from tblemployee
)
-- display emp list who have > salary than the avg salary of their dept
select * from tblemployee where salary <all(
select avg(salary) from tblemployee group by deptid
)
-- find the name of emp who has 2nd highest salary using subquery

select * from tblemployee where salary=(
select max(salary) from tblemployee where salary<>
(
select max(salary) from tblemployee
)
)

---------------------------------------------------------------------------
--function in SQL
--1. built in function
--2. user defined function


--1. built in function in SQL

--len --> to find the length

select empname, len(empname)as 'word length' from tblemployee

-- upper & lower 
select UPPER(empname) as 'emp name' from tblemployee
select lower(empname) as 'emp name' from tblemployee

--TRIM, LTRIM, RTRIM
select TRIM(empname) as 'trim fun' from tblemployee
select LTRIM(empname) as 'trim fun' from tblemployee
select RTRIM(empname) as 'trim fun' from tblemployee

--substring

select empname,SUBSTRING(empname,1,3) as' temp name' from tblemployee

-- concat

select CONCAT(empname,'->',city,'->',salary)as 'result' from tblemployee

--replace
--            col    old     new  
select REPLACE(city,'pune','PUNE') from tblemployee

select REVERSE(empname) from tblemployee

-- isnull()

select city from tblemployee
-- product  price * qty --> 
--price * isnull(qty,1)
--100 *2 -> 200
--100 *1 -> 100
select ISNULL(city,'NA')as 'City' from tblemployee

-- cast --> conversion from one data type to another data type

select cast(salary as varchar(20)) as'Salary' from tblemployee

select cast(CURRENT_TIMESTAMP as date)

select year(cast(CURRENT_TIMESTAMP as date))

select month(cast(CURRENT_TIMESTAMP as date))

select day(cast(CURRENT_TIMESTAMP as date))

select cast(CURRENT_TIMESTAMP as time)

alter table tblemployee add joiningdate date

select * from tblemployee -- yyyy-mm-dd
update tblemployee set joiningdate= cast('2023-2-10'as date) where empid=1


------------------------------------------------------------------------------

--view in SQL
-- in SQL view is a virtual table, which can be used to store result set of any sql 
--statment
-- view contains rows & columns just like we have in a real table
-- from the view we will always get an updated data
--the database engine generates the view each time when user fire/ execute the view

create view AvgSalaryFromEmp
as
select * from tblemployee where salary <all(
select avg(salary) from tblemployee group by deptid
)

create view empFromDevTesting
as
select e.*, d.deptname from tblemployee e
inner join tblDept d on d.deptid=e.deptid
where d.deptname in ('development','testing')


select * from AvgSalaryFromEmp

select * from empFromDevTesting

--modify the existing view
alter view empFromDevTesting
as
select e.*, d.deptname from tblemployee e
inner join tblDept d on d.deptid=e.deptid
where d.deptname in ('development','testing','hr')

-- remove the view

drop view empFromDevTesting