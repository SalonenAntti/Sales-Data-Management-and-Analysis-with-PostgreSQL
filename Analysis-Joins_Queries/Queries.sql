-- =====================================
--  Queries, Subqueries, Advanced Queries, Window Functions
-- =====================================

-- SALES

-- Total Sales and AVG order amount
SELECT SUM(totalamount) AS totalsales FROM orders;
SELECT AVG(totalamount) AS averageorder FROM orders;

-- Total orderamount
SELECT COUNT(orderid) AS orderamount FROM orders;

-- Monthly sales with comparison columns
SELECT
    order_month,
    SUM(totalamount) AS current_month_sales,
    LAG(SUM(totalamount)) OVER (ORDER BY order_month) AS previous_month_sales,
    SUM(totalamount) - LAG(SUM(totalamount)) OVER (ORDER BY order_month) AS month_over_month_change
FROM
    (SELECT DATE_TRUNC('month', orderdate) AS order_month, totalamount FROM orders) AS monthly_sales
GROUP BY
    order_month
ORDER BY
    order_month;


-- CUSTOMERS

-- Customer information, total spend, avg order.
SELECT 
    c.customerid, 
    c.firstname, 
    c.lastname,
    SUM(o.totalamount) AS TotalSpent,
    AVG(o.totalamount) AS AvgOrderAmount
FROM 
    customers c
LEFT JOIN 
    orders o 
ON 
    c.customerid = o.customerid
GROUP BY 
    c.customerid, 
    c.firstname, 
    c.lastname
ORDER BY 
    TotalSpent DESC;

-- Times ordered by each customer
SELECT customerid, firstname, lastname,
(SELECT COUNT(orderid) FROM orders o WHERE c.customerid = o.customerid) AS Timesordered
FROM customers c ORDER BY Timesordered DESC;

-- Key Accounts
SELECT customerid, firstname, lastname,
(SELECT COUNT(orderid) FROM orders o WHERE c.customerid = o.customerid) AS Timesordered
FROM customers c ORDER BY Timesordered DESC;


-- PRODUCTS

-- Most sold products by quantity
SELECT productid, productname, description, price,
(SELECT sum(quantity) FROM orderitems o WHERE p.productid = o.productid) AS SoldQuantity
FROM products p ORDER BY SoldQuantity DESC;

-- AVG rating for each product
SELECT productid, productname, description,
(SELECT AVG(RATING) FROM reviews r WHERE p.productid = r.productid) AS Averagerating
FROM products p ORDER BY Averagerating DESC;


-- SHIPPING

-- Most popular shipping method
SELECT shippingmethod, COUNT(SHIPPINGMETHOD) AS Mostpreferredshipping
FROM SHIPPING
GROUP BY shippingmethod
ORDER BY Mostpreferredshipping DESC;













