select	Ap.dbo.Invoices.InvoiceID,
		Ap.dbo.Invoices.VendorID,
		Ap.dbo.Invoices.InvoiceNumber,
		Ap.dbo.Invoices.InvoiceTotal,
		Ap.dbo.Invoices.InvoiceDueDate
from Ap.dbo.Invoices 
	join Examples.dbo.ActiveInvoices 
		on Ap.dbo.Invoices.InvoiceID = Examples.dbo.ActiveInvoices.InvoiceID
-- This query is joining the Invoices Table on the AP database and also the ActiveInvoices Table on the Examples database
-- Even thought it might seen to be a little bit unusual, it is important to understand how to connect information from different databases (talking about computer security, it's safer to have information spread across different databases then having it all together in a single one)
-- Not that the logic behind it is the same as the inner join
-- This query is showing us the Invoices that are still actives