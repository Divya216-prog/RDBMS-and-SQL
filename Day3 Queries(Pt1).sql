CREATE DATABASE Joindb;
USE Joindb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1, 'Divya Rani', 'Bangalore'),
(2, 'Amit Kumar', 'Chennai'),
(3, 'Sneha Sharma', 'Hyderabad'),
(4, 'Rahul Verma', 'Bangalore'),
(5, 'Neha Singh', 'Mumbai');

INSERT INTO orders VALUES
(101, 1, 2500.00),
(102, 2, 1800.50),
(103, 1, 3200.75),
(104, 3, 999.99),
(105, 4, 4500.00);

-- Inner Join
SELECT c.customer_name, o.order_amount
FROM customers c 
INNER JOIN orders o ON c.customer_id=o.customer_id;

-- Right Join
SELECT c.customer_name, o.order_amount, c.city, o.order_id
FROM customers c 
RIGHT JOIN orders o ON c.customer_id=o.customer_id;

-- Left Join
SELECT c.customer_name, o.order_amount, c.city, o.order_id
FROM customers c 
LEFT JOIN orders o ON c.customer_id=o.customer_id;

-- Full Join
SELECT c.customer_name, o.order_amount, c.city, o.order_id
FROM customers c 
RIGHT JOIN orders o ON c.customer_id=o.customer_id
UNION
SELECT c.customer_name, o.order_amount, c.city, o.order_id
FROM customers c 
LEFT JOIN orders o ON c.customer_id=o.customer_id;

-- Cross Join
SELECT c.customer_name , o.order_id
FROM customers c
CROSS JOIN orders o;

---------------------------------------------------------------------------------------------------------------
CREATE TABLE employees_2023 (
    emp_id INT,
    emp_name VARCHAR(50)
);
 
CREATE TABLE employees_2024 (
    emp_id INT,
    emp_name VARCHAR(50)
);
 
INSERT INTO employees_2023 VALUES
(1, 'Arun'),
(2, 'Bala'),
(3, 'Chitra');
 
INSERT INTO employees_2024 VALUES
(2, 'Bala'),
(3, 'Chitra'),
(4, 'Divya');
 
-- Intersect Returns only common rows from both queries.
 
select e1.emp_id, e1.emp_name
from employees_2023 e1
inner join employees_2024 e2
ON e1.emp_id = e2.emp_id;
 
select * from employees_2023;
 
select * from employees_2024;
 
-- Combines rows from both queries and removes duplicates.
 
select emp_id , emp_name from employees_2023
UNION
select emp_id , emp_name from employees_2024;
 
-- UNION ALL (keeps duplicates)
 
select emp_id , emp_name from employees_2023
UNION ALL
select emp_id , emp_name from employees_2024;
 
-- except - Returns rows from the first table only, excluding common rows.
 
select e1.emp_id, e1.emp_name
from employees_2023 e1
left join employees_2024 e2
ON e1.emp_id = e2.emp_id
where e2.emp_id is null;
---------------------------------------------------------------------------------------------------------------
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);
 
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
 
INSERT INTO employees VALUES
(101, 'Arun', 50000, 1),
(102, 'Bala', 60000, 2),
(103, 'Chitra', 55000, 2),
(104, 'Divya', 45000, 1),
(105, 'Eshan', 70000, 3);
 
 
select * from departments;
 
select * from employees;
 
-- employee with the highest salary - returning one row  - scalar sub query
 
select emp_name , salary
from employees
where salary = (
select MAX(salary)
from employees
);
 
-- Employees Working in IT Department - return multiple rows
 
select emp_name ,dept_id
from employees
where dept_id  = (
    select dept_id 
    from departments
    where dept_name = 'IT'
);
-- Employees in HR or Finance - IN clause
 
select emp_name
from employees
where dept_id  IN (
 
	select dept_id 
    from departments
    where dept_name IN ('HR' , 'Finance')
);
 
-- average salary using group by clause  avearge salary per dept
select dept_id, AVG(salary) as avgsalary
from employees
group by dept_id;
 
select dept_id, salary from employees;

select emp_name, salary , dept_id
from employees e 
where salary = (
		select max(salary)
        from employees
        where dept_id = e.dept_id
);
 
-- Employees Earning More Than Their Department Average
SELECT emp_id, emp_name, dept_id, salary
FROM employees e
WHERE salary >
      (SELECT AVG(salary)
       FROM employees
       WHERE dept_id = e.dept_id);

---------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE 'Wipro Practice.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

---------------------------------------------------------------------------------------------------------------
CREATE TABLE employeeswipro (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    dept VARCHAR(30)
);
 
INSERT INTO employeeswipro VALUES
(101, 'Arun', 50000, 'HR'),
(102, 'Bala', 60000, 'IT'),
(103, 'Chitra', 55000, 'IT'),
(104, 'Divya', 45000, 'HR'),
(105, 'Eshan', 70000, 'Finance'),
(106, 'Farah', 65000, 'Finance');
 
select * from employeeswipro;
 
 
-- departments with avaerage dsalary > 550000
select dept, avg(salary) AS avg_salary
from  employeeswipro
group by dept
having AVG(salary) > 55000;
 
-- depatrtment with more than 1 employee
select dept, COUNT(*) as emp_count
from  employeeswipro
group by dept
having count(*) > 1;
 
 
-- using both where and having clause
select dept, AVG(salary) as avg_salary
from employeeswipro
where salary > 50000
group by dept
having AVG(salary) > 60000;

--------------------------------------------------------------------------------------------------------------
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);
INSERT INTO salesman VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.10),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);
INSERT INTO customer VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

SELECT * FROM salesman;

SELECT * FROM customer;

-- SQL query to find the salesperson(s) and the customer(s) he represents.
SELECT c.cust_name, c.city, s.name, s.commission 
FROM customer c
INNER JOIN salesman s
ON c.salesman_id = s.salesman_id;

-- SQL query to find the salesperson and customer who reside in the same city.
SELECT s.name, c.cust_name, c.city 
FROM salesman s
INNER JOIN customer c
ON s.city = c.city;


