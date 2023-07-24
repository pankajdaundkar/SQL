CREATE TABLE customer(
cust_is int primary key,
cust_name varchar (30),
age int,
city varchar(20),
state varchar (20),
dob date
)
INSERT INTO customer VALUES(1,'Pratik',22,'Pune','Maharashtra','1998-1-1')
INSERT INTO customer VALUES(2,'Pankaj',21,'Pune','Maharashtra','1999-1-1')
INSERT INTO customer VALUES(3,'Anjali',23,'Nashik','Maharashtra','2000-1-1')
INSERT INTO customer VALUES(4,'Kishor',21,'Surat','Gujrat','2004-1-1')
INSERT INTO customer VALUES(5,'anjali',24,'mumbai','Maharashtra','2006-1-1')
INSERT INTO customer VALUES(6,'vidyashree',23,'nagar ','Maharashtra','2008-1-1')
INSERT INTO customer VALUES(7,'akshata',22,'Nashik','Maharashtra','2011-1-1')
INSERT INTO customer VALUES(8,'nilesh',20,'mumbai','Maharashtra','2022-1-1')
INSERT INTO customer VALUES(9,'suraj',26,'nagar','Maharashtra','2000-1-1')
INSERT INTO customer VALUES(10,'girish',27,'Surat','Gujrat','1998-1-1')
INSERT INTO customer VALUES(11,' pravin',28,'mumbai','Maharashtra','1998-1-1')
INSERT INTO customer VALUES(12,'rohan',30,'Pune','Maharashtra','2011-1-1')
INSERT INTO customer VALUES(13,'jayesh',22,'Nashik','Maharashtra','1999-1-1')
INSERT INTO customer VALUES(14,'sandip',29,'mumbai','Maharashtra','2003-1-1')
INSERT INTO customer VALUES(15,'ashok',20,'Pune','Maharashtra','2001-1-1')

SELECT * FROM customer

CREATE TABLE orderstatus(
status_id int primary key,
status_name varchar(30)
)
INSERT INTO orderstatus VALUES (1,'order')
INSERT INTO orderstatus VALUES (2,'shipped')
INSERT INTO orderstatus VALUES (3,'placed')

CREATE TABLE orders1(
order_id int primary key,
cust_id int,
status_id int,
order_date date,
shiping_date date,
delivery_date date
)

INSERT INTO  orders1 VALUES(101,1,1,'2020-06-12','2020-7-13','2020-06-14')
INSERT INTO  orders1 VALUES(102,2,2,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(103,3,1,'2020-06-12','2020-06-14','2020-06-14')
INSERT INTO  orders1 VALUES(104,4,3,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(105,5,2,'2020-06-12','2020-06-12','2020-06-12')
INSERT INTO  orders1 VALUES(106,6,1,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(107,7,3,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(108,8,3,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(109,9,2,'2020-06-12','2020-06-12','2020-06-12')
INSERT INTO  orders1 VALUES(110,10,1,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(111,16,3,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(112,17,2,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(113,18,1,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(114,19,3,'2020-06-12','2020-06-12','2020-06-14')
INSERT INTO  orders1 VALUES(115,12,1,'2020-06-12','2020-06-12','2020-06-14')

SELECT * FROM customer
SELECT * FROM orderstatus
SELECT * FROM orders1

SELECT  c1.*,o1.* 
FROM customer c1 
RIGHT JOIN orders1 o1 on o1.cust_id =c1.cust_is
