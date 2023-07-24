CREATE TABLE customerinfo(
cust_id int primary key,
cust_name varchar(30),
country varchar(30),
post_code int,
city varchar(30),
dob date 
)
-------------------------------------------------------------------------------------------

--DROP TABLE customer_info

----------------------------------------------------------------------------------------------

INSERT INTO customerinfo VALUES(1,'PANKAJ','FRANCE',121110,'PARIS','1993-6-27');
INSERT INTO customerinfo VALUES(2,'PRATIK','NORWAY',121110,'LONDON','1993-6-27');
INSERT INTO customerinfo VALUES(23,'AKSHATA','TOKIYO',121110,'BERLIN','1993-6-27');
INSERT INTO customerinfo VALUES(4,'ANJALI','NORWAY',121110,'OSLO','1993-6-27');
INSERT INTO customerinfo VALUES(5,'NILESH','OSLO',121110,'PARIS','1993-6-27');
INSERT INTO customerinfo(cust_id,cust_name,country,city,dob) VALUES (25,'SAGAR','FRANCE','BERLIN','1997-7-13');

--------------------------------------------------------------------------------------------------------------------

SELECT * FROM customerinfo;

----------------------------------------------------------------------------------------------------------------------

CREATE TABLE Product_info(
pro_id	INT PRIMARY KEY,
pro_name VARCHAR(50),
price NUMERIC(10,2)
)
------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Product_info                                                               
-------------------------------------------------------------------------------------------------------------------------

INSERT INTO Product_info VALUES (101,'MOBILE',10000)
INSERT INTO Product_info VALUES (102,'GEITOST',500)
INSERT INTO Product_info VALUES (103,'PAVLOVA',1000)
INSERT INTO Product_info VALUES (104,'TATA',1200)
INSERT INTO Product_info VALUES (105,'JOY',800)

----------------------------------------------------------------------------------------------------------------------------

sp_help customerinfo;

