/*Question 6: Hospital Staff and Department Management System
A. Theory:
Explain the purpose of DISTINCT, LIKE, IN, and BETWEEN in SQL. Describe how these operators are used with the WHERE clause. Also explain the difference between COUNT(*) and COUNT(column_name), and describe how column aliases are used to make query results easier to understand.
B. Practical:
Create a Hospital Staff Management System using Department and Staff tables.
1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
3. Insert at least 4 department records and 6 staff records.
4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
5. Display staff members whose names start with a specified letter using LIKE.
6. Display staff members belonging to selected departments using IN.
7. Display unique staff designations using DISTINCT.
8. Count the number of staff members in each department using GROUP BY and COUNT().
9. Display the maximum and minimum salary using MAX() and MIN().
10. Update the salary of a staff member.
11. Display the final staff records using SELECT with appropriate column aliases.*/

CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Staff (
    staff_id VARCHAR(50) PRIMARY KEY,
    staff_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    staff_salary INT DEFAULT 30000,
    staff_age INT CHECK (staff_age >= 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
INSERT INTO Department(dept_name)
VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics');
INSERT INTO Staff(staff_id, staff_name, designation, staff_salary, staff_age, dept_id)
VALUES
('25BAI70907','Tanmay','Doctor',25000,20,1),
('25BAI70908','Rahul','Nurse',22000,21,2),
('25BAI70909','Shiwang','Technician',23000,20,1),
('25BAI70910','Vishesh','Doctor',40000,21,3),
('25BAI70911','Mayan','Nurse',34000,20,4),
('25BAI70912','Arnav','Administrator',49000,21,2);

SELECT staff_id AS "Staff ID", staff_name AS "Staff Name", staff_salary AS "Salary"
FROM Staff
WHERE staff_salary BETWEEN 25000 AND 50000;

SELECT staff_id AS "Staff ID", staff_name AS "Staff Name"
FROM Staff
WHERE staff_name LIKE 'A%';
SELECT staff_id AS "Staff ID", staff_name AS "Staff Name", dept_id AS "Department ID"
FROM Staff
WHERE dept_id IN (1, 3);

SELECT DISTINCT designation AS "Unique Designations"
FROM Staff;


SELECT dept_id AS "Department ID", COUNT(*) AS "Total Staff"
FROM Staff
GROUP BY dept_id;

SELECT MAX(staff_salary) AS "Maximum Salary", 
MIN(staff_salary) AS "Minimum Salary"
FROM Staff;

UPDATE Staff
SET staff_salary = 55000
WHERE staff_id= '25BAI70907';
SELECT 
    s.staff_id AS "Staff ID",
    s.staff_name AS "Staff Name",
    s.designation AS"Designation",
    s.staff_salary AS"Salary",
    s.staff_age AS "Age",
    d.dept_name AS"Department"
FROM Staff s
JOIN Department d 
ON s.dept_id = d.dept_id;
	









