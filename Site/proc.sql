----------------(1) Regitration----------------

create or replace procedure Registration( mid in member.MemberID%type,mn in member.Name%type,cn in  member.ContactNo%type,op in member.Occupation%type,ads in nonresident.ADDR%type)
	is

begin
	INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(mid,mn,cn,op);
	INSERT INTO NONRESIDENT (MemberID, hasBooked, ADDR) values(mid,0,ads);
	commit;
end Registration;
/



------------(2) booking confirm by Admin------

create or replace procedure Confirm( mid in nonresident.MemberID%type)
	is
begin

	Insert into RESIDENT (MemberID, FlatNo, BuildingNo, NumberOfMember,LeavingDate,Staying) values (
	mid,(SELECT FlatNo FROM BOOKING where MemberID=mid),
	(SELECT BuildingNo FROM BOOKING where MemberID=mid),'5','',1);
	DELETE From NONRESIDENT where MemberID=mid;
	DELETE From BOOKING where MemberID=mid;


	
end Confirm;
/




--------------(3) Building info for Member -----------



create or replace procedure BuildingInfo
	is


	bn Building.BuildingNo%type;
	fn Building.FlatNo%type;
	iso Building.IsOccupied%type;
	isb Building.IsBooked%type;
	pr Building.Rprice%type;
	ps Building.Sprice%type;
	sz Building.Capacity%type;


	create or replace view myView13(BNo, FNo,oc,bk, Sz,Rp,Sp)as
	select  one.BuildingNo,one.FlatNo ,one.IsOccupied,one.IsBooked, one.Capacity,one.Rprice,one.Sprice from Building@site1 one
	union
	select  t.BuildingNo,t.FlatNo ,t.IsOccupied,t.IsBooked, t.Capacity,t.Rprice,t.Sprice from Building@site2 t; 

	cursor hello is
	select BNo, FNo,oc,bk,Sz,Rp,Sp from myview13;
begin
	
	open hello;
	loop
		fetch hello into bn,fn,iso,isb,sz,pr,ps;
		exit when hello%notfound;
		DBMS_OUTPUT.PUT_LINE(bn||' 	'||fn||' 	'||iso||' 	'||isb||' 	'||sz||' 	'||pr||'	'||ps);
		
	end loop;
	close hello;
	
end BuildingInfo;
/




--------------(4) Employee info for Member--------- ----


create or replace procedure EmployeeInfo
	is

	eid employee.employeeID%type;
	en employee.employeeName%type;
	ec employee.Contact%type;
	ep employee.Position%type;
	eg employee.Gender%type;

	
	create or replace view  
	myview2(ID,Name,ContactNo,Position,Gender) as
	select o.eployeeID,o.employeeName,o.Contact,o.Position,o.Gender from Employee@site1 o
	union all
	select t.eployeeID,t.employeeName,t.Contact,t.Position,t.Gender from Employee@site2 t;
begin
	
	open hello;
	loop
		fetch hello into eid,en,ec,ep,eg;
		exit when hello%notfound;
		DBMS_OUTPUT.PUT_LINE(eid||' 	'||en||' 	'||ec||' 	'||ep||' 	'||eg);
	end loop;
	close hello;
	
end BuildingInfo;
/