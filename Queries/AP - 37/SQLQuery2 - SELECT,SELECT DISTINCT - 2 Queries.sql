use AP;
select	VendorCity,
		VendorState 
from Vendors 
order by VendorCity;
-- This query is only asking for those columns that are inside the Vendors Table and is ordering ascendently (implicit sorting) by VendorCity
-- As you can see, some of the informations are in fact appearing more then once and even though we know that behind the scenes, which line may have unique data, in this context they don't matter

select distinct	VendorCity,
				VendorState 
from Vendors
order by VendorCity;
-- This query is the same as the previous one bu by using the distinct information they are in fact filtering the duplicates and reducing them all to only one occurrence.