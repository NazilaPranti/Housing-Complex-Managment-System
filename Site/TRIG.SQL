SET SERVEROUTput on;
--TRIGGER FOR PAIDAMOUNT UPDATE

create or replace trigger triggerpd
after update 
on BUILDING
for each row

begin
	insert into trgpaid
	values(:old.PaidAmount, :new.PaidAmount, sysdate);
end;
/

--TRIGGER FOR EMPLOYEE SALARY CHANGE

create or replace trigger triggerslry
after update 
on EMPLOYEE
for each row

begin
	insert into trgslry
	values(:old.Salary, :new.Salary, sysdate);
end;
/