--DDL commands

create table person(
personid int,
name varchar(40),
city varchar(20),
)
-- to check the schema of table
sp_help person
-- alter query is for modifcation in the existing table
-- modify the size of city varchar(20) to varchar(40)

alter table person alter column city varchar(40)

-- add column to the existing table
alter table person add country varchar(20)

-- remove the column from the table
alter table person drop column country



create table employee(
empid int primary key,
empname varchar(20) not null,
emailid varchar(40) unique,
age int check(age>=18),
country varchar(40) default('India')
)

sp_help employee
-- student table and apply constraints
--rollno pk , name required, email unique, age >18 , city - pune


