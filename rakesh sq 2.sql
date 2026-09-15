CREATE TABLE corporate_stores (
    store_id INT PRIMARY KEY,
    city_location VARCHAR(50) NOT NULL
);
INSERT INTO corporate_stores VALUES
(1, 'Austin'),
(2, 'Chicago'),
(3, 'Denver'),
(4, 'Seattle');
CREATE TABLE daily_register_sales (
    transaction_id INT PRIMARY KEY,
    store_id INT,
    sale_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES corporate_stores(store_id)
);
INSERT INTO daily_register_sales VALUES
(101, 1, 245.50),
(102, 1, 89.99),
(103, 2, 312.00),
(104, 3, 156.75),
(105, 4, 420.00),
(106, 2, 67.25);
select
s.transaction_id,
s.sale_amount,
c.city_location
from daily_register_sales s
join corporate_stores c on s.store_id = c.store_id;

