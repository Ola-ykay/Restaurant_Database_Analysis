# Restaurant Menu and Order Data Analysis (MySQL)

### Overview
This project contains a set of MySQL queries aimed at analyzing restaurant menu information and customer order activity. It emphasizes transforming raw transactional data into meaningful insights, including identifying best-selling items, understanding ordering habits, tracking revenue patterns, and evaluating overall operational performance.

### Features
- Menu Analysis
- Order Details Analysis
- Customer Behaviour Insights

### Queries  

### 1. View the menu_items table.  
```sql
SELECT * FROM menu_items;
```
### 2.  Find the number of items on the menu.
```sql
SELECT COUNT(*)
FROM menu_items;
```
### 3. What are the least and most expensive items on the menu?
```sql
SELECT * FROM menu_items
ORDER BY price;

SELECT * FROM menu_items
ORDER BY price DESC; 
```
