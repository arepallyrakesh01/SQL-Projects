
create table products(
product_id int primary key,
description varchar,
product_sku varchar,
wholesale_cost decimal(10,2),
added_date varchar);

INSERT INTO products
VALUES
(8,  'Classic Denim Bomber Jacket', 'APPR-9022', 40.00, '2026-02-02'),
(9,  'Insulated Steel TUMBLER',     'HOME-2210', 14.50, '2026-02-18'),
(10, 'Waterproof rain jacket',      'APPR-3101', 55.00, '2026-03-10'),
(11, 'Glass Tumbler Set',           'HOME-5000',  9.99, '2026-03-12');

-- Task 1: Multi-character wildcard lookup for 'Wireless'
SELECT *
FROM products
WHERE description LIKE '%Wireless%';

-- Task 2: Case-insensitive suffix matching for 'jacket' or 'tumbler'
SELECT *
FROM products
WHERE description ILIKE '%jacket'
   OR description ILIKE '%tumbler';

-- Task 3: Specific length pattern with price filter
SELECT *
FROM products
WHERE product_sku LIKE 'HOME-____'
  AND wholesale_cost < 15.00;