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
