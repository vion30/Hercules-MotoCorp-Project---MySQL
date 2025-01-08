CREATE DATABASE MotorsCertification;
USE MotorsCertification;

CREATE TABLE offices (
    officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50),
    phone VARCHAR(20),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postalCode VARCHAR(15),
    territory VARCHAR(20)
);

ALTER TABLE offices MODIFY phone VARCHAR(30);


INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) 
VALUES 
('OFC1', 'Oliverfort', '8134246695', '35240 Juarez Brook', 'Apt. 840', 'Alaska', 'Australia', '29920', 'B5N'),
('OFC2', 'North Lindastad', '364.699.3877x475', '023 Brown Loop', 'Apt. 356', 'Oklahoma', 'Isle of Man', '18331', 'U44'),
('OFC3', 'Fieldsville', '001-254-736-2841x30360', '3147 Adams Mountain', 'Apt. 319', 'California', 'Andorra', '16140', 'GYW'),
('OFC4', 'Samanthaport', '416-190-5690x2583', '6346 Alison Inlet', 'Suite 146', 'Idaho', 'Antarctica (the territory South of 60 deg S)', '83620', 'YCY'),
('OFC5', 'Smithton', '001-547-937-1052', '86039 Cobb Branch', 'Apt. 461', 'Arizona', 'Venezuela', '47486', 'Z8O');

CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    officeCode VARCHAR(10),
    reportsTo INT,
    jobTitle VARCHAR(50),
    FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES 
(2001, 'Kramer', 'Kevin', '9DK9', 'john09@mccullough.com', 'OFC5', NULL, 'Engineer, maintenance'),
(2002, 'Hunt', 'Amanda', '1S6V', 'sweeneysuzanne@wilson-jackson.com', 'OFC4', 2001, 'Visual merchandiser'),
(2003, 'Higgins', 'Valerie', '5HDB', 'marcus15@patel-guzman.com', 'OFC5', 2001, 'Librarian, public'),
(2004, 'Rose', 'Denise', '9538', 'kristy47@yahoo.com', 'OFC3', 2001, 'Administrator, education'),
(2005, 'Tucker', 'Joseph', '3EAD', 'smeyers@yahoo.com', 'OFC2', 2001, 'Engineering geologist'),
(2006, 'Blake', 'Julie', 'O3MN', 'matthew59@hotmail.com', 'OFC2', 2001, 'Physiological scientist'),
(2007, 'Jones', 'Jeffrey', 'ZT8C', 'robert37@park.biz', 'OFC3', 2001, 'Designer, exhibition/display'),
(2008, 'Harris', 'Ashley', 'ZW8I', 'peterskaren@davis-wells.com', 'OFC2', 2001, 'Set designer'),
(2009, 'Edwards', 'Thomas', 'BHDW', 'annettecampbell@hotmail.com', 'OFC1', 2001, 'Chartered loss adjuster'),
(2010, 'Williams', 'Kathy', 'WK8N', 'dillon67@yahoo.com', 'OFC1', 2001, 'Interior and spatial designer');

CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(50),
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50),
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(15),
    country VARCHAR(50),
    salesRepEmployeeNumber INT,
    creditLimit FLOAT,
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

INSERT INTO customers (
    customerNumber, customerName, contactLastName, contactFirstName, phone,
    addressLine1, addressLine2, city, state, postalCode, country,
    salesRepEmployeeNumber, creditLimit
)
VALUES
(1001, 'Humphrey, Powers and Cardenas', 'Wilson', 'Miranda', '1138312042',
 '1976 Nicholas Highway Suite 887', 'Apt. 652', 'Brianmouth', 'Georgia', '20766', 
 'Guadeloupe', 2004, 133025.89),

(1002, 'Rojas Inc', 'Stewart', 'Roger', '219-109-5413x51192',
 '5441 Brandon Stream Apt. 570', 'Suite 005', 'Davidland', 'Utah', '90669', 
 'Gibraltar', 2009, 56341.39),

(1003, 'Dyer, Manning and Martin', 'Williams', 'Corey', '(720)684-1418',
 '546 Taylor View Apt. 382', 'Suite 349', 'Randolphside', 'Vermont', '78171', 
 'Dominican Republic', 2005, 78597.55),

(1004, 'Flores-Ross', 'Carroll', 'Michael', '2653131114',
 '4385 Thomas Ferry', 'Apt. 482', 'Hallberg', 'Oregon', '45680', 
 'Congo', 2005, 79301.20),

(1005, 'Burnett, Hamilton and Sullivan', 'Roberts', 'Michael', '232.210.6341x4445',
 '5302 Arnold Road', 'Apt. 558', 'North Ashley', 'North Dakota', '69596', 
 'Namibia', 2005, 60263.34),

(1006, 'Baker PLC', 'Price', 'Alyssa', '1-421-583-8174x701',
 '3401 Jessica Lane', NULL, 'New Christopherburgh', 'Hawaii', '84753', 
 'Norfolk Island', 2007, 45934.55),

(1007, 'Gonzalez, Taylor and James', 'Adams', 'Kristen', '573.525.2857',
 '4247 Stone Shoals', NULL, 'East Emily', 'California', '81317', 
 'Kuwait', 2008, 57894.26),

(1008, 'Smith-Wood', 'Lopez', 'Lisa', '(318)319-8221x043',
 '73898 Gonzalez Drives', 'Suite 710', 'Port Andreastad', 'Wyoming', '74730',
 'Armenia', 2003, 91543.64),

(1009, 'Hernandez Group', 'Ward', 'Andrew', '1-226-641-2784x12133',
 '22011 Cody Stravenue', 'Suite 317', 'South Amy', 'Mississippi', '29143', 
 'Latvia', 2006, 128903.76),

