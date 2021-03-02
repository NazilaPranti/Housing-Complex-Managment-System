create or replace view myView3(MemberID,Name,BuildingNo,NumberOfMember)as
	(select m.MemberID,m.Name,r.BuildingNo,r.NumberOfMember 
	from Member@site1 m
	inner join Resident@site1 r on m.MemberID=r.MemberID where r.NumberofMember<=2)
	union
(select m.MemberID,m.Name,r.BuildingNo,r.NumberOfMember 
	from Member@site2 m
	inner join Resident@site2 r on m.MemberID=r.MemberID where r.NumberofMember<=2)	
	union
	(select m.MemberID,m.Name,r.BuildingNo,r.NumberOfMember 
	from Member m
	inner join Resident r on m.MemberID=r.MemberID where r.NumberofMember<=2);
