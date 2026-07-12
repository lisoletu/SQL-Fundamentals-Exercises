-- Databricks notebook source
--Running the full tables before analysis to see what I have in my data
--------------------------------------------------------------------------
SELECT *
FROM company_db.employee_data.employees;

--1. SELECT Statement
---------------------------------------
SELECT *
FROM company_db.employee_data.employees;

--2. SELECT DISTINCT Statement
----------------------------------------
SELECT DISTINCT department
FROM company_db.employee_data.employees;

--3. ORDER BY Statement
----------------------------------------
SELECT first_name,
       last_name
FROM company_db.employee_data.employees
ORDER BY salary DESC;

--4. LIMIT Statement
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
ORDER BY salary DESC
LIMIT 5;

--5.  WHERE Statement 
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE department = 'IT';

--6. AND Statement
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE department ='Finance' AND salary > 58000;

--7.OR Statement 
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE department ='HR' OR department= 'Marketing';

--8. NOT Statement 
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE NOT department= 'IT';

--9. IN Statement 
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE department IN('HR','IT','Finance');

--10. Combining Conditions 
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE department ='IT' 
AND salary >50000
AND City = 'New York';

--11. Combining WHERE, AND, and ORDER BY 
------------------------------------------
SELECT first_name,
       last_name
FROM company_db.employee_data.employees
WHERE department IN ('Finance','Marketing')
AND salary >52000
ORDER BY salary DESC;

--12. Combining SELECT DISTINCT, WHERE, and IN
------------------------------------------
SELECT DISTINCT city
FROM company_db.employee_data.employees
WHERE department NOT IN ('IT','HR');

--13. Combining WHERE, NOT, AND, and ORDER BY
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE NOT Department ='Finance'
AND salary > 50000
ORDER BY hire_date ASC;

--14. Combining WHERE, OR, IN, and LIMIT
------------------------------------------
SELECT *
FROM company_db.employee_data.employees
WHERE (city= 'Chicago' OR city='Los Angeles')
AND department IN ('IT', 'Marketing')
ORDER BY Id
LIMIT 3;



