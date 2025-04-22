use project;
show tables;

#How many orders are there in total?
select * from ecommerce_orders;
select count(order_id) as total_orders from ecommerce_orders;

#How many unique customers placed orders?

select * from ecommerce_orders;
select count(distinct(customer_id)) as unique_customers from ecommerce_orders;

#What is the total revenue generated?
select sum(price_per_unit) as total_rev_gen from ecommerce_orders;

#List all orders with the product category 'Electronics'.
select * from ecommerce_orders;
select product_name,product_category , count(product_name)as no_products from ecommerce_orders where product_category = 'Electronics' group by product_name,product_category;

#Which customer made the most purchases?
select max(customer_id) as max_purchases from ecommerce_orders;

#What is the average quantity ordered for each product category?
select product_category, avg(quantity) as avg_quantity from ecommerce_orders group by product_category ;

#How many orders were cancelled?
select * from ecommerce_orders where order_status = 'Cancelled';

#List the top 3 products with the highest sales (revenue).
select max(price_per_unit)  from ecommerce_orders;

SELECT customer_id, SUM(quantity * price_per_unit) AS total_spent
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

select customer_id, sum(quantity*price_per_unit) as total_spent from ecommerce_orders where order_status = 'Delivered' group by customer_id order by total_spent DESC limit 1;

#Which product category generated the highest revenue? 
select * from ecommerce_orders;
select product_category, max(price_per_unit) from ecommerce_orders group by product_category;

SELECT product_category, SUM(quantity * price_per_unit) AS category_revenue
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY product_category
ORDER BY category_revenue DESC
LIMIT 1;

#Find the average order value per customer. 

SELECT customer_id, AVG(quantity * price_per_unit) AS avg_order_value
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY customer_id;

#What is the monthly revenue trend?
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(quantity * price_per_unit) AS monthly_revenue
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;

#SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(quantity * price_per_unit) AS monthly_revenue
FROM ecommerce_orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;

#Which day of the week sees the most orders?
SELECT DAYNAME(order_date) AS day_of_week, COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY day_of_week
ORDER BY total_orders DESC;
