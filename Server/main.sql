set serveroutput on;
set verify off;

DECLARE
	Gender varchar2(20):='&Gender';
	chk exception;
BEGIN
	if (Gender='Male' or Gender='Female') then
		if Gender='Male' then
			myPackage.if_male();
		elsif Gender='Female' then
			myPackage.if_female();
		end if;
	else
		RAISE chk;
	end if;

EXCEPTION
	when chk then
		dbms_output.put_line('Wrong Entry!!!');
	
END;
/
