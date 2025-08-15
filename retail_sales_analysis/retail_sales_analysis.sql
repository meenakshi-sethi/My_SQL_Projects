-- SQL Retail Sales Analysis
DROP TABLE IF EXISTS retail_sales;


-- CREATE TABLE --
CREATE TABLE retail_sales(
		transactions_id	INT PRIMARY KEY, 
		sale_date DATE,	
		sale_time TIME,
		customer_id	INT,
		gender VARCHAR(15),
		age	INT,
		category VARCHAR(20),	
		quantiy	INT,
		price_per_unit FLOAT,	
		cogs FLOAT,	
		total_sale FLOAT
);

SELECT 
	* 
FROM 
	retail_sales
LIMIT 10;


SELECT 
	COUNT(*) 
FROM 
	retail_sales;

-- Check for null values

SELECT * 
FROM 
	retail_sales
WHERE 
	transactions_id is NULL;

-- Data Cleaning
SELECT * 
FROM retail_sales
WHERE 
	transactions_id is NULL
	OR
	sale_date is NULL
	OR
	sale_time is NULL
	OR 
	gender is NULL
	OR
	category is NULL
	OR 
	quantiy is NULL
	OR 
	cogs is NULL
	OR 
	total_sale is NULL;


DELETE FROM retail_sales
WHERE 
	transactions_id is NULL
	OR
	sale_date is NULL
	OR
	sale_time is NULL
	OR 
	gender is NULL
	OR
	category is NULL
	OR 
	quantiy is NULL
	OR 
	cogs is NULL
	OR 
	total_sale is NULL;

-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sales FROM retail_sales;

-- How many unique customers we have?
SELECT COUNT (DISTINCT customer_id) as Total_no_Cust FROM retail_sales;

-- How many unique category we have?
SELECT COUNT (DISTINCT category) FROM retail_sales;

-- Data Analysis & Business Problems

-- Q1: Query to retrieve all columns for sales made o '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_Date = '2022-11-05';


-- Q2: Query to retrieve all transactions where the category is "Clothing" and the quantity sold 
--     is more than 4 in the month of Nov 2022
SELECT *
FROM 
	retail_sales
WHERE 
	category = 'Clothing' AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' AND quantiy >= 4;

/*
-- Note this wont work

SELECT *
FROM 
	retail_sales
WHERE 
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' AND quantiy >= 4
GROUP BY
	category = 'Clothing';

*/

-- Q3: Query to calculate the total sales (total_sale) for each category.

SELECT 
	category, 
	SUM(total_sale) as total_sales
FROM 
	retail_sales
GROUP BY 
	category;

-- want to add no of orders in each category

SELECT 
	category, 
	SUM(total_sale) as total_sales,
	COUNT(*) as total_orders
FROM 
	retail_sales
GROUP BY 
	category;

-- Q4: Query to find average age of customers who purchased items from the "Beauty" category

SELECT 
	ROUND(AVG(age)) as avg_age
FROM 
	retail_sales
WHERE
	category = 'Beauty';

-- Q5: Query to find all the transactions where total_sale is greater than 1000

SELECT *
FROM
	retail_sales
WHERE
	total_sale > 1000;

-- Q6: Query to find the total number of transactions (transactions_id) made by each gender in each category

SELECT
	gender,
	category,
	COUNT(transactions_id) as total_trascations
FROM
	retail_sales
GROUP BY
	gender, category;

-- Q7: Query to calculate the average sales for each month. Find out best selling month in each year.

WITH monthly_avg_sales AS(
	SELECT
		EXTRACT(YEAR FROM sale_date) AS year,
		EXTRACT(MONTH FROM sale_date) AS month,
		AVG(total_sale) as avg_sales
	FROM
		retail_sales
	GROUP BY 
		year, month
),
ranked_months AS(
	SELECT
		year,
		month,
		avg_sales,
		RANK() OVER(PARTITION BY year ORDER BY avg_sales DESC) as sales_rank
	FROM 
		monthly_avg_sales
)
SELECT *
FROM 
	ranked_months
WHERE
	sales_rank = 1
ORDER BY year DESC;


-- can also be done using CTE and subquery
-- subquery make the query slighlty shorter. No performance difference in most sql engines  CTE's and inline subqueries both get optimized away unless we use a materialized CTE.

