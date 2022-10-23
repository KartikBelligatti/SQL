USE ORG
select * from Worker

--1. Synonyms
-- Creating synonym for the table worker as wrk

create synonym wrk for Worker

select * from wrk
------------------------------------------------------------------------------------------

---------------------------------------------------------------------------

--3. Simple and Complex Views

--Simple view execution
select * from Worker

--creating a view
create view Wrk_view as select * from Worker where DEPARTMENT='Account'

--Retrieve the view
select * from Wrk_view

--insert into a simple view - will automatically reflect the changes in the original table
insert into Wrk_view values('Erling','Haaland',75000,2014-05-22,'Account')

--update in a simple view
update Wrk_View set SALARY=24000 where WORKER_ID=12

--delete in a simple view
delete from Wrk_View where WORKER_ID=12


create table DEPARTMENT
(
DID int NOT NULL primary key,
DNAME varchar(25)
)

select * from DEPARTMENT

alter table Worker add DeptID int 

--complex view
select w.WORKER_ID,w.FIRST_NAME,d.DID,d.DNAME 
from Worker as w inner join DEPARTMENT as d on w.DeptID=d.DID;

create view Worker_Dep
as
select w.WORKER_ID,w.FIRST_NAME,d.DID,d.DNAME 
from Worker as w inner join DEPARTMENT as d on w.DeptID=d.DID;

select * from Worker_Dep
------------------------------------------------------------------------------------

--4. Sequence

create table student
(
SID int,
SName varchar(20),
USN varchar(10)
)

create sequence StudentID as int start with 1 increment by 1

insert into student values(NEXT VALUE FOR StudentID,'John','4SU18CS035')
insert into student values(NEXT VALUE FOR StudentID,'Sam','4SU18CS025')
insert into student values(NEXT VALUE FOR StudentID,'Paul','4SU18CS015')
insert into student values(NEXT VALUE FOR StudentID,'James','4SU18CS005')

select * from student
-----------------------------------------------------------
--2. Index

--create a clustered index on demo table
create clustered index ind_SID on student(SID)

--create a non clustered index on demo table
create index ind_TName on student(SName)

select * from student

--String Function in SQL
SELECT ascii('a');
SELECT ascii('A');
SELECT CONCAT('Kartik ', 'N', ' Belligatti');
SELECT LOWER('KARTIK');
SELECT UPPER('kartik');
SELECT LEN('Kartik');
-------------------------------------------------------------
-- Math functions in SQL
SELECT SQRT(100)
SELECT PI()
SELECT SQUARE(2)
SELECT ROUND(52.258,2)
SELECT CEILING(5.25)
SELECT FLOOR(5.25)
SELECT POWER(2,3);
-------------------------------------------------------
--Datetime functions in SQL
SELECT GETDATE()
SELECT GETUTCDATE()
SELECT SYSDATETIME()
SELECT SYSDATETIMEOFFSET()
SELECT SYSUTCDATETIME()