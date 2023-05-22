# skillpaddy-
Classwork sql
this is my ist commit





VIEW COMMAND:  
ALTER view [dbo].[V_test_table 3] as
	select id, [customer name], Gender, Addres, height, weight, BVN, Status, Region, Country  from [test_table 3]
	where status= 'MARIED'

	select * from [V_test_table 3]
GO





RENAME COMMAND: it is used to change the existing name of a column to a new column name
EXEC sp_rename 'TEST_NEW_TABLE', '[test_table2]'

EXEC sp_rename '[test_table2]', 'TEST_NEW_TABLE'





UPDATE, ALTER COMMAND: it is used to add data to an exisitng column while alter command is used to create new columns.
alter table Purchase_Orders
add New_Date date

update Purchase_Orders
Set New_Date = SUBSTRING(Date_Period,1,10)



alter table Purchase_Orders
--alter column Month_date varchar(50)
add Month_date varchar(50)
update Purchase_Orders
Set  Month_date = SUBSTRING(Date_Period,1,7)



alter  table Purchase_Orders
add latitude varchar(50)


update Purchase_Orders 
set latitude = (Select lat from accounts a
where a.id=orders.account_id )





ALTER TABLE ORDERS
ADD NEW_DATE date

UPDATE ORDERS 
SET NEW_DATE = SUBSTRING (occurred_at,1,10) 

alter table orders
add YEAR_MONTH VARCHAR(50)

UPDATE ORDERS
SET YEAR_MONTH = SUBSTRING (occurred_at,1,7)

alter table orders
add Sales_category VARCHAR(100)

UPDATE ORDERS 
SET Sales_category = 
CASE WHEN total_amt_usd > 1000 then 'high_sales' else 'low_sales' END

ALTER table ORDERS
DROP COLUMN Sales_category

UPDATE ORDERS 
SET Sales_category = 
CASE WHEN total_amt_usd > 1500 then 'high_sales'
	WHEN total_amt_usd between 1000 and 1500 then 'mid_sales' else 'low_sales' END


	UPDATE dbaccounts
	set name = 'MTN NIGERIA', website = 'www.mtnnigeria.com', lat = 43.55857880000, long = -102.55545787655, primary_poc = 'JENNIFER PETERS', sales_rep_id =521980
	where id = 9500


	alter table orders
	add YEAR_DATE INT, MONTH_NUMBER INT

	UPDATE orders
	SET YEAR_DATE = SUBSTRING (occurred_at,1,4) , MONTH_NUMBER = SUBSTRING (occurred_at,6,2)





ROLL BACK COMMAND: it is used to return the data in a column back to its original data
BEGIN TRANSACTION;
UPDATE [dbo].[New_orders]
SET website = 'www.no_data.com'
SAVE TRANSACTION website_savepoint

UPDATE [dbo].[New_orders]
SET website = 'www.This_website_does_not_exist'
SAVE TRANSACTION website_savepoint2

rollback TRANSACTION website_savepoint



BEGIN TRANSACTION;
UPDATE [dbo].[New_orders]
SET website = 'www.no_data.com'
SAVE TRANSACTION website_savepoint

UPDATE [dbo].[New_orders]
SET website = 'www.This_website_does_not_exist'
SAVE TRANSACTION website_savepoint2

UPDATE [dbo].[New_orders]
SET website = 'www.SKILLPADDY.COM'
SAVE TRANSACTION website_savepoint3

rollback TRANSACTION website_savepoint
rollback TRANSACTION website_savepoint2



BEGIN TRANSACTION
Update New_total_band
Set total_amount_band= ( case when total_amount_band= '01 Less than 1000'then 'error' else total_amount_band end)
save transaction My_savepoint

BEGIN TRANSACTION
Update New_total_band
Set total_amount_band= ( case when total_amount_band= 'error' then '01 Less than 1000'  else total_amount_band end)
save transaction My_savepoint_2

rollback transaction My_savepoint

rollback transaction My_savepoint_2





DROP COMMAND: It is used to delete a table or column automatically and completely.
alter table orders 
drop column NEW_DATE





INSERT INTO and CREATE TABLE COMMAND: It is used to input data from an existing table into a created table while the create command is used to build a new table.
select * from Purchase_Orders

INSERT INTO TEST_ORDERS_TABLE2 

