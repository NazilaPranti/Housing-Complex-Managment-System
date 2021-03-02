create or replace package body myPackage as

	procedure hasBooked
	is
		nMemberID integer;
		nhasBooked integer;
		cursor Hello is
			select * from Nonresident;
	
		begin
			dbms_output.put_line('hasBooked    MemberID');
			open Hello;
			loop
				fetch Hello into nhasBooked,nMemberID;
				exit when Hello%notfound;
				dbms_output.put_line(nhasBooked||'         '||nMemberID);
			end loop;
			close Hello;
		
	end hasBooked;	

	procedure nhasBooked
	is
		nMemberID integer;
		nhasBooked integer;
		cursor Hello is
			select * from Nonresident;
	
		begin
			dbms_output.put_line('hasBooked    MemberID');
			open Hello;
			loop
				fetch Hello into nhasBooked,nMemberID;
				exit when Hello%notfound;
				dbms_output.put_line(nhasBooked||'         '||nMemberID);
			end loop;
			close Hello;
		
	end nhasBooked;	
end myPackage;
/
