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

-- ANALYZING CUSTOMER BEHAVIOR 
-- Combine the menu_items and order_details table into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT * FROM menu_items AS A
LEFT JOIN order_details as B
ON A.menu_item_id = B.item_id;

-- What were the least and most ordered items?  What categories were they in?
SELECT item_name,category, COUNT(order_details_id) AS num_purchases
FROM menu_items AS A
LEFT JOIN order_details as B
ON A.menu_item_id = B.item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- What were the top 5 orders that spent most money?
SELECT order_id, item_name, SUM(price) AS money_spent
FROM menu_items AS A
LEFT JOIN order_details as B
ON A.menu_item_id = B.item_id
GROUP BY order_id, item_name
ORDER BY money_spent DESC
LIMIT 5;

-- View the details of the highest spend order. What insights can you gather from the results?
SELECT category, COUNT(item_id) as item_numbers
FROM menu_items AS A
LEFT JOIN order_details as B
ON A.menu_item_id = B.item_id
WHERE order_id = 1639
GROUP BY category;

-- The highest spend order bought a lot of Asian items, 

/* 1639	Korean Beef Bowl	53.85
2364	Meat Lasagna	53.85
740	Chicken Parmesan	53.85
3940	Eggplant Parmesan	50.85
4314	Eggplant Parmesan	50.85
*/

-- BONUS: View the details of the top 5 highest spend orders. What insights can you gather from the results
SELECT order_id, category, COUNT(item_id) as item_numbers
FROM menu_items AS A
LEFT JOIN order_details as B
ON A.menu_item_id = B.item_id
WHERE order_id IN (1639, 2364, 740, 3940, 4314)
GROUP BY order_id, category;
/* The top 5 highest spend orders ordered more of Italian food than all the other categories,
 this means means that the Italian food should remain on the menu list. 
 */
