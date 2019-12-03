use ProductOrders;
select	CustFirstName + ' ' + CustLastName as ' Customers Name',
		CustAddress as 'Customer Adress',
		CustCity as 'Customer City',
		CustState as ' Customer State'
from Customers
order by CustFirstName;

--This Query is just filtering some information from the Customers and displaying some of the important information about them 

select	CustFirstName + ' ' + CustLastName as ' Customers Name',
		OrderDetails.OrderID as 'Order ID',
		Items.Title 'Product',
		Items.UnitPrice as 'Unit Price',
		OrderDetails.Quantity as 'Quantity',
		Items.UnitPrice*OrderDetails.Quantity as 'Final Price'
from Items
	join OrderDetails
		on Items.ItemID = OrderDetails.ItemID
	join Orders
		on OrderDetails.OrderID = Orders.OrderID
	join Customers
		on Orders.CustID = Customers.CustID
order by CustFirstName;
-- This query, in my opinion, is extracting the most important information from that whole database
-- This query is in fact joining all the tables inside that database and displaying the information on the screen
-- The first joint that I did is joining the OrderDetails tables with the Items tables by matching the ItemID that is present in both tables
-- From that first match, I created another join that is using  the OrderDetails table and the Orders table. This joint is made by matching the OrderID that is in both table
-- The ideia of the last joint is the same as the previous joints
-- From all these joints that I've done, I was able to match the Customers that Actually had bought something, track the OrderID, the Product and the Price that his/her paid