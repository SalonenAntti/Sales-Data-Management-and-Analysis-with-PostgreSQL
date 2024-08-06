-- =====================================
--  Joins
-- =====================================

-- Join table with customer and order information. 
SELECT c.customerid, c.firstname, c.lastname, c.email, o.orderdate, o.totalamount
FROM customers AS C
FULL OUTER JOIN orders AS o
ON c.customerid = o.customerid;

-- Join table to identify paid and unpaid orders with each customerid.
SELECT o.orderid, o.customerid, o.totalamount, p.paymentdate, p.transactionid
FROM orders AS o
FULL OUTER JOIN payments AS p
ON o.orderid = p.orderid
ORDER BY p.transactionid DESC;
