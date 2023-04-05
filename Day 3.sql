--DML 

truncate table tblemployee
insert into tblemployee values('Rohan','Pune',1)
insert into tblemployee values('Suraj','Pune',1)
insert into tblemployee values('Nisha','Pune',1)
insert into tblemployee values('Arun','Mumbai',2)
insert into tblemployee values('Pooja','Mumbai',1)
insert into tblemployee values('Shraddha','Mumbai',1)
insert into tblemployee values('Shubham','Nashik',2)
insert into tblemployee values('Swapnil','Nashik',1)
insert into tblemployee values('Piyush','Nashik',3)
insert into tblemployee values('Anant','Nagpur',1)
insert into tblemployee values('Nikita','Nagpur',4)
insert into tblemployee values('Bhakti','Nagpur',1)
insert into tblemployee values('Omkar','Banglore',4)
insert into tblemployee values('Shriram','Banglore',5)
insert into tblemployee values('Samiksha','Banglore',4)
insert into tblemployee values('Neha','Banglore',5)

select * from tblDept
insert into tblDept values(5,'Testing')
-- update  -> to modify the existing record

update tblemployee set empname='Tushar',city='Mumbai',deptid=3 where empid=4

update tblDept set deptname='Sales' where deptid=3

-- delete --> to delete the record from the table

delete from tblemployee where empid=7

delete from tblemployee where deptid=1

-----------------------------------------------------------------------------
--DQL 
-- * indicate all columns
select * from tblemployee

select empname,city,salary from tblemployee
select empname from tblemployee

--where
select * from tblemployee where empid=1
select * from tblemployee where deptid=3
--operators
select * from tblemployee where salary=28000
select * from tblemployee where salary <=24000 -- <, <= ,> ,>=
select * from tblemployee where salary <>25000 -- not equal

select * from tblemployee where salary between 22000 and 28000

-- distinct
select distinct city from tblemployee
select distinct deptid from tblemployee


-- in & not in
-- in --> select multiple possible values
select * from tblemployee where deptid in(3,4,5)

update tblemployee set salary =35000 where empid in(1,4,7,11,14)

select * from tblemployee where empid in(1,3,5,7,9,11)
select * from tblemployee where city in('Pune','Mumbai')
select * from tblemployee where salary in(25000,29000,28000)
--not in

select * from tblemployee where city not in('Pune','Mumbai')
select * from tblemployee where deptid not in(3,4,5)
select * from tblemployee where empid not in(1,3,5,7,9,11)


--------------------------------------------------------------
--and , or & not operator

select * from tblemployee where city='Pune' and salary>22000

select * from tblemployee where city='Pune' or city='nagpur'

select * from tblemployee where not city='Mumbai'
---------------------------------------------------------------------

--order by

select * from tblemployee
order by salary

select * from tblemployee
order by salary desc

select * from tblemployee
order by empname 

select * from tblemployee
order by empname desc

select * from tblemployee
order by empid desc