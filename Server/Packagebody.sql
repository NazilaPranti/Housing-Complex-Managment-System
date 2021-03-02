create or replace package body myPackage as
---1
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


----2
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

---3
set serveroutput on;
creat or replace procedure N_of_Mem
	is
	MemberID int;
		 Name VARCHAR(30);
	BuildingNo VARCHAR(4);
	NumberOfMember INT;


cursor HI is select MemberID,Name,BuildingNo,NumberOfMember from myView3;

begin

		DBMS_OUTPUT.PUT_LINE('MemberID'||'  '||' Name'||'       '||' BuildingNo'||'	'||' NumberOfMember');
	
		open HI;
		loop
			fetch HI into MemberID,PaymentID,Name,Status;
			exit when HI%notfound;
DBMS_OUTPUT.PUT_LINE(MemberID||'          '||Name||'       '||BuildingNo||'		'||NumberOfMember);
		
end loop;

end N_of_Mem;

 
end myPackage;
/
