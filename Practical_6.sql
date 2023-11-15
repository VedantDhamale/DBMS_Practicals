create database lib;

use lib;

create table borrower(
	rollno int primary key,
    name varchar(20),
    dateofissue date,
    nameofbook varchar(20),
    status varchar(20)
);

create table fine(
	rollno int,
    foreign key(rollno) references borrower(rollno),
    returndate date,
	amount int
);

insert into borrower values(1,'abc','2021-06-01','SEPM','I');
insert into borrower values(2,'xyz','2021-05-01','OOP','I');
insert into borrower values(3,'pqr','2021-06-15','DBMS','I');
insert into borrower values(4,'def','2021-06-30','DSA','I');
insert into borrower values(5,'lmn','2021-07-05','ADS','I');

select * from borrower;

delimiter $
create procedure calc_fine_lib(in roll int)
begin
declare fine1 int;
declare noofdays int;
declare issuedate date;
declare exit handler for SQLEXCEPTION select 'create table definition';
select dateofissue into issuedate from borrower where rollno=roll;
select datediff(curdate(),issuedate) into noofdays;
if noofdays>15 and noofdays<=30 then
set fine1=noofdays*5;
insert into fine values(roll,curdate(),fine1);
elseif noofdays>30 then
set fine1=((noofdays-30)*50) + 30*5;
insert into fine values(roll,curdate(),fine1);
else

insert into fine values(roll,curdate(),0);
end if;
update borrower set status='R' where rollno=roll;
end $
delimiter ;
call calc_fine_lib(1);
call calc_fine_lib(2);
call calc_fine_lib(3);
call calc_fine_lib(4);
call calc_fine_lib(5);
select * from fine;

drop database lib;

