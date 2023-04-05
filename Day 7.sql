--4. full join / full outer join
-- returns all the records from both the tables(left & right)
-- it is a combination of left & right join
-- records that does not match , returns null

select emp.* ,dept.deptname
 from tblemployee emp
 full join tblDept dept on dept.deptid=emp.deptid
 where dept.deptname in ('hr','development')
 order by emp.empname

 -- 5. self join
 -- a self join is a regular join, but table is joined with itself
 -- emp table is self join with emp -> self join

 alter table tblemployee add managerid int
 select * from tblemployee -- Nisha , swapnil, neha
 update tblemployee set managerid=3 where empid in(1,2,4)
 update tblemployee set managerid=8 where empid in(5,6,7,9)
update tblemployee set managerid=16 where empid in(10,11,12,13,14,15)

select empname as 'Manager' from tblemployee where managerid is null

select emp.empname as 'Employee Name', man.empname as 'Manager Name'
from tblemployee emp , tblemployee man
where man.empid=emp.managerid

--6. Cross join 
-- cross join is used to generate the paired combination of each row of the 
--first table with each row of another table (second table)
-- it is also called cartesion product

create table breakfast(
id int primary key identity(1,1),
breakfastname varchar(20)
)
insert into breakfast values('Poha')
insert into breakfast values('Upma')
insert into breakfast values('Idali')
create table Drinks
(
did int primary key identity(1,1),
drinkname varchar(20)
)
insert into Drinks values('Tea')
insert into Drinks values('Coffee')
insert into Drinks values('Milk')

select * from breakfast cross join Drinks
----------------------------------------------------------------------------------
-- group by clause 
-- group by statement groups the rows that have the same values
-- create a summary of rows example , customer in each city, country, emp in each dept
-- group by caluse needs aggregate function to make a summary
--when we are using gorup by clause then select statment must have a column with the aggregate function
-- or with the group by clause
-- employee in each city
select city, count(empid) as 'Count'
from tblemployee
group by city

--display dept wise count of emp
select deptid, count(empid) as 'emp count'
from tblemployee
group by deptid

select dept.deptname,count(emp.empid) as 'emp count'
from tblemployee emp 
inner join tblDept dept on dept.deptid=emp.deptid
group by dept.deptname

--display country wise count of customer

-- -----------------------------------------------
--having caluse
-- having clause is used in sql because where clause can not be used with aggregate function

select city, count(empid) as 'Count'
from tblemployee
group by city
having avg(salary)<35000

select city,count(empid) as 'count'
from tblemployee 
where city in('pune','mumbai','nashik')
group by city