(1010, 'Graham Inc', 'Evans', 'Nicole', '777-938-8078',
 '46051 Blair Mountains', 'Apt. 322', 'Reedview', 'Wisconsin', '63253',
 'Papua New Guinea', 2003, 74639.99);

CREATE TABLE productlines (
    productLine VARCHAR(50) PRIMARY KEY,
    textDescription VARCHAR(4000),
    htmlDescription TEXT,
    image TEXT
);

INSERT INTO productlines (productLine, textDescription, htmlDescription, image)
VALUES
('PLINE1', 'Role democratic message front.', NULL, NULL),
('PLINE2', 'Every majority enjoy mission not fine.', NULL, NULL),
('PLINE3', 'Far unit become. None cut when because.', NULL, NULL),
('PLINE4', 'Else after west state. Loss sing society.', NULL, NULL),
('PLINE5', 'So debate rather represent.', NULL, NULL);

CREATE TABLE products (
    productCode VARCHAR(20) PRIMARY KEY,
    productName VARCHAR(100),
    productLine VARCHAR(50),
    productScale VARCHAR(10),
    productVendor VARCHAR(50),
    productDescription TEXT,
    quantityInStock SMALLINT,
    buyPrice FLOAT,
    MSRP FLOAT,
    FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

select * from products;

CREATE TABLE orders (
    orderNumber INT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    status VARCHAR(50),
    comments TEXT,
    customerNumber INT,
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

select * from orders;

CREATE TABLE payments (
    customerNumber INT,
    checkNumber VARCHAR(50),
    paymentDate DATE,
    amount FLOAT,
    PRIMARY KEY (customerNumber, checkNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

ALTER TABLE productlines
DROP COLUMN htmlDescription,
DROP COLUMN image;

SELECT * FROM productlines;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM payments;
SELECT * FROM employees;
SELECT * FROM offices;

select
max(amount), min(amount)
from payments;

select count(distinct customerName) as UniqueCustomerNames from customers;

create view cust_payment as
select  c.customerName, 
    p.amount, 
    c.contactLastName, 
    c.contactFirstName
from customers c
join payments p 
on c.customerNumber = p.customerNumber;

select * from cust_payment;

drop view cust_payment;




DELIMITER $$

CREATE PROCEDURE GetClassicCarsProductLine()
BEGIN
    SELECT productLine 
    FROM products 
    WHERE productLine = 'Classic Cars';
END$$

DELIMITER ;

-- To call the stored procedure:
CALL GetClassicCarsProductLine();


DELIMITER $$

CREATE PROCEDURE GetCreditLimit()
BEGIN
    SELECT customerName, creditLimit
    FROM customers
    WHERE creditLimit < 96800;
END$$

DELIMITER ;

CALL GetCreditLimit();

DELIMITER $$

CREATE TABLE employee_log (
    logID INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    officeCode VARCHAR(10),
    insertedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER AfterEmployeeInsert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    -- Log the inserted employee data
    INSERT INTO employee_log (employeeNumber, lastName, firstName, officeCode)
    VALUES (NEW.employeeNumber, NEW.lastName, NEW.firstName, NEW.officeCode);
END$$

DELIMITER ;



CREATE TABLE payment_log (
    logID INT AUTO_INCREMENT PRIMARY KEY,
    customerNumber INT,
    amount FLOAT,
    loggedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER CheckPaymentAmount
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    -- Log the customerNumber when payment amount is greater than 10,000
    IF NEW.amount > 10000 THEN
        INSERT INTO payment_log (customerNumber, amount)
        VALUES (NEW.customerNumber, NEW.amount);
    END IF;
END$$
DELIMITER ;

-- Create roles for Admin, HR, and Employee
CREATE ROLE Admin;
CREATE ROLE HR;
CREATE ROLE Employee;

-- Create users for Admin, HR, and Employee
CREATE USER 'employee_user'@'localhost' IDENTIFIED BY 'employee_password';

GRANT Employee TO 'employee_user'@'localhost';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'hr_password';

GRANT Admin TO 'admin_user'@'localhost';
GRANT HR TO 'hr_user'@'localhost';
GRANT Employee TO 'employee_user'@'localhost';

-- Create users
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'hr_password';
CREATE USER 'employee_user'@'localhost' IDENTIFIED BY 'employee_password';

-- Create roles
CREATE ROLE Admin;
CREATE ROLE HR;
CREATE ROLE Employee;

-- Grant roles to users
GRANT Admin TO 'admin_user'@'localhost';
GRANT HR TO 'hr_user'@'localhost';
GRANT Employee TO 'employee_user'@'localhost';

-- Grant permissions to roles
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON motorscertification.employees TO 'hr_user'@'localhost';
GRANT SELECT ON motorscertification.offices TO 'hr_user'@'localhost';
GRANT SELECT ON motorscertification.* TO 'employee_user'@'localhost';



SET GLOBAL event_scheduler = ON;

CREATE EVENT backupDatabase
ON SCHEDULE EVERY 1 DAY -- Adjust frequency as needed
DO
  -- Replace the following with your actual backup command
  SYSTEM mysqldump -u root -pPassword motorscertification > A:\EDUCATIONAL\Data Science\Edureka\Data Science - Demo Class Course\Data Science Class Contents\SQL\Module 33\Backups\motorscertification_backup.sql;

-- View processes
SHOW PROCESSLIST;

-- View InnoDB status for resource waits
SHOW ENGINE INNODB STATUS;

-- Enable slow query log to capture expensive queries
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 2; -- Capture queries that take longer than 2 seconds
SHOW VARIABLES LIKE 'slow_query_log_file';


