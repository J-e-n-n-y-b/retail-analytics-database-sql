-- A view for a manager to see total sales per employee
CREATE ALGORITHM = TEMPTABLE VIEW employee_total_sales AS
SELECT
    e.employee_id,
    e.employee_fname,
    e.employee_lname,
    t.store_id,
    t.transaction_datetime,
    t.grand_total
FROM employees e
JOIN transactions t ON t.employee_id = e.employee_id;

-- A view for a district manager to see total sales per store 
CREATE ALGORITHM = TEMPTABLE VIEW store_total_sales AS
SELECT
    s.store_id,
    s.store_city,
    t.transaction_datetime,
    t.grand_total
FROM stores s
JOIN transactions t ON t.store_id = s.store_id;
