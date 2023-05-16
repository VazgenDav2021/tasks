-- select * from employees where department_id = 90;

-- select * from employees where salary > 5000;

-- select * from employees where last_name like "L%";

-- select * from departments where location_id = 1700;

-- select * from locations where country_id like "US";

-- select * from employees where first_name = "Lex" and last_name = "De Haan";

-- select * from employees where first_name = "Lex" or salary = 5800;

-- select * from employees where job_id = 'FI_ACCOUNT' and salary < 8000;

-- select * from employees where last_name like "_%ll%_" or last_name like "_%kk%_";

-- select * from employees where commission_pct = null; // неверно

-- select * from employees where commission_pct is null;

-- select * from employees where commission_pct is not null;

-- select * from departments where department_id <> 80 and department_id <> 110 and department_id <> 270;

-- select * from departments where department_id  in (80, 110, 270);

-- select * from departments where department_id not in (80, 110, 270);

-- select * from employees where salary  between 5000 and 7000;

-- select * from employees where salary not between 5000 and 7000;


-- Лекиця 2


-- Не надо так писать 
-- SeLecT employee_id, first_name,email, phone_NUMERIC frOM employees where employee_id = 164 and last_name not like "a%" or commission_pct is null and manager_id between 100 and 200; 


-- 1 Команды MYSQL пишем с верхним регостром
-- 2 Поля разделют строкой, и надо сделать табуляцию

-- SELECT
-- 	employee_id,
--     first_name,
--     email,
--     phone_NUMERIC
-- FROM employees
-- 	WHERE 
-- 		employee_id = 164 AND last_name NOT LIKE "a%"
--         OR
--         commission_pct IS NULL
--         AND 
--         manager_id BETWEEN 100 AND 200;


-- 3 Запятые можно ставить и так
-- SELECT
-- 	employee_id
--     ,first_name
--     ,email
--     ,phone_NUMERIC
-- FROM employees
-- 	WHERE 
-- 		employee_id = 164 AND last_name NOT LIKE "a%"
--         OR
--         commission_pct IS NULL
--         AND 
--         manager_id BETWEEN 100 AND 200;



-- Нахождение ошибок


-- SELECT
-- 	employee_id,
--     email
--     phone_NUMERIC
-- FROM employees
-- 	WHERE 
-- 		employee_id = 164 AND last_name NOT LIKE "a%"
--         OR
--         commission_pct IS NULL
--         AND 
--         manager_id BETWEEN 100 AND 200;
--         
        
-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM employees  WHERE    employee_id = 164 AND last_name NOT LIKE "a%"         O' at line 6



--  CASE
DROP DATABASE learn;
CREATE DATABASE learn;
USE learn;

CREATE TABLE products (
	
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128),
    price INTEGER
);

INSERT INTO products (name, price) VALUES ('Яблока', 1000),
							('Арбуз', 3000),
                            ('Ягоды', 4000),
                            ('Дыня', 5200),
                            ('Малина', 2200),
                            ('Инжир', 5000),
                            ('Помидор', 5600),
                            ('Морковка', 6000),
                            ('Яблоко', 7500);
                            
                            
-- Простой пример с CASE созданием нового столбца "category" исходя из условия цены                             
-- SELECT 
-- 	*,
--     CASE
-- 		WHEN price = 1000
-- 			THEN "дишовый товар"
-- 		WHEN price = 3000
-- 			THEN "средний товар"
-- 		WHEN price = 4000
-- 			THEN "дорогой товар"
--     END as category
--  FROM products;



-- Более актуальное условие для нашей таблицы 
-- SELECT 
-- 	*,
--     CASE
-- 		WHEN price < 2500
-- 			THEN "дишовый товар"
-- 		WHEN price < 4000
-- 			THEN "средний товар"
-- 		WHEN price >= 4000
-- 			THEN "дорогой товар"
--     END as category
--  FROM products;


-- Болле краткий код с помощю оператоа ELSE 
-- SELECT 
-- 	*,
--     CASE
-- 		WHEN price < 2500
-- 			THEN "дишовый товар"
-- 		WHEN price < 4000
-- 			THEN "средний товар"
-- 		ELSE "дорогой товар"
--     END as category
--  FROM products;



-- CREATE DATABASE airpots;
-- USE airpots;


-- CREATE TABLE airliners (
--   id VARCHAR(128) PRIMARY KEY,
--   model_name VARCHAR(128),
--   `range` INTEGER,
--   production_year INTEGER,
--   color VARCHAR(128),
--   side_number VARCHAR(128),
--   country VARCHAR(128)
--   );

-- SELECT
-- 	model_name,
--     `range`,
--     CASE
-- 		WHEN `range` > 1000 AND `range` <= 2500
-- 			THEN 'short_haul'
-- 		WHEN `range` > 2500 AND `range` <= 6000
-- 			THEN 'medium_haul'
-- 		WHEN `range` > 6000 
-- 			THEN 'long_haul'
--     END AS category
-- FROM airliners;
-- 	



-- Здесь работаем с полями null, сортировкой

-- SELECT 
-- 	*,
--     CASE
-- 		WHEN discount IS NULL
-- 			THEN 1
-- 		ELSE discount
--     END AS real_discount
-- FROM products;


-- Более короткий метод

-- SELECT 
-- 	*,
--     COALESCE(discount,1) as real_discount
-- FROM products;


-- SELECT 
-- 	*
-- FROM products
-- ORDER BY price;


-- SELECT 
-- 	*
-- FROM products
-- ORDER BY title;


-- SELECT 
-- 	price,
--     discount
-- FROM products
-- ORDER BY price, discount;



-- SELECT 
-- 	price,
--     discount
-- FROM products
-- ORDER BY price DESC, discount DESC;


-- SELECT DISTINCT
-- 	price 
-- FROM products;




-- use airpots;

-- SELECT
-- 	model_name,
--     `range`,
--     CASE
-- 		WHEN `range` > 1200 AND `range` <= 2500
-- 			THEN 'short_haul'
-- 		WHEN `range` > 2500 AND `range` <= 6000
-- 			THEN 'medium_haul'
-- 		WHEN `range` > 6000 
-- 			THEN 'long_haul'
-- 		ELSE "UNDEFINED"
--     END AS category
-- FROM airliners;



-- use hr;
-- select * from employees;

-- SELECT
-- 	*
-- FROM employees
-- ORDER BY last_name;


-- SELECT
-- 	salary
-- FROM employees
-- ORDER BY salary DESC;





	






