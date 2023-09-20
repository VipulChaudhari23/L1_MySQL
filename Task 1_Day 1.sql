show databases;
show tables;
-- Create database
create database library;

-- use database as library
use library;

-- create table books
create table Books (
	Book_No int(20),
    Book_Name varchar(40), 
    Author_Name varchar(40),
    Cost int(10),
    Category char(20)
    );
    
-- Description of table books;
desc Books;

-- insert data into table
insert into Books values (101, 'Let us C', 'Denis Ritchie', 450, 'System'), 
	(102, 'Oracle-complete REF', 'Loni', 550, 'Database'), 
	(103, 'Master in SQL', 'Loni', 250, 'Database'), 
	(104, 'PL SQL - REF', 'Scott Urman', 750, 'Database');
	
-- 1] select all the records
select * from books;
    
-- 2] select records whose cost between >=500 and <=700
select * from books where cost >= 500 and cost <= 700;

-- 3] Find record with book name staring with O letter
select * from books where Book_Name like 'O%';

-- 4] find records whose cost is < avg cost
select * from books where Cost > (select avg(Cost) from books);

-- 5] create new table with same structure
-- 6] create new table as copy of books
CREATE TABLE new_Books as (select * from Books);
select * from new_Books;

-- 5] create new table with database as category
Create table onlydatabase as (select * from Books where category = 'Database');
select * from onlydatabase;
    
-- 6] find record with max cost
select max(cost) from books;
select * from books where cost= (select max(cost) from books);

-- 7] find record with min cost
select min(cost) from books;
select * from books where cost= (select min(cost) from books);

-- 8]find name of the author who has  published more than one book
select * from books group by author (where author < 2)
select * from books where count(Author) > 0;

-- just to copy schema 
create table books3 like books;
select * from books3;

-- copy old table gto new table
create table books2 as select * from books;
select * from books2;

-- update cost to old + 150 
SET SQL_SAFE_UPDATES = 0;
update books set cost = cost + 150;
select * from books;

-- select book name under category of database only 
select Book_name from books where category = 'Database';

-- select book name, cost under (Database, system)
select Book_name, Cost from books where category = 'Database' or category = 'System';

-- alter table add new column publish year
alter table books add Publish_year int(20);

-- add data to publish year 
update books set publish_year = 2001 where category = 'database';
update books set publish_year = 2005 where category = 'system';
select * from books;

-- insert the value in publish_year but other values will be null
insert into books(Publish_year) values (2001), (2002), (2003), (2004);

-- delete perticular entyr form the table
DELETE from books where publish_year = 2004; 
