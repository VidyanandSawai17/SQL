-- functions
-- 1. built in function
--2. user defined function --> used to exe a perticular task
-- prod-price  --> discounted price
--max,min,count,avg,concat ,cast, year,month,day,len,trim,substring....
-- type 1 --> single / scalar function -> a function which returns a single value
create function Addition(@a int,@b int)
returns int
as
begin
declare @c int
set @c=@a+@b
return @c
end


select dbo.Addition(10,30) as 'Addition'

create function GetNameById(@id int)
returns varchar(20)
as begin
return(
select empname from tblemployee where empid=@id
)
end

select dbo.GetNameById(7) as'emp name'

--2 . multivalue function  -->which returns the recordset

create function GetEmpByDeptId(@did int)
returns table
as 
return
(
select * from tblemployee where deptid=@did
)

select * from dbo.GetEmpByDeptId(4)

-- create a function to pass product price & discount percentage
-- returns the discounted price

create function CalculateDiscount(@price decimal,@discount int)
returns decimal
as begin
declare @a decimal
declare @discountprice decimal
set @a= @price * @discount /100
set @discountprice=@price-@a
return @discountprice
end

------------------------------------------------------------------------------------

--SP

-- without parameter
--proc / procedure
create proc GetAllEmps
as begin
select * from tblemployee
return
end


exec GetAllEmps


create proc GetEmpByDept(@deptid int)
as begin
select * from tblemployee where deptid=@deptid
return
end

exec GetEmpByDept @deptid=4

create proc InsertEmp(
@empname varchar(20),
@city varchar(20),
@did int,
@salary int,
@managerid int,
@joiningdate date
)
as begin
insert into tblemployee values(@empname,@city,@did,@salary,@managerid,cast(@joiningdate as date))
return 
end

exec InsertEmp
@empname='Test',
@city='Pune',
@did=4,
@salary=35500,
@managerid=3,
@joiningdate='2/3/2023'

-- write update & delete query in SP & exe it
-- find out diff between view & SP
-- find out diff between function & SP