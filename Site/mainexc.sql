SET SERVEROUTPUT ON;

DECLARE

FLTN BOOKING.FlatNO%TYPE :='&FLATNO';
BLDN BOOKING.BuildingNO%TYPE :=&BUILDINGNO;
md MEMBER.MemberID%TYPE := &enter_memberid;
sell CHAR(4) := '&SELL';
x INT;

exc exception;

BEGIN

x:=package2.bookf(FLTN,BLDN);

if(x='1')
  then package2.procbook(FLTN,BLDN,md,sell);
else 
  RAISE exc;
end if;

EXCEPTION
   WHEN exc THEN
        dbms_output.put_line('Booking not possible!');
END;
/


--SELECT * FROM MEMBER WHERE MEMBERID NOT IN(SELECT MEMBERID FROM RESIDENT);