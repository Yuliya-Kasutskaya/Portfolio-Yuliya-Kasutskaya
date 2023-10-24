#1. Select all order records in which the shipping country name begins with 'U'.
  
SELECT *
FROM orders
WHERE ship_country LIKE 'U%'

#2. Select order records (include order ID, customer ID, weight, and shipping country columns) that should be shipped to countries whose name begins with 'N', 
sort by weight (descending) and display only the first 10 records.
  
SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'N%'
ORDER BY freight DESC
LIMIT 10

#3. Select employee records (include columns first name, last name, telephone, region) in which the region is unknown.
  
SELECT last_name, first_name, home_phone, region
FROM employees
WHERE region IS NULL

#4. Count the number of customers whose region is known.
  
SELECT COUNT(first_name)
FROM employees
WHERE region IS NULL

#5. Count the number of suppliers in each country and sort the grouping results in descending order of number.

SELECT country, COUNT(country)
FROM suppliers
GROUP BY country
ORDER BY count DESC

#6. Calculate the total weight of orders (in which the region is known) by country, then filter by total weight
(display only those records where the total weight is more than 2750) and sort in descending order of the total weight.

SELECT ship_country, SUM(freight) 
FROM orders
WHERE ship_region IS NOT NULL 
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY sum DESC

#7. Select all unique countries of customers and suppliers and sort countries in ascending order.

SELECT ship_country
FROM orders
UNION
SELECT country
FROM suppliers
ORDER BY ship_country

#8. Select countries in which customers, suppliers, and employees are “registered” at the same time.

SELECT ship_country
FROM orders
INTERSECT
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees

#9. Select countries in which both customers and suppliers are “registered”, but employees are not “registered” in them.

SELECT ship_country
FROM orders
INTERSECT
SELECT country
FROM suppliers
EXCEPT
SELECT country
FROM employees
