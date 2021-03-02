creat or replace procedure if_male
	is
		EmployeeID int;
		PaymentID int;
		Name varchar2(50);
		Gender varchar2(20);
	
		cursor Hello is 
			select EmployeeID,PaymentID,Name,Gender from myView1;
	   
	begin

		DBMS_OUTPUT.PUT_LINE('EmployeeID'||'  '||'  PaymentID'||'   '||' Name'||'       '||' Gender');
	
		open Hello;
		loop
			fetch Hello into EmployeeID,PaymentID,Name,Gender;
			exit when Hello%notfound;
			DBMS_OUTPUT.PUT_LINE(EmployeeID||'             '||PaymentID||'        '||Name||'          '||Gender);
		end loop;
		
	end if_male;
