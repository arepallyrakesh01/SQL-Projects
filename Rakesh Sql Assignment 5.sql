CREATE TABLE analytical_sales (
    transaction_id   INT PRIMARY KEY,
    product_category VARCHAR(30),
    units_sold       INT,
    total_revenue    DECIMAL(8,2)
);
INSERT INTO analytical_sales VALUES
(1, 'Electronics', 2, 1199.98),
(2, 'Apparel', 5, 125.00),
(3, 'Electronics', 1, 45.00),
(4, 'Home Goods', 3, 270.00),
(5, 'Apparel', 1, 45.00),
(6, 'Electronics', 4, 2400.00);
SELECT
    SUM(total_revenue) AS gross_revenue,
    AVG(total_revenue) AS average_order_value,
    COUNT(*) AS total_transactions,
	MIN (total_revenue) AS lowest_revenue,
	MAX (total_revenue) AS highest_revenue
FROM analytical_sales;

SELECT
    COUNT(DISTINCT product_category) AS unique_categories
FROM analytical_sales;

SELECT
    SUM(total_revenue) AS category_revenue,
	COUNT(units_sold) AS total_units_solds
FROM analytical_sales
GROUP BY product_category;

SELECT
    SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category
ORDER BY category_revenue DESC;

SELECT
    transaction_id,
	product_category,
	units_sold,
	total_revenue
FROM analytical_sales
WHERE units_sold >1;

SELECT
    product_category,
    SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category
HAVING SUM(total_revenue) > 300
ORDER BY category_revenue DESC;

SELECT
    product_category,
	SUM(total_revenue) AS category_revenue
FROM analytical_sales
WHERE units_sold > 1
GROUP BY product_category
HAVING SUM(total_revenue) > 250
ORDER BY category_revenue DESC;

SELECT
    product_category,
	SUM(total_revenue) AS category_revenue
FROM analytical_sales
WHERE units_sold > 1
GROUP BY product_category
HAVING SUM(total_revenue) > 250
ORDER BY category_revenue DESC
LIMIT 2;

SELECT
    product_category,
	SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category;
	
	