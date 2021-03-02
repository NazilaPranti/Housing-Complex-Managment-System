create or replace package body package2 as

--function for booking

function bookf(f in BOOKING.FlatNO%TYPE,b in BOOKING.BuildingNO%TYPE) 
	return number
        is 
ocpd Building.isoccupied%TYPE;
bkd Building.isbooked%TYPE;

begin 
        select isoccupied,isbooked INTO ocpd,bkd from BUILDING where FlatNO=f and BuildingNO=b;
        if (ocpd='1') or (bkd='1')
          then return 0;
        else return 1;
        end if;
             
end bookf; 


--procedure for booking
procedure procbook(f in BOOKING.FlatNo%TYPE,b in BOOKING.BuildingNo%TYPE,mid in MEMBERS.MemberID%TYPE,sl in CHAR)
       is

begin

insert into BOOKING(MemberID,Sell,FlatNO,BuildingNO,BookingDate) values(mid,sl,f,b,sysdate);
update NONRESIDENT SET hasbooked='1' where MemberID=mid;
update BUILDING SET IsBooked='1' where FlatNo=f and BuildingNO=b;
commit;

end procbook;

--function for employee update salary whose age>=30
function emplyfunc(m out varchar2) 
	return number
        is
cursor W is SELECT * from EMPLOYEE WHERE AGE >= 30;
W1 W%ROWTYPE;
  
begin
 
OPEN W;
IF W%NOTFOUND THEN 
 m :='not found';
 RETURN 0;
ELSE
 m:='found';
 RETURN 1;
END IF; 
CLOSE W; 
                      
end emplyfunc; 


--procedure for employee
procedure emplyproc(v in int)
       is


begin

update EMPLOYEE SET SALARY = Salary*v WHERE AGE>=30;
commit;

end emplyproc;

	
end package2;
/