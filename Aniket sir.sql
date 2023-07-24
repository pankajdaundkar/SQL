
--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed

CREATE TABLE student(
roll_no INT PRIMARY KEY,
sname VARCHAR (30),
degree VARCHAR (20),
birth_date VARCHAR (20),
cource_id INT CONSTRAINT cource_id_fk FOREIGN KEY(cource_id) REFERENCES cource(cource_id),
batch_id INT,
fees_paid INT,remark VARCHAR (10)
)

--Course – course id , course name, duration (in months), trainer id , total fees 

CREATE TABLE cource(
cource_id INT PRIMARY KEY,
cource_name VARCHAR(30),
duration VARCHAR(20),trainer_id INT,
total_fees INT
)

--Trainer – Trainer id , trainer name , join date , email , experience in years 

CREATE TABLE  trainer(
trainer_id INT,trainer_name VARCHAR(30),
join_date VARCHAR(20),eamil VARCHAR (20),
experience INT 
)
