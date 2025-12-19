-- LAB SESSION1
use collegedb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    status VARCHAR(20)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    payment_date DATE,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi', 'Active'),
(2, 'Bala', 'Chennai', 'Active'),
(3, 'Charan', 'Mumbai', 'Inactive'),
(4, 'Deepa', 'Delhi', 'Active'),
(5, 'Esha', 'Mumbai', 'Active');

INSERT INTO orders VALUES
(101, 1, '2024-01-05', 5000),
(102, 1, '2024-02-10', 7000),
(103, 2, '2024-01-15', 3000),
(104, 2, '2024-03-20', 8000),
(105, 4, '2024-02-25', 6000);

INSERT INTO payments VALUES
(201, 1, '2024-01-07', 5000),
(202, 1, '2024-02-12', 4000),
(203, 2, '2024-01-17', 3000),
(204, 4, '2024-03-01', 6000);

-- Customers who have placed more orders than the average number of orders per customer
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >
(SELECT COUNT(order_id) / COUNT(DISTINCT customer_id) FROM orders);

-- Customers whose total order amount is greater than the average order amount of all customers
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) >
(SELECT AVG(order_amount) FROM orders);

-- Customers who live in cities where at least one inactive customer exists
SELECT * FROM customers
WHERE city IN
(SELECT city FROM customers WHERE status = 'Inactive');

-- Customers who have never made any payment
SELECT * FROM customers 
WHERE customer_id NOT IN
(SELECT customer_id FROM payments);

-- Customers whose total payments are less than their total order amount
SELECT customer_id FROM orders 
GROUP BY customer_id 
HAVING SUM(order_amount)<
(SELECT SUM(order_amount) FROM orders 
GROUP BY customer_id);

-- Customers who have made more payments than orders
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(p.payment_id) > COUNT(o.order_id);

-- Customers who have only one order
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = 1;

-- Customers whose order amount is higher than at least one order placed by another customer in the same city
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN customers c2 ON c.city = c2.city
INNER JOIN orders o2 ON c2.customer_id = o2.customer_id
WHERE c.customer_id <> c2.customer_id
  AND o.order_amount > o2.order_amount;

-- Customers who have not placed any orders but have made payments
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
INNER JOIN payments p ON c.customer_id = p.customer_id
WHERE c.customer_id NOT IN
(SELECT customer_id FROM orders);




