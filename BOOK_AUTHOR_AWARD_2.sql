----EXICUTION FROM SQL ALL QUERIES

CREATE TABLE Author(
AuthorId INT PRIMARY KEY,
author_Name VARCHAR(30),
Ph_NO INT,
email VARCHAR(25),
ADDRESS VARCHAR(25),
city VARCHAR(25)
)
INSERT INTO Author VALUES (1,'Chetan Bhagat',789563210,'chetan@gmail.com','Viman Nagar','Mumbai')
INSERT INTO Author VALUES (2,'Sham Surve',7895698,'shamgmail.com','Vishal Nagar','Pune')
INSERT INTO Author VALUES (3,'Soma Mohite',689563252,'soma@gmail.com','Karve Nagar','Pune')
INSERT INTO Author VALUES (4,'Reena Sharma',889453210,'reena@gmail.com','Hanuman Nagar','Sangli')
INSERT INTO Author VALUES (5,'Dr.Ranganathan',665653210,'ranganathan@gmail.com','Ramarao nagar','Mumbai')

SELECT * FROM Author


sp_help Author

CREATE TABLE Book(
BookId INT PRIMARY KEY,
BookName VARCHAR(25),
AuthorId INT FOREIGN KEY(AuthorId) REFERENCES Author(AuthorId),
Price INT,
PublisherDate DATE
)
INSERT INTO Book VALUES (1,'Diary of Ann Frank',1,201,'2020-10-12')
INSERT INTO Book VALUES (2,'Indian History',2,250,'2020-11-11')
INSERT INTO Book VALUES (3,'Indian Economy',3,100,'2020-12-10')
INSERT INTO Book VALUES (4,'Science and Technology',1,250,'2020-10-09')
INSERT INTO Book VALUES (5,'Environmental Studies',4,500,'2020-09-08')
INSERT INTO Book VALUES (6,'Indian Geography',5,450,'2020-08-07')
INSERT INTO Book VALUES (7,'General Studies',4,150,'2020-07-06')
INSERT INTO Book VALUES (8,'Mental ability',2,201,'2020-10-12')
INSERT INTO Book VALUES (9,'Mental ability',3,200,'2020-10-12')

SELECT * FROM Book

sp_help Book

CREATE TABLE AwardMaster(
AwardTypeId INT PRIMARY KEY,
Award_Name VARCHAR(25),
Award_Price VARCHAR(25))

INSERT INTO AwardMaster VALUES (101,'Dnyanpeeth','11 lack')
INSERT INTO AwardMaster VALUES (102,'ABC','10k')
INSERT INTO AwardMaster VALUES (103,'bcd','20k')
INSERT INTO AwardMaster VALUES (104,'Padmabhooshan','1 lack') 
INSERT INTO AwardMaster VALUES (105,'Padmashree','2lack ')

SELECT * FROM AwardMaster

sp_help AwardMaster

CREATE TABLE Award
(
AwardId INT,
AwardTypeId INT FOREIGN KEY(AwardTypeId) REFERENCES AwardMaster(AwardTypeId),
AuthorId INT FOREIGN KEY(AuthorId) REFERENCES Author(AuthorId),
BookId INT FOREIGN KEY(BookId) REFERENCES Book(BookId),
Years INT)

INSERT INTO Award VALUES (1,101,1,1,2020)
INSERT INTO Award VALUES (2,102,2,5,2021)
INSERT INTO Award VALUES (3,103,3,2,2022)
INSERT INTO Award VALUES (4,104,4,3,2023)
INSERT INTO Award VALUES (15,105,1,4,2019)

SELECT * FROM Author
SELECT * FROM Book
SELECT * FROM AwardMaster
SELECT * FROM Award

--1.    Write a query to show book name , author name and award name for all books which has received any award. 
SELECT b.BookName,a.author_Name,aw.Award_Name
FROM Book b
join Author a ON a.AuthorId=b.AuthorId
join Award a2 ON a2.AuthorId=a.AuthorId
join AwardMaster aw ON aw.AwardTypeId=a2.AwardTypeId

--2.    Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
SELECT author_Name FROM Author WHERE AuthorId=
(
update Author SET author_Name='_Honourable' WHERE 



--3.	Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
SELECT a.author_Name,count(a.AuthorId)AS 'Maximum Book'
FROM Author a
join Book b ON b.AuthorId=a.AuthorId
GROUP BY a.author_Name
ORDER BY count(a.AuthorId) DEC



--4.	Write a query to select book name with 5 th highest price.
SELECT BookName ,Max(Price) AS 'Highest Price'
FROM Book 
GROUP BY BookName
ORDER BY MAx(Price) DESC
offset 4 ROWS FETCH NEXT 1 ROWS only

--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
SELECT * FROM Book
WHERE Price=201


--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.
update Book SET Price=Price+Price*0.5 WHERE AuthorId =1
SELECT * FROM Book


--7.	Show award names and number of books which got these awards. 
SELECT aw.Award_Name,count(b.BookId)AS 'Num of Books'
FROM AwardMaster aw
join Award a ON a.AwardTypeId=aw.AwardTypeId
join Book b ON b.BookId=a.BookId
GROUP BY aw.Award_Name

--8.	Delete all books written by ‘Chetan Bhagat’ 



--9.	Create view to show name of book and year when it has received award. 
SELECT b.BookName
FROM Book b
join Award a ON a.BookId=b.BookId
WHERE year=

--10.	Create trigger to ensure min price of any book must be Rs. 100. 

--11.	Increase price of book by 10% if that book has received any award.

--12.	Show names of author and number of books written by that Author.

--13.	Show names of authors whose books are published before year 2020.

--14.	Show name of books which has published within 1 year after 15 August 2020.

--15.	Delete all authors whose no book is published in year 2020.