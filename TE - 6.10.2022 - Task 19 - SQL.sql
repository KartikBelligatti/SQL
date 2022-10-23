CREATE DATABASE ORG;

USE ORG;

CREATE TABLE Worker 
(
WORKER_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
FIRST_NAME varchar(25),
LAST_NAME varchar(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT varchar(25)
);

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('satish','kumar',75000,'2009-01-14','Account')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('vipul','diwan',200000,'2009-06-14','Account')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('Geetika','Chauhan',90000,'2009-04-11','Admin')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('Kartik','belligatti',50000,'2022-01-14','Finance')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('Anand','Raj',55000,'2008-06-14','Design')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('Shashank','Belligatti',70000,'2022-09-24','Testing')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('Ravi','Kumar',85000,'2018-06-14','Admin')

INSERT into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
('poornima','nagendra',55000,'2021-09-14','Developer')

select * from Worker

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME as 'WORKER_NAME' from Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(FIRST_NAME) as 'UPPER_CASE FIRST_NAME' from Worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select DISTINCT DEPARTMENT from Worker

--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) as 'FIRST_NAME' FROM Worker;

--Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select DISTINCT DEPARTMENT, LEN(DEPARTMENT) as 'Length of Department' from Worker

--Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column 
--COMPLETE_NAME. A space char should separate them.
select concat(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME from Worker;

--Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” 
--from Worker table.
select * from Worker where FIRST_NAME IN('vipul','satish');

--Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from Worker where DEPARTMENT='Admin';

--Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker where FIRST_NAME LIKE '%a';

--Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where FIRST_NAME LIKE '%a%';