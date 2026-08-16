CREATE TABLE products(
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  sku_code CHAR(8) UNIQUE NOT NULL,
  price NUMERIC(10,2) CHECK (price > 0),
  stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
  is_available BOOLEAN DEFAULT TRUE,
  category TEXT NOT NULL,
  adden_on DATE DEFAULT CURRENT_DATE,
  last_update TIMESTAMP DEFAULT NOW()
);


INSERT INTO products (name, sku_code, price , stock_quantity, is_available, category)
VALUES
('Wireless Mouse', 'WM123456', 699.99, 50, TRUE, 'Electronics'),
('Bluetooth Speaker', 'BS234567', 1499.00, 30, TRUE, 'Electronics'),
('Laptop Stand', 'LS345678', 799.50, 20, TRUE, 'Accessories'),
('USB-C Hub', 'UC456789', 1299.99, 15, TRUE, 'Accessories'),
('Notebook', 'NB567890', 99.99, 100, TRUE, 'Stationery'),
('Pen Set', 'PS678901', 199.00, 200, TRUE, 'Stationery'),
('Coffee Mug', 'CM789012', 299.00, 75, TRUE, 'Home & Kitchen'),
('LED Desk Lamp', 'DL890123', 899.00, 40, TRUE, 'Home & Kitchen'),
('Yoga Mat', 'YM901234', 499.00, 25, TRUE, 'Fitness'),
('Water Bottle', 'WB012345', 349.00, 60, TRUE, 'Fitness');


-- Q1. Show the name and price of all products.
SELECT name, price FROM products;

-- Q2. Show all products where the category is 'Electronics'.
SELECT * FROM products WHERE category = 'Electronics';

-- Q3. Group products by category. Show each category once.
SELECT category FROM products GROUP BY category;

-- Q4. Show categories that have more than 1 product.
SELECT category, COUNT(*) FROM products
GROUP BY category
HAVING COUNT(*) > 1;

-- Q5. Show all products sorted by price in ascending order.
SELECT * FROM products ORDER BY price ASC;

-- Q6. Show only the first 3 products from the table.
SELECT * FROM products LIMIT 3;

-- Q7. Show product name as "Item\_Name" and price as "Item\_Price".
SELECT name AS Item_Name, price AS Item_Price FROM products;


-- Q8. Show all the unique categories from the products table.
SELECT DISTINCT category FROM products;

---

-- Q1. Display the name and price of the cheapest product in the entire table.
SELECT name, price FROM products
WHERE price = (SELECT MIN(price) FROM products);

-- Q2. Find the average price of products that belong to 'Home & Kitchen' or 'Fitness'.
SELECT category, ROUND(AVG(price),2) AS avg_price
FROM products
WHERE category IN ('Home & Kitchen', 'Fitness')
GROUP BY category;

--  Q3. Show product names and stock quantity where product is available, stock > 50, and price != 299.00
SELECT NAME, STOCK_QUANTITY FROM PRODUCTS
WHERE is_available = TRUE
AND STOCK_QUANTITY > 50
AND PRICE !=299.00;

-- Q4. Find the most expensive product in each category.
SELECT CATEGORY, MAX(PRICE) FROM PRODUCTS
GROUP BY CATEGORY

-- Q5. Show all unique categories in uppercase, sorted in descending order.
SELECT DISTINCT UPPER(CATEGORY) AS CAT_UPPER
FROM PRODUCTS
ORDER BY CAT_UPPER DESC;

--String Function

-- SUBSTRING / SUBSTR 
select NAME , SUBSTR(SKU_CODE, 1,2) FROM PRODUCTS;

-- LEFT
SELECT NAME, LEFT(SKU_CODE,3) FROM PRODUCTS;

--RIGHT
SELECT NAME, RIGHT(SKU_CODE,3) FROM PRODUCTS;

-- CONCAT
SELECT CONCAT(NAME,' ',CATEGORY) FROM PRODUCTS;
SELECT CONCAT(NAME,' ',CATEGORY,' ',SKU_CODE) FROM PRODUCTS;

-- CONCAT_WS (WITH SEPEARTOR)
SELECT CONCAT_WS(' ',NAME,CATEGORY,SKU_CODE) FROM PRODUCTS;

-- TRIM
SELECT TRIM('     SARVESH    ') FROM PRODUCTS;

-- REPLACE
select name, replace(sku_code,left(sku_code,2),'gg') from products;

-- CASES
SELECT NAME, PRICE,
CASE 
	WHEN (PRICE > 1000) THEN 'EXPENSIVE'
	WHEN (PRICE BETWEEN 500 AND 1000) THEN 'MODERATE'
	ELSE 'CHEAP'
END AS PRICE_TAG FROM PRODUCTS;

