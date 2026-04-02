-- Create all of the tables 
CREATE TABLE stores (
store_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
store_number SMALLINT UNSIGNED NOT NULL, 
store_street_address VARCHAR(30) NOT NULL, 
store_city VARCHAR(15) NOT NULL,
store_state CHAR(2) NOT NULL, 
store_zip VARCHAR(5) NOT NULL, 
store_tax_rate DECIMAL(4,2) NOT NULL, 
UNIQUE (store_number)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE products (
product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(10) NOT NULL, 
product_price DECIMAL(5,2) NOT NULL,
UNIQUE (product_name)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE colors (
color_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
color_name VARCHAR(10) NOT NULL,
UNIQUE (color_name)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE sizes (
size_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
size_name CHAR(3) NOT NULL,
UNIQUE (size_name)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE skus (
sku_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
product_id INT UNSIGNED NOT NULL, 
color_id INT UNSIGNED NOT NULL, 
size_id INT UNSIGNED NOT NULL, 
UNIQUE (product_id, color_id, size_id)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE employees (
employee_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
hr_employee_number VARCHAR(10) NOT NULL, 
store_id INT UNSIGNED NOT NULL, 
employee_fname VARCHAR(15) NOT NULL, 
employee_lname VARCHAR(30) NOT NULL, 
employee_email VARCHAR(75) NOT NULL,
employee_street_address VARCHAR(45) NOT NULL, 
employee_city VARCHAR(20) NOT NULL, 
employee_state CHAR(2) NOT NULL, 
employee_zip VARCHAR(5) NOT NULL, 
hire_date DATE NOT NULL, 
UNIQUE (hr_employee_number),
UNIQUE (employee_email)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE transactions (
transaction_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
store_id INT UNSIGNED NOT NULL, 
employee_id INT UNSIGNED NOT NULL, 
transaction_datetime DATETIME NOT NULL,
subtotal DECIMAL(6,2) NULL,
tax DECIMAL(5,2) NULL,
grand_total DECIMAL(6,2) NULL,
KEY (transaction_datetime)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE inventory (
sku_id INT UNSIGNED NOT NULL,
qty_on_hand SMALLINT UNSIGNED NOT NULL,
store_id INT UNSIGNED NOT NULL,
UNIQUE (store_id, sku_id)
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE transaction_items (
transaction_item_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
transaction_id INT UNSIGNED NOT NULL, 
sku_id INT UNSIGNED NOT NULL, 
qty TINYINT NOT NULL, 
unit_price DECIMAL(5,2) NULL,
line_total DECIMAL(6,2) NULL
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE events_sessions (
events_session_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
sname VARCHAR(15),
stime DATETIME
) engine=InnoDB CHARSET utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Add foreign keys to the tables 
ALTER TABLE skus
	ADD FOREIGN KEY (product_id)
	REFERENCES products(product_id);
	
ALTER TABLE skus
	ADD FOREIGN KEY (color_id)
	REFERENCES colors(color_id);
	
ALTER TABLE skus
	ADD FOREIGN KEY (size_id)
	REFERENCES sizes(size_id);
	
ALTER TABLE employees
	ADD FOREIGN KEY (store_id)
	REFERENCES stores(store_id);
	
ALTER TABLE transactions
	ADD FOREIGN KEY(store_id)
	REFERENCES stores(store_id);
	
ALTER TABLE transactions
	ADD FOREIGN KEY(employee_id)
	REFERENCES employees(employee_id);
	
ALTER TABLE inventory
	ADD FOREIGN KEY(sku_id)
	REFERENCES skus(sku_id);
	
ALTER TABLE inventory
	ADD FOREIGN KEY(store_id)
	REFERENCES stores(store_id);
	
ALTER TABLE transaction_items
	ADD FOREIGN KEY(transaction_id)
	REFERENCES transactions(transaction_id);
	
ALTER TABLE transaction_items
	ADD FOREIGN KEY(sku_id)
	REFERENCES skus(sku_id);
	
-- PLEASE READ: I know that functions go in the routines.sql file, but the below 
-- function is needed for the set_new_line_total trigger to run properly. 
-- Please count this as one of my functions. Thank you. 
-- Create a funtion to calculate the line_total

DELIMITER $
CREATE FUNCTION calc_line_total(item_qty TINYINT, item_unit_price DECIMAL (5,2))
RETURNS DECIMAL (6,2)
DETERMINISTIC
BEGIN
	RETURN item_qty*item_unit_price;
END $
DELIMITER ;

-- Create BEFORE INSERT trigger on transaction_items table called set_new_line_total
-- This trigger will look up the price of the product_price from the products table to create the unit_price
-- and then it will SET the NEW.line_total using the calc_line_total function (qty*unit_price)

DELIMITER $
CREATE TRIGGER set_new_line_total BEFORE INSERT ON transaction_items
FOR EACH ROW
BEGIN
    DECLARE look_up_price DECIMAL(5,2);
    
    IF NEW.unit_price IS NULL THEN
        SELECT p.product_price
        INTO look_up_price
        FROM skus s
        JOIN products p ON (p.product_id = s.product_id)
        WHERE s.sku_id = NEW.sku_id;
        
        SET NEW.unit_price = look_up_price;
    END IF;
    
    SET NEW.line_total = calc_line_total(NEW.qty, NEW.unit_price);
END $
DELIMITER ;

-- Create AFTER INSERT trigger for transaction_items table called update_transaction_totals
-- Create two variables called old_subtotal and new_subtotal, then select the current subtotal for the NEW.transaction_id, 
-- then create an if/then for if the subtotal is null then set it to NEW.line_total but is it's not null (this will happen if
-- multiple items are sold within the same transaction) then add the NEW.line_total to the subtotal to get a running total,
-- then set the subtotal, tax, and grand_total in the transactions table to their new values

DELIMITER $
CREATE TRIGGER update_transaction_totals AFTER INSERT ON transaction_items
FOR EACH ROW
BEGIN
    DECLARE old_subtotal DECIMAL(6,2);
    DECLARE new_subtotal DECIMAL(6,2);
    
    SELECT t.subtotal
    INTO old_subtotal
    FROM transactions t
    WHERE t.transaction_id = NEW.transaction_id;
    
    IF old_subtotal IS NULL THEN
        SET new_subtotal = NEW.line_total;
    ELSE
        SET new_subtotal = old_subtotal + NEW.line_total;
    END IF;
    
    UPDATE transactions t
    JOIN stores s on s.store_id = t.store_id
    SET
        t.subtotal = new_subtotal,
        t.tax = new_subtotal*(s.store_tax_rate/100),
        t.grand_total = new_subtotal + t.tax
    WHERE t.transaction_id = NEW.transaction_id;
END $
DELIMITER ;



