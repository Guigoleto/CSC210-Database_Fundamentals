use BikeStores;	
select	product_name as 'Name',
		category_name as 'Category',
		brand_name as 'Brand',
		list_price as 'Price',
		quantity as 'On Stock'
from production.products
	join production.categories 
		on production.products.category_id = production.categories.category_id
	join production.brands
		on production.brands.brand_id = production.products.brand_id
	join production.stocks
		on production.products.product_id = production.stocks.product_id
where production.stocks.quantity = 0 ;
-- This query is joining 4 tables at once by using the primary key from each table. All the tables have foreign keys that refer to the primary keys from other tables, such as category_id that is present on both category table and also the products table
-- By using these we joined the tables and displayed on the screen what would be a "sales" interface
-- But in this situation, instead of asking for all of the products, I only want to see the ones that they don't have on stock

select	product_name as 'Name',
		category_name as 'Category',
		brand_name as 'Brand',
		list_price as 'Price',
		quantity as 'On Stock'
from production.products
	join production.categories 
		on production.products.category_id = production.categories.category_id
	join production.brands
		on production.brands.brand_id = production.products.brand_id
	join production.stocks
		on production.products.product_id = production.stocks.product_id
where production.products.list_price < 400 
	and production.stocks.quantity > 0
	and production.products.model_year = 2016;
-- Those table relate the rows with the foreign keys and primary keys, because I know that, I joined those tables one by one until all of them were actually connected so I would be able to put them all together and extract information from all of them 
-- Plus, I created a where statement that will only retrieve information from the rows whose products.list_price is lower then 400 and they have at least 1 product on their stock and are relatively new (from 2016)

select	product_name as 'Name',
		category_name as 'Category',
		brand_name as 'Brand',
		list_price as 'Price',
		quantity as 'On Stock'
from production.products
	join production.categories 
		on production.products.category_id = production.categories.category_id
	join production.brands
		on production.brands.brand_id = production.products.brand_id
	join production.stocks
		on production.products.product_id = production.stocks.product_id
where production.categories.category_name = 'Mountain Bikes' 
	and production.brands.brand_name = 'Surly'
	and production.products.list_price < 1000
	and production.stocks.quantity > 0
order by list_price;
-- The joints made here are the same from the previous query but what I changed here are the where statements 
-- First of all, I raised a little bit the prices to display on the screen prices up to 1000 
-- Second, now I want products only from the brand Surly 
-- And third I want to see the products that they actually have on the stock 