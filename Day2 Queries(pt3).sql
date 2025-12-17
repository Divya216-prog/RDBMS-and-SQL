SELECT ABS(-10);
SELECT ROUND(123.456,1);
SELECT CEIL(8.4);
SELECT ROUND(5.2);
SELECT POWER(3,3);
SELECT MOD(21,11);

SELECT UPPER('divya');
SELECT LOWER('SQL');
SELECT LENGTH('BEAUTY');
SELECT SUBSTRING('Database',3,4);
SELECT CONCAT('Good','Morning');
SELECT TRIM(' WORLD ');
SELECT REPLACE('sql guide', 'guide', 'book');

SELECT NOW();
SELECT CURDATE();
SELECT DATEDIFF('2025-01-10', '2025-01-01');
SELECT DATE_ADD('2025-01-01', INTERVAL 10 DAY);
SELECT MONTH('2025-02-15');
SELECT YEAR('2025-12-10');

CREATE DATABASE companyDB2;
USE companyDB2;
 
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(20),
    salary INT
);
 
select * from employees;
 
INSERT INTO employees VALUES
(1, 'Amit', 'HR', 30000),
(2, 'Ravi', 'IT', 50000),
(3, 'Neha', 'IT', 70000),
(4, 'Meena', 'HR', 40000),
(5, 'Arjun', 'Finance', 60000);
 
select COUNT(*) as total_employees
from employees;
 
select COUNT(*) as IT_COUNT
from employees
where dept = 'IT';
 
select SUM(salary) as total_salary
from employees;
 
select dept, SUM(salary) as dept_salary
from employees
GROUP BY dept;
 
select AVG(salary) as dept_salary
from employees;
 
select dept, AVG(salary) as avg_salary
from employees
GROUP BY dept;

select MIN(salary) as lowest_salary
from employees;
 

select MAX(salary) as lowest_salary
from employees;
 
select dept, MAX(salary) as max_salary
from employees
GROUP BY dept;

CREATE DATABASE logicDB;
USE logicDB;
 
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    bonus INT,
    dept VARCHAR(20)
);
 
INSERT INTO employees VALUES
(1, 'Amit', 25000, NULL, 'HR'),
(2, 'Ravi', 40000, 5000, 'IT'),
(3, 'Neha', 60000, NULL, 'Finance'),
(4, 'Meena', 80000, 10000, 'IT');
 
SELECT * FROM employees;
 
 
select emp_name, salary,
case
	when salary < 30000 then 'low'
    when salary between 30000 and 60000 then 'Medium'
    else 'high'
END as salary_level
from employees;
 
select * 
from employees
where
case 
	when dept = 'IT' then salary > 50000
    else salary > 30000
END;
 
update employees
set bonus =
case
	when salary >= 60000 then 10000
    else 5000
END;
 
SELECT * FROM employees;
 
select emp_name,
if(salary >= 50000, 'Eligible' , 'Not eligible')  as status
from employees;
 
select emp_name,
IF (bonus is null, salary * 0.05 , bonus) as final_bonus
from employees;
 
select emp_name,
ifnull(bonus, 0 ) as  bonus_amount
from employees;
 



