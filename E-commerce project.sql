create database ecommerce;
use ecommerce;


CREATE TABLE customers_table (
customer_id int PRIMARY KEY,
customer_name varchar(100),
city varchar(50),
state varchar(50),
signup_date date
);


CREATE TABLE ecommerce.products_table(
product_id int primary key,
product_name varchar(50),
category varchar(50),
price mediumint
);

DROP TABLE product_table;

 create table ecommerce.orders_table(
 order_id int,
 customer_id int,
 product_id int,
 order_date date,
 quantity int,
 sales int 
 );
 

ALTER TABLE ecommerce.orders_table
ADD PRIMARY KEY (order_id);

SELECT*FROM CUSTOMERS_TABLE;
SELECT*FROM ORDERS_TABLE;
SELECT*FROM product_table;


-- TOTAL SALES
SELECT SUM(sales) AS total_sales
FROM orders_table;

-- TOTAL ORDERS
SELECT COUNT(order_id) AS total_orders
FROM orders_table;

-- TOTAL CUSTOMERS
SELECT COUNT(customer_id) AS total_customers
FROM customers_table;

-- SALES BY CATEGORY

SELECT 
p.category,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN products_table p
ON o.product_id = p.product_id
GROUP BY P.category
ORDER BY total_sales DESC;

-- TOP 10 PRODUCTS BY SALES
SELECT 
p.product_name,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN products_table p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;

-- SALES BY CITY
SELECT 
c.city,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN customers_table c
ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_sales DESC;

-- SALES BY STATE
SELECT 
c.state,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN customers_table c
ON o.customer_id = c.customer_id
GROUP BY c.state
ORDER BY total_sales DESC;

-- MONTHLY SALES TREND
SELECT 
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(sales) AS total_sales
FROM orders_table
GROUP BY year, month
ORDER BY year, month;

-- TOP 10 CUSTOMERS BY SALES
SELECT 
c.customer_name,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN customers_table c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- AVERAGE ORDER VALUE
SELECT 
SUM(sales) / COUNT(order_id) AS avg_order_value
FROM orders_table;

-- TOTAL QUANTITY SOLD BY CATEGORY
SELECT 
p.category,
SUM(o.quantity) AS total_quantity
FROM orders_table o
JOIN products_table p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_quantity DESC;

-- SALES BY CATEGORY AND CITY
SELECT 
p.category,
c.city,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN products_table p
ON o.product_id = p.product_id
JOIN customers_table c
ON o.customer_id = c.customer_id
GROUP BY p.category, c.city
ORDER BY total_sales DESC;

-- TOP FIVE STATES BY SALES

SELECT 
c.state,
SUM(o.sales) AS total_sales
FROM orders_table o
JOIN customers_table c
ON o.customer_id = c.customer_id
GROUP BY c.state
ORDER BY total_sales DESC
LIMIT 5;

-- TOTAL SALES PER CUSTOMER
use ecommerce;

SELECT 
c.customer_name,
SUM(o.sales) as sales from orders_table o
join customers_table c
using (customer_id)
group by customer_id;







