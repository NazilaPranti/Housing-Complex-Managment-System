create or replace view myview1(EmployeeId,Name,Position,salary,gender,AGE,month,year,amount)as
     select e.EmployeeID,e.Name,e.Position,e.salary,e.gender,e.age,p.MNTH,p.YR,p.Amount from EMPLOYEE e JOIN PAYROLL p on e.EmployeeID=p.EmployeeID;
--SELECT * FROM myview1;


--view for due amount of flats
create or replace view myviewpaid(BuildingNo,FlatNo,SPRICE,PaidAmount,DueAmount)as
     select BuildingNo,FlatNo,SPRICE,PaidAmount,SPRICE-PaidAmount from BUILDING WHERE SPRICE <> PaidAmount;

select * from myviewpaid;


/*
create or replace view myviewpaidsites(BuildingNo,FlatNo,SPRICE,PaidAmount,DueAmount)as
     select BuildingNo,FlatNo,SPRICE,PaidAmount,SPRICE-PaidAmount from BUILDING@site1 WHERE SPRICE <> PaidAmount
     union
     select BuildingNo,FlatNo,SPRICE,PaidAmount,SPRICE-PaidAmount from BUILDING WHERE SPRICE <> PaidAmount;

select * from myviewpaidsites;

*/


