create or replace package body packageglbl as

function bookfunc(f in BOOKING.FlatNO%TYPE,b in BOOKING.BuildingNO%TYPE,val out int,bldn out int) 
	return number
        is 
CURSOR C1 IS
 SELECT * FROM BUILDING@site1 WHERE (FlatNo=f AND BuildingNo=b) 
UNION 
 SELECT * FROM BUILDING WHERE (FlatNo=f AND BuildingNo=b);

cur C1%ROWTYPE; 
rslt int :=0;
ocpd Building.isoccupied%TYPE;
bkd Building.isbooked%TYPE;

begin 
        open C1;
        LOOP
        FETCH C1 INTO cur;
        if ((cur.IsOccupied='0') and (cur.Isbooked='0')) then
               rslt := 1;
               bldn := cur.BN;
        end if;
        exit when C1%notfound;
        END LOOP;

        if(rslt = 1) THEN
            val := 1;
        else
           val := 0;
        END IF;

        CLOSE C1;

        return 1;
             
end bookfunc; 

	
procedure bookproc(f in BOOKING.FlatNo%TYPE,b in BOOKING.BuildingNo%TYPE,mid in MEMBERS.MemberID%TYPE,sl in CHAR,bld in int)
       is

CURSOR CS RETURN BUILDING%ROWTYPE IS SELECT * FROM BUILDING WHERE BN=bld;
CR CS%ROWTYPE;
ST INT;

begin

open CS;
FETCH CS INTO CR;
if CS%NOTFOUND THEN
   ST:=0;
ELSE 
   ST :=1;
END if;

CLOSE CS;

IF(ST = 1) THEN
   insert into BOOKING(MemberID,Sell,FlatNO,BuildingNO,BookingDate) values(mid,sl,f,b,sysdate);
   update NONRESIDENT SET hasbooked='1' where MemberID=mid;
   update BUILDING SET IsBooked='1' where FlatNo=f and BuildingNO=b;
   commit;

ELSE
   insert into BOOKING@site1(MemberID,Sell,FlatNO,BuildingNO,BookingDate) values(mid,sl,f,b,sysdate);
   update NONRESIDENT@site1 SET hasbooked='1' where MemberID=mid;
   update BUILDING@site1 SET IsBooked='1' where FlatNo=f and BuildingNO=b;
   commit;


END IF;

end bookproc;


/*
--function for employee update salary whose age>=30
function emplyfunc(m out varchar2) 
	return number
        is
CURSOR CW IS
 SELECT * FROM EMPLOYEE@site1 WHERE AGE>=30 
UNION 
 SELECT * FROM EMPLOYEE WHERE AGE>=30 ;

CW1 CW%ROWTYPE;
  
begin
 
OPEN CW;
IF CW%NOTFOUND THEN 
 m :='not found';
 RETURN 0;
ELSE
 m:='found';
 RETURN 1;
END IF; 
CLOSE CW; 
                      
end emplyfunc; 


--procedure for employee
procedure emplyproc(v in int)
       is

CURSOR CT IS
 SELECT * FROM EMPLOYEE@site1 WHERE AGE>=30 
UNION 
 SELECT * FROM EMPLOYEE WHERE AGE>=30 ;

CT1 CT%ROWTYPE;

begin
LOOP
OPEN CT;
FETCH CT INTO CT1;
IF CT1.EmployeeID IN EMPLOYEE THEN
  update EMPLOYEE SET SALARY = Salary*v WHERE EMPLOYEEID=CT1.EMPLOYEEID;
  commit;
ELSE
   update EMPLOYEE@site1 SET SALARY = Salary*v WHERE EMPLOYEEID=CT1.EMPLOYEEID;
   commit;
EXIT WHEN CT%NOTFOUND;
END LOOP;
CLOSE CT;

end emplyproc;

*/

	
end packageglbl;
/