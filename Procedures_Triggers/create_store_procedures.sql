-- =====================================
--  Stored Procedures
-- =====================================

-- Customerid, Total Sales, AVG Sales
CREATE OR REPLACE FUNCTION SumandAvgsalesEA(cust_id INT)
RETURNS TABLE(customerid INT, Totalsales NUMERIC, Avgsales NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT o.customerid, 
           SUM(o.totalamount) AS Totalsales, 
           AVG(o.totalamount) AS Avgsales
    FROM orders o
    WHERE o.customerid
 = cust_id 
    GROUP BY o.customerid;
END;
$$ LANGUAGE plpgsql;

-- Run the stored procedure, value within parentheses is changable, represents customerid.
SELECT * FROM SumandAvgsalesEA(14);


-- All sales within queried month
CREATE OR REPLACE FUNCTION MonthlySales(report_month DATE)
RETURNS TABLE(customerid INT, Totalsales NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT o.customerid,
           SUM(o.totalamount) AS Totalsales
    FROM orders o
    WHERE DATE_TRUNC('month', o.orderdate) = DATE_TRUNC('month', report_month)
    GROUP BY o.customerid;
END;
$$ LANGUAGE plpgsql;

-- Run the stored procedure, value within parentheses is changable, represents month.
SELECT * FROM MonthlySales('2024-08-01');
