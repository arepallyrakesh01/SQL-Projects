create table product_inventory(
product_id int primary key,
product_name varchar(100),
wholesale_cost decimal(10,2)
);
insert into product_inventory(
product_id,
product_name,
wholesale_cost)
values
(1, 'Laptop', 80000),
(2, 'Mobile phone', 45000),
(3, 'Headphones', 12000),
(4, 'Smart watch', 9000),
(5, 'Keyboard',5000),
(6, 'Mouse', 3000);
select * from product_inventory;
SELECT 
    product_name, 
    wholesale_cost 
FROM 
    product_inventory 
ORDER BY 
    wholesale_cost DESC 
LIMIT 3;

SELECT 
    product_name, 
    wholesale_cost 
FROM 
    product_inventory 
ORDER BY 
    wholesale_cost DESC 
LIMIT 2 OFFSET 3;
