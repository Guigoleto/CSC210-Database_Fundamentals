use Examples;
select	Employees.EmployeeID,
		Employees.FirstName + ' ' + Employees.LastName as 'Full Name',
		Employees.DeptNo as 'Department Number',
		Departments.DeptName as 'Department Name',
		Employees.ManagerID as 'First Manager',
		EmployeesTest.ManagerID as 'Second Manager'
from Employees 
	left join Departments
		on Employees.DeptNo = Departments.DeptNo
	right join EmployeesTest
		on Employees.EmployeeID = EmployeesTest.EmployeeID;
-- This query began with the ideia of showing me the employee list of a company and how was the first hierarchy and how was the Test Hierarchy. But surprisingly, attempting to make this not only showed me the output that I wanted but also the fact that a new Department was created (just as curiosity: and it still has no name)

use Examples;
	select	'Active' as 'Source',
			InvoiceNumber as 'Invoice Number',
			InvoiceDate as 'Invoice Date',
			InvoiceTotal as 'Invoice Total'
	from ActiveInvoices
	where InvoiceDate >= ' 02/01/2016'
union
	select	'Paid' as 'Source',
			InvoiceNumber as 'Invoice Number',
			InvoiceDate as 'Invoice Date',
			InvoiceTotal as 'Invoice Total'
	from PaidInvoices
	where InvoiceDate >= ' 02/01/2016'
order by InvoiceTotal desc;

-- The UNION clause is a very useful clause that can be used when you want to join different information from two different tables
-- The only thing that we have to pay attention when using the UNION clause is that the information type that we are using the fill one column must be of the same type in all the united tables. 