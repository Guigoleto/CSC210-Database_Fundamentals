use AP;
select 'Invoice : #' + InvoiceNumber + ', dated ' 
					 + convert(char(8), PaymentDate,3) + ' for $' 
					 + convert(varchar(9),PaymentTotal,1) 
					 as 'Complete Information'
from Invoices;
-- This SQL query puts some useful information together, it gets the Invoive Number, the Payment Date and the Amount that should be paid
-- It puts a nice formatting on these concatenated information
-- And it also changes the formatting of the date by using the CONVERT clause
-- The first CONVERT clause converts the payment date to a group of 8 characters, the third parameter of that function allows it to change the format of the characters that are being displayed
-- The second CONVERT clause converts the payment total toa group of 9 character (that can be changed) and also gives it the special formatting that puts a coma after every three integers number if there is a fourth one
-- for more information about the syntax you can access this website : https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15

select datediff(DAY, InvoiceDueDate, PaymentDate)
from Invoices;
-- Talking about dates, the DATEDIFF function is a good function to understand how it works
-- It basically gets two dates (without having to change it's formatting) and calculates the differences between these two dates, you can choose day, month or year (maybe even more options) to calculate the difference
-- Note that because there are some people that never payed their invoices the result of it is NULL

select datediff(DAY, InvoiceDueDate, getdate()) 
from Invoices;

select datediff(MONTH, InvoiceDueDate, getdate()) 
from Invoices;

select datediff(YEAR, InvoiceDueDate, getdate())
from Invoices;
-- The queries above doesn't have a "useful output" but the purpose of these three queries is to introduce a new function and give different using examples for that DATEDIFF function
-- first of all, as you can see the main difference between these three functions is that on one of them I'm asking for the DAY, the other for the MONTH and the other for the YEAR
-- I'm calculating how many days, month and years there are between the InvoiceDueDate and today (10/19/2019)
-- To get the information about the current day I used the function GETDATE which requires no parameters
-- Also, keep in mind that the output may change because the GETDATE() function is not a static function 