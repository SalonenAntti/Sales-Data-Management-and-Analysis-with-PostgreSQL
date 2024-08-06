-- =====================================
--  Indexes
-- =====================================

-- Composite Indexes

CREATE INDEX indexorderscustomeridorderdatetotalamount ON orders(customerid, orderdate, totalamount);
CREATE INDEX indexreviewsproductidcustomeridrating ON reviews(productid, customerid, rating);
CREATE INDEX indexshippingorderidshippingcost ON shipping(orderid, shippingcost);

-- Unique Indexes

CREATE UNIQUE INDEX indexproductsproductname ON products(productname);
CREATE UNIQUE INDEX indexshippingtrackingnumber ON shipping(trackingnumber);

-- Full Text Index

ALTER TABLE reviews ADD COLUMN reviewtexttsvector tsvector;
UPDATE reviews SET reviewtexttsvector = to_tsvector('english', reviewtext);
CREATE INDEX indexreviewsreviewtext ON reviews USING GIN (reviewtext_tsvector);

-- Partial Index

CREATE INDEX indexorderstotalamountotal100 ON orders(totalamount) WHERE totalamount > 100;
CREATE INDEX indexshippingshippingcost10 ON shipping(shippingcost) WHERE shippingcost > 10;
