use BikeStores;
select	store_name as 'Store Name',
		'$ ' + convert(varchar(20),sum(list_price-discount),1) as 'Profit'
from sales.order_items as OI
	join sales.orders as O
		on OI.order_id = O.order_id
	join sales.stores as S
		on S.store_id = O.store_id
	group by store_name
-- This query is joining the orders, order_items and store table 
-- The ideia behind this query is to know what was the profit of each store and to do that we are using the aggregate function sum and grouping the values by the store name

select	staffs.first_name as 'Employee',
		stores.store_name as 'Employee',
		'$ ' + convert(varchar(20),sum(list_price-discount),5) as 'Profit'
from sales.staffs as staffs
	join sales.stores as stores
		on staffs.store_id = stores.store_id
	join sales.orders as O
		on O.staff_id = staffs.staff_id
	join sales.order_items as OI
		on OI.order_id = O.order_id
	group by staffs.first_name, stores.store_name
-- This query idea is the same as the previous one but the main difference is that instead of having the value returned by store, I'm having the values returned by employee of each store so in that case, we can see how much each of them sold

select	store_name as 'Store Name',
		convert(varchar(5),order_date,2) as 'Date',
		sum(list_price) as 'Profit per Month'
from sales.orders
	join sales.order_items 
		on sales.order_items.order_id = sales.orders.order_id
	join sales.stores
		on sales.orders.store_id = sales.stores.store_id
where store_name = 'Baldwin Bikes'
	group by convert(varchar(5),order_date,2), store_name
order by convert(varchar(5),order_date,2)
-- This query is printing on the screen the name of the store, the month and the profit that the store made on that month
-- I'm grouping the rows by store_name and by the date 
-- If you pay close attention the convert function is being used to not only convert the month but also to 'shorten it' and make it able to group by month
-- If this conversion was not used, it would be a littlebit hard to group things by the month and it would print things by days

select	store_name as 'Store Name',
		convert(varchar(5),order_date,2) as 'Date',
		sum(list_price) as 'Profit per Month'
from sales.orders
	join sales.order_items 
		on sales.order_items.order_id = sales.orders.order_id
	join sales.stores
		on sales.orders.store_id = sales.stores.store_id
where store_name = 'Santa Cruz Bikes'
	group by convert(varchar(5),order_date,2), store_name
order by convert(varchar(5),order_date,2)
-- This query is printing on the screen the name of the store, the month and the profit that the store made on that month
-- I'm grouping the rows by store_name and by the date 
-- If you pay close attention the convert function is being used to not only convert the month but also to 'shorten it' and make it able to group by month
-- If this conversion was not used, it would be a littlebit hard to group things by the month and it would print things by days

select	store_name as 'Store Name',
		convert(varchar(5),order_date,2) as 'Date',
		sum(list_price) as 'Profit per Month'
from sales.orders
	join sales.order_items 
		on sales.order_items.order_id = sales.orders.order_id
	join sales.stores
		on sales.orders.store_id = sales.stores.store_id
where store_name = 'Rowlett Bikes'
	group by convert(varchar(5),order_date,2), store_name
order by convert(varchar(5),order_date,2)
-- This query is printing on the screen the name of the store, the month and the profit that the store made on that month
-- I'm grouping the rows by store_name and by the date 
-- If you pay close attention the convert function is being used to not only convert the month but also to 'shorten it' and make it able to group by month
-- If this conversion was not used, it would be a littlebit hard to group things by the month and it would print things by days

select	store_name as 'Store Name',
		convert(varchar(2),order_date,2) as 'Date',
		sum(list_price) as 'Profit per Year'
from sales.orders
	join sales.order_items 
		on sales.order_items.order_id = sales.orders.order_id
	join sales.stores
		on sales.orders.store_id = sales.stores.store_id
where store_name = 'Baldwin Bikes'
	group by convert(varchar(2),order_date,2), store_name
order by convert(varchar(2),order_date,2)
-- The concept of this query is the same as the previous one but instead of grouping it by month I chose to group it by year and i did that by reducing the amount of characters on the conversion to 2 chars instead of 5 chars (like I did on the previous query)

select	store_name as 'Store Name',
		convert(varchar(2),order_date,2) as 'Date',
		sum(list_price) as 'Profit per Year'
from sales.orders
	join sales.order_items 
		on sales.order_items.order_id = sales.orders.order_id
	join sales.stores
		on sales.orders.store_id = sales.stores.store_id
where store_name = 'Santa Cruz Bikes'
	group by convert(varchar(2),order_date,2), store_name
order by convert(varchar(2),order_date,2)
-- The concept of this query is the same as the previous one but instead of grouping it by month I chose to group it by year and i did that by reducing the amount of characters on the conversion to 2 chars instead of 5 chars (like I did on the previous query)

select	store_name as 'Store Name',
		convert(varchar(2),order_date,2) as 'Date',
		sum(list_price) as 'Profit per Year'
from sales.orders
	join sales.order_items 
		on sales.order_items.order_id = sales.orders.order_id
	join sales.stores
		on sales.orders.store_id = sales.stores.store_id
where store_name = 'Rowlett Bikes'
	group by convert(varchar(2),order_date,2), store_name
order by convert(varchar(2),order_date,2)
-- The concept of this query is the same as the previous one but instead of grouping it by month I chose to group it by year and i did that by reducing the amount of characters on the conversion to 2 chars instead of 5 chars (like I did on the previous query)