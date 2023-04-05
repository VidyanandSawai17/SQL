-- like operator in sql

select * from tblemployee

select * from tblemployee where empname='rohan'

select * from tblemployee where empname like 'n%'
select * from tblemployee where empname like '%l'

select * from tblemployee where empname like '%o%'

select * from tblemployee where empname like '[g-t]%'
select * from tblemployee where empname like '%[g-t]'
select * from tblemployee where empname like '%[g-t]%'

select * from tblemployee where empname like '[aso]%'

select * from tblemployee where empname like '%[aso]'

select * from tblemployee where empname like 'S____'
select * from tblemployee where empname like '____j'

select * from tblemployee where empname like '__r__'


select * from tblemployee where empname not like 'n%'
select * from tblemployee where empname not like '[aso]%'

update tblemployee set city=null where empid in (11,14,7)
-------------------------------------------------------------------
-- Null values - if column contains null value we can not use compare operator
--we can use following
-- is null
-- is not null
select * from tblemployee where salary>28000

select * from tblemployee where salary is null

select * from tblemployee where salary is not null

select * from tblemployee where city is null

select * from tblemployee where city is not null


-------------------------------------------------------------------
-- TOP operator 

select top 3 * from tblemployee
order by salary desc

select top 3 * from tblemployee
order by salary,empname

select top 10 percent * from tblemployee
order by salary desc
--ties means match or same col- that we put in order by cluase
select top 5 with ties * from tblemployee
order by salary desc

--------------------------------------
--offset & fetch
--offset is used to skip the records
-- after skip how many records we want that will be added in the fetch
-- offset is used with combination of order by 
-- fetch is optional


select * from tblemployee
order by salary desc
offset 3 rows

-----------------------------------
select * from tblemployee
order by salary desc
offset 3 rows
fetch next 3 rows only