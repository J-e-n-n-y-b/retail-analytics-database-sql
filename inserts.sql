INSERT INTO stores (store_number,store_street_address,store_city,store_state,store_zip,store_tax_rate)
VALUES
(10204, '1234 N. North Street', 'Mesa', 'AZ', '85204', 8.30),
(20250, '2222 S. South Drive', 'Scottsdale', 'AZ', '85250', 8.00),
(30224, '3434 E. East Lane', 'Chandler', 'AZ', '85224', 7.80);

INSERT INTO employees (hr_employee_number,store_id,employee_fname,employee_lname,employee_email,employee_street_address,employee_city,employee_state,employee_zip,hire_date)
VALUES
('4801111796', 1, 'Allison', 'Adams', 'Allison.Adams@retail.com', '1111 N. First Street', 'Mesa', 'AZ', '85214', '2020-01-01'),
('2302222648', 1, 'Brianna', 'Brooks', 'Brianna.Brooks@retail.com', '2222 E. Second Avenue', 'Tempe', 'AZ', '85281', '2023-02-02'),
('2403333871', 1, 'Claire', 'Charles', 'Claire.Charles@retail.com', '3333 S. Third Lane', 'Mesa', 'AZ', '85212', '2024-03-03'),
('2404444638', 1, 'Diana', 'Davidson', 'Diana.Davidson@retail.com', '4444 W. Fourth Circle', 'Tempe', 'AZ', '85282', '2024-04-04'),
('4805555127', 2, 'Evelyn', 'Evermore', 'Evelyn.Evermore@retail.com', '5555 N. Fifth Street', 'Scottsdale', 'AZ', '85251', '2019-05-05'),
('2306666879', 2, 'Felix', 'Foxcroft', 'Felix.Foxcroft@retail.com', '6666 E. Sixth Blvd', 'Scottsdale', 'AZ', '85250', '2023-06-06'),
('2407777323', 2, 'Gus', 'Garrison', 'Gus.Garrison@retail.com', '7777 S. Seventh Avenue', 'Paradise Valley', 'AZ', '85253', '2024-07-07'),
('2408888474', 2, 'Helga', 'Hogen', 'Helga.Hogen@retail.com', '8888 W. Eigth Way', 'Scottsdale', 'AZ', '85257', '2024-08-08'),
('4809999346', 3, 'Isabelle', 'Ivy', 'Isabelle.Ivy@retail.com', '9999 N. Ninth Blvd', 'Chandler', 'AZ', '85224', '2021-09-09'),
('2301010333', 3, 'Jennifer', 'Johnson', 'Jennifer.Johnson@retail.com', '1010 E. Tenth Place', 'Ahwatukee', 'AZ', '85044', '2023-10-10'),
('2401100363', 3, 'Kagome', 'Kitsune', 'Kagome.Kitsune@retail.com', '1100 S. Eleventh Way', 'Chandler', 'AZ', '85226', '2024-11-11'),
('2401200474', 3, 'Laila', 'Long', 'Laila.Long@retail.com', '1200 W. Twelfth Court', 'Chandler', 'AZ', '85224', '2024-12-12'),
('2401231234', 3, 'Maddie', 'Myers', 'Maddie.Myers@retail.com', '1300 N. Thirteenth Dead End Drive', 'Chandler', 'AZ','85224', '2024-12-13');

INSERT INTO products (product_name,product_price)
VALUES
('Shirt',30.00),
('Jean',75.00),
('Dress',55.00);

INSERT INTO colors (color_name)
VALUES
('White'),
('Blue'),
('Black');

INSERT INTO sizes (size_name)
VALUES
('S'),
('M'),
('L'),
('XL');

INSERT INTO skus (product_id,color_id,size_id)
VALUES
(1,1,1),
(1,1,2),
(1,1,3),
(1,1,4),
(1,2,1),
(1,2,2),
(1,2,3),
(1,2,4),
(1,3,1),
(1,3,2),
(1,3,3),
(1,3,4),
(2,1,1),
(2,1,2),
(2,1,3),
(2,1,4),
(2,2,1),
(2,2,2),
(2,2,3),
(2,2,4),
(2,3,1),
(2,3,2),
(2,3,3),
(2,3,4),
(3,1,1),
(3,1,2),
(3,1,3),
(3,1,4),
(3,2,1),
(3,2,2),
(3,2,3),
(3,2,4),
(3,3,1),
(3,3,2),
(3,3,3),
(3,3,4);

