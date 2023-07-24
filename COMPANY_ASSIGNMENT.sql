CREATE TABLE students(
stu_id INT PRIMARY KEY,
stu_name VARCHAR (30),
city VARCHAR (20)

-----------------------------------------------------------------
INSERT INTO students values(1,'RAM','PUNE')
INSERT INTO students values(2,'SHAM','MUMBAI')
INSERT INTO students values(3,'SITA','PUNE')
INSERT INTO students values(4,'GITA','NASHIK'
------------------------------------------------------------------
SELECT * FROM students
------------------------------------------------------------------

--INSERT NEW STUDENT HAVING ID=5,NAME=RAMESH,CITY=HYDRABAD
INSERT INTO students VALUES(5,'RAMESH','HYDRABAD')
-------------------------------------------------------------------

--CHANGE CITY NAME OF STU_ID=4 (GITA) TO SANGALI
UPDATE students SET city='SANGALI' WHERE stu_id=4

--------------------------------------------------------------------

--RETURN LIST OF ALL COLUMN STU_ID,NAME,CITY
SELECT * FROM students;
--------------------------------------------------------------------

--RETURN LIST OF STU_ID,NAME,MARKS,MAX MARKS,PERCENTAGE

CREATE TABLE subjects(
sub_id INT PRIMARY KEY,
sub_name VARCHAR (20),
max_marks INT,
passing_mark INT
)
------------------------------------------------------------------------

INSERT INTO subjects VALUES (1,'MATH',100,40)
INSERT INTO subjects VALUES (2,'ENGLISH',100,40)
INSERT INTO subjects VALUES (3,'MARATHI',50,15)
INSERT INTO subjects VALUES (4,'HINDI',50,15)

-----------------------------------------------------------------------------

CREATE TABLE exam(
stu_id INT CONSTRAINT fk_stu_id FOREIGN KEY(stu_id)REFERENCES students(stu_id),
sub_id INT CONSTRAINT FK_sub_id FOREIGN KEY(sub_id)REFERENCES subjects(sub_id),
marks INT
)
----------------------------------------------------------------------------------

INSERT INTO exam VALUES (1,1,100)
INSERT INTO exam VALUES (1,2,85)
INSERT INTO exam VALUES (1,3,40)
INSERT INTO exam VALUES (1,4,45)
INSERT INTO exam VALUES (2,1,35)
INSERT INTO exam VALUES (2,2,55)
INSERT INTO exam VALUES (2,3,25)
INSERT INTO exam VALUES (3,1,95)
INSERT INTO exam VALUES (3,2,87)
INSERT INTO exam VALUES (3,3,45)
INSERT INTO exam VALUES (3,4,42)
------------------------------------------------------------------------------------

SELECT * FROM 

--------------------------------------------------------------------------------------
