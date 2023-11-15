
-- 2) Create a table orders(OrderID (unique identifier), CustomerName, OrderDate, ProductName, Quantity, 
-- TotalPrice) and perform the following SQL queries :
-- I) Add a "ShippingAddress" column to the table and populate it with appropriate addresses for each 
-- order. Then, display the updated table.
-- II) Retrieve the details of orders placed in the year 2023.
-- III) Display the unique "CustomerName" values of customers who have placed more than one order.
-- IV) Show the "CustomerName," "ProductName," and "TotalPrice" of orders where the "Quantity" is 
-- greater than 10.
-- V) Retrieve the "CustomerName" of customers who have ordered a product with the name "Laptop."


use problem_statement;

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    ProductName VARCHAR(50),
    Quantity INT,
    TotalPrice INT
);
    
insert into ORDERS(OrderID,CustomerName,OrderDate,ProductName,Quantity,TotalPrice) values(1,'Vedant','2003-01-11','PC',2,60000),
						(2,'Ved','2002-12-20','Laptop',5,75000),
                        (3,'Gole','2001-03-11','Mobile',2,55000),
                        (4,'Aniket','2000-06-11','Mobile',1,40000),
                        (5,'HP','2002-10-23','Laptop',8,67000),
                        (6,'Ganesh','2003-7-12','PC',4,80000),
                        (7,'Mane','2002-06-11','Laptop',7,25000),
                        (8,'Omakr','2001-03-21','Mobile',1,39000);

select * from orders;


-- Add a "ShippingAddress" column to the table and populate it with appropriate addresses for each 
-- order. Then, display the updated table
ALTER TABLE orders
	ADD ShippingAddress VARCHAR(55);

update orders 
	set ShippingAddress='Pune' 
	where ProductName='Laptop';
    

update orders 
	set ShippingAddress='Mumbai' 
	where ProductName='PC';
    

update orders 
	set ShippingAddress='Delhi' 
	where ProductName='Mobile';

select * from orders;

-- Retrieve the details of orders placed in the year 2023.
select * from orders where year(OrderDate)='2002';
-- above code use years like 2022, 2023, 2021 


-- Display the unique "CustomerName" values of customers who have placed more than one order
select distinct CustomerName from orders where Quantity>2;

-- Show the "CustomerName," "ProductName," and "TotalPrice" of orders where the "Quantity" is 
-- greater than 10.

-- select CustomerName,ProductName,TotalPrice where Quantity > 10;
select CustomerName,ProductName,TotalPrice from orders where Quantity > 6;

-- Retrieve the "CustomerName" of customers who have ordered a product with the name "Laptop."
select distinct CustomerName from orders where ProductName='Laptop'; 