set serveroutput on;
declare
	mid nonresident.MemberID%type;
	
	
begin
	DBMS_OUTPUT.PUT_LINE('Memeber Id to confirm Booking: ');
	
	mid := &enter_input;
	
	
	Confirm(mid);
end;
/