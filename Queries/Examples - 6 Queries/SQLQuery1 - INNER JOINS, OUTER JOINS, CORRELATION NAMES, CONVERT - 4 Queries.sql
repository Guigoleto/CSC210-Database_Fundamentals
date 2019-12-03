use Examples;

select	EmployeeID as 'Employee ID',
		FirstName + ' ' + LastName as 'Employee Name',
		DeptName as 'Departament Name'
from Employees 
	join Departments 
		on Employees.DeptNo = Departments.DeptNo
order by Employees.EmployeeID;
-- This query is correlating the Employees with their respective Department Name

 select EmployeeID as 'Employee ID',
		FirstName + ' ' + LastName as 'Employee Name',
		DeptName as 'Departament Name'
from Employees 
	right join Departments 
		on Employees.DeptNo = Departments.DeptNo
order by Employees.EmployeeID;
-- This query has the same idea of the previous one, but I'm making an outer join with the table departments so you can see which value was not returned with the inner join that would be returned with an outer join
-- If you pay attention, there are no employees working on Department Number 3 

select RepFirstName + ' ' + RepLastName as ' Representative Name',
	   SalesReps.RepId as 'Representative ID',
	   SalesYear as 'Sales Year',
	   '$ '+convert(varchar(20),SalesTotal,1) as 'Sales Total'
from SalesReps
	join SalesTotals
		on SalesReps.RepID = SalesTotals.RepID;
-- This query is Showing the Representative's Name as well as its ID and its Sales Total Per year based on the condition that the Representative ID appears on both SalesReps and SalesTotals Tables

select InvestorID as 'ID',
	   FirstName + ' ' + Lastname as 'Investor Name',
	   Phone,
	   '$ '+convert(varchar(10),Investments,1) as 'Investments',
	   '$ '+convert(varchar(10),NetGain,1) as 'Net Gains',
	   '$ '+convert(varchar(10),Investments+NetGain,1) as 'Final Amount'
from Customers 
	join Investors
		on Investors.InvestorID = Customers.CustID;
-- This query is matching the people that are customers and also investors and returning their ID's as well as their names , Investments, Profits and Final Amount
