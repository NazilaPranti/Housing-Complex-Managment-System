SET SERVEROUTPUT ON;

DECLARE

FLTN BOOKING.FlatNO%TYPE :='&FLATNO';
BLDN BOOKING.BuildingNO%TYPE :=&BUILDINGNO;
md MEMBER.MemberID%TYPE := &enter_memberid;
sell CHAR(4) := '&SELL';
x INT;
rslt int;

exc exception;

BEGIN

rslt := packageglbl.bookfunc(FLTN,BLDN,rslt,x);

if(rslt='1')
  then packageglbl.bookproc(FLTN,BLDN,md,sell,x);
else 
  RAISE exc;
end if;

EXCEPTION
   WHEN exc THEN
        dbms_output.put_line('Booking not possible!');
END;
/


--SELECT * FROM MEMBER WHERE MEMBERID NOT IN(SELECT MEMBERID FROM RESIDENT);