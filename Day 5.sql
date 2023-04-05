--Assignment:
--1. create table product(id,name,price,company)
--2. display the product with hightest price to lowest price (first 3 products)
--3. display product name whose price is lowset price in product table
--4. display the product with lowest to highest price (skip first 3 products & display next 5 products)
--5. display product details with alphbetical order of product name & price 
--6. display product details with alphabetical order of company name& price

create table Product(
id int primary key identity(1,1),
name varchar(40),
company varchar(40),
price int
)

insert into Product values('Mouse','HP',799)
insert into Product values('Keyboard','HP',499)
insert into Product values('Pen','Pen',20)
insert into Product values('Pencil','Natraj',12)
insert into Product values('Pendrive','Sony',599)
insert into Product values('Laptop','Lenovo',34849)
insert into Product values('Chair','Test',1099)
insert into Product values('Study table','Table',3899)
insert into Product values('Sofa','Sofa',12899)
insert into Product values('Headphone','boat',2899)

select top 3 * from Product
order by price desc

select top 1 * from Product
order by price 

select * from Product
order by price
offset 3 rows
fetch next 5 rows only


select * from Product
order by name,price

select * from Product
order by company,price


--------------------------------------------------------------

--column alise

select name+' '+ company as 'Product with Company' from Product

select name,name as 'Product name',price as 'Product price' from Product

------------------------------------------------------------------
-- Aggregate function in SQL
-- count, sum, avg, max, min
-- returns a scalar value - single value
select * from  Product
select * from tblemployee
select count(id) as 'Count' from Product

select count(distinct name) as'Count' from Product

select count(distinct city) as 'city count' from tblemployee

select sum(price) as 'sum price' from Product

select sum(salary) as 'sum salary' from tblemployee


select avg(price) as 'avg price' from Product
select avg(salary) as 'avg salary' from tblemployee

select max(price) as 'max price' from Product
select min(price) as 'max price' from Product

select max(salary) as 'max salary' from tblemployee
select min(salary) as 'min salary' from tblemployee