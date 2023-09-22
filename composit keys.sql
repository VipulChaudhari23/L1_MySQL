create database university;
use university;
use university;
create table students (s_id INT(10) NOT NULL AUTO_INCREMENT, s_firstname VARCHAR(30) 
NOT NULL, s_lastname VARCHAR(30) NOT NULL, s_email VARCHAR(40), PRIMARY KEY (s_id));

insert into students (s_firstname,s_lastname,s_email) values ('Shankar', 'Bhat', 'shankar@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Venkat', 'Rao', 'venkat@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Mohan', 'Nair', 'mohan@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Abhijeet', 'Patel', 'abhi@example.com');

select * from students;

create table Atable (aid int primary key);
alter table atable add name varchar(20);
insert into atable values (1,'one');

create table Btable (bid int primary key);
alter table btable add name varchar(20);
insert into btable values (11,'eleven');

create table ctable (aid int,bid int,foreign key(aid) references atable(aid),foreign key(bid) references btable(bid));
insert into ctable values(1,11);

select a.aid "A",b.bid "B" from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;

select a.name,b.name from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;


-- Composit Foreign key
create table employee(empId int primary key, empName varchar(20), empSalary int);
create table department(deptId int primary key, deptName varchar(20));
create table organization(empId int , foreign key (empId) references employee(empId), deptId int,
	foreign key (deptId) references department(deptId));
select * from organization;
desc organization;




