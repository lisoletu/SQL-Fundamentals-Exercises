-- Databricks notebook source
--Running the full tables before analysis to see what I have in my data
--------------------------------------------------------------------------
SELECT *
FROM case_statements_prac_exercise3.exercise_data.attendance;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.classes;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.deliveries;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.employeess;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.orders;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.payments;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.products;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.products_inventory;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.students;

SELECT *
FROM case_statements_prac_exercise3.exercise_data.tickets;


--1. Table: products 
--------------------------------------------------------
SELECT product_name,
       price,
    CASE 
        WHEN  price > 1000 THEN 'Expensive' 
        WHEN  price BETWEEN 100 AND 1000 THEN  'Mid-range'
        WHEN  price < 100 THEN 'Budget'
    END AS price_category
FROM case_statements_prac_exercise3.exercise_data.products;


--2. Table: orders
--------------------------------------------------------
SELECT customer_name,
       amount,
    CASE 
        WHEN  amount >= 1000 THEN 'High Value' 
        WHEN  amount BETWEEN 500 AND 999.99 THEN  'Medium Value'
        WHEN  amount < 500 THEN 'Low Value'
    END AS order_value_category 
FROM case_statements_prac_exercise3.exercise_data.orders;


--3. Table: employees
----------------------------------------------------
SELECT emp_name,
      department,
      salary,
    CASE
        WHEN department = 'IT' AND salary > 80000 THEN 'Senior IT' 
        WHEN department = 'HR' AND salary > 55000 THEN 'Experienced HR' 
    ELSE 'Staff'
    END AS position_level 
FROM case_statements_prac_exercise3.exercise_data.employeess;

--4. Table: students
--------------------------------------------------------
SELECT student_name,
       score,
    CASE
        WHEN score >= 90 THEN 'A'
        WHEN score BETWEEN 80 AND 89 THEN 'B'
        WHEN score BETWEEN 70 AND 79 THEN 'C'
        WHEN score BETWEEN 60 AND 69 THEN 'D'
        WHEN score < 60 THEN 'F'
    END AS grade
FROM case_statements_prac_exercise3.exercise_data.students;

--5. Table: deliveries
-------------------------------------------------------
SELECT delivery_id,
       delivery_time_minutes,
    CASE
        WHEN delivery_time_minutes <= 30 THEN 'Fast'
        WHEN delivery_time_minutes BETWEEN 31 AND 60 THEN 'On Time'
         WHEN delivery_time_minutes = 60 THEN 'Late'
    ELSE 'Slow'
    END AS performance
    FROM case_statements_prac_exercise3.exercise_data.deliveries;

--6. Table: tickets 
-----------------------------------------------------------
SELECT issue_type,
       priority,
    CASE
        WHEN priority = 3 THEN 'High'
        WHEN priority = 2 THEN 'Medium'
        WHEN priority = 1 THEN 'Low'
    END AS priority_label
FROM case_statements_prac_exercise3.exercise_data.tickets;


--7. Table: attendance
-----------------------------------------------------------
SELECT student_id,
       ((days_present*100)/total_days) AS attendance_percentage,
    CASE
        WHEN ((days_present*100)/total_days)>= 90 THEN  'Excellent'
        WHEN ((days_present*100)/total_days) BETWEEN 75 AND 89 THEN 'Good'
    ELSE 'Needs Improvement'
    END AS attendance_status 
FROM case_statements_prac_exercise3.exercise_data.attendance;
        

--8. Table: products_inventory
-----------------------------------------------------------
SELECT product_id,
       stock_qty,
    CASE
        WHEN stock_qty = 0 THEN 'Out of Stock'
        WHEN stock_qty BETWEEN 1 AND 4 THEN 'Low Stock'
        WHEN stock_qty = 5 THEN 'In Stock'
    ELSE 'In Stock'
    END AS stock_status
    FROM case_statements_prac_exercise3.exercise_data.products_inventory;



--9. Table: classes
-----------------------------------------------------------
SELECT subject,
      enrolled_students,
    CASE
        WHEN enrolled_students >= 25 THEN 'Large'
        WHEN enrolled_students BETWEEN 10 AND 24 THEN 'Medium'
        ELSE 'Small'
    END AS class_size_category
    FROM case_statements_prac_exercise3.exercise_data.classes;


--10. Table: payments 
----------------------------------------------------------
SELECT payment_id,
       payment_method,
       amount,
    CASE
        WHEN  payment_method = 'Cash' AND amount >=200 THEN 'Eligible for Discount' 
    ELSE 'Not Eligible' 
    END AS discount_eligibility
FROM case_statements_prac_exercise3.exercise_data.payments;


