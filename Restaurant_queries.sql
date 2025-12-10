-- menu items
-- 1. View the menu_items table.
SELECT * FROM menu_items;

-- 2. Find the number of items on the menu.
SELECT COUNT(*)
FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
SELECT * FROM menu_items
ORDER BY price; 

SELECT * FROM menu_items
ORDER BY price DESC; 

-- 4. How many Italian dishes are on the menu?
 SELECT COUNT(category) FROM menu_items
 WHERE category = 'Italian';
 
-- 5. What are the least and most expensive Italian dishes on the menu?
SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY PRICE;

SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY PRICE DESC;

-- 6. How many dishes are in each category?
SELECT category, COUNT(menu_item_id) as number_of_dishes
FROM menu_items
GROUP BY category;

-- 7. What is the average dish price within each category?
SELECT category, AVG(price) as average_price
FROM menu_items
GROUP BY category;


-- order_details table
-- 1. View the order_details table.
	SELECT * FROM order_details;
    
-- 2. What is the date range of the table?
SELECT order_date FROM order_details
ORDER BY order_date;

SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 3. How many orders were made within this date range?
   SELECT COUNT(distinct order_id) FROM order_details;
   
-- 4. How many items were ordered within this date range?
   SELECT COUNT(*) FROM order_details;
   
-- 5. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) as number_of_items
FROM order_details
GROUP BY order_id
ORDER BY number_of_itemS DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT order_id, COUNT(item_id) as number_of_items
FROM order_details
GROUP BY order_id
HAVING number_of_items > 12) AS number_orders;

