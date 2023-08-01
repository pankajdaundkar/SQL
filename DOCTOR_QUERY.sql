----EXICUTION FROM SQL ALL QUERIES

CREATE TABLE Provience_Names(
Provience_Id INT PRIMARY KEY,
Provience_Name VARCHAR(30)
)
INSERT INTO Provience_Names VALUES (1,'Madras')
INSERT INTO Provience_Names VALUES (2,'Bombay')
INSERT INTO Provience_Names VALUES (3,'Madras')
INSERT INTO Provience_Names VALUES (4,'Kolkatta')
INSERT INTO Provience_Names VALUES (5,'Madras')

SELECT * FROM Provience_Names


CREATE TABLE Patients(
patient_id INT PRIMARY KEY,
First_Name  VARCHAR(20),
Last_Name VARCHAR(20),
Gender VARCHAR(10),
BirthDate VARCHAR(20),
City VARCHAR(25),
Provience_Id INT,FOREIGN KEY(Provience_Id) REFERENCES Provience_Names(Provience_Id),
Allergies VARCHAR(30),
Height DECIMAL(3,0),
Weights DECIMAL(4,0)
)
SELECT * FROM patients

INSERT INTO patients VALUES (101,'Vidyashree','Hipparagi','F','01/01/2000','Sangli',2,'Hay Fever',5.6,55)
INSERT INTO patients VALUES (102,'Akshata','Sabne','F','13/07/1999','Latur',1,'Pet Allergy',5.4,45)
INSERT INTO patients VALUES (103,'Sagar','Kawade','M','01/12/2000','Solapur',3,'Dust Allergy',5.7,57)
INSERT INTO patients VALUES (104,'Anjali','Buddhe','F','12/04/1997','Beed',4,'Food Allergy',5.5,50)
INSERT INTO patients VALUES (105,'Pankaj','Daundakar','M','02/11/1991','Pune',1,'Pollean Allergy',6,65)

CREATE TABLE doctors(
docid INT,
f_name VARCHAR(10),
l_name VARCHAR(10),
speciality VARCHAR(25)
)
INSERT INTO doctors VALUES (11,'Siddhart',' Mukherjee','Biologist')
INSERT INTO doctors VALUES (12,'Devi','Shetty','Cardiologist')
INSERT INTO doctors VALUES (13,'Surabi','Anand','Dermatologist')
INSERT INTO doctors VALUES (14,'Aditya','Gupta','gynecologist')
INSERT INTO doctors VALUES (15,'Mohamed','Rela','Neurologist')

SELECT * FROM doctors

CREATE TABLE admissions(
 patient_id INT FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
 ad_date VARCHAR(20),
 dis_date VARCHAR(20),
 diagnosis VARCHAR(50),
 attending_doc_id INT
 )
 INSERT INTO admissions VALUES (101,'01/06/2022','06/06/2022','Fever',11)
 INSERT INTO admissions VALUES (102,'11/06/2022','16/06/2022','Cough',12)
 INSERT INTO admissions VALUES (103,'21/11/2021','26/11/2021','Pain',15)
 INSERT INTO admissions VALUES (104,'12/08/2022','18/08/2022','CBC',14)
 INSERT INTO admissions VALUES (105,'05/07/2023','15/07/2023','Hiboglobin',13)

 SELECT * FROM admissions

 --	Show the first name, last name and gender of patients who’s gender is ‘M’

SELECT First_Name,Last_Name,Gender FROM patients WHERE Gender='M'

--	Show the first name & last name of patients who does not have any allergies

SELECT First_Name,Last_Name FROM patients WHERE Allergies is null

--	Show the patients details that start with letter ‘C’

SELECT * FROM patients WHERE  First_Name like 'c%'

--	Show the patients details that height range 100 to 200

SELECT * FROM patients WHERE Height between 4 and 6


--	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null

UPDATE patients SET Allergies='NKA' WHERE Allergies is null


--	Show how many patients have birth year is 2020

SELECT * FROM  patients WHERE  BirthDate='2020'


--	Show the patients details who have greatest height
SELECT * FROM patients WHERE Height =
(SELECT max(Height) FROM patients)

--select top 1 * from patients order by Height desc

SELECT * FROM patients WHERE Height=(SELECT max(Height) FROM patients)
ORDER BY Height DESC

--	Show the total amount of male patients and the total amount of female patients in the patients table.

SELECT Gender, COUNT(*) as TotalPatients
FROM patients
GROUP BY Gender


--	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

SELECT first_name, last_name, Allergies
FROM patients
WHERE Allergies IN ('Penicillin', 'Morphine')
ORDER BY Allergies ASC, first_name ASC, last_name ASC

--	Show first_name, last_name, and the total number of admissions attended for each doctor.

SELECT f_name, l_name, COUNT(*) AS TotalAdmissionsAttended
FROM doctors
JOIN admissions ON doctors.attending_doc_id = admissions.attending_doc_id
GROUP BY doctors.docid, f_name, l_name


--Every admission has been attended by a doctor.

--For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem