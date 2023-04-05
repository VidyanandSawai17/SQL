-- employee
-- on emp table we want apply constraints using alter query

-- unique

alter table employee add constraint un_employee unique(email)

--drop the unique constraint
alter table employee drop constraint un_employee
--or
alter table employee add constraint un_employee unique(email,contact)

--primary key 
alter table employee alter column empid int not null
alter table employee add constraint pk_employee primary key(empid)

alter table employee drop constraint pk_employee
--check
alter table employee add constraint chk_employee check(age>=18)

alter table employee drop constraint chk_employee
-- default
alter table employee add constraint df_employee default 'India' for country


alter table employee drop constraint df_employee

sp_help employee


--create table book -> id , name, price, author,publication,contact
--sp_help book
-- id pk, name - not null, pulication - default (TQ) contact - unique


-- FK constraint
create table tblDept(
deptid int primary key,
deptname varchar(20)
)
--1  hr
--2  admin
create table tblemployee (
empid int primary key identity(1,1),
empname varchar(40),
city varchar(20),
deptid int,
constraint fk_deptemp foreign key(deptid) references tblDept(deptid)
)


alter table tblemployee add constraint fk_deptemp foreign key(deptid) references tblDept(deptid)

alter table tblemployee drop constraint fk_deptemp


-- non cluster index --> applies on col where values may be duplicate
create index in_employee on tblemployee(empname,city)

--cluster index --> applies on the PK column
create unique index in_employee2 on tblemployee(empid)

drop index in_employee

-- remove the table (remove the table & its schema from the DB)
drop table employee

-- truncate table ( remove all the records)
truncate table employee

-----------------------------------------------------------------------------
-- identity field in SQL
-- auto increment the value 

create table tblemployee (
empid int primary key identity(1,1),

)

----------------------------------------------------------------------------

--DML -> insert
select * from tblDept
select * from tblemployee

insert into tblDept values(1,'HR')
insert into tblDept values(2,'Admin')
insert into tblDept values(3,'Development')

insert into tblemployee values('Rohan','Mumbai',1)
insert into tblemployee values('Suraj','Pune',1)
insert into tblemployee values('Arjun','Pune',2)
insert into tblemployee values('Arun','Pune',2)
insert into tblemployee values('Kishor','Nagpur',3)
insert into tblemployee values('Rahul','Nagpur',3)



insert into tblemployee(empname,deptid) values('Rajesh',3)
