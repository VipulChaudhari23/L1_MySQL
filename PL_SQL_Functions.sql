-- create function
delimiter $$
CREATE FUNCTION CalcIncome ( starting_value INT )
RETURNS INT deterministic
BEGIN
   DECLARE income INT;
   SET income = 0;

   label1: WHILE income <= 3000 DO
     SET income = income + starting_value;
   END WHILE label1;

   RETURN income;
END
$$

-- You could then reference your new function as follows:

SELECT CalcIncome (1000);

-- exampe 2 for function
delimiter $$
CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
     RETURN CONCAT('Hello, ',s,'!');
END
$$

SELECT hello('world');

-- example 3 for function
DELIMITER $$
CREATE FUNCTION sample_fn_no_param ()
RETURNS INT DETERMINISTIC
BEGIN
DECLARE count INT;
SELECT COUNT(*) INTO count FROM emp;
RETURN count;
END
$$

-- Execute and Verify Commands
select sample_fn_no_param ();

delimiter $$
create function nondet()
RETURNS INT deterministic
	BEGIN
		DECLARE date_of INT;
		SELECT current_date() INTO date_OF FROM emp;
		RETURN date_OF;
	END
$$
select nondet();

select * from emp;