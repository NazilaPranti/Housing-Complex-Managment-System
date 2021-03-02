set serveroutput on;
set verify off;
--MemberID,FlatNo,BuildingNo,NumberOfMember,RentID,Month,Year
DECLARE
	nMemberID integer:=&MemberID;
	FlatNo  VARCHAR(4):='&FlatNo';
	BuildingNo VARCHAR(4):='&BuildingNo';
	NumberOfMember INT:=&NumberOfMember;
	RentID INT:=&RentID;
	Month VARCHAR2(10):='&Month';
	Year INT:=&Year; 
	nhasBooked INT:=&hasBooked;	
	
	excp exception;
	
BEGIN
	if MemberId=nMemberID then
		insert into resident values(nMemberID,FlatNo,BuildingNo,NumberOfMember);
	
		insert into Rent values(nMemberID,FlatNo,RentID,Month,Year);
	
		update  set MemberID=nMemberID where hasBooked=nhasBooked;
		myPackage.Nonresident;
		
	elsif MemberId=nMemberID then
		insert into resident values(nMemberID,FlatNo,BuildingNo,NumberOfMember);
		commit;
		insert into Rent values(nMemberID,FlatNo,RentID,Month,Year);
		commit;
		update Booking set MemberID=nMemberID where hasBooked=nhasBooked;
		commit;
		myPackage.nhasBooked;	
		
	else
		raise excp;
	end if;
	
EXCEPTION
	when excp then
		dbms_output.put_line('Wrong Entry!!');
	
	
END;
/
