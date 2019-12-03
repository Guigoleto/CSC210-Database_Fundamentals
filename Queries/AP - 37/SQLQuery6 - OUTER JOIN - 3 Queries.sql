use AP;
select	VendorName,
		InvoiceNumber, 
		InvoiceTotal 
from Vendors 
	join Invoices
		on Vendors.VendorID = Invoices.VendorID 
order by VendorName;
-- This is a typical INNER JOIN that is using the Vendors Table and the Invoices Table to get some useful information
-- I choose to print this first so we can understand between an INNER JOIN and an OUTER JOIN
-- As you can see, this is statement only prints the rows that match the with the ON clause condition

select	VendorName,
		InvoiceNumber, 
		InvoiceTotal 
from Vendors 
	left join Invoices
		on Vendors.VendorID = Invoices.VendorID 
order by VendorName;
-- This is a typical OUTER JOIN that is pretty much the same as the previous query 
-- The LEFT clause is saying that we want to display on the screen all the information from the Vendors Table, whether they match with the condition or not
-- As you can see, the rows that match with the conditions are printed normally as they were in the previous query but the rows that don't match the condition are printed with NULL values

select	VendorName,
		InvoiceNumber, 
		InvoiceTotal 
from Vendors 
	right join Invoices
		on Vendors.VendorID = Invoices.VendorID 
order by VendorName;
-- Notice that the output of this query is the same of the first query