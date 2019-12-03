use BikeStores;
select	sales.customers.first_name + ' ' +sales.customers.last_name as 'Client Name',
		sales.customers.state as 'State',
		sales.customers.zip_code as 'Zip Code',
		sales.staffs.first_name + ' ' + sales.staffs.last_name as 'Staff Name',
		sales.stores.store_name as 'Store Name',
		production.products.product_name as 'Product Name',
		sales.order_items.list_price as 'Price Paid',
		datediff(day,sales.orders.shipped_date,sales.orders.required_date) as 'Days after the Required Day'
from sales.customers
	join sales.orders 
		on sales.customers.customer_id = sales.orders.customer_id
	join sales.staffs
		on sales.orders.staff_id = sales.staffs.staff_id
	join sales.stores
		on sales.staffs.store_id = sales.stores.store_id
	join sales.order_items
		on sales.order_items.order_id = sales.orders.order_id
	join production.products
		on production.products.product_id = sales.order_items.product_id;
-- Because all the tables in that database have foreign keys to relate to another table, I made a lots of joints so I would be able to retrieve information from all those tables and finally be able to connect them 
-- So the main objective from this query is to extract the information from the client and the store that he/she ordered a product
-- Plus what I think it's actually interesting is the datediff information that I used on the query that can be useful to see how the difference between the required date and the delivered date 
-- If the number is positive, that means that it took longer to deliver the product then what it was required, meaning that the delivery process was not good
-- if the number is negative, that means that it was good (I guess) because they were able to deliver the product before it was required 
-- if the number is equals to 0, that means that the product was delivered on the exact same date that it was required
-- Maybe I should implement an if statment....
 
select	sales.customers.first_name + ' ' +sales.customers.last_name as 'Client Name',
		sales.customers.state as 'State',
		sales.customers.zip_code as 'Zip Code',
		sales.staffs.first_name + ' ' + sales.staffs.last_name as 'Staff Name',
		sales.stores.store_name as 'Store Name',
		production.products.product_name as 'Product Name',
		sales.order_items.list_price as 'Price Paid',
		datediff(day,sales.orders.shipped_date,sales.orders.required_date) as 'Days after the Required Day'
from sales.customers
	join sales.orders 
		on sales.customers.customer_id = sales.orders.customer_id
	join sales.staffs
		on sales.orders.staff_id = sales.staffs.staff_id
	join sales.stores
		on sales.staffs.store_id = sales.stores.store_id
	join sales.order_items
		on sales.order_items.order_id = sales.orders.order_id
	join production.products
		on production.products.product_id = sales.order_items.product_id
where datediff(day,sales.orders.shipped_date,sales.orders.required_date) <= 0
-- This logic behind the joints are the same as the previous query 
-- But in this case, I'm actually extracting the rows tha match the where statement which are the products that were delivered on time or earlier 