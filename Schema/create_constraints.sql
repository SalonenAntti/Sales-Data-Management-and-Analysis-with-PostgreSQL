-- =====================================
--  Constraints
-- =====================================

-- Suppliers table
SELECT * FROM suppliers
ALTER TABLE suppliers
ADD CONSTRAINT unique_contactemail 
UNIQUE (contactemail);

ALTER TABLE suppliers
ADD CONSTRAINT unique_phone
UNIQUE (phone);

-- Orderitems table
SELECT * FROM orderitems
ALTER TABLE orderitems
ADD CONSTRAINT quantitynotzero
CHECK (quantity > 0);

ALTER TABLE orderitems
ADD CONSTRAINT unitpricenotzero
CHECK (unitprice > 0);

-- Payments table
SELECT * FROM payments
ALTER TABLE payments
ALTER COLUMN Transactionid SET NOT NULL;

-- Shipping table
SELECT * FROM shipping
ALTER TABLE shipping
ALTER COLUMN trackingnumber SET NOT NULL;

ALTER TABLE shipping
ADD CONSTRAINT shippingcostnotnegative
CHECK (shippingcost >= 0);
