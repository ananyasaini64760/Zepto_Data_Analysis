drop table if exists zepto_data;

create table zepto_data(
		sku_id SERIAL PRIMARY KEY,
		category VARCHAR(120),
		name VARCHAR(150) NOT NULL,
		mrp NUMERIC(8,2),
		discountPercent NUMERIC(5,2),
		availableQuantity INTEGER,
		discountedSellingPrice NUMERIC(8,2),
		weightInGms INTEGER,
		outOfStock BOOLEAN,
		quantity INTEGER
);

--data exploration

--count of rows

SELECT COUNT(*) FROM zepto_data;

--sample data


SELECT * FROM zepto_data
LIMIT 10;


-- null values

SELECT * FROM zepto_data
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--differnt product categories

SELECT DISTINCT category 
FROM zepto_data
ORDER BY category;

--products in stock vs out of stock

select outOfStock, COUNT(sku_id)
FROM zepto_data
GROUP BY outOfStock;

--product names present multiple times

SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto_data
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- data cleaning

--profucts with price == 0

SELECT * FROM zepto_data
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto_data 
WHERE mrp = 0;

--convert paise to rupees

UPDATE zepto_data
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM zepto_data;

-- Q1. Find the top 10 best-value products based on the discount percentage.

SELECT DISTINCT name, mrp, discountPercent
FROM zepto_data
ORDER BY discountPercent DESC
LIMIT 10;


-- Q2. What are the products with High MRP but out of stock.

SELECT DISTINCT name, mrp
FROM zepto_data
WHERE outOfStock = TRUE and mrp >= 300
ORDER BY mrp DESC;

-- Q3. Calculate Estimated Revenue for each category.

SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_data
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all the products where MRP is greater than Rs. 500 and discount is less than 10%.

SELECT DISTINCT name, mrp, discountPercent
FROM zepto_data
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average dicount percentage.

SELECT category,
ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_data
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
discountedSellingPrice/weightInGms AS price_per_gram
FROM zepto_data
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7. Group the products into categories like low, medium, bulk.

SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	 WHEN weightInGms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto_data;

-- Q8. What is the total inventory Weight Per Category.

SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_data
GROUP BY category
ORDER BY total_weight;
