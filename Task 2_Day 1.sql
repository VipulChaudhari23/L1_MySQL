-- create database
create database Library_System; 

-- use database
use Library_System;

-- 1) Create the table Member, Books and 
-- Issue without any constraints as mentioned in the schema description above.
-- create table LS_Member
create table LS_Member(
	Member_id int(5),
    Member_NAme varchar(30),
    Member_address varchar(50),
    Acc_Open_Date date,
    Membership_type varchar(20),
    Fees_paid int(5),
    Max_Books_Allowed int(2),
    Penalty_Amount int(7)
    );
    
-- create table books
create table Books(
	Book_No int(6),
    Book_Name varchar(30),
    Author_Name varchar(30),
    Cost int(7),
    Category char(10)
);

-- create table Issue
create table Issue(
	Lib_Issue_Id int(10),
    Book_No int(6),
    Member_Id int(5),
    Issue_Date date,
    Return_Date date
);
show tables;
-- 2) View the structure of the tables.
desc LS_MEmber;
desc Books;
desc Issue;

-- 3) Drop the Member table
drop table LS_Member;

-- 4) Create the table Member again as per the schema description with the following constraints.
create table Member(
-- a. Member_Id – Primary Key
	Member_id int(5) PRIMARY KEY,
-- 5) Modify the table Member increase the width of the member name to 30 characters
    Member_NAme varchar(30),
    Member_address varchar(50),
    Acc_Open_Date date,
    Membership_type varchar(20),
-- b. Membership_type - ‘Lifetime’,’ Annual’, ‘Half Yearly’,’ Quarterly’
    CONSTRAINT mt CHECK (Membership_type IN('Lifetime','Annual','Half Yearly','Quarterly')),
    Fees_paid int(5),
    Max_Books_Allowed int(2),
    Penalty_Amount int(7)
    );
    
-- 6) Add a column named as Reference of Char(30) to Issue table.
alter table Issue add Reference Char(30);

-- 7) Delete/Drop the column Reference from 
alter table Issue drop column Reference;

-- 8) Rename the table Issue to Lib_Issue.
alter table Issue rename TO Lib_Issue;

-- 9) Insert following data in table Member
insert into Member values(1, 'Richa Sharma', 'Pune', '2005-12-10', 'Lifetime', 25000, 5, 50),
	(2, 'Garima Sen', 'Pune', '2023-09-20', 'Annual', 1000, 3, null);
    
-- 10) Insert at least 5 records with suitable data and save it.
insert into Member values(3, 'Vipul Chaudhari', 'Jalgaon', '2007-01-12', 'Half Yearly', 5000, 2, 10),
	(4, 'Saiem Pathan', 'Nashik', '2022-02-27', 'Quarterly', 19000, 4, 23),
    (5, 'Yash Varma', 'Nagar', '2021-05-20', 'Lifetime', 9000, 8, 10),
    (6, 'Akshay Karpe', 'Aurangabad', '2002-06-14', 'Annual', 7000, 6, 20),
    (7, 'Mrunali Kale', 'Bhosari', '2020-08-17', 'Lifetime', 8000, 2, 30);

-- 11) Modify the column Member_name. Decrease the width of 
-- the member name to 20 characters. (If it does not allow state the reason for that)
alter table member add member_name_new varchar(20);
update member set member_name_new = Member_NAme;
alter table member drop column Member_NAme;
alter table member rename column member_name_new to Member_NAme;
desc member;

-- 12) Try to insert a record with Max_Books_Allowed = 110, Observe the error that comes. Report the reason for this error.
insert into Member values(8, 'Parth Patil', 'Pune', '2020-09-17', 'Half Yearly', 2000, 110, 10);
select * from Member;

-- 13) Generate another table named Member101 using a Create command along with a simple SQL query on member table.
create table Member101(
	Member_id int(5) PRIMARY KEY,
    Member_NAme varchar(30),
    Member_address varchar(50),
    Acc_Open_Date date,
    Membership_type varchar(20),
    Fees_paid int(5),
    Max_Books_Allowed int(2),
    Penalty_Amount int(7)
    );
use library_system;
desc member101;
-- 14) Add the constraints on columns max_books_allowed and penalty_amt as follows
-- Also give names to the constraints.

ALTER TABLE Member
-- a. max_books_allowed < 100
ADD CONSTRAINT check_max_books_allowed
CHECK (Max_Books_Allowed < 100),
-- b. penalty_amt maximum 1000
ADD CONSTRAINT check_penalty_amt
CHECK (Penalty_Amount <= 1000);


