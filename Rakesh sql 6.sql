-- Create Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- Note: Contains NULLs for guest checkouts
    product_id INT,
    order_date DATE
);

-- Insert Mock Data
INSERT INTO customers VALUES 
(1, 'Alice Smith', 'USA'),
(2, 'Bob Jones', 'Canada'),
(3, 'Charlie Brown', 'UK'),
(4, 'Diana Prince', 'USA'); -- Has never placed an order

INSERT INTO products VALUES 
(101, 'Laptop', 1200.00),
(102, 'Smartphone', 800.00),
(103, 'Wireless Headphones', 150.00),
(104, 'Tablet', 400.00); -- Has never been ordered

INSERT INTO orders VALUES 
(5001, 1, 101, '2026-06-01'), -- Alice bought Laptop
(5002, 2, 102, '2026-06-02'), -- Bob bought Smartphone
(5003, 1, 103, '2026-06-03'), -- Alice bought Headphones
(5004, NULL, 101, '2026-06-04'); -- Guest checkout bought Laptop

-- INNER JOIN excludws guest orders because NULL customer_id has no matching customer.
SELECT
    o.order_id,
    c.customer_name,
	p.product_name
FROM orders o
INNER JOIN customers c
   ON o.customer_id = c.customer_id
INNER JOIN products p
   ON o.product_id = p.product_id;
-- LEFT JOIN keeps every customer, so customers with no orders receive NULL in order_id.
SELECT
c.customer_name,
o.order_id
FROM customers c
LEFT JOIN orders o
   ON c.customer_id = o.customer_id;
-- RIGHT JOIN keeps every product, so products with no orders receive NULL in order_id.
SELECT
 p.product_name,
 o.order_id
FROM orders o
RIGHT JOIN products p
   ON o.product_id = p.product_id;
-- FULL OUTER JOIN keeps unmatched customers and unmatched orders, including guest checkouts.
SELECT
 c.customer_name,
 o.order_id,
 o.customer_id AS order_customer_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;
-- CROSS JOIN does not require a matching key and creates every customer-product combination.
SELECT
 c.customer_name,
 p.product_name
FROM customers c
CROSS JOIN products p;