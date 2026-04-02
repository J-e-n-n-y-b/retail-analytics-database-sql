-- A helper function to get the product_id from the product_name

DELIMITER $
CREATE FUNCTION getprodid(pname VARCHAR(10))
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
    SET @prodid_result = 0;
    
    SELECT product_id INTO @prodid_result
    FROM products
    WHERE product_name = pname;
    
    RETURN @prodid_result;
END $
DELIMITER ;

-- A helper function to get the product name from the product_id

DELIMITER $
CREATE FUNCTION getprodname(pid INT)
RETURNS VARCHAR(10)
READS SQL DATA
BEGIN
    SET @prod_result = '';
    
    SELECT product_name INTO @prod_result
    FROM products
    WHERE product_id = pid;
    
    RETURN @prod_result;
END $
DELIMITER ;

-- A helper function to get the color name from color_id

DELIMITER $
CREATE FUNCTION getcolorname(cid INT)
RETURNS VARCHAR(10)
READS SQL DATA
BEGIN
    SET @color_result = '';
    
    SELECT color_name INTO @color_result
    FROM colors
    WHERE color_id = cid;
    
    RETURN @color_result;
END $
DELIMITER ;

-- A helper function to get the size name from size_id

DELIMITER $
CREATE FUNCTION getsizename(sid INT)
RETURNS CHAR(3)
READS SQL DATA
BEGIN
    SET @size_result = '';
    
    SELECT size_name INTO @size_result
    FROM sizes
    WHERE size_id = sid;
    
    RETURN @size_result;
END $
DELIMITER ;

-- Procedure to get_sku_description which is the full product_name,
-- color_name, and size_name based off the sku_id

DELIMITER $
CREATE PROCEDURE getskudescription(skuid INT)
BEGIN
    IF skuid>0 THEN
        SELECT
            s.sku_id,
            getprodname(s.product_id) AS product_name,
            getcolorname(s.color_id) AS color_name,
            getsizename(s.size_id) AS size_name
        FROM skus s
        WHERE s.sku_id = skuid;
    END IF;
END $
DELIMITER ;

-- Procedure to get the top seller between two dates
-- USES THE MAJORITY of the tables in the FROM line

DELIMITER $
CREATE PROCEDURE gettopsellersbydate(startdate DATE, enddate DATE)
BEGIN
    IF startdate IS NOT NULL
        AND enddate IS NOT NULL THEN
        
        SELECT 
            s.sku_id,
            p.product_name,
            c.color_name,
            z.size_name,
            SUM(ti.qty) AS total_units,
            SUM(ti.line_total) AS total_revenue
        FROM transactions t
        JOIN transaction_items ti ON ti.transaction_id = t.transaction_id
        JOIN skus s ON s.sku_id = ti.sku_id
        JOIN products p ON p.product_id = s.product_id
        JOIN colors c ON c.color_id = s.color_id
        JOIN sizes z ON z.size_id = s.size_id
        WHERE DATE(t.transaction_datetime) >= startdate
        AND DATE (t.transaction_datetime) <= enddate
        GROUP BY 
            s.sku_id,
            p.product_name,
            c.color_name,
            z.size_name
        ORDER BY total_units DESC;
    END IF;
END $
DELIMITER ;
            
-- Procedure to get the top seller for each store
-- USES THE MAJORITY of the tables in the FROM line

DELIMITER $
CREATE PROCEDURE gettopsellersbystoreid(storeid INT)
BEGIN
    IF storeid >0 THEN
        
        SELECT 
            s.sku_id,
            p.product_name,
            c.color_name,
            z.size_name,
            SUM(ti.qty) AS total_units,
            SUM(ti.line_total) AS total_revenue
        FROM transactions t
        JOIN transaction_items ti ON ti.transaction_id = t.transaction_id
        JOIN skus s ON s.sku_id = ti.sku_id
        JOIN products p ON p.product_id = s.product_id
        JOIN colors c ON c.color_id = s.color_id
        JOIN sizes z ON z.size_id = s.size_id
        WHERE t.store_id = storeid
        GROUP BY 
            s.sku_id,
            p.product_name,
            c.color_name,
            z.size_name
        ORDER BY total_units DESC;
    END IF;
END $
DELIMITER ;         

-- Procedure to get the top seller for each store
-- USES THE MAJORITY of the tables in the FROM line

DELIMITER $
CREATE PROCEDURE gettopsellersbystoreidanddate(storeid INT, startdate DATE, enddate DATE)
BEGIN
    IF storeid>0
    AND startdate IS NOT NULL
    AND enddate IS NOT NULL THEN
        SELECT
            s.sku_id,
            p.product_name,
            c.color_name,
            z.size_name,
            SUM(ti.qty) AS total_units,
            SUM(ti.line_total) AS total_revenue
        FROM transactions t
        JOIN transaction_items ti ON ti.transaction_id = t.transaction_id
        JOIN skus s ON s.sku_id = ti.sku_id
        JOIN products p ON p.product_id = s.product_id
        JOIN colors c ON c.color_id = s.color_id
        JOIN sizes z ON z.size_id = s.size_id
        WHERE t.store_id = storeid
            AND DATE(t.transaction_datetime) >= startdate
            AND DATE(t.transaction_datetime) <= enddate
        GROUP BY
            s.sku_id,
            p.product_name,
            c.color_name,
            z.size_name
        ORDER BY total_units DESC;
    END IF;
END $
DELIMITER ;