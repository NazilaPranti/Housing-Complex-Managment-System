-----(1)

SET SERVEROUTPUT ON;

create or replace trigger trigger_log
after insert on nonresident
begin
	dbms_output.put_line('Registration Done !!');
end;
/


----(2)
SET SERVEROUTPUT ON;

create or replace trigger trigger_log
after update on employee
begin
	dbms_output.put_line('Update Done !!');
end;
/