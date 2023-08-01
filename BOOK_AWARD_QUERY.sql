CREATE TABLE Author1(
AuthorId INT PRIMARY KEY,
AuthorName VARCHAR(20) not null,
PhoneNo INT UNIQUE,
Email VARCHAR(15) UNIQUE,
ADDRESS VARCHAR(25) not null,
City VARCHAR(15)
)
INSERT INTO Author1 VALUES (1,'Ranganathan',123654,'rg@gmail.com','neharu street','Bangalore')
INSERT INTO Author1 VALUES (2,'KNA',145874,'kna@gmail.com','kalal street','Mumbai')
INSERT INTO Author1 VALUES (3,'Archana Ms',169745,'ams@gmail.com','Gandhi street','Kolhapur')
INSERT INTO Author1 VALUES (4,'Manjunathan',202145,'mjn@gmail.com','FC street','Pune')
INSERT INTO Author1 VALUES (5,'Bhandharimath',2036541,'bdm@gmail.com','Ganesh street','Sangli')
INSERT INTO Author1 VALUES (6,'Balika',2036581,'ba@gmail.com','Sai street','Solapur')


--BOOK TABLE---

CREATE TABLE Book1(
BookId INT PRIMARY KEY,
BookName VARCHAR(20) not null,
AuthorId INT FOREIGN KEY(AuthorId) REFERENCES Author1(AuthorId),
price NUMERIC(12,2)
)
INSERT INTO Book1 VALUES (11,'Indian Geography',1,25632)
INSERT INTO Book1 VALUES (12,'Indian History',2,15632)
INSERT INTO Book1 VALUES (13,'Karnataka History',3,1564)
INSERT INTO Book1 VALUES (14,'Mental Ability',4,20000)
INSERT INTO Book1 VALUES (15,'World Geography',5,15000)
INSERT INTO Book1 VALUES (16,'Reasoning',6,10000)

--AWARD MASTER TABLE---

CREATE TABLE AwardMaster(
AwardTypeId INT PRIMARY KEY,
AwardName varchar(20),
AwardPrice FLOAT
)
INSERT INTO AwardMaster VALUES (21,'PadmabHushan',23000) 
INSERT INTO AwardMaster VALUES (22,'Padmashree',25000) 
INSERT INTO AwardMaster VALUES (23,'PadmaVibHushan',100000) 
INSERT INTO AwardMaster VALUES (24,'Oscar',35000) 
INSERT INTO AwardMaster VALUES (25,'DyanaPeeth',60000) 
INSERT INTO AwardMaster VALUES (36,null,50000)

--AWARD TABLE--

CREATE TABLE Award1(
AwardId INT PRIMARY KEY,
AwardTypeId INT FOREIGN KEY(AwardTypeId) REFERENCES AwardMaster(AwardTypeId),
AuthorId INT FOREIGN KEY(AuthorId) REFERENCES Author1(AuthorId),
BookId INT FOREIGN KEY(BookId) REFERENCES Book1(BookId),
year INT
)
INSERT INTO Award1 VALUES (1,21,1,11,2022)
INSERT INTO Award1 VALUES (2,22,5,15,2002)
INSERT INTO Award1 VALUES (3,23,4,12,2017)
INSERT INTO Award1 VALUES (4,24,2,14,2023)
INSERT INTO Award1 VALUES (5,25,3,13,2020)
INSERT INTO Award1 VALUES (6,36,6,16,2020)


sp_help Author1
sp_help Book1
sp_help AwardMaster
sp_help Award1     

SELECT * FROM Author1
SELECT * FROM Book1
SELECT * FROM AwardMaster
SELECT * FROM Award1

--1.Find the book name which is written by author xyz.
SELECT BookName FROM Book1 WHERE AuthorId=
(
SELECT AuthorId FROM Author1 WHERE AuthorName='Archana Ms'and AuthorId=3
)
--------------------------------------------------------------------------------------------------
--2.Find the num of award for each author.
SELECT a1.AuthorName,a2.AuthorId, count(a3.AwardTypeId) AS 'Award' FROM Author1 a1
join Award1 a2 ON a2.AuthorId=a1.AuthorId
join AwardMaster a3 ON a3.AwardTypeId=a2.AwardTypeId
GROUP BY a1. AuthorName,a2.AuthorId
--having count(AuthorId)
--having Count(*)=1
--------------- OR -------------------------------------------------------------------------------------
SELECT a1. AuthorName ,count(a3.AwardName) AS 'Number of Awards'
FROM Author1 a1
join Award1 a2 ON a2.AuthorId=a1.AuthorId
join AwardMaster a3 ON a3.AwardTypeId=a2.AwardTypeId
GROUP BY AuthorName
HAVING count(a3.AwardName)>=1
----------------------------------------------------------------------------------------------------------------
--3.Find the award name for the book xyz.
SELECT a1. AwardName 
FROM AwardMaster a1
join Award1 a2 ON a2.AwardTypeId=a1.AwardTypeId
join Book1 a3 ON a3.BookId=a2.BookId
join Author1 a4 ON a4.AuthorId=a3.AuthorId
WHERE BookName='World Geography'
----------------------------------------------------------------------------------------------------------------------
--4.Find the all author name who got an award.
SELECT a1.AuthorName,Count(a3.AwardTypeId) AS 'Got Award'
FROM Author1 a1
join Award1 a2 ON a2.AuthorId=a1.AuthorId
join AwardMaster a3 ON a3.AwardTypeId=a2.AwardTypeId
GROUP BY a1.AuthorName


--5.Find the year wise author count.
SELECT a2.year,count(a.AuthorId)AS 'Year wise Count'
FROM Author1 a
join Award1 a2 ON a2.AuthorId=a.AuthorId
GROUP BY a2.year,a.AuthorId


--6.Find the author name who wrote only one book.
SELECT a.AuthorName,count(a.AuthorId)AS 'Ony one book'
FROM Author1 a
GROUP BY a.AuthorName
HAVING count(a.AuthorId)=1

--7.Find the book name which has maximum values.
SELECT TOP (1) b.BookName,Max(b.price)
FROM Book1 b
GROUP BY b.BookName