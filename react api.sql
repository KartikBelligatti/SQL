create database React_API

use React_API

create table products
(
id int primary key Identity(5,1),
prod_name varchar(300),
price varchar(40),
image varbinary(max)
)

insert into products values('John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet','? 695', (SELECT * FROM OPENROWSET(BULK N'C:\Users\ASUS\Downloads\81fPKd-2AYL._AC_SL1500_.jpg', SINGLE_BLOB) as T1))
insert into products values('Solid Gold Petite Micropave','? 168', (SELECT * FROM OPENROWSET(BULK N'C:\Users\ASUS\Downloads\81fPKd-2AYL._AC_SL1500_.jpg', SINGLE_BLOB) as T1))
insert into products values('White Gold Plated Princess','? 9.99', (SELECT * FROM OPENROWSET(BULK N'C:\Users\ASUS\Downloads\81fPKd-2AYL._AC_SL1500_.jpg', SINGLE_BLOB) as T1))
insert into products values('Pierced Owl Rose Gold Plated Stainless Steel Double','? 10.99', (SELECT * FROM OPENROWSET(BULK N'C:\Users\ASUS\Downloads\81fPKd-2AYL._AC_SL1500_.jpg', SINGLE_BLOB) as T1))

select * from products


