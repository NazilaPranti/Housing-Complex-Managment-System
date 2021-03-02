SET SERVEROUTPUT ON;

create or replace trigger trigger_log
after insert on Resident
begin
	dbms_output.put_line('New Data in Resident table!');
end;
/
create or replace trigger trigger_log1
after insert on Rent
begin
	dbms_output.put_line('New Data in Rent table!');
end;
/
create or replace trigger trigger_log2
after update on Nonresident
begin
	dbms_output.put_line('New Data in Nonresident table!');
end;
/
SET SERVEROUTPUT ON;
