USE ORG

CREATE TABLE salesman 
(
SALESMAN_ID INT NOT NULL PRIMARY KEY IDENTITY(5001,1),
NAME varchar(25),
CITY varchar(25),
COMMISSION Float,
);
insert into salesman values('James hoog','New york',0.15)
insert into salesman values('Nail Knite','Paris',0.13)
insert into salesman values('Pit Alex','London',0.11)
insert into salesman values('Mc Lyon','Paris',0.14)
insert into salesman values('Paul Adam','Rome',0.13)
insert into salesman values('Lauson Hen','San Jose',0.12)

select * from salesman

--1. From the following table, create a view for those salespeople who belong to the city of New York.
create view salesman_ny
as
select * from salesman where CITY='New york'

select * from salesman_ny

--2. From the following table, create a view for all salespersons. Return salesperson ID, name, and city.

create view sales
as
select SALESMAN_ID,NAME,CITY from salesman 

select * from sales
--3. From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.

create view sm_number
as
select CITY, COUNT (DISTINCT SALESMAN_ID) as 'Number of Salesman' from salesman
GROUP BY CITY;

select * from sm_number

CREATE TABLE customer
(
CUSTOMER_ID INT NOT NULL PRIMARY KEY IDENTITY(3001,1),
CUST_NAME varchar(25),
CITY varchar(25),
GRADE INT,
SALESMAN_ID INT
);

insert into customer values('Nick Rimando','New york',100,5001)
insert into customer values('Brad Davis','New york',200,5001)
insert into customer values('Graham Zusi','California',200,5002)
insert into customer values('Julian Green','London',300,5002)
insert into customer values('Fabian jhonsan','paris',300,5006)
insert into customer values('Geoff Cameron','Berlin',100,5003)

select * from customer
--4. From the following table, create a view that counts the number of customers in each grade.

create view no_of_customer
as
select GRADE, COUNT (DISTINCT CUSTOMER_ID) as 'Number of Customer' from customer
GROUP BY GRADE;

select * from no_of_customer







CREATE TABLE orders
(
ORDER_NO INT NOT NULL PRIMARY KEY IDENTITY(70001,1),
PURCHASE_AMT Float,
ORDER_DATE date,
CUSTOMER_ID INT,
SALESMAN_ID INT
);

insert into orders values(150.5, '2012-10-05', 3005,5002)
insert into orders values(270.65, '2012-09-10', 3001,5005)
insert into orders values(65.26, '2012-10-05', 3002,5001)
insert into orders values(110.5, '2012-08-17', 3006,5003)
insert into orders values(948.5, '2012-09-10', 3005,5002)
insert into orders values(2400.6, '2012-07-27', 3001,5001)

select * from orders

--5. From the following tables, create a view to get the salesperson and customer by name. 
--Return order name, purchase amount, salesperson ID, name, customer name.

create view order_details
as
select ORDER_NO, PURCHASE_AMT, a.SALESMAN_ID, NAME, CUST_NAME
FROM orders a, customer b, salesman c
WHERE a.CUSTOMER_ID = b.CUSTOMER_ID
AND a.SALESMAN_ID = c.SALESMAN_ID;

select * from order_details