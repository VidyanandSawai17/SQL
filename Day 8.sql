--subquery
-- write a sql query in to another query
-- we can nest the multiple quries in to one another
-- we can use subquery with select, insert,update, delete
-- main query where = ( inner query.......)
--in subquery always inner query get executed first, then that inner query 
--returns the result to the outer query , then outer query get executed
-- most of the time inner query returns the scalar value
select * from tblemployee

select max(salary) as 'max salary' from tblemployee
-- display emp details who have max salary

select * from tblemployee where salary=
(
select min(salary) from tblemployee
)

-- select the emp's who has greater salary than empid 14

select * from tblemployee where salary>
(
select salary from tblemployee where empid=14
)

-- find the emp's who have less salary than the avg salary

select * from tblemployee where salary <(select avg(salary) from tblemployee)

-- display emp's who have less salary than avg salary of dev dept
select * from tblemployee where salary <
(
select avg(e.salary) from tblemployee e
inner join tblDept d on d.deptid=e.deptid
where d.deptname='development'
)
-- OR
select * from tblemployee where salary <(
select avg(salary) from tblemployee where deptid=(
select deptid from tblDept where deptname='development')
)

-- select emp whose city is same as empid 3
-- display dept wise sum their salaries

--subquery with update, delete & insert

-- give hike by 20% to the emp who work in developemt dept

update tblemployee set salary=salary+(salary*0.20) where deptid=
(
select deptid from tblDept where deptname='development'
)

select * from tblemployee where deptid=4

-- delete with subquery
-- remove the emp who work in admin dept
delete from tblemployee where deptid=
(select deptid from tblDept where deptname='Admin')