---------------------------------------------------------------------------------------------------------------------------
--1.	Write a statement that will select the City column from the Customers table
SELECT city FROM customerinfo;
-------------------------------------------------------------------------------------------------------------------------
--2.	Select all the different values from the Country column in the Customers table.
SELECT country FROM customerinfo;
--------------------------------------------------------------------------------------------------------------------------
--3.	Select all records where the City column has the value "London
SELECT * FROM customerinfo WHERE city='LONDON';
------------------------------------------------------------------------------------------------------------------------------
--4.	Use the NOT keyword to select all records where City is NOT "Berlin".
SELECT * FROM customerinfo WHERE NOT city='BERLIN';
------------------------------------------------------------------------------------------------------------------------------
--5.	Select all records where the CustomerID column has the value 23.
SELECT * FROM customerinfo WHERE cust_id=23;
---------------------------------------------------------------------------------------------------------------------------------
--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
SELECT * FROM customerinfo WHERE city='BERLIN' AND post_code=121110;
-----------------------------------------------------------------------------------------------------------------------------------
--7.	Select all records where the City column has the value 'Berlin' or 'London'.
SELECT * FROM customerinfo WHERE city='BERLIN' OR city='LONDON';
------------------------------------------------------------------------------------------------------------------------------------
--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
SELECT * FROM customerinfo ORDER BY city;
---------------------------------------------------------------------------------------------------------------------------------------
--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
SELECT * FROM customerinfo ORDER BY city DESC;
---------------------------------------------------------------------------------------------------------------------------------------
--10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
SELECT * FROM customerinfo ORDER BY country,city;
--------------------------------------------------------------------------------------------------------------------------------------------
--11.	Select all records from the Customers where the PostalCode column is empty.
SELECT * FROM customerinfo WHERE post_code IS NULL;
---------------------------------------------------------------------------------------------------------------------------------------------
--12.	Select all records from the Customers where the PostalCode column is NOT empty.
SELECT * FROM customerinfo WHERE  post_code is NOT NULL;
-------------------------------------------------------------------------------------------------------------------------------------------
--13. Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
UPDATE customerinfo SET city='OSLO' WHERE country='NORWAY'; 
-----------------------------------------------------------------------------------------------------------------------------------------------
--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE FROM customerinfo WHERE country='NORWAY';
---------------------------------------------------------------------------------------------------------------------------------------------------
--15.	Use the MIN function to select the record with the smallest value of the Price column.
SELECT MIN(price) AS 'Smallest value' FROM Product_info;
---------------------------------------------------------------------------------------------------------------------------------------------
--16.	Use an SQL function to select the record with the highest value of the Price column.
SELECT MAX(price) AS 'Highest value'FROM Product_info;
-----------------------------------------------------------------------------------------------------------------------------
--17.	Use the correct function to return the number of records that have the Price value set to 20
SELECT * FROM Product_info WHERE price=1000;
---------------------------------------------------------------------------------------------------------------------------
--18.	Use an SQL function to calculate the average price of all products.
SELECT AVG(price) AS Avarage_price FROM Product_info;
------------------------------------------------------------------------------------------------------------------------
--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
SELECT SUM(price) AS Sum_of_price FROM Product_info;
-----------------------------------------------------------------------------------------------------------------------------
--20.	Select all records where the value of the City column starts with the letter "a".
SELECT * FROM customerinfo WHERE city like 'a%';
----------------------------------------------------------------------------------------------------------------------------------
--21.	Select all records where the value of the City column ends with the letter "a".
SELECT * FROM customerinfo WHERE city LIKE '%a';
--------------------------------------------------------------------------------------------------------------------------------
--22.	Select all records where the value of the City column contains the letter "a".
SELECT * FROM customerinfo WHERE city LIKE '%a%';
------------------------------------------------------------------------------------------------------------------------------------
--23.Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
SELECT * FROM customerinfo WHERE city LIKE 'p%s';
-----------------------------------------------------------------------------------------------------------------------------------
--24.	Select all records where the value of the City column does NOT start with the letter "a".
SELECT * FROM customerinfo WHERE city NOT LIKE  'a%';
-----------------------------------------------------------------------------------------------------------------------------------
--25.	Select all records where the second letter of the City is an "a"
SELECT * FROM customerinfo WHERE city LIKE '%_a';
----------------------------------------------------------------------------------------------------------------------------------
--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
SELECT * FROM customerinfo WHERE city LIKE 'p%' OR city LIKE 'b%' OR city LIKE 'l%';
--------------------------------------------------------------------------------------------------------------------------------------
--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
SELECT * FROM customerinfo WHERE city NOT LIKE 'a%' AND city NOT LIKE 'f%';
-------------------------------------------------------------------------------------------------------------------------------------
--28.	Select all records where the first letter of the City is NOT an "P" or a "L" or an "B".
SELECT * FROM customerinfo WHERE city NOT LIKE '[PLB]%';
--------------------------------------------------------------------------------------------------------------------------------------
---29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".
SELECT * FROM customerinfo WHERE country IN ('NORWAY','FRANCE');
--------------------------------------------------------------------------------------------------------------------------------------
--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
SELECT * FROM customerinfo WHERE country NOT IN ('NORWAY','FRANCE');
--------------------------------------------------------------------------------------------------------------------------------------
--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
SELECT * FROM Product_info WHERE price BETWEEN 500 AND 1000;
--------------------------------------------------------------------------------------------------------------------------------------
--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
SELECT * FROM  Product_info WHERE price NOT BETWEEN 500 AND 1000;
---------------------------------------------------------------------------------------------------------------------------------------
--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
 SELECT * FROM Product_info where pro_name BETWEEN 'MOBILE' AND 'JOY';
-----------------------------------------------------------------------------------------------------------------------------------------
--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
SELECT (post_code) as 'pno' FROM customerinfo;
------------------------------------------------------------------------------------------------------------------------------------------
--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.
SELECT 'customerinfo' AS 'CONSUMRE'
------------------------------------------------------------------------------------------------------------------------------------------
--36.	List the number of customers in each country.
SELECT country ,COUNT(cust_id) AS 'COUNT' FROM customerinfo 
GROUP BY  country
------------------------------------------------------------------------------------------------------------------------------------------------
--37.	List the number of customers in each country, ordered by the country with the most customers first.
SELECT country,COUNT(cust_id) AS 'COUNT' FROM customerinfo GROUP BY country ORDER BY COUNT(cust_id) DESC
-------------------------------------------------------------------------------------------------------------------------------------------
--38.	Write the correct SQL statement to create a new database called testDB
CREATE DATABASE  testDB
-----------------------------------------------------------------------------------------------------------------------------------------------
--39.	Write the correct SQL statement to delete a database named testDB
DROP DATABASE testDB
---------------------------------------------------------------------------------------------------------------------------------------------
--40.	Add a column of type DATE called Birthday in Persons table
ALTER TABLE customerinfo ADD Birthday INT 
-----------------------------------------------------------------------------------------------------------------------------------------------
--41.	Delete the column Birthday from the Persons table
ALTER TABLE customerinfo DROP COLUMN Birthday
--------------------------------------------------------------------------------------------------------------------------------------------------




