create or replace package package2 as

	function bookf(f in BOOKING.FlatNO%TYPE,b in BOOKING.BuildingNO%TYPE) 
	return number;

        procedure procbook(f in BOOKING.FlatNo%TYPE,b in BOOKING.BuildingNo%TYPE,mid in MEMBERS.MemberID%TYPE,sl in CHAR);

	function emplyfunc(m out varchar2) 
	return number;
	
        procedure emplyproc(v in int);

end package2;
/



