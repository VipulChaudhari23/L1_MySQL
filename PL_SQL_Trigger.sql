create table Accounts(account_num int, amount decimal(10,2));
set @sum = 0;
-- Create trigger
-- trigger is to perfor some opperotion before/after in background, before/after we give the manula query
create trigger trg_insert before insert on Accounts 
	for each row
	set @sum = @sum + new.amount;

insert into Accounts values(1, 10000.23);
insert into Accounts values(2, 20000.23);

-- display the oppertion
select @sum;
        