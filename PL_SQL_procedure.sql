-- each procedure need to start and end different delimiter using $$
-- CASE 4: A Stored Function that Accept No Parameters
-- While loop in PL-SQL
drop procedure fact;
delimiter $$
CREATE PROCEDURE fact(IN x INT)
BEGIN
  DECLARE result INT;
  DECLARE i INT;
  SET result = 1;
  SET i = 1;
  WHILE i <= x DO
    SET result = result * i;
    SET i = i + 1;
  END WHILE;

  SELECT x AS Number, result as Factorial;
END 
$$
CALL fact(1)// 
CALL fact(2) //
CALL fact(4) //
CALL fact(0) //
-- drop procedure
DROP PROCEDURE IF EXISTS fact //

use learningmysql;
select * from cars_india_dataset;
delimiter $$
-- create the procedure
create procedure myProcedure()
begin
	select * from cars_india_dataset;
end $$

-- call the procedure
call myProcedure;

-- drop procedure
drop procedure procedure_name;

-- in parametet(input parameter)
create procedure myProcedure1(IN mkr varchar(50))
begin
	select * from cars_india_dataset where maker = mkr;
end $$
call myProcedure1('Hyundai');

-- out paremeter(output parameter)
create procedure myOutProcedure(out total int)
begin 
	select count(*) into total from cars_india_dataset;
End $$
call myOutProcedure(@total_car);
-- display the out parameter
select @total_car;

-- IN/OUT parameter
create procedure inoutparameter_getHyundaitotal(IN mkrName varchar(30), OUT total int)
begin 
	select count(*) into total from cars_india_dataset where maker = mkrName;
END $$
call inoutparameter_getHyundaitotal('Hyundai', @tol);
select @tol;

-- CASE 1: A Stored Procedure that Accept No Parameters
-- CASE 2: A Stored Procedure that Accept Parameters (IN, OUT, INOUT)
-- CASE 3: A Stored Procedure that Accept Parameters, Return ResultSet
-- CASE 4: A Stored Function that Accept No Parameters
-- CASE 5: A Stored Function that Accept Parameters

CREATE TABLE emp(first_name VARCHAR(20), id INT PRIMARY KEY);

insert into emp values('HJK', 1);
insert into emp values('ABC', 2);
insert into emp values('DEF', 3);

-- Verify Using:
select * from emp;

-- CASE 1: A Stored Procedure that Accept No Parameters
CREATE PROCEDURE sample_sp_no_param()
BEGIN
	UPDATE emp SET `first name`= 'ChangedHJK' where id = 1;
END $$

CALL sample_sp_no_param;
select * from emp;

-- CASE 2: A Stored Procedure that Accept Parameters (IN, OUT, INOUT)
CREATE PROCEDURE sample_sp_with_params (IN empId INT UNSIGNED, OUT oldName VARCHAR(20), INOUT newName VARCHAR(20))
BEGIN
	SELECT first_name into oldName FROM emp where id = empId;
	UPDATE emp SET first_name = newName where id = empId;
END $$

set @inout='updatedHJK';
CALL sample_sp_with_params(1,@out,@inout);
select @out,@inout;
select * from emp;

-- CASE 3: A Stored Procedure that Accept Parameters, Return ResultSet
CREATE PROCEDURE sample_sp_with_params (IN empId INT UNSIGNED, OUT oldName VARCHAR(20), INOUT newName VARCHAR(20))
BEGIN
	SELECT first_name into oldName FROM emp where id = empId;
	UPDATE emp SET first_name = newName where id = empId;
    select * from emp;
END

set @inout='updatedHJKS';
CALL sample_sp_with_params_resultset (1,@out,@inout);
-- You can verify the values of OUT and INOUT parameters as:
select @out,@inout;

-- CASE 4: A Stored Function that Accept No Parameters
-- While loop in PL-SQL
delimiter $$
CREATE PROCEDURE fact(IN x INT)
BEGIN
  DECLARE result INT;
  DECLARE i INT;
  SET result = 1;
  SET i = 1;
  WHILE i <= x DO
    SET result = result * i;
    SET i = i + 1;
  END WHILE;

  SELECT x AS Number, result as Factorial;
END;
CALL fact(1) //
CALL fact(2) //
CALL fact(4) //
CALL fact(0) //

-- drop procedure
DROP PROCEDURE IF EXISTS fact //

-- Do while in PL-SQL Syntex
delimiter $$
CREATE PROCEDURE fact(IN x INT)
BEGIN
  DECLARE result INT DEFAULT 1;  /* notice you can declare a variable*/
  DECLARE i INT DEFAULT 1;       /* and give it a value in one line */

  REPEAT
    SET result = result * i;
    SET i = i + 1;
  UNTIL i > x
  END REPEAT;

  SELECT x AS Number, result as Factorial;
END;
CALL fact(1) //
CALL fact(2) //
CALL fact(4) //
CALL fact(0) //
