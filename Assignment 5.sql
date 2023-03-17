create table patients(
patient_id int,
first_name varchar(20),
last_name varchar(20),
gender char(1),
birth_date date,
city varchar(20),
province_id char(2),
allerigies varchar(80),
height decimal(3,0),
weight decimal(4,0)
)


insert into patients values(1, 'Rohit', 'Deshmukh', 'M', '1996-01-04', 'Buldhana', 12, 'zzz', 5, 55)
insert into patients values(2, 'Komal', 'Patil', 'F', '1999-07-14', 'Akola', 13, 'yyy', 5, 52)
insert into patients values(3, 'Akash', 'Gayakwad', 'M', '1996-02-24', 'Nagpur', 14, 'xxy', 5, 65)
insert into patients values(4, 'Vijay', 'Rathod', 'M', '2002-08-20', 'Amravati', 15, 'aaa', 5, 75)
insert into patients values(5, 'Priya', 'Bhosle', 'F', '1992-11-12', 'Washim', 16, 'bbb', 5, 45)
insert into patients values(6, 'Darshan', 'Shinde', 'M', '1993-05-30', 'Bhandara', 17, 'ccc', 5, 58)

select * from patients

create table doctors(
doctor_id int,
first_name varchar(20),
last_name varchar(20),
specialty varchar(20)
)

insert into doctors values(1, 'Ram', 'Patil', 'MS')
insert into doctors values(2, 'Shaym', 'Thakare', 'MBBS')
insert into doctors values(3, 'Prajwal', 'Mohod', 'BAMS')
insert into doctors values(4, 'Aditi', 'Patil', 'BDS')
insert into doctors values(5, 'Aishwarya', 'Deshmukh', 'BHMS')

select * from doctors

create table admissions(
patient_id int,
admission_date date,
discharge_date date,
diagnosis varchar(20),
attending_doctor_id int
)

insert into admissions values(1, '2023-01-15', '2023-01-23','Alzheimer',1)
insert into admissions values(2, '2023-02-05', '2023-02-13','Fever',2)
insert into admissions values(3, '2023-01-05', '2023-01-10','Diabetes',3)
insert into admissions values(4, '2023-03-01', '2023-03-05','Chronic k disease',4)
insert into admissions values(5, '2023-03-01','2023-03-05','Arthritis',5)

select * from admissions

create table provience_name(
province_id char(2),
province_name varchar(30)
)

insert into provience_name values(12, 'India')
insert into provience_name values(13, 'India')
insert into provience_name values(14, 'India')
insert into provience_name values(15, 'India')
insert into provience_name values(16, 'India')
insert into provience_name values(17, 'India')

select * from provience_name

--1.	Show the first name, last name and gender of patients who’s gender is ‘M’

		select first_name, last_name, gender from patients where gender = 'M'

--2.	Show the first name & last name of patients who does not have any allergies
		
		select first_name, last_name from patients where allerigies = 'No'
		
--3.	Show the patients details that start with letter ‘C’

		select * from patients where first_name like 'C%'

--4.	Show the patients details that height range 100 to 200
		
		select * from patients where height between 5 and 6

--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
		
		update patients set allerigies = 'NKA' where allerigies = null

--6.	Show how many patients have birth year is 1999

		select * from patients where year(birth_date) = 1999
		
--7.	Show the patients details who have greatest height

		select * from patients where height = (select max(height) from patients)

--8.	Show the total amount of male patients and the total amount of female patients in the patients table.

		select gender, count(patient_id) as patients from patients group by gender

--9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

		select first_name, last_name, allerigies from patients where allerigies in( 'Penicillin','Morphine') order by first_name

--10.	Show first_name, last_name, and the total number of admissions attended for each doctor.
--		Every admission has been attended by a doctor.

		select doctors.first_name, doctors.last_name, count(patient_id) from doctors inner join admissions on  doctor_id = attending_doctor_id
		group by doctors.first_name, doctors.last_name, patient_id

--11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
		
		select (patients.first_name) as PFName, (patients.last_name) as PLName, admissions.diagnosis, (doctors.first_name) as DFName, (doctors.last_name) as DLName from admissions inner join patients on admissions.patient_id = patients.patient_id
		inner join doctors on doctors.doctor_id = admissions.attending_doctor_id
