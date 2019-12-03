use AP;
select	Count(*) as 'Number of Invoices' ,
		'$ '+ Convert(varchar(9), SUM(InvoiceTotal - PaymentTotal - CreditTotal),1) as 'Total Due'
from Invoices;
-- This is a slightly modified version of the Example that is given in the book
-- I'm counting down how many Invoices are there in the Invoices Table on the AP database by using the "Count(*)" function
-- I'm also summing all the Invoices and subtracting from them the amount that was paid and given as a Credit to check how much is still owed as Invoice

select	COUNT(*) as 'Number of Invoices',
		'$ '+ CONVERT(varchar(20),AVG(InvoiceTotal), 1) as 'Average Invoice Amount',
		'$ '+ CONVERT(varchar(20),SUM(InvoiceTotal), 1) as 'Total Invoice Amount'
from Invoices
	where InvoiceDate > '2015-09-01';
-- This query is just a "Showcase of Aggregate Functions" 
-- I'm using the Count function to count the amount of invoices and the AVG to calculate the average invoice amount and the sum to sum everything 
-- What is written between the parentheses in the AVG and SUM function is the column that I want to use the aggregate function

select	Invoices.VendorId as 'Vendor ID',
		Vendors.VendorName as 'Company Name',
		SUM(InvoiceTotal) as 'Invoices Total',
		AVG(InvoiceTotal) as 'Invoices Average'
from Invoices
	join Vendors
		on Invoices.VendorID = Vendors.VendorID
	group by Invoices.VendorID, Vendors.VendorName
	having SUM(InvoiceTotal) > 1000
order by Invoices.VendorID ASC;
-- This query is showing us the the ID and the Name from all the vendors whose Invoices Total is greater then 1000
-- This query is also showing the invoices average and the sum for each vendor
-- This query is joining two tables to match their invoice and each vendor information
-- The group by clause is grouping all the information about invoices and everything else by vendorId and VendorName, plus, without the group by clause in this situation, I wouldn't be able to use aggregate functions on the invoices
-- That happens because I'm aggregating the Invoice Total and Average by the Vendor ID BUT the VendorsName is related to the VendorID so I have to add it to the GROUP BY clause just the way I did on the example above

select	COUNT(*) as 'Californian Vendors' from Vendors where VendorState = 'CA';
-- This query is showing how many Vendor from california we have in our database

select	VendorID,
		Count(*) as 'Quantity of Invoices',
		'$ ' + Convert(varchar(20),SUM(InvoiceTotal - PaymentTotal - CreditTotal),2) as 'Invoices Total'
from Invoices
	group by VendorID with rollup;
--This query is grouping the Invoices by the Vendors ID and returning us how many invoices they had and its total
-- Also, because of the WITH ROLLUP clause, there is a summary in the end of the query output showing us all the possible summaries

select	VendorState,
		VendorCity,
		COUNT (*) as 'Quantity of Vendors' 
from Vendors
	where VendorState in ('IA','NJ')
	group by VendorState, VendorCity with rollup
order by VendorState DESC, VendorCity DESC;
-- This query is grouping the vendors by its states and cities and showing how many of them we have in each city from each state. By the ending of the grouping process, we can check not only the partial summaries but the total

select	VendorState,
		VendorCity,
		COUNT (*) as 'Quantity of Vendors' 
from Vendors
	where VendorState in ('IA','NJ')
	group by VendorState, VendorCity with cube
order by VendorState DESC, VendorCity DESC;
-- When we used the CUBE clause instead of the ROLLUP we got not only the summaries for the each state but also the summaries for each city (which in this case can also be aggregated and have its own "ROLLUP")