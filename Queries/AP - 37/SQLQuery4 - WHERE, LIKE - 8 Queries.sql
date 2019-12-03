use AP; 
select	VendorID,
		VendorName,
		VendorCity 
from Vendors
	where VendorCity like 'PH%'; 
-- This query will match all the possible solutions that contain a "PH" in the word
-- After making the matching, this statement will print on your screen all the possible solutions that were found

select	VendorID,
		VendorName, 
		VendorCity 
from Vendors 
	where VendorName like 'COMPU_ER%'; 
-- This query will match all the possible solutions that contain the same letters in that same position. 
-- But the "_" can be filled with any character, therefore it can be used as a "trump card" 
-- After making the matching, this statement will print on your screen all the possible solutions that were found

select	VendorID,
		VendorName,
		VendorCity, 
		VendorContactLName 
from Vendors 
	where VendorContactLName like 'BRA[A-Y]%'; 
-- This query will match all vendors whose name contain the sequence "BRAA", "BRAB", "BRAC", ... , "BRAY".
-- What is important to know is that by using the syntax with the "[]" you can select which "letters" you want to be matched 
-- In this situation, by using the [A-Y], the SQL query will try to find all the possible solutions which that has any letters within that range

select	VendorID, 
		VendorName,
		VendorCity,
		VendorState
from Vendors
	where VendorState like 'N[CJ]';
-- As you can see, by putting [CJ] you will ask only for the "NC" and "NJ" combination

select	VendorID,
		VendorName,
		VendorCity,
		VendorState
from Vendors
	where VendorState like 'N[^K-Y]'; 
-- This query has a similar syntax to the previous two but its logic is the opposite of the previous one
-- This query will look for all the possible solutions except for the ones that contain any combination of characters within that range(from K to Y)

select	VendorID,
		VendorName,
		VendorCity,
		VendorZipCode 
from Vendors
	where VendorZipCode not like '[1-9]%';
-- Have the same idea from the previous query
-- The difference is before the "LIKE" clause, because you have a "NOT" clause
-- This query will look for all the possible solutions whose zipcode don't start with any number from 1 to 9, therefore it will look only for the ones that begin with 0

select  VendorID,
		VendorName,
		VendorCity,
		VendorZipCode
from Vendors 
	where VendorZipCode like '20%'
-- In this query I'm just asking for Vendors whose ZipCode starts with "20"

select	VendorId,
		VendorName, 
		VendorCity, 
		VendorState, 
		VendorZipCode
from Vendors
	where VendorState = 'CA' and VendorZipCode like'93%' 
order by VendorZipCode;
-- I'm displaying only Vendors that are from CA and whose ZipCode starts with "93"