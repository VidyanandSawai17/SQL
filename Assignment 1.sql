--ASSIGNMENT NO - 1
--1.Write a statement that will select the City column from the Customers table

create table Customer(
Cid int primary key, Cnamne varchar(20), Ccity varchar(20), Cpincode int, Ccountry varchar(20)
)

insert into Customer values(1, 'Vidyanand', 'Amravati', 444701, 'India')
insert into Customer values(2, 'Saily', 'Washim,', 423661, 'India')
insert into Customer values(3, 'Gauri', 'Chandrapur', 34355, 'India')
insert into Customer values(4, 'Nikita', 'Mumbai', 453444, 'India')
insert into Customer values(5, 'Shreya', 'Amravati', 23434, 'India')
insert into Customer values(6, 'Prashant', 'Yawatmal', 422701, 'India')
insert into Customer values(7, 'Rishikesh', 'Akola', 411701, 'India')
insert into Customer values(8, 'Roshan', 'Buldhana', 434701, 'India')
insert into Customer values(9, 'Yash', 'Nagpur', 442601, 'India')
insert into Customer values(10, 'Rohit', 'Pune', 421701, 'India')

select * from Customer

--2.Select all the different values from the Country column in the Customers table.

select Ccountry from Customer

--3.Select all records where the City column has the value "London

select * from Customer where Ccity = 'Akola'

--4.Use the NOT keyword to select all records where City is NOT "Berlin".

select * from Customer where not Ccity = 'Amravati' 

--5.Select all records where the CustomerID column has the value 23.

select * from Customer where Cid = 9

--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.

select * from Customer where Ccity = 'Amravati' and Cpincode = 444701

--7.Select all records where the City column has the value 'Berlin' or 'London'.

select * from Customer where Ccity = 'Amravati' or Ccity = 'Chandrapur'

--8.Select all records from the Customers table, sort the result alphabetically by the column City.

select * from Customer order by Ccity

--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.

select * from Customer order by Ccity Desc

--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City

select * from Customer order by Ccountry, Ccity 

--11.Select all records from the Customers where the PostalCode column is empty.

update customer set Cpincode = null where Cid = 1
select * from Customer where Cpincode IS null 

--12.Select all records from the Customers where the PostalCode column is NOT empty.

select * from Customer where Cpincode IS NOT null 

--13.Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".

update Customer set Ccity = 'CA' where Ccountry = 'USA' 

--14.Delete all the records from the Customers table where the Country value is 'Norway'

delete from Customer where Ccountry = 'USA'

--15
--16
--17
--18
--19

--20.Select all records where the value of the City column starts with the letter "a"

select * from Customer where Ccity like 'a%'

--21.Select all records where the value of the City column ends with the letter "a"

select * from Customer where Ccity like '%a'

--22.Select all records where the value of the City column contains the letter "a"

select * from Customer where Ccity like '%a%'

--23.Select all records where the value of the City column starts with letter "a" and ends with the letter "b".

select * from Customer where Ccity like '%a_b%'

--24 Select all records where the value of the City column does NOT start with the letter "a".

select * from Customer where not Ccity like 'a%'

--25 Select all records where the second letter of the City is an "a"
--26
--27
--28
--29.Use the IN operator to select all the records where the Country is either "Norway" or "France".

select * from Customer where Ccity IN ('Amravati', 'Akola')

--30.Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".

select * from Customer where Ccity <> ('Amravati')

--31.Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20

select * from Customer where Cid BETWEEN 5 AND 7

--32
--33
--34
--35
--36
--37
--38
--39

--40.Add a column of type DATE called Birthday in Persons table

alter table Customer add Cbirthday date 
select * from Customer

--41.Delete the column Birthday from the Persons table

alter table Customer drop column Cbirthday