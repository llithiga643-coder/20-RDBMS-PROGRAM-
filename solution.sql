
create database lithuss123;
use lithuss123;
CREATE TABLE employee (
id INT PRIMARY KEY,
name VARCHAR(100),
salary DECIMAL(10,2)
);
CREATE TABLE notifications (
id INT AUTO_INCREMENT PRIMARY KEY,
message VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
INSERT INTO notifications (message)
VALUES (CONCAT('New employee added: ', NEW.name));
END$$
DELIMITER ;
INSERT INTO employee (id, name, salary)
VALUES (101, 'Ravi', 25000);
SELECT * FROM notifications;
