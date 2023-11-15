-- 1) Create a table employee( ID, Name, Department, DOB, city, mobile, status) and perform following 
-- queries:
-- I)add salary column and add data values according to schema in table.
-- Display Table.
-- II) Show The Details of employees whose salary in between 20000-60000.
-- III) Display Name of employees currently working in company.
-- IV) Show the Name, DOB and City of the employee whose name is starts with "P".
-- V) Retrieve the Name of employees who work in "IT" Department.


create database problem_statement;

use problem_statement;

create table employee(
	ID int primary key,
    Name varchar(30),
    Department varchar(30),
    DOB date,
    city varchar(20),
    mobile bigint,
    status varchar(30)
);


alter table employee
	add salary int
;

insert into employee(ID,Name,Department,DOB,city,mobile,status,salary) values(1,'Vedant','Ai&ds','2003-01-11','pune',9356182089,'working',60000),
						(2,'Ved','CS','2003-12-20','pune',1234567891,'working',75000),
                        (3,'Gole','Ai&ds','2003-03-11','mumbai',1237894567,'working',55000),
                        (4,'Aniket','IT','2003-06-11','pune',7894561237,'Notworking',40000),
                        (5,'HP','Ai&ds','2003-10-23','mumbai',7412589633,'working',67000),
                        (6,'Ganesh','IT','2003-7-12','pune',3698521470,'working',80000),
                        (7,'Mane','CS','2003-06-11','Delhi',0123987412,'Notworking',25000),
                        (8,'Omakr','IT','2003-03-21','pune',0123456987,'Notworking',39000);
                        
insert into employee values(9,'pranav','Ai&ds','2003-04-01','Delhi',0147852369,'Notworking',120000);
insert into employee values(10,'priya','CS','2003-06-17','Rajasathan',0147852369,'working',82000);


select * from employee;

select * from employee where salary between 20000 and 60000; 

select * from employee where status='working';

select Name,DOB,city from employee where Name like 'p%';

select Name from employee where Department='IT';
 
