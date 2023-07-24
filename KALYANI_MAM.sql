CREATE TABLE regions(
region_id INT PRIMARY KEY,
region_name VARCHAR(30)
)

CREATE TABLE countries(
country_id INT,
country_name VARCHAR(40),
region_id INT CONSTRAINT FK_region_id FOREIGN KEY(region_id)REFERENCES regions(region_id)
)

CREATE TABLE locations(
 location_id INT,
 street_address VARCHAR(25),
 post_code INT,
 city VARCHAR(30),
 state_provence VARCHAR(12),
 country_id INT CONSTRAINT fk_country_id FOREIGN KEY(country_id)REFERENCES countries(country_id)
 )

 CREATE TABLE depertment(
 dept_id INT,
 dept_name VARCHAR (30),
 location_id INT CONSTRAINT fk_ location_id FOREIGN KEY(location_id)REFERENCES  locations(location_id)
 )
  CREATE TABLE employees(
  e_id INT,
  first_name VARCHAR(20),
  last_name VARCHAR(30),
  email VARCHAR(20),
  phone_no VARCHAR(20),
  hire_date VARCHAR(20),
  job_id VARCHAR(10),
  sallary INT,
  commision INT,
  maneger_id INT,
  dpt_id INT CONSTRAINT fk_dpt_id FOREIGN KEY (dpt_id)REFERENCES depertment (dpt_id)
  )

  CREATE TABLE job(
  job_id VARCHAR (20),
  job_title VARCHAR(30),
  min_salary INT,max_salary INT
  )

 

























--1. Write a query to list the number of jobs available in the employees table.
--2. Write a query to get the total salaries payable to employees.
--3. Write a query to get the minimum salary from employees table.
--4. Write a query to get the maximum salary of an employee working as a 
--Programmer.
--5. Write a query to get the average salary and number of employees working 
--the department 90.
--6. Write a query to get the highest, lowest, sum, and average salary of all 
--employees.
--7. Write a query to get the number of employees with the same job.
--8. Write a query to get the difference between the highest and lowest 
--salaries.
--9. Write a query to find the manager ID and the salary of the lowest-paid 
--employee for that manager.
--10. Write a query to get the department ID and the total salary payable 
--in each department.
--11. Write a query to get the average salary for each job ID excluding 
--programmer.
--12. Write a query to get the total salary, maximum, minimum, average 
--salary of employees (job ID wise), for department ID 90 only.
--13. Write a query to get the job ID and maximum salary of the 
--employees where maximum salary is greater than or equal to $4000.
--14. Write a query to get the average salary for all departments 
--employing more than 10 employees.
