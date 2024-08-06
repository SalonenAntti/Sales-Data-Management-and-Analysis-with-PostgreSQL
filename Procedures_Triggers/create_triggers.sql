-- =====================================
--  Trigger Function
-- =====================================

-- Trigger function for discounts
ALTER TABLE orders
ADD COLUMN discount DECIMAL(5, 2);

CREATE OR REPLACE FUNCTION applydiscount()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.totalamount > 1000 THEN
        NEW.discount = 0.10; -- 10% discount
    ELSE
        NEW.discount = 0;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER discounttrigger
BEFORE INSERT OR UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION applydiscount();
