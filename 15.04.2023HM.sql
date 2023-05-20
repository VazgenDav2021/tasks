-- Разбор дз

-- USE hr;
-- -- 1.1  
-- SELECT
-- 	department_id,
--     max(
-- 		CASE
-- 			WHEN salary > 10000 THEN 1
-- 			ELSE 0
-- 		END 
--     ) AS exapmle
-- FROM employees
-- GROUP BY department_id;

-- -- 1.2
-- SELECT department_id ,
--  CASE
--   WHEN MAX(salary) > 10000 THEN 1
--         ELSE 0
--  END AS has_high_earner
-- FROM employees
-- GROUP BY department_id;


-- -- 2.1
-- SELECT
-- 	department_id,
--     min(
-- 		CASE
-- 			WHEN salary > 10000 THEN 1
-- 			ELSE 0
-- 		END 
--     ) AS exapmle
-- FROM employees
-- GROUP BY department_id;


-- 3  SELECT * FROM employees ORDER BY last_name;

-- 4 SELECT * FROM employees ORDER BY salary DESC;

-- 5 SELECT * FROM employees WHERE department_id IN (60,90,110) ORDER BY last_name;


-- 6 SELECT * FROM employees WHERE job_id = "ST_CLERK" ORDER BY salary DESC;

-- 7 SELECT * FROM employees WHERE first_name LIKE "D%" ORDER BY last_name; 

-- 8
SELECT
	id,
    service_class,
    price
FROM tickets
	WHERE CAse service_class
		WHEN "Business" THEN price > 100000
        WHEN "PremiumEconomy" THEN price bETWEEN 20000 aNd 30000
        WHEN "Economy" THEN price bETWEEN 10000 aNd 11000
	End;
    
-- 9 

-- SELECT 
-- 	side_number,
--     CASE 
-- 		WHEN production_year < 2000 THEN "old"
--         WHEN production_year BETWEEN 2000 AND 2010 THEN "Mid"
--         ELSE "New"
-- 	END age
-- FROM airliners
-- WHERE `range` < 10000
-- ORDER BY production_year;


--  10

-- SELECT
-- 	id,
--     trip_id,
--     price,
--     CASE
-- 		WHEN service_class = "Business" THEN price * 0.9
--         WHEN service_class = "Economy" THEN price * 0.85
--         WHEN service_class = "PremiumEconomy" THEN price * 0.8
-- 	END discount_price
-- FROM tickets WHERE  trip_id IN ("LL4S1G8PQW", "0SE4S0HRRU", "JQF04Q8I9G" );



-- Ограничение, значение по умалчанию, слияние таблиц (вертикальный подход)

--  1 Констрейнты

-- USE learn2;
-- DROP TABLE IF EXISTS goods;

-- CREATE TABLE goods (
--     id integer primary key,
--     name varchar(128) NOT NULL, 
--     long_text varchar (200) UNIQUE,
--     consultant_number varchar(128) UNIQUE,
--     age_of_creating integer CHECK (age_of_creating BETWEEN 0 AND 4),
-- );


-- INSERT INTO 
-- 	goods(id, name, long_text, consultant_number, age_of_creating) 
-- 		VALUES (1, "Fen", "Ochen Xoroshiy Fen", "+374 91 09 07 08", 2);


-- INSERT INTO 
-- 	goods(id, name, long_text, consultant_number, age_of_creating) 
-- 		VALUES (2, "Fen 2", "Ochen Xoroshiy Fen2", "+374 91 08 07 08", 2);
--         

-- SELECT * FROM goods;  

-- 2 auto_increment
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id integer primary key auto_increment,
    name varchar(128),
    lastname varchar(128),
    age integer check (age beTWEEN 18 And 120),
    phone varchar(128) unique
);


INSERt into users(name, lastname, age, phone) VALUES ("vazgen", "dav", 23, "+374 01 08 07 08");
InSERT INTO users(name, lastname, age, phone) vALUES ("vazgen1", "Dav1", 44, "+374 02 08 07 08");
INSErT INTO users(name, lastname, age, phone) VALUES ("vazgen2", "Dav2", 55, "+374 03 08 07 08");
INSErT INTO users(name, lastname, age, phone) VALUES ("vazgen3", "Dav3", 64, "+374 04 08 07 08");
INSErT INTO users(name, lastname, age, phone) VALUES ("vazgen4", "Dav4", 22, "+374 05 08 07 08");
 
