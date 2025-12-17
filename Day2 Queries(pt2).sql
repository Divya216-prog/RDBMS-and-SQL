CREATE DATABASE bankdb1;
USE bankdb1;
 
CREATE TABLE accounts (
    acc_id INT PRIMARY KEY,
    acc_name VARCHAR(50),
    balance INT
);
 
INSERT INTO accounts VALUES
(101, 'Amit', 10000),
(102, 'Ravi', 8000),
(103, 'Neha', 12000);
 
SELECT * FROM accounts;
 
START TRANSACTION;
 
UPDATE accounts
SET balance = balance - 2000
where acc_id = 101;
 
 
SET autocommit = 0;
 
SAVEPOINT sp1;
 
UPDATE accounts
SET balance = balance +  4000
where acc_id = 102;
 
 
ROLLBACK To sp1;
 
SET autocommit = 1;
commit;
 
SELECT * FROM accounts;

--------------------------------------------------------------------------------------------------------------
CREATE DATABASE companydb;
USE companydb;
 
 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);
 
INSERT INTO employees VALUES
(1, 'Amit', 50000),
(2, 'Ravi', 45000),
(3, 'Neha', 60000);
 
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test123';
 
SELECT user, host FROM mysql.user;
 
GRANT SELECT
ON companydb.employees
TO 'testuser'@'localhost';
 
GRANT INSERT, UPDATE
ON companydb.employees
TO 'testuser'@'localhost';
 
GRANT ALL PRIVILEGES
ON companydb.*
TO 'testuser'@'localhost';
 
FLUSH PRIVILEGES;
 
SHOW GRANTS FOR 'testuser'@'localhost';
 
 
REVOKE UPDATE
ON companydb.employees
FROM 'testuser'@'localhost';
 
REVOKE ALL PRIVILEGES ON comapnydb.* FROM 'testuser'@'localhost';
 
FLUSH PRIVILEGES;
 
DROP USER 'testuser'@'localhost';