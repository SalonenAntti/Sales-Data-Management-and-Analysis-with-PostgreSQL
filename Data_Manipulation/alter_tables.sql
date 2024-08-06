

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;






SELECT * FROM orderitems
UPDATE orderitems
SET unitprice = p.price
FROM products p
WHERE orderitems.productid = p.productid


SELECT * FROM orders
UPDATE orders
SET totalamount = subquery.total
FROM (
SELECT orderid, SUM(quantity * unitprice) AS total
FROM orderitems
GROUP BY orderid
) AS subquery
WHERE orders.orderid = subquery.orderid;








SELECT * FROM shipping
SELECT shippingid, orderid, shippingcost FROM shipping WHERE shippingcost > 15;
UPDATE shipping
SET shippingcost = 22.50
WHERE shippingid = 154


Select * FROM products
SELECT * FROM products WHERE productname = 'Milk';
UPDATE products
SET description = '1 liter of fat free milk'
WHERE productid = 1;


SELECT * FROM suppalliers
DELETE FROM suppliers
WHERE supplierid = 9;

UPDATE suppliers
SET supplierid = 9
WHERE supplierid = 10;


