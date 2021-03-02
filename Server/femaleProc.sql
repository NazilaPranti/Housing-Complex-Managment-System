creat or replace procedure if_female
	is
		EmployeeID int;
		PaymentID int;
		Name varchar2(50);
		Gender varchar2(20);
	
		cursor Pick is 
			select EmployeeID,PaymentID,Name,Gender from myView2;
	   
	begin

		DBMS_OUTPUT.PUT_LINE('EmployeeID'||'  '||'  PaymentID'||'   '||' Name'||'       '||' Gender');
	
		open Pick;
		loop
			fetch Pick into EmployeeID,PaymentID,Name,Status;
			exit when Pick%notfound;
			DBMS_OUTPUT.PUT_LINE(EmployeeID||'             '||PaymentID||'        '||Name||'          '||Gender);
		end loop;
		
	end if_female;
/