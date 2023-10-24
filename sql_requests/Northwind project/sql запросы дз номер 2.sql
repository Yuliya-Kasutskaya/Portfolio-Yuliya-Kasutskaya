SELECT *
FROM orders
WHERE ship_country LIKE 'U%'


SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'N%'
ORDER BY freight DESC
LIMIT 10


SELECT last_name, first_name, home_phone, region
FROM employees
WHERE region IS NULL

SELECT COUNT(first_name)
FROM employees
WHERE region IS NULL


SELECT *
FROM orders

--5

SELECT country, COUNT(country)
FROM suppliers
GROUP BY country
ORDER BY count DESC

--6

SELECT ship_country, SUM(freight) 
FROM orders
WHERE ship_region IS NOT NULL 
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY sum DESC


--7
SELECT ship_country
FROM orders
UNION
SELECT country
FROM suppliers
ORDER BY ship_country

--8

SELECT ship_country
FROM orders
INTERSECT
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees

--9

SELECT ship_country
FROM orders
INTERSECT
SELECT country
FROM suppliers
EXCEPT
SELECT country
FROM employees

