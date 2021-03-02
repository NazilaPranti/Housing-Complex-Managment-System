
SET SERVEROUTPUT ON;

DECLARE

rslt int := 0;
msg varchar2(10);
val int :=&incrementvalue;

E exception;

BEGIN

rslt := packageglbl.emplyfunc(msg);

if(rslt='1')
  then packageglbl.emplyproc(val);
else 
  RAISE E;
end if;

EXCEPTION
   WHEN E THEN
        dbms_output.put_line('no rows found to update!');
END;
/


