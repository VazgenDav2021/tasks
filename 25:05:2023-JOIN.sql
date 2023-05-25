-- USE learn;

-- DROP TABLE IF EXISTS clients;
-- CREATE TABLE clients (
-- 		id INTEGER PRIMARY KEY AUTO_INCREMENT,
-- 		name VARCHAR(128),
--         lastname VARCHAR(128),
--         location_id INTEGER,
--         city VARCHAR(128)
-- );

-- DROP TABLE IF EXISTS transactions;
-- CREATE TABLE transactions (
-- 	id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     client_id INTEGER,
--     money_amount INTEGER,
--     currency_id INTEGER
-- );


-- INSERT INTO clients (name, lastname,location_id, city) VALUES ("Ольга", "Петрова", 2, "Киев"),
-- 															  ("Александр", "Монин", 4, "Харьков"),
--                                                               ("Николай", "Сидоров", 11, "Астана"),
--                                                               ("Янна", "Попкова", 3, "Ереван"),
--                                                               ("Вилиам", "Смит", 5, "Париж"),
--                                                               ("МАрк", "Цукенберг", 8, "Караганда");

-- INSERT INTO transactions (client_id, money_amount, currency_id) VALUES (3, 500, 1),
-- 																	   (3, 700, 2),
-- 																	   (1, 250, 1),
-- 																	   (1, 900, 2),
-- 																	   (4, 100, 2),
-- 																	   (1, 400, 1),
-- 																	   (4, 200, 2);
-- SELECT
-- 	t1.name,
--     t1.lastname,
--     t2.money_amount,
--     t2.currency_id
-- FROM clients t1
-- INNER JOIN transactions t2
-- ON t1.id = t2.client_id;


--  1 задача
-- SELECT
-- 	t1.first_name,
--     t1.last_name,
--     t2.department_name
-- FROM employees t1
-- INNER JOIN departments t2
-- ON t1.department_id = t2.department_id;


-- 2 задача 
-- SELECT
-- 	t1.first_name,
--     t1.last_name,
--     t2.department_name
-- FROM employees t1
-- INNER JOIN departments t2
-- ON t1.department_id = t2.department_id
-- AND department_name = "IT";


-- 3 задача
-- SELECT
-- 	t1.first_name as manager_name,
--     t1.last_name as manager_last_name,
-- 	t2.first_name as employee_name,
--     t2.last_name as employee_last_name
-- FROM employees t1
-- INNER JOIN employees t2
-- ON t1.employee_id = t2.manager_id;


-- SELECT
-- 	t2.job_id
-- FROM employees t1
-- INNER JOIN employees t2
-- ON t1.employee_id = t2.manager_id
-- AND t2.salary > t1.salary;



-- 1 inner join если есть поля которые не находят себе пару отбрасываются
-- CREATE TABLE table_1 (
-- 	id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(68)
-- );

-- CREATE TABLE table_2 (
-- 	id INTEGER PRIMARY KEY,
--     name VARCHAR(68)
-- );


-- INSERT INTO table_1 (name) VALUES ("Гайк"), ("Сева"), ("Сева"), ("Катя");
-- INSERT INTO table_2 (id, name) VALUES (3, "Гайк"), (4, "Сева"), (5, "Сева"), (6, "Катя");


-- SELECT
-- 	t1.name,
--     t1.id
-- FROM table_1 t1
-- INNER JOIN table_2 t2
-- ON t1.id = t2.id;


-- Left join
-- CREATE TABLE table_3 (
-- 	id INTEGER PRIMARY KEY,
--     age INTEGER
-- );
-- INSERT INTO table_3 (id, age) VALUES (3, 21), (4, 32), (5, 22), (6, 12);

-- SELECT
-- 	t1.name,
--     t1.id,
--     t2.age
-- FROM table_1 t1
-- LEFT JOIN table_3 t2
-- ON t1.id = t2.id;


-- SELECT
-- 	t1.SNAME,
--     t2.SNAME as boss_name
-- FROM SELLERS t1
-- LEFT JOIN SELLERS t2
-- ON t1.SELL_ID = t2.BOSS_ID;


-- SELECT
-- 	t1.CNAME,
--     t2.AMT
-- FROM CUSTOMERS t1
-- INNER JOIN ORDERS t2
-- ON t1.CUST_ID = t2.CUST_ID
-- AND t2.AMT > 1000;


-- SELECT
-- 	t1.CNAME,
--     t2.AMT
-- FROM CUSTOMERS t1
-- LEFT JOIN ORDERS t2
-- ON t1.CUST_ID = t2.CUST_ID
-- AND t2.AMT > 1000;


-- RIGHT JOIN
-- USE hr;
-- SELECT
-- 	t1.id,
--     t1.name,
--     t2.age
-- FROM table_1 t1
-- RIGHT JOIN table_3 t2
-- ON t1.id=t2.id;

-- USE hr;

-- SELECT * FROM locations;

-- SELECT 
-- 	t1.first_name,
--     t1.last_name,
--     t3.city
-- FROM employees t1
-- INNER JOIN departments t2
-- ON t1.department_id = t2.department_id
-- INNER JOIN locations t3
-- ON t2.location_id = t3.location_id
-- AND t3.city IN ("Seattle", "Toronto");


-- SELECT 
-- 	t1.first_name,
--     t1.last_name,
--     t3.city
-- FROM employees t1
-- RIGHT JOIN departments t2
-- ON t1.department_id = t2.department_id
-- RIGHT JOIN locations t3
-- ON t2.location_id = t3.location_id
-- AND t3.city IN ("Seattle", "Toronto");


-- SELECT 
-- 	t1.first_name,
--     t1.last_name,
--     t3.city
-- FROM employees t1
-- LEFT JOIN departments t2
-- ON t1.department_id = t2.department_id
-- LEFT JOIN locations t3
-- ON t2.location_id = t3.location_id
-- AND t3.city IN ("Seattle", "Toronto");



-- FULL JOIN 
-- FULL JOIN не работает в реализации MYSQL 
-- SELECT
-- 	t1.id,
--     t1.name,
--     t2.age
-- FROM table_1 t1
-- FULL JOIN table_3 t2
-- ON t1.id = t2.id;


-- SELECT
-- 	t1.id,
--     t1.name,
--     t2.age
-- FROM table_1 t1
-- LEFT JOIN table_3 t2
-- ON t1.id = t2.id
-- UNION
-- SELECT
-- 	t1.id,
--     t1.name,
--     t2.age
-- FROM table_1 t1
-- RIGHT JOIN table_3 t2
-- ON t1.id = t2.id;
