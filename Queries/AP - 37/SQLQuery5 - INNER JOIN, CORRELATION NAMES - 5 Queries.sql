use Ap;
select	InvoiceID, 
		VendorContactFName+' '+VendorContactLName as 'VendorName',
		VendorAddress1,
		VendorCity,
		VendorName as 'Company Name',
		VendorState
from Invoices 
	join Vendors 
		on Invoices.VendorID=Vendors.VendorID 
order by InvoiceID;
-- This query is asking the VendorID from the invoices table, the vendor city, the vendorName and also changing it to Company Name and joining the Vendor Contact Name and naming this concatenation as VendorName
-- Besides that, this query is in fact joining the Invoices and the Vendors but the only rows that are going to be displayed are the ones the match the condition displayed on the ON clause
-- Which means that the only rows displayed are those that contains a VendorID that is the same on both the Invoice and the Vendors Table

select	Vendors.VendorID,
		VendorName,
		VendorState 
from Vendors 
	join Invoices
		on Vendors.VendorID = Invoices.VendorID;
-- The first column that is being selected on this query is different from what we have seen so far. That's because the two tables that I'm joining in fact have columns with the same name so we have to specify which table are we retrieving that information. To do that, I wrote Vendors.VendorId to specify that I'm retrieving information from that specific table
-- This query has the same objective of the previous one by I'm only displaying a couple of columns 

select	Vendors.VendorID, 
		VendorName,
		VendorState 
from Vendors 
	join Invoices
		on Vendors.VendorID != Invoices.VendorID;
-- This query displays on the screen only the Vendors that doesn't have an Invoice

select	InvoiceID,
		VendorContactFName+' '+VendorContactLName as 'VendorName',
		VendorAddress1,
		VendorCity,
		VendorName as 'Company Name',
		VendorState 
from Invoices as i 
	join Vendors as v 
		on v.VendorID = i.VendorID
order by InvoiceID;
-- This is exactly the same query as the previous one but this one has a different feature
-- The main difference between them is that this query assign a different name for the tables, the Invoices is being named "i" while the Vendors is being named "v"
-- Keep in mind that whenever you name a table you have to refer use the renamed version of it throughout your query

use AP;
select	VendorName as 'CompanyName',
		Vendors.VendorID,
		convert(varchar(9),PaymentTotal,1) as 'PaymentTotal' , 
		InvoiceLineItemDescription as 'LineItemAmount'
from Vendors
	join Invoices 
		on Vendors.VendorID = Invoices.VendorID
	join InvoiceLineItems 
		on Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	where PaymentTotal > 0
order by Vendors.VendorID;
-- This Query is asking to dump on the screen those columns that are in different tables (Vendors, Invoices and InvoiceLineItems)
-- The tricky part about this query is that instead of joining information from only two tables it is in fact joining informations about three different tables which then require conditions for each join situation
-- Note that the 0 are not displayed because they don't matter for us 