SELeCT * FROM users;

-- во врмея turncate у нас идет обнуление поэтому id заного начинатся 
SET sql_safe_updates = 0;
truncate table users;


--  Во время DELETE у нас id работает по другом
DELETE FROM users;



-- 1

DROP TABLE IF EXISTS goods;
CREATE TABLE goods (
	id INTEGER PRIMARY KEY,
    title VARCHAR(30),
    quantity INTEGER CHECK (quantity > 0),
    in_stock CHAR(1) CHECK (in_stock IN ("Y", "N"))
);

SELECT * FROM goods;


-- 2 
INSERT INTO goods (id, title, quantity, in_stock) VALUES (1, "Samokat", 3, "Y");
INSERT INTO goods (id, title, quantity, in_stock) VALUES (2, "Roliki", 1, "Y");



-- 3
DROP TABLE IF EXISTS goods_2;
CREATE TABLE goods_2 (
	id INTEGER PRIMARY KEY,
    title VARCHAR(30),
    quantity INTEGER CHECK (quantity > 0),
    price INTEGER,
    in_stock CHAR(1) CHECK (in_stock IN ("Y", "N"))
);
SELECT * FROM goods_2;

-- 4 
INSERT INTO goods_2 (id, title, quantity, price, in_stock) VALUES (1, "BMW", 6, 25000, "Y");
INSERT INTO goods_2 (id, title, quantity, price, in_stock) VALUES (5, "BMW", 9, 25000, "Y");
INSERT INTO goods_2 (id, title, quantity, in_stock) VALUES (2, "Roliki", 3, "Y");
INSERT INTO goods_2 (id, title, quantity, price, in_stock) VALUES (3, "Mercedes", 7,  20000, "Y");




-- 5  
SELECT title FROM goods
UNION ALL
SELECT title FROM goods_2;

SELECT
	id,
    title,
    quantity,
    price
FROM goods_2
UNION ALL
SELECT 
	id,
    title,
    quantity,
    0
FROM goods;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    age INTEGER CHECK (age BETWEEN 18 AND 120)
);

INSERT INTO users (name, last_name, age) VALUES ("Vazgen", "Dav", 22);
INSERT INTO users (name, last_name, age) VALUES ("Andrey", "Litv", 33);
INSERT INTO users (name, last_name, age) VALUES ("Yura", "Kolin", 21);

SELECT * FROM users;

DROP TABLE IF EXISTS users_2;
CREATE TABLE users_2 (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    age INTEGER CHECK (age BETWEEN 18 AND 120),
    phone varchar(128),
    driver_license BOOLEAN DEFAULT FALSE
);

INSERT INTO users_2 (name, last_name, age, phone, driver_license) VALUES ("Vazgen2", "Dav2", 22, "374 91 09 07 08", 1);
INSERT INTO users_2 (name, last_name, age, phone) VALUES ("Andrey", "Litv2", 33, "374 91 09 07 08");
INSERT INTO users_2 (name, last_name, age, phone, driver_license) VALUES ("Yura2", "Kolin2", 21, "374 91 09 07 08", 0);

SELECT * FROM users_2;


-- 1 
SELECT
	id,
    name,
    last_name,
    age
FROM users
UNION ALL -- Слияние двух таблиц 
SELECT
	id,
    name,
    last_name,
    age
FROM users_2;

-- 2 Берем данные из разного количесрва столбцов
SELECT
	id,
    name,
    last_name,
    age,
    null as phone,
	null as driver_license,
    "VIP" as user_status
FROM users
UNION ALL -- Слияние двух таблиц 
SELECT
	id,
    name,
    last_name,
    age,
	phone,
    driver_license,
	"Regular" as user_status
FROM users_2;


-- Второй вариант 
SELECT
	id,
    name,
    last_name,
    age,
    phone,
    driver_license
FROM users_2
UNION  -- Слияние двух таблиц 
SELECT
	id,
    name,
    last_name,
    age,
	null,
    null
FROM users;


SELECT 
	title
FROM goods
UNION ALL
SELECT 
	title
FROM goods_2;


--  1 он убирает дубликаты и 2х 3х и n-oм количестве таблиц
--  2  on убирает дубликаты из каждой таблицы отдельно

SELECT 
  quantity
FROM goods
UNION
SELECT 
    quantity
FROM goods_2;

