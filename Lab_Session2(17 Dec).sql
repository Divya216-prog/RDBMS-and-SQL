CREATE DATABASE shopDB;
USE shopDB;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15)
);
INSERT INTO customers (customer_id, customer_name, email, city, phone) VALUES
(101, 'Amit Kumar', 'amit.kumar@example.com', 'Bangalore', '9999900000'),
(102, 'Neha Sharma', 'neha.sharma@example.com', 'Mumbai', '8888800000'),
(103, 'Ravi Singh', 'ravi.singh@example.com', 'Bangalore', '1111122222'),
(104, 'Meena Joshi', 'meena.joshi@example.com', 'Delhi', '9999999977'),
(105, 'Ankit Verma', 'ankit.verma@example.com', 'Bangalore', '6666554444');

SELECT * FROM customers;

SELECT customer_name, email
FROM customers WHERE city = 'Bangalore';

