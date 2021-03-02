set serveroutput on;
declare
	mid member.MemberID%type;
	mn member.Name%type;
	cn member.ContactNo%type;
	op member.Occupation%type;
	ads nonresident.ADDR%type;
	
begin
	DBMS_OUTPUT.PUT_LINE('Enter your Following Information for registration: ');
	
	mid := &enter_input;
	mn := &enter_input;
	cn := &enter_input;
	op := &enter_input;
	ads := &enter_input;
	
	registration(mid,mn,cn,op,ads);
	
end;
/