USE ORG

--1. Scalar Function with 2 parameters - any concept
create function Fn_Area_of_rectangle(@length int, @breadth int)
returns int
as
begin
	return @length * @breadth
end

select dbo.Fn_Area_of_rectangle(4,5) as Result





--2. Procedure with OUTPUT parameter

select * from customer
create procedure TotalCustomer(@totalcust int OUTPUT)
as
Begin
	Select @totalcust=count(CUSTOMER_ID) from customer
End


Declare @Result int
exec TotalCustomer @Result OUTPUT 
Print @Result


--3. Trigger to restrict DML access between 6:00PM to 10.00AM

alter trigger restrict_DML_access 
on customer 
FOR INSERT, UPDATE, DELETE
as
begin
	if DATEPART(HH,GETDATE())>21 
	BEGIN
		print 'You Cannot perform DML Operations between 6:00PM to 10.00AM'
		Rollback transaction -- like the working of ctrl+z
	END
--	if DATEPART(HH,GETDATE())<10 
--	BEGIN
--		print 'You Cannot perform DML Operations between 6:00PM to 10.00AM'
--		Rollback transaction -- like the working of ctrl+z
--	END
end

select * from customer

update customer set CUST_NAME='kartik' where CUSTOMER_ID=3001
insert into customer values('Shashank','New york',100,5005)
delete from customer where CUSTOMER_ID=3001

--4. Server-scope trigger to restrict DDL access
create trigger restrict_DDL_access
on Database
For Create_Table,Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on ORG Database'
	Rollback Transaction
End

create table cust
(
cust_id int
)


--5. Working of explicit transaction with Save transaction

select * from customer

BEGIN TRANSACTION
	insert into customer values('Shashank','New york',100,5007)
	SAVE TRANSACTION insert_statement
	delete from customer where CUSTOMER_ID=5007
	ROLLBACK TRANSACTION insert_statement
COMMIT TRANSACTION






--6. Difference between throw and Raiserror in exception handling

create procedure DivideByZero
@n1 int,
@n2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	IF(@n2=0)
	BEGIN
		RAISERROR('Cannot Divide By Zero',16,127) -- ASSUME LIKE THROW
	END
	ELSE
	BEGIN
		SET @Result=@n1/@n2
		PRINT 'Value is:' + CAST(@Result as varchar)
	END
END

EXEC DivideByZero 10,0



create procedure DivideByZeroThrow
@n1 int,
@n2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	BEGIN TRY
		BEGIN
			IF(@n2=0)		
			THROW 50001,'Cannot Divide By Zero',1 
			SET @Result=@n1/@n2
			PRINT 'Value is:' + CAST(@Result as varchar)
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()		
	END CATCH
END	


EXEC DivideByZero 10,0  --- Using RAISE ERROR
EXEC DivideByZeroThrow 10,0  ------ Using THROW