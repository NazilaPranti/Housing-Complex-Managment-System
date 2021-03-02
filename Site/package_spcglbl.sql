create or replace package packageglbl as

	function bookfunc(f in BOOKING.FlatNO%TYPE,b in BOOKING.BuildingNO%TYPE,val out int,bldn out int) 
	return number;
	
	procedure bookproc(f in BOOKING.FlatNo%TYPE,b in BOOKING.BuildingNo%TYPE,mid in MEMBERS.MemberID%TYPE,sl in CHAR,bld in int);

        /*
        function emplyfunc(m out varchar2) 
	return number;
	
        procedure emplyproc(v in int);

        */


end packageglbl;
/