INSERT INTO inventory (sku_id,qty_on_hand,store_id)
VALUES
(1,12,1),
(2,20,1),
(3,20,1),
(4,12,1),
(5,12,1),
(6,20,1),
(7,20,1),
(8,12,1),
(9,12,1),
(10,20,1),
(11,20,1),
(12,12,1),
(13,10,1),
(14,18,1),
(15,18,1),
(16,10,1),
(17,10,1),
(18,18,1),
(19,18,1),
(20,10,1),
(21,10,1),
(22,18,1),
(23,18,1),
(24,10,1),
(25,8,1),
(26,14,1),
(27,14,1),
(28,8,1),
(29,8,1),
(30,14,1),
(31,14,1),
(32,8,1),
(33,8,1),
(34,14,1),
(35,14,1),
(36,8,1),
(1,17,2),
(2,25,2),
(3,25,2),
(4,17,2),
(5,17,2),
(6,25,2),
(7,25,2),
(8,17,2),
(9,17,2),
(10,25,2),
(11,25,2),
(12,17,2),
(13,15,2),
(14,23,2),
(15,23,2),
(16,15,2),
(17,15,2),
(18,23,2),
(19,23,2),
(20,15,2),
(21,15,2),
(22,23,2),
(23,23,2),
(24,15,2),
(25,13,2),
(26,19,2),
(27,19,2),
(28,13,2),
(29,13,2),
(30,19,2),
(31,19,2),
(32,13,2),
(33,13,2),
(34,19,2),
(35,19,2),
(36,13,2),
(1,14,3),
(2,22,3),
(3,22,3),
(4,14,3),
(5,14,3),
(6,22,3),
(7,22,3),
(8,14,3),
(9,14,3),
(10,22,3),
(11,22,3),
(12,14,3),
(13,12,3),
(14,20,3),
(15,20,3),
(16,12,3),
(17,12,3),
(18,20,3),
(19,20,3),
(20,12,3),
(21,12,3),
(22,20,3),
(23,20,3),
(24,12,3),
(25,10,3),
(26,16,3),
(27,16,3),
(28,10,3),
(29,10,3),
(30,16,3),
(31,16,3),
(32,10,3),
(33,10,3),
(34,16,3),
(35,16,3),
(36,10,3);

-- Inserting a new transaction and passing the transaction_id to the transaction_items table
-- Make sure to keep this insert, set, insert block all together to get the full 
-- transaction cycle.  
-- Transaction 1
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (1,1,'2025-12-14 14:30:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id, 1, 2);

-- Transaction 2
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (1,1,'2025-12-16 16:30:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,25,2);

-- Transaction 3
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (1,2,'2025-12-17 17:30:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,16,1);

-- Transaction 4
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (1,3,'2025-12-19 19:30:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,9,1),
(@tran_id,17,1),
(@tran_id,33,1);

-- Transaction 5
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (1,4,'2025-12-20 20:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,6,1);

-- Transaction 6
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (2,5,'2025-12-15 15:30:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,25,1),
(@tran_id,29,1);

-- Transaction 7
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (2,5,'2025-12-16 16:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,2,2);

-- Transaction 8
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (2,6,'2025-12-17 17:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,9,1);

-- Transaction 9
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (2,7,'2025-12-19 19:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,22,1);

-- Transaction 10
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (2,8,'2025-12-20 20:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,1,1),
(@tran_id,5,1),
(@tran_id,9,1),
(@tran_id,17,1);

-- Transaction 11
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (3,9,'2025-12-14 14:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,12,1);

-- Transaction 12
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (3,9,'2025-12-15 15:00:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,23,1);

-- Transaction 13
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (3,10,'2025-12-17 17:15:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,3,1),
(@tran_id,11,1),
(@tran_id,24,1),
(@tran_id,28,1),
(@tran_id,36,1);

-- Transaction 14
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (3,11,'2025-12-19 19:15:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,10,1);

-- Transaction 15
INSERT INTO transactions(store_id, employee_id, transaction_datetime)
VALUES (3,12,'2025-12-20 20:45:00');

SET @tran_id= LAST_INSERT_ID();

INSERT INTO transaction_items(transaction_id, sku_id, qty)
VALUES 
(@tran_id,1,3);

-- Inserts for my EVENT: 
INSERT INTO events_sessions(sname,stime)
VALUES
('jennyb','2013-05-10 15:10:00'),
('stepht', DATE_SUB(NOW(),INTERVAL .90 DAY)),
('kevint',DATE_SUB(NOW(),INTERVAL .91 DAY)),
('annb',NOW());


