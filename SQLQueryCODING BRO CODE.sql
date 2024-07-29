CREATE DATABASE myDB;

USE myDB;

alter database myDB read = 1;

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_pay DECIMAL(5, 2),
hire_date DATE
);

DROP TABLE employees

SELECT * FROM employees;

ALTER TABLE employees
add phone_number VARCHAR(15);

ALTER TABLE employees
RENAME COLUMN phone_number to email;

ALTER TABLE employees
ALTER COLUMN phone_number INT;

ALTER TABLE employees
ALTER COLUMN phone_number VARCHAR(100)
AFTER last_name;

SELECT * FROM employees


ALTER TABLE employees
MODIFY phone_number VARCHAR(100)
FIRST;

SELECT * FROM employees;

ALTER TABLE employees
DROP COLUMN phone_number;

INSERT INTO employees
VALUES (1, 'Eugene', 'krabs', 25.50, '2023-01-02', 0703);

INSERT INTO employees
VALUES (2, 'Squidward', 'Tentacles', 15.00, '2023-01-03', 0809),
       (3, 'Spongebob', 'Squarepants', 12.50, '2023-01-04', 0908),
	   (4, 'Patrick', 'Star', 12.50, '2023-01-05', 0609),
	   (5, 'Sandy', 'cheeks', 17.25, '2023-01-06', 0206);

INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, 'Sheldon', 'Plankton');

SELECT first_name, last_name
FROM employees;

SELECT * 
FROM employees
WHERE employee_id = 1;

SELECT *
FROM employees
WHERE first_name = 'SpongeBob';

SELECT * 
FROM employees
WHERE hourly_pay >= 15;

SELECT *
FROM employees
WHERE hire_date <= '2023-01-03'

SELECT *
FROM employees
WHERE employee_id != 1;

SELECT *
FROM employees
WHERE hire_date IS NULL;

SELECT *
FROM employees
WHERE hire_date IS NOT NULL;

UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6;

select * from employees;

UPDATE employees
SET hourly_pay = 10.50,
    hire_date = '2023-01-05',
	phone_number = 0903
WHERE employee_id = 6;

UPDATE employees
SET hire_date = NULL
WHERE employee_id = 6;

DELETE FROM employees
WHERE employee_id = 6;

CREATE TABLE test(
     my_date DATE,
	 my_time TIME,
	 My_datetime DATETIME
	   );

select * from test;

DROP TABLE test;

CREATE TABLE products(
      product_id INT,
	  product_name VARCHAR(25) UNIQUE,
	  price DECIMAL(4, 2)
);

select * from products

INSERT INTO products
VALUES (100, 'hamburger', 3.99),
       (101, 'fries', 1.89),
	   (102, 'soda', 1.00),
	   (103, 'ice cream', 1.49);

CREATE TABLE products(
      product_id INT,
	  product_name VARCHAR(25),
	  price DECIMAL(4, 2) NOT NULL
);
	 
ALTER TABLE products
ALTER COLUMN price DECIMAL(4, 2) NOT NULL;

INSERT INTO products
VALUES (104, 'COOKIE', 0);

CREATE TABLE dynamics (
      employee_id INT,
	  first_name VARCHAR(30),
	  middle_name VARCHAR(30),
	  hourly_pay DECIMAL(5, 2),
	  hire_date DATE,
	  CONSTRAINT chk_hour CHECK(hourly_pay >= 10.00)
);

select * from dynamics

INSERT INTO dynamics
VALUES (1, 'chika', 'offor', 10.50, '2022-02-01');


ALTER TABLE dynamics
ADD CONSTRAINT chk_hire_date CHECK(hire_date >= '2022-02-02')

ALTER TABLE dynamics
DROP CHECK chk_hire_date;

select * from products

INSERT INTO products
VALUES (104, 'straw', 0.00), 
       (105, 'napkin', 0.00), 
	   (106, 'fork', 0.00), 
	   (107, 'spoon', 0.00);

DELETE FROM products
WHERE product_id >= 104;

DROP TABLE products;

CREATE TABLE products (
    product_id INT,
	product_name VARCHAR(25),
	price DECIMAL(4, 2) DEFAULT 0
);

ALTER TABLE products
ALTER COLUMN price SET DEFAULT 1;

