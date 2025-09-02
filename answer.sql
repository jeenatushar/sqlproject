select * from retail_sales where transaction_id is null or 
sale_date is NULL
or sale_time is null 
or customer_id is null or gender is null 
or age is null
or  category is null or quantity is null 
or price_per_unit is null 
or cogs is null 
or total_sale is null;

-- data cleaning 

delete from retail_sales where transaction_id is null or 
sale_date is NULL
or sale_time is null 
or customer_id is null or gender is null 
or age is null
or  category is null or quantity is null 
or price_per_unit is null 
or cogs is null 
or total_sale is null;


-- data exploration 
-- how many sales we have 

select count(*) from retail_sales;

-- how many unique  customer we have 

select count(distinct(customer_id)) from retail_sales;

-- how many distinct category customer by 

select distinct category from retail_sales

-- bussiness insight of data and finding solution

-- 1 Write a SQL query to retrieve all columns for sales made on 2022-11-05

select * from retail_sales where sale_date="2022-11-05";

-- Write a SQL query to retrieve all transactions where the category is
-- 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * from retail_sales where category="Clothing" and quantity>=4;

-- 3 Write a SQL query to calculate the total sales (total_sale) for each category and find out the highest sales of which category :

select category,sum(total_sale) as sales from retail_sales group by 1 order by sales desc ;

-- 4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

select avg(age) from retail_sales where category="Beauty" group by category;
   
    -- or 

select avg(age) from retail_sales where category="Beauty";

-- 5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:

select * from retail_sales where total_sale>1000;

-- 6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select count(transaction_id),gender,category from retail_sales group by category,gender;

-- Write a SQL query to calculate the average sale for each month.:
WITH te AS (
    SELECT *,
           MONTH(sale_date) AS month1,
           YEAR(sale_date)  AS year1
    FROM retail_sales
)SELECT AVG(total_sale)  as average_sales  ,month1,year1 avg_sale
FROM te
GROUP BY year1, month1 order by year1,month1 ;


 -- *Write a SQL query to find the top 5 customers based on the highest total sales *
 
 select customer_id,sum(total_sale) as total_sales from retail_sales group by customer_id order by total_sales desc limit 5

-- Write a SQL query to find the number of unique customers who purchased items from each category.:

select category,count(distinct customer_id ) from retail_sales group by category
