CREATE TABLE capstone_sales_staging(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
product_sku VARCHAR(100), 
units_sold DECIMAL(12,2),
gross_revenue NUMERIC(12,2),
shipping_city VARCHAR(100)
);
INSERT INTO capstone_sales_staging
(order_id, order_date, customer_id, product_sku,
 units_sold, gross_revenue, shipping_city)
VALUES
(1001, '2025-01-05', 201, 'P101', 2, 90000, ' Hyderabad '),
(1002, '2025-01-10', 202, 'P102', 3, 60000, 'hyderabad'),
(1003, '2025-02-15', 203, 'P103', 5, 7500, ' Chennai '),
(1004, '2025-02-20', 204, 'P104', 2, 10000, 'mumbai'),
(1005, '2025-03-12', 205, 'P105', 1, 8000, ' Hyderabad'),
(1006, '2025-03-25', 206, 'P106', 20, 1000, 'delhi'),
(1007, '2025-04-05', 207, 'P107', 50, 500, ' Chennai'),
(1008, '2025-04-18', 208, 'P108', 4, 4000, 'mumbai'),
(1009, '2025-05-10', 209, 'P101', 1, 45000, 'hyderabad '),
(1010, '2025-05-22', 210, 'P102', 2, 40000, 'Delhi'),
(1011, '2025-06-14', 211, 'P103', 10, 15000, ' Mumbai '),
(1012, '2025-07-09', 212, 'P104', 3, 15000, 'chennai'),
(1013, '2025-08-16', 213, 'P105', 2, 16000, ' Hyderabad '),
(1014, '2025-09-21', 214, 'P106', 30, 1500, 'Delhi'),
(1015, '2025-10-11', 215, 'P108', 5, 5000, 'Mumbai');

CREATE TABLE capstone_products(
product_sku varchar(100),
product_name varchar(60),
category varchar(100),
unit_cost numeric(12,2)
);
INSERT INTO capstone_products
(product_sku, product_name, category, unit_cost)
VALUES
('P101', 'Laptop', 'Electronics', 35000),
('P102', 'Mobile', 'Electronics', 15000),
('P103', 'Headphones', 'Electronics', 800),
('P104', 'Office Chair', 'Furniture', 3000),
('P105', 'Office Table', 'Furniture', 5000),
('P106', 'Notebook', 'Stationery', 20),
('P107', 'Pen', 'Stationery', 5),
('P108', 'Backpack', 'Accessories', 500);
---- Aggregation functions
SELECT 
   TRIM(UPPER(shipping_city)) AS cleaned_city,
   SUM(gross_revenue)AS total_revenue,
   COUNT(order_id) AS total_orders
FROM capstone_sales_staging
GROUP BY TRIM(UPPER(shipping_city))
ORDER BY total_revenue DESC;
---- INNER JOIN
SELECT
    p.category,
    p.product_name,
    SUM(s.gross_revenue) AS total_revenue,
    SUM(s.units_sold * p.unit_cost) AS total_cost,
    SUM(s.gross_revenue -
        (s.units_sold * p.unit_cost)) AS net_profit,
    ROUND(
        SUM(s.gross_revenue -
            (s.units_sold * p.unit_cost))
        / NULLIF(SUM(s.gross_revenue), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM capstone_sales_staging s
INNER JOIN capstone_products p
    ON s.product_sku = p.product_sku
GROUP BY p.category, p.product_name
ORDER BY net_profit DESC;
---- Extract
SELECT
    EXTRACT(YEAR FROM order_date) AS fiscal_year,
    EXTRACT(QUARTER FROM order_date) AS fiscal_quarter,
    EXTRACT(MONTH FROM order_date) AS fiscal_month,
    SUM(gross_revenue) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM capstone_sales_staging
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(QUARTER FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    fiscal_year,
    fiscal_quarter,
    fiscal_month;
	
WITH product_sales AS (
    SELECT
        p.category,
        p.product_name,
        SUM(s.gross_revenue) AS total_revenue
    FROM capstone_sales_staging s
    INNER JOIN capstone_products p
        ON s.product_sku = p.product_sku
    GROUP BY
        p.category,
        p.product_name
)
SELECT
    category,
    product_name,
    total_revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY total_revenue DESC
    ) AS category_rank
FROM product_sales
ORDER BY category, category_rank;

 

select*from  capstone_products;
select*from capstone_sales_staging;