SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < ANY 
			(SELECT AVG (quantity)
			FROM order_details
			GROUP BY product_id
			ORDER BY AVG (quantity)
			 LIMIT 1)
ORDER BY units_in_stock DESC

-- 3 Напишите запрос, который выводит 3 заказа с наибольшей стоимостью, 
которые были созданы после 1 сентября 1997 года включительно и были доставлены в страны Южной Америки. 
Общая стоимость рассчитывается как сумма стоимости деталей заказа с учетом дисконта. 
Результирующая таблица должна иметь колонки customer_id, 
ship_country и order_price, строки которой должны быть отсортированы по стоимости заказа в обратном порядке.

SELECT *
FROM orders

--3
SELECT orders.customer_id, orders.ship_country, order_price
FROM orders
INNER JOIN 
	(SELECT SUM (unit_price * quantity - (unit_price * quantity * discount)) AS order_price, order_id
	FROM order_details
	GROUP BY order_id
	ORDER BY order_price DESC
	) AS od
USING (order_id)
WHERE order_date >= '1997.09.01'  
ORDER BY order_price DESC
LIMIT 3


Вывести все товары (уникальные названия продуктов), 
которых заказано ровно 10 единиц (конечно же, это можно решить и без подзапроса).

--4
SELECT DISTINCT products.product_name, order_details.quantity
FROM order_details
JOIN products
USING (product_id)
WHERE order_details.quantity = '10'