INSERT INTO products (product_id, product_name)
VALUES (104, 'straw'), 
       (105, 'napkin'), 
	   (106, 'fork'), 
	   (107, 'spoon');

select * from products

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
	amount DECIMAL(5, 2),
	);

INSERT INTO transactions
VALUES (1003, 3.29);

select * from transactions

DROP TABLE transactions

CREATE TABLE transactions (
      transaction_id INT PRIMARY KEY AUTO_INCREMENT,
	  amount DECIMAL(5, 2)

);

ALTER TABLE dynamics
ADD CONSTRAINT fk_employee_id
FOREIGN KEY(employee_id) REFERENCES employees(employee_id);

CREATE TABLE customer(
     customer_id INT PRIMARY KEY,
	 customer_name VARCHAR(100),
	 city VARCHAR(100)
);

CREATE TABLE orders (
      order_id INT PRIMARY KEY,
	  order_date DATETIME,
	  customer_id INT
	  );

ALTER TABLE customer
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

INSERT INTO customer (customer_id)
VALUES (20),
       (21),
	   (22),
	   (23);
INSERT INTO customer
VALUES (5, 'Emmanuel', 'oregun'),
       (6, 'fortune', 'dockyard'),
	   (7, 'nneka', 'osun'),
	   (8, 'collins', 'abia');

select * from customer
select * from orders
SELECT * FROM employees;

ALTER TABLE orders
DROP COLUMN customer_id;

ALTER TABLE orders
add customer_id INT;

UPDATE employees 
SET job = 'janitor'
WHERE employee_id = 5;
   

INSERT INTO orders
 VALUES (14, '2022-02-03', 20), 
        (15, '2022-02-04', 21),
		(16, '2022-02-05', 22),
		(17, '2022-02-06', 23);

SELECT *
FROM customer inner JOIN orders
ON customer.customer_id = orders.customer_id

SELECT SUM(customer_id) as SUM
FROM customer

SELECT CONCAT(first_name, ' ' ,last_name) AS full_name
from employees;

ALTER TABLE employees
ADD job VARCHAR(25);

SELECT * 
FROM employees
WHERE hire_date < '2023-01-05' and job = 'cook';

SELECT *
FROM employees
WHERE job = 'cook' OR job = 'asst.manager';

SELECT *
FROM employees
WHERE NOT job = 'manager' AND not job = 'asst.manager';

SELECT *
FROM employees
WHERE hire_date BETWEEN '2023-01-02' AND '2023-01-06';

SELECT *
FROM employees
WHERE job IN ('cook', 'cashier', 'janitor');

SELECT *
FROM employees
WHERE first_name Like 's%'

SELECT *
FROM employees
WHERE hire_date LIKE '2023%';

SELECT * from employees
WHERE last_name LIKE '%r';

SELECT * FROM employees
WHERE job LIKE '_ook';

SELECT * FROM employees
WHERE hire_date LIKE '____-__-04';

SELECT * FROM employees
WHERE job LIKE '_a%';

select * from employees
ORDER BY last_name;

select * from employees
ORDER BY last_name DESC, hire_date ASC;

CREATE TABLE income (
     income_name VARCHAR(20),
	 amount INT
);

CREATE TABLE expenses (
      expense_name VARCHAR(30),
	  amount INT
);

INSERT INTO expenses
  VALUES ('wages', 250000), 
         ('tax', 300000), 
		 ('repairs', 400000);


INSERT INTO income
VALUES ('orders', 100000), 
       ('merchandise', 30000000), 
	   ('services', 2800000);


SELECT * FROM INCOME
UNION
SELECT * FROM expenses;


select * from employees;
select * from customer;

ALTER TABLE customer
add referral_id INT;

UPDATE customer
SET referral_id = 4
WHERE customer_id = 8;

SELECT a.customer_id, a.customer_name,
       CONCAT(a.customer_name, ' ', b.customer_name) AS 'REFERRED BY'
FROM customer AS a
RIGHT JOIN customer AS b
on a.referral_id = b.customer_id;

ALTER TABLE employees
add supervisor_id INT;

UPDATE employees
SET supervisor_id = 1
WHERE employee_id = 4;

select * from employees;

ALTER TABLE employees
DROP COLUMN suoervisor_id;

