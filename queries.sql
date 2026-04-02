-- 1. Aggregate GROUP BY query. Average Transaction Value (ATV) per STORE
SELECT 
    t.store_id,
    s.store_number,
    s.store_city,
    AVG(t.grand_total) AS ATV
FROM transactions t
JOIN stores s ON s.store_id = t.store_id
GROUP BY 
    t.store_id,
    store_number,
    s.store_city
ORDER BY
    ATV DESC;

-- 2. Query to see the top selling product for all stores
CALL gettopsellersbydate('2025-12-14','2025-12-20');

-- 3. Query to select the top sellers by store id and DATE
-- The example of this query can also be found in my 
-- gettopsellersbystoreidanddate procedure.
-- Procedure USES THE MAJORITY OF THE TABLES IN THE FROM LINE. See routines.sql
-- Store_id 1
CALL gettopsellersbystoreidanddate(1,'2025-12-14','2025-12-20');

-- Store_id 2
CALL gettopsellersbystoreidanddate(2,'2025-12-14','2025-12-20');

--Store_id 3
CALL gettopsellersbystoreidanddate(3,'2025-12-14','2025-12-20');

-- 4. Query from the employee_total_sales VIEW
-- Query total sales by employee per certain time period
SELECT
    employee_id,
    employee_fname,
    employee_lname,
    store_id,
    SUM(grand_total) AS total_sales
FROM employee_total_sales
WHERE transaction_datetime BETWEEN '2025-12-14 00:00:00' AND '2025-12-20 23:59:59'
GROUP BY
    employee_id,
    employee_fname,
    employee_lname,
    store_id
ORDER BY total_sales DESC;

-- 5. Query from the store_total_sales VIEW
-- Query total sales by store per certain time period
SELECT 
    store_id,
    store_city,
    SUM(grand_total) AS total_sales
FROM store_total_sales
WHERE transaction_datetime BETWEEN '2025-12-14 00:00:00' AND '2025-12-20 23:59:59'
GROUP BY 
    store_id,
    store_city
ORDER BY total_sales DESC;

-- 6. Subquery Example: Query to find all transaction items that sold the product_name 'Shirt'
SELECT
    t.transaction_datetime,
    t.store_id,
    t.employee_id,
    ti.transaction_id,
    ti.sku_id,
    ti.qty,
    ti.line_total
FROM transaction_items ti
JOIN transactions t ON t.transaction_id = ti.transaction_id
JOIN skus s ON s.sku_id = ti.sku_id
JOIN products p ON p.product_id = s.product_id
WHERE p.product_id = getprodid('Shirt')
ORDER BY 
    t.transaction_datetime;

-- Example 1 of UPDATE. Employee got married and needs to update their last name and email
UPDATE employees
SET 
employee_lname = 'Cook', 
employee_email = 'Claire.Cook@retail.com'
WHERE hr_employee_number = '2403333871';

-- Example 2 of UPDATE. Store changes address but still within the same city. Street address update only.
UPDATE stores
SET
store_street_address = '3333 W. West Road'
WHERE store_number = 30224;

-- Example 1 of Delete. An employee never made a sale so she was fired
-- and must be removed from the employees table. 
DELETE FROM employees
WHERE hr_employee_number = '2401231234';

-- Example 2 of Delete. 
DELETE FROM events_sessions
WHERE sname = 'annb';


