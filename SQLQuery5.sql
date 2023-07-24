create table Employee2
(emp_id int primary key,
emp_name varchar (30),
emp_email varchar(20),
salary int,
age int check(age>=18),
country varchar(20)default 'india'
)
---DML INSERT

insert into Employee2 values (1,'pankaj','pankaj@gmail.com',20000,20,'USA')
insert into Employee2 values (2,'sagar','sagar@gmail.com',22000,22,'AUS')
insert into Employee2 values (3,'pratik','pratik@gmail.com',35000,18,'USA')
insert into Employee2 values (4,'nilesh','nilesh@gmail.com',30000,24,'AUS')
insert into Employee2 values (5,'fahad','fahad@gmail.com',40000,26,'USA')
insert into Employee2  values (6,'girish','girish@gmail.com',24000,28,'USA')
insert into Employee2 values (7,'anjali','anjali@gmail.com',34000,26,'USA')
insert into Employee2  values (8,'akshata','akshata@gmail.com',25000,24,'CANADA')
insert into Employee2 values (9,'vidyashree','vidyashree@gmail.com',28000,22,'USA')
insert into Employee2 values (10,'snehal','snehal@gmail.com',30000,29,'USA')

--update data

update Employee2 set country='dubai' where emp_id=2
update Employee2 set emp_email ='pankaj12@gmail.com' where emp_id=4
update Employee2 set emp_email='pratik11@gmail.com',age=29,country='japan' where emp_id =1
update Employee2 set salary=25000 where emp_id in(1,4,7,10);
update Employee2 set salary=30000 where emp_id in(2,5);
update Employee2 set salary=32000 where emp_id in(3,6,8);
update Employee2 set salary=27000 where emp_id in(9);

--delet data

delete from Employee2 where emp_id =5

select * from Employee2

select * from Employee2 where emp_name like 'a%' -- start with a & contains any number of characters
select * from Employee2 where emp_name like '%a' -- name contains any letter end with a
select * from Employee2 where emp_name like 'p%'
select * from Employee2 where emp_name like '%p%' --any letters conains p
select * from Employee2 where emp_name like '%[k-z]%'			  
select * from Employee2 where emp_name like '[abcdefg]%'
select * from Employee2 where emp_name like '%[abcdefg]'
select * from Employee2 where emp_name like '%[abcdefg]%'
select * from Employee2 where emp_name like 'a____'
select * from Employee2 where emp_name like 't__h__'

-- not like (skip the pattern)

select * from Employee2 where emp_name not like 'a%'
select * from Employee2 where emp_name not like '%[abcdefg]'

-- in clause --> select the multiple possible values

select * from Employee2 where emp_id in(1,2,3,4,5)

--display emp whose country is india & usa

select * from Employee2 where country in ('India','USA')

-- display the emp whose age is 27,31,20

select * from Employee2 where age in (27,31,20)
select * from Employee2 where emp_id=1

-- not in
select * from Employee2 where country not in ('India','USA')

-- and operator 

select * from Employee2 where country='India' and Salary>23000 and age >26

--or operator

select * from Employee2 where country='India' or country='uk'

-- not operator

select * from Employee2 where not country='India'
select * from Employee2 where not salary<=25000

--or operator

select * from Employee2 where country='India' or country='uk'

-- not operator

select * from Employee2 where not country='India'
select * from Employee2 where not salary<=25000

-- order by clause --> sort the data

select * from Employee2 
order by emp_name 

select * from Employee2 
order by emp_name desc

select * from Employee2 
order by age desc

select * from Employee2 where age <29
order by emp_name

select * from Employee2 
order by emp_name,salary desc

-- built in functions - max, min, avg, count, sum
--aggregate functions in SQL

select max(salary) from Employee2
select max(salary) as 'Max Salary' from Employee2
select min(salary) as 'Min Salary' from Employee2
select sum(salary) as 'Total salary' from Employee2
select avg(salary) as 'avg salary' from Employee2
select min(age) as 'Min age' from Employee2
select max(age) as 'Min age' from Employee2

--top --> it is used to limiting rows

select top 8 * from Employee2
-- display first 3 emp who has highest salary in the table
select top 3 * from Employee2
order by salary desc
-- display emp who has the highest salary in the table
select top 1 * from Employee2
order by salary desc
select top 2 percent * from Employee2 
order by salary desc
select top 2 with ties * from Employee2
order by salary desc
-----------------------------------------------------------------
--offset --> to skip records
--fetch --> select the records /limiting the rows
-- offset always used with order by caluse


select * from Employee2
order by salary desc
offset 3 rows
fetch next 5 rows only

--display emp who have 2nd & 3rd highest salary

select * from Employee2
order by salary desc
offset 1 rows 
fetch next 2 rows only

create table Dept(
did int primary key,
dname varchar (30)
)
insert into Dept values (1,'HR');
insert into Dept values (2,'SALES');
insert into Dept values (3,'TESTING');
insert into Dept values (4,'DEVLOPER');
insert into Dept values (5,'ADMIN');

alter table Employee2 add did int foreign key(did)references Dept(did)

select * from Dept
select * from Employee2

update Employee2 set did=3 where emp_id in(6,7,9,10)
update Employee2 set did=1 where emp_id in(1,3,5)
update Employee2 set did=3 where emp_id in(2,4,8)
`099i
select e1.*,d1.*
from Employee2 e1
inner join Dept d1 on d1.did=e1.emp_id
--OR
select Employee2.*,Dept.dname
from Employee2
inner join Dept on Dept.did=Employee2.emp_id







