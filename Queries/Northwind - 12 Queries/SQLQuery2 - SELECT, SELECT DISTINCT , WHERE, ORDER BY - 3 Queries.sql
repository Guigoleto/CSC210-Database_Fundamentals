use Northwind;
select distinct Country 
from Customers 
order by Country;
-- I'm checking the countries that we have customers\

select	ProductID,
		ProductName
from Products
where Discontinued <> 0
-- I'm checking the products that were discontinued 

select	ProductName,
		CompanyName,
		Country as 'From: '
from Products
	join Suppliers
		on Products.SupplierID = Suppliers.SupplierID
where Discontinued <> 0
-- I'm for the companies and their products that were discontinued