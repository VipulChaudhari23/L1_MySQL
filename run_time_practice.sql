CREATE TABLE employee(empid int, name varchar(30));

desc student;
insert into student( studentName,studentMarks) values('Vinay', 90), ('Parth', 80);

insert into employee values(1, 'vipul'),(2, 'yash'),( 3, 'saiem');
select * from employee;
select * from student;

desc employee;
USE learningmysql;
CREATE DATABASE learningmysql;
show tables;
desc cars_india_dataset;

select * from cars_india_dataset;

select * from cars_india_dataset order by Height desc;
select * from cars_india_dataset where maker = 'Hyundai' order by displacement;

select count(*),maker from cars_india_dataset group by maker;
select count(*) as 'Total count',seats from cars_india_dataset group by seats;
select count(*) as 'Total count',fuel from cars_india_dataset group by fuel;
select count(*) as 'Total count',fuel from cars_india_dataset group by fuel having count(*) > 10;
-- select count(*) as 'Total count',fuel from cars_india_dataset group by fuel;

-- unique maker from dataset and there count
select distinct maker from cars_india_dataset;
select count(distinct maker) from cars_india_dataset;

-- unique model from dataset and there count
select distinct model from cars_india_dataset;
select count(distinct model) from cars_india_dataset;


select count(distinct maker),fuel from cars_india_dataset group by fuel;

select count(*) as 'Total Type',type from cars_india_dataset group by type order by count(*) desc;

-- foreign key 
create table department(dept_id int(10) primary key, dept_name varchar(40) not null);
insert into department values(103, 'Admin'), (102, 'HR'), (101, 'Finance');
select * from department;

create table emp_detail(empId int primary key, emp_name varchar(30) not null,address varchar(100), age int, 
departmentId int, foreign key (departmentId) references department(dept_id));
insert into emp_detail values(2, 'Anand', 'Pune', 45, 102),(3, 'Yash', 'Pune', 34, 103),(4, 'Saiem', 'Pune', 56, 101);
select * from emp_detail;
desc emp_detail;

-- Inner Join
select e.empid, e.emp_name, d.dept_name, d.dept_id from department d inner join emp_detail e on e.departmentId = d.dept_id where empId=3;

-- left outer join
select d.dept_id,d.dept_name,e.emp_name from department d left join emp_detail e on d.dept_id = e.departmentId;




