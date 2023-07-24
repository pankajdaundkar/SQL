CREATE TABLE Employee4(
e_id INT PRIMARY KEY,
e_name VARCHAR(40),
e_email VARCHAR (30),
salary NUMERIC (10,2),
age INT CHECK  (age>=18),
country VARCHAR (20) DEFAULT 'india'
)
--- DML INSERT VALUES
INSERT INTO Employee4 VALUES (1,'Pankaj','Pankaj@gmail.com',20000,20,'India');
INSERT INTO Employee4 VALUES (2,'Pratik','Pratik@gmail.com',30000,25,'USA');
INSERT INTO Employee4 VALUES (3,'Sagar','Sagar@gmail.com',22000,30,'CANADA');
INSERT INTO Employee4 VALUES (4,'Snehal','Snehal@gmail.com',35000,27,'USA');
INSERT INTO Employee4 VALUES (5,'Anjali','Anjali@gmail.com',33000,33,'USA');
INSERT INTO Employee4 VALUES (6,'Akshata','Akshata@gmail.com',45000,30,'AUS');
INSERT INTO Employee4 VALUES (7,'Sanket','Sanket@gmail.com',60000,37,'AMERICA');
INSERT INTO Employee4 VALUES (8,'Nilesh','Nilesh@gmail.com',180000,20,'USA');
INSERT INTO Employee4 VALUES (9,'Vidyashree','Vidyashree@gmail.com',14000,24,'India');
INSERT INTO Employee4 VALUES (10,'Girish','Girish@gmail.com',16000,25,'India');

SELECT * FROM Employee4

--UPDATE DATA

UPDATE Employee4 SET country='DUBAI'WHERE e_id=2;
UPDATE Employee4 SET country='CANADA'WHERE e_id=1;
UPDATE Employee4 SET age=25 WHERE e_id in(2,4,6);
UPDATE Employee4 SET age=30 WHERE e_id in(1,5,7);
UPDATE Employee4 SET age=27 WHERE e_id in(3,8);
UPDATE Employee4 SET age=32 WHERE e_id in(9,10);

--LIKE CLOUSE
SELECT * FROM Employee4 WHERE e_name LIKE 'a%';--select name start with letter 'a'
SELECT * FROM Employee4 WHERE e_name LIKE '%a';---select name end with letter 'a'
SELECT * FROM Employee4 WHERE e_name LIKE 'p%';
SELECT * FROM Employee4 WHERE e_name LIKE '%a%';-- contain letter 'a' in between(anywhere) name
SELECT * FROM Employee4 WHERE e_name LIKE '%[k-z]%';--start from k-z all names select
SELECT * FROM Employee4 WHERE e_name LIKE '[abcdefg]%';
SELECT * FROM Employee4 WHERE e_name LIKE '%[abcdefg]%';
SELECT * FROM Employee4 WHERE e_name like 'a_____';
SELECT * FROM Employee4	WHERE e_name LIKE 't__h__';

-- NOT LIKE (skip the pattern)

select * from Employee4 where e_name not like 'a%'
select * from Employee4 where e_name not like '%[abcdefg]'

-- IN CLAUSE --> select the multiple possible values

select * from Employee4 where e_id in(1,2,3,4,5)

--DISPLAY emp whose country is INDIA & USA

select * from Employee4 where country in ('India','USA')

-- DISPLAY the emp whose age is 27,31,20

select * from Employee4 where age in (27,31,20)
select * from Employee4 where e_id=1

-- NOT IN
select * from Employee4 where country not in ('India','USA')

-- AND OPERATOR 

select * from Employee4 where country='India' and Salary>23000 and age >26

--OR OPERATOR

select * from Employee4 where country='India' or country='uk'

---NOT OPERATOR
select * from Employee4 where not country='India'
select * from Employee4 where not salary<=25000

--OR OPERATOR

select * from Employee4 where country='India' or country='uk'

-- NOT OPERATOR

select * from Employee4 where not country='India'
select * from Employee4 where not salary<=25000

-- order by clause --> sort the data

select * from Employee4 
order by e_name 

select * from Employee4 
order by e_name desc

select * from Employee4 
order by age desc

select * from Employee4 where age <29
order by e_name

select * from Employee4 
order by e_name,salary desc

-- built in functions - max, min, avg, count, sum
--aggregate functions in SQL

select max(salary) from Employee4
select max(salary) as 'Max Salary' from Employee4
select min(salary) as 'Min Salary' from Employee4
select sum(salary) as 'Total salary' FROM Employee4
select avg(salary) as 'avg salary' from Employee4
select min(age) as 'Min age' from Employee4
select max(age) as 'Min age' from Employee4




										  