WITH monthly_avg_sales AS (
	SELECT
		EXTRACT(YEAR FROM sale_date) AS year,
		EXTRACT(MONTH FROM sale_date) AS month,
		ROUND(AVG(total_sale)::numeric,2) as avg_sales
	FROM 
		retail_sales
	GROUP BY
		year, month
)
SELECT * 
FROM(
	SELECT
		year,
		month,
		avg_sales,
		RANK()OVER(PARTITION BY year ORDER BY avg_sales DESC) AS ranked_sales
	FROM
		monthly_avg_sales
) as ranked_months
WHERE 
	ranked_sales = 1
ORDER BY
	year DESC;

-- Check ROUND(double precision), ROUND(numeric), ROUND(numeric, integer)


-- Q8: Query to find top 5 customers based on the highest total sales
SELECT 
	customer_id,
	ROUND(SUM(total_sale)::numeric, 2) AS total_sales
FROM
	retail_sales
GROUP BY
	customer_id
ORDER BY
	total_sales DESC
LIMIT 5;

-- Q9: Query to the number of unique customers who purchased items from each category

SELECT 
	category,
	COUNT(DISTINCT customer_id) as Total_customers
FROM 
	retail_sales
GROUP BY 
	category;

-- Q10: Query to create each shift and number of orders (Example morning <= 12, afternoon between 12 & 17, evening > 17)

SELECT
	CASE
		WHEN sale_time <= TIME '12:00:00' THEN 'Morning' 
		WHEN sale_time < TIME '17:00:00' THEN 'Afternoon' -- implicitly > 12:00:00 
		ELSE 'Evening'
	END AS shift,
	COUNT(*) AS orders
FROM 
	retail_sales
GROUP BY 1
ORDER BY orders DESC;

-- Q11: Query to find top 5 customers by total sales (Window ranking)

WITH cust_total AS (
	SELECT
		customer_id,
		ROUND(SUM(total_sale)::numeric,2) AS total_sales
	FROM 
		retail_sales
	GROUP BY 
		customer_id
),
ranked AS (
	SELECT
		customer_id,
		total_sales,
		ROW_NUMBER() OVER(ORDER BY total_sales DESC) as rn
	FROM
		cust_total
)
SELECT
	customer_id, total_sales
FROM
	ranked
WHERE 
	rn <= 5
ORDER BY
	total_sales DESC;


-- Q12: Query to show per-customer transaction deltas & running totals (explain why these customers are top performers.)

SELECT
	customer_id,
	sale_date,
	sale_time,
	total_sale,
	LAG(total_sale) OVER (PARTITION BY customer_id ORDER BY sale_date, sale_time) AS prev_sale,
	(total_sale - LAG(total_sale) OVER (PARTITION BY customer_id ORDER BY sale_date, sale_time)) AS delta_vs_prev,
	SUM(total_sale) OVER(PARTITION BY customer_id ORDER BY sale_date, sale_time ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM
	retail_sales
ORDER BY
	customer_id, sale_date, sale_time;

-- Q13: Query to show Best month per year + show all months ranked, with MoM change via LAG

WITH monthly AS(
	SELECT
		EXTRACT(YEAR FROM sale_date)::int AS yr,
		EXTRACT(MONTH FROM sale_date)::int AS mn,
		SUM(total_sale) AS month_sales
	FROM
		retail_sales
	GROUP BY yr, mn
),
ranked AS(
	SELECT
		yr,
		mn,
		ROUND(month_sales :: numeric,2) AS month_sales,
		LAG(month_sales) OVER (PARTITION BY yr ORDER BY mn) AS prev_month_sales,
		(month_sales - LAG(month_sales) OVER(PARTITION BY yr ORDER BY mn)) AS mom_delta,
		RANK() OVER (PARTITION BY yr ORDER BY month_sales DESC) AS sales_rank
	FROM
		monthly
)
SELECT
	yr,
	mn,
	month_sales,
	prev_month_sales,
	mom_delta,
	sales_rank
FROM 
	ranked
ORDER BY
	yr, sales_rank, mn;

-- Q14: Query to find customers with biggest gap between purchases (using LEAD)

WITH ordered AS(
	SELECT
		customer_id,
		sale_date,
		LEAD(sale_data) OVER (PARTITION BY customer_id ORDER BY sale_date) AS next_date
	FROM
		retial_sales
),
gaps AS(
	SELECT
		customer_id,
		sale_date,
		next_date,
		(next_date - sale_date) AS gap_days
	FROM
		ordered
	WHERE
		next_date IS NOT NULL
)
SELECT
	customer_id,
	MAX(gap_days) AS max_gap_days,
FROM
	gaps
GROUP BY
	customer_id
ORDER BY
	max_gap_days DESC
LIMIT 5;