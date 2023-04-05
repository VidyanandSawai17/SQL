select * from Product
select * from productlog
insert into Product values('Test','HP',100)
delete from Product where id=12
-- create a trigger that will maintain log for product table

create table ProductLog
(
logid int primary key identity(1,1),
description varchar(255)
)

-- any prodcut inserted in the product table log the details using trigger
-- triggers have built in properties 
-- inserted
--deleted
create trigger tr_product_insert
on product after insert
as begin
declare @prodid int
select @prodid = id from inserted
insert into ProductLog values('New Product id '+cast(@prodid as varchar(10))+
' added on '+cast(CURRENT_TIMESTAMP as varchar(20)))
end



create trigger tr_product_delete
on product after delete
as begin
declare @prodid int
select @prodid = id from deleted
insert into ProductLog values('Product id '+cast(@prodid as varchar(10))+
' removed from table on '+cast(CURRENT_TIMESTAMP as varchar(20)))
end

--update --> deleted (old data) inserted (new data)
--mouse HP 799 (deleted)
--mouse dell 899 (inserted)
update Product set price=999 where id in (1,2,3)

-- write a insert & delete trigger on employee table

create trigger tr_Product_Update
on Product for update
as begin
declare @id int
declare @oldname varchar(40), @newname varchar(40)
declare @oldcomp varchar(40), @newcomp varchar(40)
declare @oldprice int , @newprice int
declare @desc varchar(500)
select * into tempTable from inserted
while(Exists(select id from tempTable))
begin
set @desc=''
select TOP 1 @id=id,
@newname=name,
@newcomp=company,
@newprice=price from tempTable

select @oldname=name,@oldcomp=company,@oldprice=price from deleted where id=@id
set @desc='product with id '+cast(@id as varchar(10))+' change '
if(@oldname<>@newname)
set  @desc= @desc+' old name '+@oldname + ' to new name '+@newname
if(@oldcomp<>@newcomp)
set @desc= @desc+' old company '+@oldcomp + ' to new comp '+@newcomp
if(@oldprice<>@newprice)
set  @desc= @desc+' old price '+cast(@oldprice as varchar(20)) + ' to new price '+cast(@newprice as varchar(20))

insert into ProductLog values(@desc)
delete from tempTable where id=@id
end
end

select * from product
select * from ProductLog
update product set name='test', company='test comp' , price=100 where id=11