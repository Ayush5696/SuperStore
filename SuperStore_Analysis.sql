create database SuperStore;
use SuperStore;
select * from superstoreorders;

alter table superstoreorders
rename column ï»¿order_id to order_id;

-- What is the total sales amount
SELECT SUM(sales) 
AS total_sales 
FROM superstoreorders;

-- What is the average discount applied to orders
SELECT AVG(discount) 
AS average_discount 
FROM superstoreorders;

-- calculate the average profit:
SELECT AVG(profit) 
AS average_profit 
FROM superstoreorders;


-- Most Common Ship Mode
SELECT ship_mode, 
COUNT(*) AS order_count 
FROM superstoreorders
GROUP BY ship_mode 
ORDER BY order_count 
DESC LIMIT 1;

-- Top 5 Customers by Total Sales:
SELECT customer_name, 
SUM(sales) AS total_sales 
FROM superstoreorders 
GROUP BY customer_name 
ORDER BY total_sales 
DESC LIMIT 5;

-- Sales Distribution by Category:
SELECT category, 
SUM(sales) AS total_sales 
FROM superstoreorders 
GROUP BY category;

-- How many orders were placed in each region:
SELECT region, 
COUNT(DISTINCT order_id) 
AS order_count 
FROM superstoreorders 
GROUP BY region;

-- How many orders were shipped late :
SELECT COUNT(*) AS late_shipments 
FROM  superstoreorders
WHERE ship_date > order_date;


-- sales over year --
SELECT 
year,
SUM(sales) AS Total_sales
FROM superstoreorders
GROUP BY year
ORDER BY SUM(sales) DESC

-- customer segmentation 
SELECT
segment,
COUNT(DISTINCT customer_name) AS Toatl_customers,
SUM(sales) AS Total_sales
FROM superstoreorders
GROUP BY segment
ORDER BY SUM(sales) DESC

-- Shipping and order management --
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(profit) AS Avg_profit
FROM superstoreorders
GROUP BY ship_mode
ORDER BY AVG(profit)

--time analysis --
SELECT
ship_mode,
AVG(DATEDIFF(DAY, TRY_CAST(order_date AS DATE), TRY_CAST(ship_date AS DATE))) AS Avg_time_gape
FROM superstoreorders
GROUP BY ship_mode

-- profibility and cost analysis --
SELECT
product_name,
category,
sub_category,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_dicount
FROM superstoreorders
GROUP BY 
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC

-- Global sales and quantity product overview --
SELECT
country,
SUM(sales) AS Total_sales,
SUM(quantity)  AS Total_quantity
FROM superstoreorders
GROUP BY country
ORDER BY SUM(sales) DESC


-- state level category exploration --
SELECT 
product_name,
category,
SUM(quantity) AS Total_quantity_sold
FROM superstoreorders
GROUP BY 
product_name,
category
ORDER BY SUM(quantity) DESC

-- Regional subcategory analysis --
SELECT
region,
sub_category,
SUM(quantity) AS Total_quantity_sold
FROM superstoreorders
GROUP BY region,
sub_category
ORDER BY SUM(quantity) DESC





