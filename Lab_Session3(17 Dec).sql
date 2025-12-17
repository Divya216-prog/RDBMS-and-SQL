USE shopDB;  

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

START TRANSACTION;

INSERT INTO orders (order_id, customer_id, order_date, amount)
VALUES (1, 101, '2025-12-17', 5000.00);
SAVEPOINT sp1;

INSERT INTO orders (order_id, customer_id, order_date, amount)
VALUES (2, 102, '2025-10-11', 3000.00);
SAVEPOINT sp2;

INSERT INTO orders (order_id, customer_id, order_date, amount)
VALUES (3, 103, '2025-11-29', 7000.00);
SAVEPOINT sp3;

ROLLBACK TO SAVEPOINT sp2;

COMMIT;
SELECT * FROM orders;