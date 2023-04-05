-- JOINS in SQL
-- when we want to join 2 or more tables to get the data 
--we can use joins 
-- we will combine both the tables columns & then generate the result 
-- in join there must be a match column in the 2 or more tables
-- types of joins
--1. Inner join
--2. Left join
--3. right join
--4. full join / full outer join
--5. self join
--6. cross join / cartesion product

select * from tblDept
select * from tblemployee


-- 1. inner join --> select the records that have matching values in both the table
-- example --> customer -> orders

select emp.*,dept.deptname
from tblemployee emp
inner join tblDept dept on dept.deptid=emp.deptid



select emp.*,dept.deptname
from tblemployee emp
inner join tblDept dept on dept.deptid=emp.deptid
where dept.deptname in('HR','Development')
order by emp.empname
--2. 

--display emp who is from pune city & hr dept
select emp.*,dept.deptname
from tblemployee emp
inner join tblDept dept on dept.deptid=emp.deptid
where dept.deptname='hr' and emp.city='Pune'


-- display emp from hr dept & salary is less than 30000
select emp.*,dept.deptname
from tblemployee emp
inner join tblDept dept on dept.deptid=emp.deptid
where dept.deptname='hr' and emp.salary<30000

--display emp from development & hr desc of their salary
select emp.*,dept.deptname
from tblemployee emp
inner join tblDept dept on dept.deptid=emp.deptid
where dept.deptname in ('hr','development')
order by emp.salary desc


-- 2. left join -->all records from left table & matching data from another table
-- records those are not matched, will be return as null
select emp.*,dept.deptname
from tblemployee emp 
left join tblDept dept on dept.deptid=emp.deptid


--3. right join --> all records from right table & matching data from left table
--records those are not matched , will return as null
select emp.*,dept.deptname
from tblemployee emp 
left join tblDept dept on dept.deptid=emp.deptid

select dept.deptname,emp.*
from tblemployee emp 
right join tblDept dept on dept.deptid=emp.deptid

