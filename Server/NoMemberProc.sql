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

/
