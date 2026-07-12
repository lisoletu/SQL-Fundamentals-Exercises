-- Databricks notebook source
-- DBTITLE 1,1
--Running the full tables before analysis to see what I have in my data
--------------------------------------------------------------------------
SELECT *
FROM company_db.employee_data.employees;


--1. COUNT() Function
------------------------------------------
SELECT COUNT(*) AS total_employees
FROM company_db.employee_data.employees;
 
--2. SUM() Function
-------------------------------------------
SELECT SUM(salary) AS total_IT_salary
FROM company_db.employee_data.employees
WHERE department = 'IT';

--3. AVG() Function 
--------------------------------------------
SELECT AVG(salary) AS average_HR_salary
FROM company_db.employee_data.employees
WHERE department = 'HR';


--4. MIN() and MAX() Functions
----------------------------------------------
SELECT MIN(salary) AS lowest_salary,
       MAX(salary) AS highest_salary
FROM company_db.employee_data.employees;

--5. GROUP BY Statement
----------------------------------------------
SELECT department,
    SUM(salary) AS total_salary
FROM company_db.employee_data.employees
GROUP BY department;

--6. GROUP BY and COUNT() 
----------------------------------------------
SELECT city,
       COUNT(DISTINCT id) AS employee_cnt
FROM company_db.employee_data.employees
GROUP BY city;

--7. GROUP BY and ORDER BY
------------------------------------------------
SELECT department,
    AVG(salary) AS average_salary
FROM company_db.employee_data.employees
GROUP BY department;

--8. HAVING Clause 
-----------------------------------------------
SELECT department,
    SUM(salary) AS total_salary
FROM company_db.employee_data.employees
GROUP BY department
HAVING total_salary > 100000;

--9. Combining GROUP BY, HAVING, and ORDER BY
-----------------------------------------------
SELECT city,
    COUNT(id) AS employee_cnt
FROM company_db.employee_data.employees
GROUP BY city
HAVING employee_cnt>1
ORDER BY employee_cnt DESC;

--10. Combining Aggregate Functions
-----------------------------------------------
SELECT department,
        AVG (salary) AS highest_average_salary
FROM company_db.employee_data.employees
GROUP BY department
ORDER BY highest_average_salary DESC
LIMIT 1;







