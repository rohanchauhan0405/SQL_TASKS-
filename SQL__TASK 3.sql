---CREATING TABLES  AND IMPORTING FILES  

create table Customers(customer_id int primary key,
customer_name varchar,
city varchar,
phone_number bigint,
email varchar,
registration_date date
)

create table Orders_Item(
order_item_id int primary key,
order_id int,
product_id int,
quantity int,
total_price int

)

create table Orders(
order_id int primary key,
customer_id int,
order_date date,
order_amount int,
delivery_city varchar,
payment_mode varchar
)

create table Products(
product_id int primary key,
product_name varchar,
category varchar,
price int,
stock_quantity int,
supplier_name varchar,
supplier_city varchar,
supply_date date
)

set datestyle='ISO, DMY';
copy  Customers from  'D:\SQL SOFTRONIX\TASKS\TASK 3\customers.csv' delimiter ',' csv header
copy Orders_Item from  'D:\SQL SOFTRONIX\TASKS\TASK 3\order_items.csv' delimiter ',' csv header
copy Orders from 'D:\SQL SOFTRONIX\TASKS\TASK 3\orders.csv' delimiter ',' csv header
copy Products from 'D:\SQL SOFTRONIX\TASKS\TASK 3\products.csv' delimiter ',' csv header



--******************* TASK 1 *************---------------------

--*1*
select cust.customer_name,cust.city,o.order_date from Customers
as cust inner join Orders as o on cust.customer_id=o.customer_id 
where extract(year from order_date)=2023

--*2*
select P.product_name,P.category,OI.total_price from Customers as C
inner join Orders  as O on C.customer_id=O.customer_id inner join
Orders_Item as OI on O.order_id=OI.order_id inner join 
Products as P on P.product_id=OI.product_id  order by C.city='Mumbai';

--*3*
select C.customer_name,O.order_date,OI.total_price from Customers as C inner join Orders as O
on C.customer_id=O.customer_id inner join Orders_Item as OI on O.order_id=OI.order_id 
where payment_mode='Credit Card'

--*4*
select P.product_name,P.category,OI.total_price from Orders as O
inner join  Orders_Item as OI on O.order_id=OI.order_id inner join
Products as P on P.product_id=OI.product_id where O.order_date between '2023-01-01' AND '2023-06-30';

--*5*
SELECT c.customer_name, COUNT(oi.product_id) AS total_products_ordered
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Orders_Item oi ON o.order_id = oi.order_id
GROUP BY c.customer_name;

---**********************TASK 2************************************

--*2.1**
select distinct city from Customers

--*2.2**
select distinct supplier_name from Products

--*2.3**
select distinct payment_mode from Orders 

--*2.4**
select distinct P.category from Products as P inner join 
Orders_Item OI on P.product_id=OI.product_id

--*2.5**
select distinct supplier_city from Products 


----****************** TASK 3 *******************************

--*3.1**
select *from Customers order by customer_name asc

--*3.2**
select *from Orders as O  inner join  Orders_Item as OI 
on O.order_id=OI.order_id order by total_price desc

--*3.3**
select *from Products order by price asc , category desc

--*3.4**
select order_id,customer_id,order_date from Orders order by order_date desc

--*3.5**
SELECT c.city, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY c.city ASC;

---*************************TASK 4 ********************************

--*4.1**
select *from Customers order by customer_name asc limit(10)

--*4.2**
select product_id,product_name,price from Products order by price desc limit(5)

--*4.3**
SELECT *FROM orders ORDER BY customer_id LIMIT 10 OFFSET 10;

--*4.4**
select  order_id,customer_id,order_date from Orders Where order_date between  '2023-01-01' and '2023-12-31'
order  by  order_date asc limit 5;

--*4.5**
select distinct c.city
from Customers c
join Orders o on c.customer_id = o.customer_id
order by c.city
limit 10 offset 10;
  
--*****************TASK 5 ***************************

--*5.1**
select count(order_amount)from Orders

--*5.2**
SELECT 
    SUM(oi.total_price) AS total_upi_revenue
FROM Orders o
JOIN Orders_Item oi 
    ON o.order_id = oi.order_id
WHERE o.payment_mode = 'UPI';

--*5.3**
select avg(price) from Products

--*5.4**
select 
max(total_price),
min(total_price) 
from Orders_Item as OI inner join Orders as O on OI.order_id=O.order_id 
where  
extract (Year from order_date)=2023

--*5.5**
select product_id,sum(quantity) from Orders_Item  group by  product_id


--*********************** TASK 6  ******************************

--*6.1**
select customer_id from Orders 
where extract(year from order_date)=2022
intersect
select customer_id from Orders 
where extract(year from order_date)=2023

--*6.2**
select OI.product_id from Orders_Item as OI
inner join Orders as O on OI.order_id=O.order_id
where extract(year from order_date)=2022
except
select OI.product_id from Orders_Item as OI
inner join Orders as O on OI.order_id=O.order_id
where extract(year from order_date)=2023

--*6.3**
select supplier_city from Products 
except
select city from Customers

--*6.4** 
select supplier_city from Products 
union
select city from Customers

--*6.5**
select product_id, product_name
from Products
intersect
select p.product_id, p.product_name
from Products p
join Orders_Item oi 
    on  p.product_id = oi.product_id
join Orders o 
    on  oi.order_id = o.order_id
where extract(year from o.order_date) = 2023;


--************************TASK 7**********************************

select customer_name(select 

)