SELECT a.first_name, a.last_name,
       CONCAT(b.first_name, ' ', b.last_name) AS 'reports to'
FROM employees AS a
RIGHT JOIN employees AS b
ON a.supervisor_id = b.employee_id;

CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;

SELECT * FROM employee_attendance
ORDER BY last_name DESC;

SELECT * FROM customer;

ALTER TABLE customer
add email VARCHAR(50);

UPDATE customer
SET email = 'abia@gmail.com'
WHERE customer_id = 8;

CREATE VIEW customer_emails AS
SELECT email
FROM customer;

Select *
FROM customer_emails;

INSERT INTO customer
VALUES (9, 'Darlington', 'california', NULL, 'darlington@gmail.com');

CREATE INDEX customer_name_idx
ON customer(customer_name);

SELECT * FROM customer
WHERE customer_name = 'Emmanuel';

CREATE INDEX customer_name_city_idx
on customer(customer_name, city);

ALTER TABLE customer
DROP INDEX customer_name_idx;

SELECT * FROM customer
where customer_name = 'Emmanuel' AND city = 'oregun';

select * from employees;

SELECT first_name, last_name, hourly_pay,
       (SELECT AVG(hourly_pay) from employees) AS avg_pay
FROM employees;

SELECT first_name, last_name, hourly_pay
FROM employees
WHERE hourly_pay > (SELECT AVG(hourly_pay) FROM employees);


SELECT customer_name, city 
FROM customer
WHERE customer_id NOT IN
(SELECT DISTINCT customer_id
FROM customer
WHERE customer_id IS NOT NULL);

SELECT * FROM orders

ALTER TABLE orders
ALTER COLUMN amount FLOAT;

update orders
set amount = 4.00
where order_id = 17;

SELECT count(amount) as count_per_day, order_date
from orders
GROUP BY order_date;

SELECT count(amount) as count_per_day, order_id
FROM orders
GROUP BY order_id
HAVING COUNT(amount) < 1 AND order_id IS NOT NULL;

select * from orders;

SELECT SUM(order_id), order_date
FROM orders
GROUP BY order_date WITH ROLLUP;

SELECT count(order_id) as '# of orders', customer_id
FROM orders
GROUP BY customer_id with rollup;

SELECT * from employees;

SELECT SUM(hourly_pay) AS 'hourly pay', employee_id
FROM employees
GROUP BY employee_id with rollup;

ALTER TABLE customer
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
ON DELETE cascade;


DELIMITER $$
CREATE PROCEDURE get_customer()
BEGIN
     SELECT * from customer;
END $$
DELIMITER;


DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
     SELECT * 
	 FROM customer
	 WHERE customer_id = id;
END $$
DELIMITER;


CALL find_customer();


DELIMITER $$
CREATE PROCEDURE find_customer(IN f_name VARCHAR(50), 
                               IN l_name VARCHAR(50))
BEGIN
     SELECT *
	 FROM customer
	 WHERE first_name = f_name AND last_name = l_name;
END $$
DELIMITER;

CALL find_customer('larry', 'lobster');

ALTER TABLE employees
ADD salary DECIMAL(10, 2);

SELECT * from employees;
UPDATE employees
SET salary = hourly_pay * 2080;

CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

CREATE TABLE expenses_number (
        expense_id INT primary key,
		expense_name VARCHAR (50),
		expense_total DECIMAL(10, 2)
);

SELECT * FROM expenses_number;

INSERT INTO expenses_number
VALUES (1, 'salaries', 0),
       (2, 'supplies', 0),
	   (3, 'taxes', 0);

UPDATE expenses_number
SET expense_total = (SELECT SUM(salary) from employees)
WHERE expense_name = 'salaries';

CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses_number
SET expense_total = expense_total - OLD.salary
WHERE expense_name = 'salaries';

DELETE FROM employees
WHERE employee_id = 6;

CREATE TRIGGER after_salary_insert
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses_number
SET expense_total = expense_total + NEW.salary
WHERE expense_name = 'salaries';

INSERT INTO employees
VALUES(6, 'SHEDOM', 'PLANKTON', 10, NULL, 'JANITOR', '2023-01-01');

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
UPDATE expenses_number
SET expense_total = expense_total + (NEW.salary - OLD.salary)
WHERE expense_name = 'salaries';






































































































































































































































































