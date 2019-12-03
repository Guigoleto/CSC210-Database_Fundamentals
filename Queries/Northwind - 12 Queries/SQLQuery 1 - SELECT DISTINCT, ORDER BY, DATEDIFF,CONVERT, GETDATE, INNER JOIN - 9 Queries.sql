use Northwind;
-- CustomerCustomerDemo is a blank table, don't delete it because it may become useful in the future
select * from CustomerCustomerDemo;
-- CustomerDemographics is a blank table, don't delete it because it may become useful in the future
select * from CustomerDemographics;

select	TerritoryID,
		Territories.RegionID,
		TerritoryDescription as 'Territory',
		RegionDescription as 'Region'
from Territories
	join Region
		on Territories.RegionID = Region.RegionID
order by Region.RegionID
-- This first query is mainly composed of an INNER JOIN that allows me to see on the screen the territory ID and the Region ID followed by a correlation of each Territory to its region

select distinct	Employees.EmployeeID,
		TitleofCourtesy + ' ' + FirstName + ' ' + LastName as 'Employee Name',
		TerritoryDescription as 'Territory of Influence',
		RegionDescription
from Territories
	join Region
		on Territories.RegionID = Region.RegionID
	join EmployeeTerritories
		on EmployeeTerritories.TerritoryID = Territories.TerritoryID
	join Employees 
		on Employees.EmployeeID = EmployeeTerritories.EmployeeID
order by Employees.EmployeeID
-- This is an expansion of the previous query
-- We know that we have a lot of employees and each one of them acts in a territory of a specific region
-- So by using the same syntax that I did to the previous one and making two more inner joins, I'm now able to see which employee acts at each region and territory 
-- By the way, let's take a look at something...

select Employees.EmployeeID,
		TitleofCourtesy + ' ' + FirstName + ' ' + LastName as 'Employee Name',
		DATEDIFF(YEAR,HIREDATE,GETDATE()) as 'Years of work'
from Employees
-- Go look for some retirement plans dude....

--Let's see how a customer is related to an employee...
select	CompanyName,
		ContactTitle + ': ' + ContactName as 'Contact Name',
		TitleofCourtesy + ' ' + FirstName + ' ' + LastName as 'Shops from: '
from Employees
	join Orders
		on Orders.EmployeeID = Employees.EmployeeID
	join Customers
		on Customers.CustomerID = Orders.CustomerID
-- Even though I know that the Orders Table contain a lot of useful information, I want to use it now just as a bridge to see how each customer relates to an employee. To do that, let's go for some inner joins...

select	ProductID,
		ProductName,
		CategoryName,
		CompanyName as 'Supplied By',
		City+', '+Country as 'From: '
from Products
	join Suppliers
		on Products.SupplierID = Suppliers.SupplierID
	join Categories
		on Products.CategoryID = Categories.CategoryID
--	Now I'm just checking on the products that they have on this whole database and giving a check on the categories and where are they shipped from 

select 	Orders.OrderID,
		ProductName,
		CategoryName,
		Suppliers.CompanyName as 'Supplied By',
		City+', '+Country as 'From: ',
		Shippers.CompanyName as 'Via'
from Products
	join Suppliers
		on Products.SupplierID = Suppliers.SupplierID
	join Categories
		on Products.CategoryID = Categories.CategoryID
	join [Order Details]
		on [Order Details].ProductID = Products.ProductID
	join Orders
		on Orders.OrderID = [Order Details].OrderID
	join Shippers
		on Orders.ShipVia = Shippers.ShipperID
order by Orders.OrderID
-- Now I'm expanding the previous query by adding the OrderID of each order and which company is shipping that order. To do that I had to make inner joins connecting tables one by one until the point that I was able to retrieve information from each query

select 	Orders.OrderID,
		ProductName,
		CategoryName,
		Suppliers.CompanyName as 'Supplied By',
		City+', '+Country as 'From: ',
		Shippers.CompanyName as 'Via'
from Products
	join Suppliers
		on Products.SupplierID = Suppliers.SupplierID
	join Categories
		on Products.CategoryID = Categories.CategoryID
	join [Order Details]
		on [Order Details].ProductID = Products.ProductID
	join Orders
		on Orders.OrderID = [Order Details].OrderID
	join Shippers
		on Orders.ShipVia = Shippers.ShipperID
where Country = 'Brazil'
order by Orders.OrderID
-- Just Checking what people order from brazil