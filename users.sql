-- Create the database named retaildb
CREATE database retaildb
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the database
USE retaildb;
  
-- Create three users
-- Read-only user
CREATE USER 'jenny'@'localhost'
  IDENTIFIED BY 'your_secure_password_here1';
  
-- Transaction user
CREATE USER 'steph'@'localhost'
  IDENTIFIED BY 'your_secure_password_here2';
  
-- Admin user
CREATE USER 'admin'@'localhost'
  IDENTIFIED BY 'your_secure_password_here3';
  
-- Create three roles for the read-only, transcation, and admin users
CREATE ROLE 'viewer', 'dataentry', 'dbadmin';

-- Grant permissions to the read-only user
GRANT
  SELECT,
  SHOW VIEW,
  EXECUTE
ON retaildb.* TO 'viewer';

-- Grant permissions to the transaction user
GRANT
  SELECT,
  SHOW VIEW,
  EXECUTE,
  INSERT,
  UPDATE,
  DELETE
ON retaildb.* TO 'dataentry';

-- Grant permissions to the admin user
GRANT
  SELECT,
  SHOW VIEW,
  EXECUTE,
  INSERT,
  UPDATE,
  DELETE,
  CREATE,
  ALTER,
  DROP,
  CREATE VIEW,
  TRIGGER,
  CREATE ROUTINE,
  ALTER ROUTINE,
  REFERENCES,
  INDEX,
  EVENT,
  CREATE TEMPORARY TABLES
ON retaildb.* TO 'dbadmin';

-- Assign viewer role to user jenny
GRANT 'viewer' TO 'jenny'@'localhost';

-- Assign dataentry role to user steph
GRANT 'dataentry' TO 'steph'@'localhost';

-- Assign dbadmin role to user Admin
GRANT 'dbadmin' TO 'admin'@'localhost';

-- Set deafault roles. Per the instructions "If you skip this step the user may not see their database at all". 
SET DEFAULT ROLE 'viewer' TO 'jenny'@'localhost';
SET DEFAULT ROLE 'dataentry' TO 'steph'@'localhost';
SET DEFAULT ROLE 'dbadmin' TO 'admin'@'localhost';

-- Make sure I did everything right and check that they went through
SHOW GRANTS FOR 'viewer';
SHOW GRANTS FOR 'dataentry';
SHOW GRANTS FOR 'dbadmin';

SHOW GRANTS FOR 'jenny'@'localhost';
SHOW GRANTS FOR 'steph'@'localhost';
SHOW GRANTS FOR 'admin'@'localhost';

