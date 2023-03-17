--ASSIGNMENT NO - 3

create table student(
rollno int, sname varchar(20), degree varchar(20), birthdate date, courseid int, batchid int, feespaid int, remark varchar(20)
)

select * from student

insert into student values(1, 'Vidyanand', 'MCA', '1999-06-17', 12, 1707, 35400, 'NA')
insert into student values(2, 'Vivekanand', 'Engg.', '1998-02-02', 13, 1708, 23200, 'NA')
insert into student values(3, 'Shyam', 'Msc Comp.', '2002-03-08', 14, 1709, 12100, 'NA')
insert into student values(4, 'Ram', 'Engg.', '2001-06-07', 15, 1710, 18780, 'NA')
insert into student values(5, 'Rahul', 'BCA', '2000-07-27', 16, 1711, 27890, 'NA')
insert into student values(6, 'Rahul', 'BCA', '2000-07-27', 16, 1711, 27890, 'NA')
insert into student values(7, 'Rohit', 'BCA', '2000-07-27', 16, 1711, 27890, 'NA')
insert into student values(9, 'Rohit', 'BCA', '2009-07-27', 16, 1711, 27890, 'NA', '')

create table course(courseid int, courcename varchar(20), duration varchar(20), trainerid int, totalfees int)

select * from course

insert into course values(12, 'Dotnet', 'three months', 1212, 35400)
insert into course values(13, 'Java', 'three months', 1213, 45400)
insert into course values(14, 'MERN', 'three months', 1214, 55400)
insert into course values(15, 'Data Science', 'three months', 1215, 65400)
insert into course values(16, 'Python', 'three months', 1216, 75400)

create table trainer(trainerid int, trainername varchar(20), joindate date, email varchar(30), experience varchar(20))

select * from trainer

insert into trainer values(1212, 'Aniket Sir', '2022-12-20', 'xyz@gmail.com', 'Eight Year')
insert into trainer values(1213, 'Vrushali Madam', '2022-06-20', 'xyz@gmail.com', 'Fiv Year')
insert into trainer values(1214, 'Megha Mdam Sir', '2022-02-20', 'xyz@gmail.com', 'Four Year')
insert into trainer values(1215, 'Prajwal Sir', '2022-03-20', 'xyz@gmail.com', 'Three Year')
insert into trainer values(1216, 'Ninad Sir', '2023-02-20', 'xyz@gmail.com', 'Two Year')


--1. Show list of students. List contains roll no , student name , course name , trainer name in
--   order of course name and student name.


select student.rollno, student.sname, course.courcename, trainer.trainername from student inner join course on student.courseid = course.courseid
inner join trainer on trainer.trainerid = course.trainerid

--2 Show list of students who have pending fees more than 1000rs . List should have student
--  name , course name , balance fees . Show this list in descending order of balance fees.

select student.sname,student.feespaid, course.totalfees
from student
inner join course on course.courseid = student.courseid
where course.totalfees - student.feespaid>=1000 


--3  Append letter ‘_spl’ to all batch ids of trainer ‘Devendra’.

--4  Update table student. Update ‘remark’ field. Remark should be ‘Eligible ’ if fees paid
--   by student is more than 30%.

update student set remark ='Eligible ' where feespaid >= all(
select (totalfees * 0.30) from  course )

select * from student
select * from course

--5. Create a index to make retrieval faster based on course name.

--6. List name of course for which more than 2 students are enrolled.

select course.courseid, course.courcename 
from student
inner join course on course.courseid = student.courseid
group by course.courseid, course.courcename
having count(course.courseid)>1
			
--7. List name of course for which maximum revenue was generated. ( max fee collection)

select courcename,totalfees from course  where totalfees =(
select max(totalfees) from course )

--8. Select name of student who are in same batch as ‘Anil’.

select sname from student where batchid =(
select batchid from student where sname ='Rohit')

--9. Delete all students who are in course which is less than 2 months duration

delete student where courseid =(
select courseid from course where duration <1)

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.

alter table student add is_placed varchar(20)
insert into student values(8, 'Vid', 'Engg', '2001-01-01', 12, 1707, 35400, 'Eligible', 'Yes')

select* from student where is_placed ='Yes' and feespaid = 
all(select totalfees from course )

select * from student inner join course on student.courseid = course.courseid where totalfees = feespaid
and is_placed = 'Yes'

--11. Create a trigger to add student data in ex-student table if student is deleted from student table.

--12. Create a view which shows name of trainer and number of students he is training.

create view studentcount as 
select student.sname,course.courcename, trainer.trainername from student 
inner join course on student.courseid = course.courseid
inner join trainer on trainer.trainerid = course.trainerid

select * from studentcount

--13. Show names of students who are more than 20 years old.

select * from student where year (cast(CURRENT_TIMESTAMP as date) )-year(cast(birthdate as date))>=20

--14. Show names of students who have paid all the fees. 

select student.sname from student inner join course on course.courseid = student.courseid
where student.feespaid = course.totalfees

--15. Write a procedure which accepts student id and returns his balance fees.



