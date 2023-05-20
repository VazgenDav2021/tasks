-- 1. Найти департаменты в которых есть работники, зарабатывающие больше 10 000. В результате выборки формируются два поля (department_id и поле со значениями 1 или 0)
-- SELECT 
-- 	department_id,
-- 	max(
-- 		case
-- 			when salary > 10000 then 1
-- 			else 0
--         end
--     )
-- FROM employees
-- GROUP BY department_id

-- 2 Найти департаменты в которых все работники зарабатывают больше 10 000. В результате выборки формируются два поля (department_id и поле со значениями 1 или 0)

-- SELECT 
-- 	department_id,
-- 	min(
-- 		case
-- 			when salary > 10000 then 1
-- 			else 0
--         end
--     )
-- FROM employees
-- GROUP BY department_id

-- 3. Отсортировать сотрудников по фамилии в алфавитном порядке

-- SELECT
-- 	*
-- FROM employees
-- ORDER BY last_name;


-- 4 Отсортировать сотрудников по зарплате - от самой большой зарплаты до самой маленькой

-- SELECT
-- 	*
-- FROM employees
-- ORDER BY salary DESC;


-- 5 Вывести сотрудников, работающих в департаментах с id 60, 90 и 110, отсортированными в алфавитном порядке по фамилии 


-- SELECT
-- 	*
-- FROM employees
-- WHERE department_id in (60, 90, 110)
-- ORDER BY last_name; 



-- 6 Вывести сотрудников с job_id ST_CLERK, отсортированными по зарплате - от самой большой зарплаты до самой маленькой

-- SELECT
-- 	*
-- FROM employees
-- WHERE job_id = 'ST_CLERK'
-- ORDER BY salary DESC;


-- 7 Вывести сотрудников, чьи имена начинаются на букву D и отсортировать их в алфавитном порядке по фамилии

-- SELECT
-- 	*
-- FROM employees
-- WHERE first_name like 'D%'
-- ORDER BY last_name; 


-- 8 Выведите данные о билетах разной ценовой категории. Среди билетов экономкласса (Economy) добавьте в выборку билеты с ценой от 10 000 до
--  11 000 включительно. Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000 включительно. 
-- Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000. В решении необходимо использовать оператор CASE.
-- В выборке должны присутствовать три атрибута — id, service_class, price. 

-- SELECT id, service_class, price 
-- from tickets 
-- WHERE
--     CASE service_class
--         WHEN 'Business' THEN price > 100000
--         WHEN 'PremiumEconomy' THEN price BETWEEN 20000 AND 30000
--         WHEN 'Economy' THEN price BETWEEN 10000 AND 11000
--     END



-- 9 Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
-- Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. Более новые самолеты отнесите к классу 'New'. 
-- Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.

-- SELECT side_number,
--        CASE
--            WHEN production_year < 2000 THEN 'Old'
--            WHEN production_year <= 2010 THEN 'Mid'
--            ELSE 'New'
--         END age
-- FROM airliners
-- WHERE range <= 10000
-- ORDER BY age


-- 10 Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. 
-- Определите цену билета в каждом сегменте с учетом скидки. В выборке должны присутствовать три атрибута — id, trip_id, new_price. 


-- SELECT id, trip_id, 
-- 				CASE
--            WHEN service_class = 'Business' THEN price * 0.9
--            WHEN service_class = 'Economy' THEN price * 0.85
--            WHEN service_class = 'PremiumEconomy' THEN price * 0.8
--          END new_price
-- FROM tickets WHERE trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G')
 
 
-- 11 Создайте таблицу goods (id, title, quantity)

-- create table goods(
-- id integer primary key,
-- title varchar(128),
-- quantity integer check(quantity between 0 and 10)
-- ); 


-- 12 Добавьте несколько строк
-- insert into goods (id, title, quantity) values(1, 'велосипед', 4);
-- insert into goods (id, title, quantity) values(2, 'лыжи',  5);
-- insert into goods (id, title, quantity) values(3, 'коньки',  7);
-- insert into goods (id, title, quantity) values(4, 'скейт', 2); 



-- 13 Добавьте поле price (integer) со значением по умолчанию 0 (надо покопатся))

-- ALTER TABLE goods
-- add price integer default 0; 


-- 14 Проверьте содержимое таблицы
-- select * from goods;


-- 15 Измените тип на numeric(8, 2)
-- перед изменением типа необходимо очистить поле

-- 16 Удалите таблицу  DROP TABLE goods;


-- 17 Заново создайте, добавьте данные и на ее основе создайте новую таблицу
-- CREATE TABLE goods (
-- 	id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(128) NOT NULL,
--     price INTEGER,
--     quantity INTEGER
--     );
-- INSERT INTO goods(title, price, quantity) VALUES ('Ролики', 3000, 10),
-- 											     ('Самокат', 4500, 12),
--                                                  ('Велосипед', 3000, 10);
-- CREATE TABLE goods_2 AS
-- 	SELECT
-- 		*
-- 	FROM goods
--     WHERE 1=0; 
 