--1

SELECT CONCAT(last_name, ' ', first_name), customers.company_name
FROM orders
INNER JOIN customers USING(customer_id)
INNER JOIN employees USING(employee_id)
INNER JOIN shippers on shippers.shipper_id = orders.ship_via
WHERE employees.city = 'London' AND customers.city = 'London' AND shippers.company_name = 'Speedy Express'


--2
SELECT products.product_name, products.units_in_stock, suppliers.contact_name, suppliers.phone
FROM products
INNER JOIN categories USING (category_id)
INNER JOIN suppliers USING (supplier_id)
WHERE category_name IN('Beverages', 'Seafood') AND products.units_in_stock < 20 AND discontinued = 0
ORDER BY units_in_stock

--3

SELECT customers.contact_name, orders.order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL


--4
SELECT customers.contact_name, orders.order_id
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL