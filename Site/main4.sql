---Employee info for Member ----


set serveroutput on;
declare
	
begin
	
	EmployeeInfo();
end;
/
==================================================

create or replace procedure EmployeeInfo
	is

	eid employee.employeeID%type;
	en employee.employeeName%type;
	ec employee.Contact%type;
	ep employee.Position%type;
	eg employee.Gender%type;

	
	create or replace view  
	myview2(ID,Name,ContactNo,Position,Gender) as
	select eployeeID,employeeName,Contact,Position,Gender from Employee@site1
	union all
	select eployeeID,employeeName,Contact,Position,Gender from Employee@site2;
begin
	
	open hello;
	loop
		fetch hello into bn,fn,iso,isb,pr,ps,sz;
		exit when hello%notfound;
		DBMS_OUTPUT.PUT_LINE(eid||' 	'||en||' 	'||ec||' 	'||ep||' 	'||eg);
	end loop;
	close hello;
	
end BuildingInfo;
/