SELECT id,
Account_id,
Bronze_qty,
Silver_qty,
Gold_qty, 
Date_Period, 
SUBSTRING (Date_Period,1, 10) as date_period,
SUBSTRING (Date_Period, 1, 7) as date_month,
SUBSTRING (Date_Period, 1, 4) as date_year, 
substring (Date_Period, 6, 2) as month_number,
substring (Date_Period, 9, 2) as Day_number,
total,
Bronze_amt_usd,
Silver_amt_usd,
Gold_amt_usd, 
total_amt_usd,
round (total_amt_usd, .2) as total_amount
FROM Purchase_Orders


CREATE TABLE TEST_ORDERS_TABLE2 (
ID INT,
ACCOUNT_ID INT, 
standard_qty INT,
gloss_qty INT,
poster_qty INT,
Occurred_at date,
date_period date,
date_month VARCHAR(50),
date_year VARCHAR(50),
month_number VARCHAR(50),
 Day_number VARCHAR(50),
 total FLOAT, 
standard_amt_usd FLOAT,
gloss_amt_usd FLOAT,
poster_amt_usd FLOAT,
total_amt_usd FLOAT
)


INSERT INTO [dbo].[test_table3] ([id], [Amount], [DOB])
VALUES (2000, 5000, '2022-08-23'),
(2002, 3009, '2023-09-12'),
(3007, 2005, '2024-08-13'),





JOIN COMMAND: It is used to unite various tables together to draw data from peculiar to both of them..it can be inner, right, full outer join.
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name



Select * into tmp_test_Table_B From (
Select a.id,
a.name,
sum(b.total_amt_usd)Total_Amount,
Sum(b.total) Total_QTY,  
count (account_id)Count_TX_days,
SUBSTRING(occurred_at,1,4)Year_month
from accounts as a
inner join orders  as b 
on a.id=b.account_id
where total_amt_usd <1000
group by  a.id,name, SUBSTRING(occurred_at,1,4)
) b



Select * into tmp_test_Join From (
Select a.id,
a.name,
sum(b.total_amt_usd)Total_Amount,
Sum(b.total) Total_QTY,  
count (account_id)Count_TX_days,
SUBSTRING(occurred_at,1,4)Year_month
from accounts as a
inner join orders  as b 
on a.id=b.account_id
group by  a.id,name, SUBSTRING(occurred_at,1,4)
) b


Select * into tmp_test_Join_B From (
Select a.id,
a.name,
sum(b.total_amt_usd)Total_Amount,
Sum(b.total) Total_QTY,  
count (account_id)Count_TX_days,
SUBSTRING(occurred_at,1,4)Year_month
from accounts as a
inner join orders  as b 
on a.id=b.account_id
where total_amt_usd <1000
group by  a.id,name, SUBSTRING(occurred_at,1,4)
) b





IN AND BETWEEN COMMAND: it is used to draw out a list from a table 
SELECT  [id]
      ,[name]
      ,[website]
      ,[lat]
      ,[long]
      ,[primary_poc]
      ,[sales_rep_id]
  FROM [skill_paddy].[dbo].[accounts]
  WHERE [id] IN ( sELECT DISTINCT account_id FROM TMP_new_orders  WHERE Year_Number = 2017)
  AND sales_rep_id IN (sELECT ID FROM sales_reps WHERE region_id =4)

  
  sELECT account_id, total_amt_usd, total_amount_band FROM TMP_new_orders  
  WHERE total_amt_usd BETWEEN 1000 AND 1500
  
  
  
  
  
  ORDER BY, GROUP BY, COUNT COMMAND: Order by is used to arrange a column from smallest to highest or highest to lowest, while count command is used to find out the aggregate of similar data in a table. COUNT DISTINCT is used to find the unique set of data in a table
  Select  Year_Number, count (*)cnt from New_orders
 group by Year_Number
 order by 1 desc

 Select  Year_Number, count (*)cnt from New_orders
 group by Year_Number
 order by  cnt asc

 Select  account_id,Account_name,Year_Number, count (*) as total_count from New_orders
 group by Year_Number, account_id,Account_name
 order by  account_id asc, total_count desc

Select  account_id,
  Account_name,
  Year_Number,
  max (total_amt_usd)AS Max_total_Amt,
  min(total_amt_usd) AS Min_total_amt,
  sum(total_amt_usd)AS Sum_Total_amount,
  AVG(total_amt_usd) AS AVG_total_amt,
  count(account_id)AS count_total ,
  count(distinct account_id)AS count_uniq_account
  from New_orders
 group by Year_Number, account_id,Account_name
having  Year_Number=2016
order by  account_id asc, count_total desc




