
--Book table	– Book id , book name , author id , price , published date

create table book(bookid int primary key, bookname varchar(20), authorid int, price int, publisheddate date)

insert into book values(1, 'xyz', 10, 400, '1999-06-17')
insert into book values(2, 'abc', 11, 500, '1979-12-07')
insert into book values(3, 'pqr', 12, 600, '1949-06-27')
insert into book values(4, 'uvw', 13, 700, '1969-03-17')
insert into book values(5, 'ijk', 14, 800, '1969-11-10')

select * from book

--Author table 	– author id , author name , ph no , email , address, city 


create table author(authorid int, authorname varchar(20), phno int, email varchar(20), address varchar(20), city varchar(20))
insert into author values(10, 'P Nehru', 112121, 'wqw', 'E-delhi', 'delhi')
insert into author values(11, 'B Thakre', 212121, 'qww', 'E-delhi', 'delhi')
insert into author values(12, 'APJ kalam', 212121, 'aaswqw', 'E-delhi', 'delhi')
insert into author values(13, 'M Gandhi' , 111121, 'asdsd', 'E-delhi', 'delhi')
insert into author values(14, 'P Patil', 122121, 'aaddd', 'E-delhi', 'delhi')

select * from author

--Awards table 	– award id , award type id, author id , book id , year 

create table award(awardid int, awardtypid int, authorid int, bookid int, year date)

insert into award values(111, 25, 10, 1, '2000-05-01')
insert into award values(112, 26, 11, 2, '2001-01-03')
insert into award values(113, 27, 12, 3, '2003-08-01')
insert into award values(114, 28, 13, 4, '2004-10-21')
insert into award values(115, 29, 14, 5, '2005-02-11')

select * from award

--Awards master table – award type id , award name , award price

create table amaster(awardtypid int, awardname varchar(20), awardprice int)

insert into amaster values(25, 'APJ kalam', 911111)

insert into amaster values(26, 'P Patil' , 551211)

insert into amaster values(27, 'M Gandhi', 7712121)

insert into amaster values(28, 'B Thakre', 6612121)

insert into amaster values(29, 'P Nehru', 1112121)

insert into amaster values(29, 'No Award Recevied', 0)


select * from amaster

-------------------------------------------------------------------------------------------------------------------------------------




--1.	Write a query to show book name , author name and award name for all books which has received any award. 

select book.bookname, author.authorname, amaster.awardname, amaster.awardprice from book 
inner join author on author.authorid = book.authorid
inner join award on award.bookid = book.bookid
inner join amaster on award.awardtypid = amaster.awardtypid

--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .


select * from author inner join book on author.authorid = book.bookid update author set authorname = 'Honourable' 

--3.	Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.

select  author.authorname ,count(authorid) as 'count' from author
group by authorname
order by [count] desc

--4.	Write a query to select book name with 5 th highest price.

select  * from book
order by price desc
offset 4 row 
fetch next 1 row only
 
--5.	Select list of books which have same price as book ‘xyz’.

select book.bookid, book.bookname,book.price from book where price =(
select price from book where bookid =(
select bookid from book where bookname ='xyz')
)


--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.

update book set price = price + (price*0.05)(
select book.bookid, book.bookname, author.authorname, book.price from book inner join author on book.authorid = author.authorid
where author.authorname = 'Abdul kalam')


--7.	Show award names and number of books which got these awards. 

select book.bookname,author.authorname from book inner join author on author.authorid = book.authorid
inner join award on award.authorid = book.authorid

--8.	Delete all books written by ‘Chetan Bhagat’ 

delete from book where bookname = 'xyz'

--9.	Create view to show name of book and year when it has received award. 

create view AwardList as(
select book.bookname, award.year from book inner join award on award.authorid = book.authorid)

select * from AwardList

--10.	Create trigger to ensure min price of any book must be Rs. 100. 

--11.	Increase price of book by 10% if that book has received any award.

update book set price=price+(price*0.10) where bookid in(
select book.bookid
from award
inner join book on book.bookid = award.bookid
)

select * from book

--12.	Show names of author and number of books written by that Author.

select author.authorname as 'Authors', count(author.authorid) as 'Copies'  from author inner join book on book.authorid = author.authorid
group by author.authorname 
                                                          
--13.	Show names of authors whose books are published before year 1999.

select book.bookname, book.publisheddate from book inner join author on book.authorid = author.authorid
where book.publisheddate < cast('1-1-1999' as date)

--14.	Show name of books which has published within 1 year after 12 December 1979.

select publisheddate from book where publisheddate > cast('1979-12-07' as date)

--15.	Delete all authors whose no book is published in year 1999. 

delete book where publisheddate > '1999'

--16 


			select price,
			case
			when price >= 500 then 'Expemsive'
			when price <= 500 then 'Cheap'
			else 'xyz'
			end as 'Price c'
			from book