--query to create table
create table Employee                        
(id int,
emname varchar(25),
salary numeric(12,2)
)

-- schema
sp_help Employee
--alter is used to modify the schema of table
--add is used for add new column
alter table Employee add qualification varchar(10)
--modify the data type and size
alter table Employee alter column qualification varchar(15)
--drop the column from table
alter table Employee drop column qualification
--rename the column insql server
sp_rename 'Employee.salary' ,'empsalary'

create table student
(id int not null,
student_name varchar(25)not null,
email varchar (40)not null,
contactnumber int not null

)
--for existing column we want to apply not null
alter table Employee alter column empname varchar(25)not null
alter table Employee alter column emsalary numeric (12,2)not null
alter table Employee alter column id int not null

alter table Employee add email varchar (40)not null unique
alter table Employee add constraint un_emp unique (email)

--or 
--when we want to apply unique constraint to the multiple column
alter table Employee add constraint un_emp2 unique(id,email)
alter table Employee drop constraint un_emp2

alter table Employee add constraint pk_emp primary key(id)
alter table Employee drop constraint pk_emp
alter table Employee add id int primary key
alter table Employee alter column id int not null


create table Student1
(
id int,
name varchar(30),
constraint pk_stud primary key(id)
)


create table Book
(id int primary key,
name varchar(25)not null,
autorname varchar(25)not null,
price numeric(10,2)not null
)
sp_help Book


--forengin key
create table Dept
(Did int primary key,--pk column	
dname varchar(25),
)

create table emp
(empid int primary key,
ename varchar(25) not null,
Did int,
constraint fk_dept_emp foreign key(Did) references Dept(Did)
)

--OR 
create table emp
( 
empid int primary key,
ename varchar(25) not null,
Did int foreign key(Did) references Dept(Did)
)

-- with alter command
alter table Emp add constraint fk_dept_emp foreign key(did) references Dept(did)

create table users
(
users_id int  primary key,
users_name varchar(25),
)

create table product
(
product_id int primary key,
product_name varchar(25),
)

create table orders
( order_id  int primary key,
users_id int foreign key(users_id)references users(users_id),
product_id int foreign key (product_id)references product(product_id)

)
sp_help orders

