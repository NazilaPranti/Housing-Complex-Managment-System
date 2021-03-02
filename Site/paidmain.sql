--if paidamount updated THEN BUILDING TABLE is UPDATED
SET SERVEROUTPUT ON;

DECLARE
B BUILDING.BuildingNo%type :=&buildingno;
F BUILDING.FlatNo%type :='&flatno';
pd BUILDING.PaidAmount%type :=&paidamount;

cursor H IS SELECT * FROM BUILDING WHERE BuildingNo=B and FlatNo=F;
CURS H%ROWTYPE;

ex EXCEPTION;
BEGIN

OPEN H;

FETCH H INTO CURS;
if (CURS.PaidAmount+pd) <= CURS.SPRICE then
  UPDATE BUILDING SET PaidAmount=PaidAmount+pd WHERE BuildingNo=B and FlatNo=F;
  commit;
else
  raise ex;    
   
end if;

CLOSE H; 

EXCEPTION
   WHEN ex THEN
        dbms_output.put_line('paid amount exceeds sell price!');  
END;
/


