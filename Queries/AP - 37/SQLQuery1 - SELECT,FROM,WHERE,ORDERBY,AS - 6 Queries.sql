use AP;
select * 
from Vendors;
-- Most basic query in SQL language that dumps on the screen all the information that is inside that database table
-- I'm using this command to show me the whole table and then practice the other syntaxes
-- The use of the * after the SELECT clause means that I'm not selecting any column specifically but for all of the columns from the VENDORS table

select	VendorId,
		VendorName,
		VendorCity,
		VendorState 
from Vendors;
--This is a query that only displays on the screen some of the table columms. 
--The columns displayed are the ones that I wrote between the SELECT clause and the FROM clause
-- Between every "column" that was asked, I must add a coma

select	VendorId, 
		VendorName,
		VendorCity, 
		VendorState 
from Vendors 
order by VendorState ASC;
-- This query is using the same concept that was seen previously but it adds the ORDER BY clause, which allow us to sort the output ascendently by "vendor state" 

select	VendorId, 
		VendorName, 
		VendorCity,
		VendorState 
from Vendors 
	where VendorState = 'CA' 
order by VendorName ASC ;
-- This query follows the same pattern from the previous one, but this one is printing only the information that matches with the condition of the WHERE clause, which in this case is looking for the vendors that are from California (CA)

select	VendorId, 
		VendorName, 
		VendorCity, 
		VendorState 
from Vendors 
	where VendorState != 'CA' 
order by VendorName ASC ;
-- This query is exactly the same as the previous one except for one minor signal which makes a major difference, the exclamation mark right after the VendorState means that he is looking for the vendors that are not from California (CA)

select  VendorId,
		VendorName as 'CompanyName',
		VendorContactFName+' '+VendorContactLName as 'VendorName',
		VendorCity,
		VendorState 
from Vendors
	where VendorState = 'CA' 
order by VendorName ASC;
--This query asks for the VendorId, the VendorName, VendorContactFName, VendorContactLName, VendorCity, VendorCity, VendorState from the Vendors Table
--In this query I changed the Vendorname to Company Name and I combined the VendorContactFName and VendorContactLName to form the "actual" vendor name
--What is interesting is that I used quotation marks to "highlight" the words that I used to replace the previous table columns and columns concatenation
--Besides the "renaming" this query is quite similar to the previous one
