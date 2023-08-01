----EXICUTION FROM SQL ALL QUERIES

CREATE TABLE EmployeeInfo
(
Empid INT PRIMARY KEY,
First_Name VARCHAR(30),
Last_Name VARCHAR(30),
Department VARCHAR(30),
Project VARCHAR(30),
ADDRESS VARCHAR(30),
DOB DATE,
Gender VARCHAR(30)
)
sp_help EmployeeInfo

INSERT INTO EmployeeInfo VALUES(1,'Rohit','Gupta','Admin','P1','Delhi','1992/09/02','Male')
INSERT INTO EmployeeInfo VALUES(2,'Rahul','Mahajan','Admin','P2','Mumabi','1986/10/10','Male'),
(3,'Sonia','Banerjee','HR','P3','Pune','1983/06/05','Female'),
(4,'Ankita','Kapoor','HR','P4','Chennai','1983/11/28','Female'),
(5,'Swati','Garg','HR','P5','Delhi','1991/04/06','Female')

CREATE TABLE EmployeePosition
(
Empid INT FOREIGN KEY (Empid)REFERENCES EmployeeInfo(Empid),
EmpPosition VARCHAR(30),
DateOfJoining DATE,
Salary INT
)
sp_help EmployeePosition

INSERT INTO EmployeePosition VALUES (1,'Executive','2020-04-01',75000)
INSERT INTO EmployeePosition VALUES (2,'Manager','2020-04-03',500000)
INSERT INTO EmployeePosition VALUES (3,'Manager','2020-04-02',1500000)
INSERT INTO EmployeePosition VALUES (2,'Officer','2020-04-02',90000)
INSERT INTO EmployeePosition VALUES (1,'Manager','2020-04-03',300000)

SELECT * FROM EmployeeInfo
SELECT * FROM EmployeePosition

--1. Create a query to generate the first records from the EmployeeInfo table.
SELECT * FROM EmployeeInfo WHERE Empid=1

--2. Create a query to generate the last records from the EmployeeInfo table.
SELECT * FROM EmployeeInfo WHERE Empid=5

--3. Create a query to fetch the third-highest salary from the EmpPosition table.
SELECT TOP 1 salary FROM 
(
SELECT TOP 3 salary FROM EmployeePosition
ORDER BY salary DESC
)AS subquery ORDER BY Salary 
--or
SELECT * FROM EmployeePosition ORDER BY Salary DESC offset 2 ROWS FETCH NEXT 1 ROW only

--4. Write a query to find duplicate records from a table.
SELECT Empid,COUNT(*) AS 'Duplicate Record'
FROM EmployeePosition
GROUP BY Empid
HAVING COUNT(*)>1

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
SELECT EmpPosition ,sum(salary) AS 'Total Salary' FROM EmployeePosition 
GROUP BY EmpPosition

--6. Create a query to obtain display employees having salaries equal to or greater than 150000.
SELECT Empid,salary FROM EmployeePosition WHERE Salary>=150000


--7. Create a query to fetch the list of employees of the same department
SELECT Department,count(*) FROM EmployeeInfo
GROUP BY Department 
HAVING count(*)>1