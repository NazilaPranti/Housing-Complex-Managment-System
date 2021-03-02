SET SERVEROUTPUT ON;

DECLARE

E exception;
rslt int := 0;
msg varchar2(10);
val int :=&incrementvalue;

BEGIN

rslt := package2.emplyfunc(msg);

if(rslt='1')
  then package2.emplyproc(val);
else 
  RAISE E;
end if;

EXCEPTION
   WHEN E THEN
        dbms_output.put_line('no rows found to update!');
END;
/

