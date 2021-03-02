--to get resident with building and flatno
select R.MemberID,R.FlatNo,R.BuildingNo from RESIDENT R inner join BUILDING B ON R.BuildingNo=B.BuildingNo where staying=1 and R.FlatNo=B.FlatNo;

--rent resident
