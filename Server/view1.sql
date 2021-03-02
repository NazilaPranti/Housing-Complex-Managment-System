create or replace view myView2(EmployeeID,Name,ContactNo)as
	(select e.EmployeeID,p.PaymentID,e.Name,e.Gender 
	from Employee@site1 e
	inner join PAYROLL@site1 p on e.EmployeeID=p.EmployeeID where e.Gender='Male')
	union
(select e.EmployeeID,p.PaymentID,e.Name,e.Gender 
	from Employee@site2 e
	inner join PAYROLL@site2 p on e.EmployeeID=p.EmployeeID where e.Gender='Male')
	union

	(select e.EmployeeID,p.PaymentID,e.Name,e.Gender 
	from Employee e
	inner join PAYROLL p on e.EmployeeID=p.EmployeeID where e.Gender='Male');




