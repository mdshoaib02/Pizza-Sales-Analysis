SELECT *
FROM pizza_sales_analysis.pizza_sales;

-- Total Revenue

SELECT ROUND(SUM(quantity * unit_price),2)
FROM pizza_sales_analysis.pizza_sales;
# 817860.05

-- Average Order Value

SELECT ROUND(AVG(total_price),2)
FROM pizza_sales_analysis.pizza_sales;
#16.82

-- Total Pizza Sold

SELECT SUM(quantity)
FROM pizza_sales_analysis.pizza_sales;
# 49574

-- Total Orders
 
SELECT COUNT(order_id)
FROM pizza_sales_analysis.pizza_sales;
# 48620

-- Average Pizza per Order

SELECT ROUND(SUM(quantity)/ COUNT(distinct(order_id)),2) AS average_percentage
FROM pizza_sales_analysis.pizza_sales;
# 2.32

-- Daily Trends for total Orders

SELECT dayname(order_date), COUNT(DISTINCT((order_id))) AS total_orders
FROM pizza_sales_analysis.pizza_sales
group by dayname(order_date);

-- Monthly Trends for total Orders

SELECT monthname(order_date), COUNT(DISTINCT((order_id))) AS total_orders
FROM pizza_sales_analysis.pizza_sales
group by monthname(order_date);

-- Percentage of sales on the basis of pizza category

SELECT pizza_category,ROUND(SUM(total_price),2) AS total_revenue, 
ROUND(SUM(total_price)*100 /(select SUM(total_price) from pizza_sales_analysis.pizza_sales),2) AS percentage_sales
FROM pizza_sales_analysis.pizza_sales
Group by pizza_category
ORDER BY total_revenue DESC;

-- Percentage of pizza sales on the basis of size

SELECT pizza_size,ROUND(SUM(total_price),2) AS total_sales ,ROUND(SUM(quantity)*100 /(SELECT SUM(quantity) FROM pizza_sales_analysis.pizza_sales),2) AS percentage_sales 
FROM  pizza_sales_analysis.pizza_sales
GROUP BY pizza_size
ORDER BY percentage_sales DESC;

-- Total Pizza sold by Pizza Category

SELECT pizza_category, SUM(quantity) AS total_sold
FROM pizza_sales_analysis.pizza_sales
GROUP BY pizza_category
ORDER BY total_sold DESC;

-- Top 5 pizza by revenue

SELECT 
    pizza_name, ROUND(SUM(total_price), 2) AS total_revenue
FROM
    pizza_sales_analysis.pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Bottom 5 category by revenue

SELECT pizza_name, ROUND(SUM(total_price),2) AS total_revenue
FROM pizza_sales_analysis.pizza_sales
GROUP BY pizza_name
ORDER BY  total_revenue
LIMIT 5;

-- Top 5 by quantity

SELECT pizza_name, ROUND(SUM(quantity),2) AS total_quantity
FROM pizza_sales_analysis.pizza_sales
GROUP BY pizza_name
ORDER BY  total_quantity DESC
LIMIT 5;

-- Bottom 5 pizza by Quantity

SELECT pizza_name, ROUND(SUM(quantity),2) AS total_quantity
FROM pizza_sales_analysis.pizza_sales
GROUP BY pizza_name
ORDER BY  total_quantity
LIMIT 5;

-- Top 5 pizza by total order

SELECT pizza_name, ROUND(COUNT(DISTINCT(order_id)),2) AS total_order
FROM pizza_sales_analysis.pizza_sales
GROUP BY pizza_name
ORDER BY  total_order DESC
LIMIT 5;

-- Bottom 5 Orders by Total Orders

SELECT pizza_name, ROUND(COUNT(DISTINCT(order_id)),2) AS total_order
FROM pizza_sales_analysis.pizza_sales
GROUP BY pizza_name
ORDER BY  total_order
LIMIT 5;