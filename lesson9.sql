-- 1. Найти компетенции, которых нет ни у одного преподавателя
-- USE uni;
-- SELECT 
-- 	t1.title
-- FROM Competencies t1
-- LEFT JOIN Teachers2Competencies t2
-- ON t1.id = t2.competencies_id
-- WHERE t2.competencies_id IS NULL;
-- 2. Вывести название курса и имя старосты
-- SELECT  
-- 	t1.title,
--     t2.name AS headman_name
-- FROM Courses t1
-- INNER JOIN Students t2
-- ON t1.headman_id = t2.id;
-- 3*. Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
-- SELECT
-- 	t1.name,
--     t3.title as course_name,
--     t4.name  as headman_name
-- FROM Students t1
-- INNER JOIN Students2Courses t2
-- ON t1.id = t2.student_id
-- INNER JOIN Courses t3
-- ON t2.course_id = t3.id
-- INNER JOIN Students t4
-- ON t3.headman_id = t4.id;

-- Подзпарос
-- Пример 1  Пдозпарос как условие
-- Выводим имена техт клиентов которые сделали заказ больше и равному 1500

-- DROP TABLE IF EXISTS subqueries;
-- CREATE DATABASE subqueries;
-- USE subqueries;

-- DROP TABLE IF EXISTS orders;
-- CREATE TABLE orders(
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	customer_id INTEGER,
--     order_price INT CHECK (order_price > 0)
-- );

-- DROP TABLE IF EXISTS users;
-- CREATE TABLE users(
-- 	costomer_id INTEGER,
--     costomer_name VARCHAR(128)
-- );


-- INSERT INTO orders (customer_id, order_price) VALUES (101, 2000);
-- INSERT INTO orders (customer_id, order_price) VALUES (102, 100);
-- INSERT INTO orders (customer_id, order_price) VALUES (102, 3400);
-- INSERT INTO orders (customer_id, order_price) VALUES (104, 650);
-- INSERT INTO orders (customer_id, order_price) VALUES (105, 890);


-- INSERT INTO users (costomer_id, costomer_name) VALUES (101, "Vanya");
-- INSERT INTO users (costomer_id, costomer_name) VALUES (102, "Petya");
-- INSERT INTO users (costomer_id, costomer_name) VALUES (104, "Sergey");
-- INSERT INTO users (costomer_id, costomer_name) VALUES (105, "Olga");


-- SELECT 
-- 	costomer_name
-- FROM users
-- WHERE costomer_id IN (
--     SELECT 
-- 		customer_id
-- 	FROM orders
--     WHERE order_price >=1500		
-- );

-- Задание 1
-- Найти имена техт студентов которых средний балл быше среднего в своем факультете
-- students -> id, name, faculty_name, avg_grade

-- DROP DATABASE IF EXISTS studentsDB;
-- CREATE DATABASE studentsDB;

-- USE studentsDB;
-- DROP TABLE IF EXISTS students;
-- CREATE TABLE students (
-- 	id INTEGER,
--     student_name VARCHAR(120),
--     faculty_name VARCHAR(120),
--     avarage_grade DECIMAL (2,1)
-- );

-- INSERT INTO students VALUES (1, "Vitali", "Engineering", 3.8),
-- 							(2, "Olga", "IT", 4.4),
--                             (3, "Sergey", "Law", 2.1),
--                             (4, "Peter", "Engineering", 6.8),
--                             (5, "Nikolay", "Engineering", 4.8);
-- SELECT 
-- 	student_name,
--     avarage_grade,
--     faculty_name
-- FROM students
-- WHERE avarage_grade > (
-- 	SELECT 
-- 		AVG (avarage_grade)
--     FROM students
--     WHERE faculty_name = students.faculty_name
-- );


-- Пример 2 Подзапрос использовать в качестве источника данных
-- Соеденить таблицы пользователей из NY, и пользователей из WS. Показать техт пользователей
-- которые младше 22 лет
-- USE learn2;
-- SELECT * FROM users_washington;  

-- SELECT
-- 	*
-- FROM (
-- 	SELECT
-- 		id
--         name,
--         lastname,
--         age,
--         phone
-- 	FROM users_washington
-- 	UNION ALL
-- 	SELECT
-- 		id
--         name,
--         lastname,
--         age,
--         phone
-- 	FROM users_ny
-- ) t1
-- WHERE age <= 22;

-- Задача 2
-- Сделать запорс, который выберает все продукты, 
-- у которых цена выше средней цены всех продуктов.
-- products -> id, name, price, qnt
-- CREATE DATABASE SUBQUERIES_SORUCE;
-- USE SUBQUERIES_SORUCE;

-- DROP TABLE IF EXISTS prodcuts;
-- CREATE TABLE prodcuts (
-- 	id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(128),
--     price INT,
--     qnt INT
-- );

-- INSERT INTO prodcuts (name, price, qnt) VALUES ("ProductA", 2000,5),
-- 											   ("ProductB", 3000,1), 
--                                                ("ProductC", 1500,3), 
--                                                ("ProductD", 1999,2), 
--                                                ("ProductE", 2100,2);
-- SELECT 
-- 	name,
--     price
-- FROM prodcuts
-- WHERE price > (
-- 	SELECT AVG(price)
--     FROM prodcuts
-- );



-- Дата

-- Пример 1
-- str_to_date - получение даты из строки.
-- Первым аргументом у нас идет дата
-- Вторым аргументом у нас идет формат
-- SELECT str_to_date("2000-07-01 00:00:00", "%Y-%m-%d %H:%i:%i") AS date;

-- Пример 2. Как брать текущею дату
-- SELECT curdate(); -- '2023-06-08' получает текущею дату
-- SELECT now(); -- '2023-06-08 13:22:32' возвращает текущею дату и время
-- SELECT sysdate(); -- '2023-06-08 13:23:01' возвращает текущею дату и время
-- разница now/sysdate. Now нам возвращает дату именно во время запуска скрипта. 
-- sysdate возвращает дрема когда была вызвана данная функция

-- Пример 3. Как взять значение из даты 
-- SELECT extract(hour from str_to_date("2000-07-01 00:00:00", "%Y-%m-%d %H:%i:%i")); -- 7 (июль)
-- hour, minutes, year ... 


-- Пример 4. Как добавлять к дате определенный интервал
-- SELECT date_add("2000-07-01 00:00:00", interval 5 day); -- ->  '2000-07-06 00:00:00'
-- SELECT date_add("2000-07-01 00:00:00", interval -5 day); -- -> '2000-06-26 00:00:00'
    
-- Пример 5. Расчет разницы между датами
-- SELECT datediff("2000-07-01 00:00:00", "2000-07-10 00:00:00") -- -> -9
-- Первым аргументом идет число которое сравниеваем
-- Вторым аргументом идет число с которое сравниеваем
-- Результат может быть отрицательным и положительным. Если отрицательный означает что первая дата
-- раньше второй на n-ое количество дней


-- Задание 1 найти заказы которые были совершенны в марте
-- USE shop;
-- SELECT * FROM orders;

-- SELECT 
-- 	* 
-- WHERE month(ODATE) = 3;
-- -- month берет значение месяца

-- Задание 2
-- Найти все покупки которые были сделаны в интервале с 10 марта 2022 года по 10 апреля 2022 года
-- SELECT 
-- 	*
-- FROM orders
-- WHERE date(ODATE) BETWEEN "2022-03-10" AND "2022-04-10";
-- date берет значение даты

-- задание 3
-- Найти средную стоимость заказа за март
-- SELECT 
-- 	avg(amt) as avg_order_in_mart
-- FROM orders
-- WHERE month(ODATE) = 3;

-- задание 4
-- Определить какие покупки бтли сделаны во вторник
-- SELECT
-- 	*
-- FROM orders
-- WHERE weekday(ODATE) = 1;
-- метод weekday начинает расчет с 0 (понедельник)
-- SELECT
-- 	*
-- FROM orders
-- WHERE dayofweek(ODATE) = 3;
-- метод dayofweek начинает расчет с 1 (воскресенье)


-- Агрегация

-- Пример 1
-- DROP DATABASE IF EXISTS paymenstsDB;
-- CREATE DATABASE paymenstsDB;

-- USE paymenstsDB;

-- DROP TABLE IF EXISTS payments;
-- CREATE TABLE payments(
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(128),
--     amount INT
-- );


-- INSERT INTO payments (name, amount) VALUES ("Anya", 500),
-- 										   ("Jenya", 1200),
-- 										   ("Gena", 222),
-- 										   ("Alexei", 120);
-- -- выведется ошибка поскольку в агрегационном запорсе вызываем не агрегазионное поле                 
-- SELECT
-- 	name,
-- 	avg(amount) as avg_amount_of_transactions
-- FROM payments;
-- -- Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'paymenstsdb.payments.name'; this is incompatible with sql_mode=only_full_group_by


-- Задание 1 найти самую высокю зп в таблице сотрудников из БД hr;
-- USE hr;
-- SELECT
-- 	max(salary) as max_salary
-- FROM employees;
	
-- Задание 2 найти количество сотрудников
-- SELECT
--  count(*) as qount_of_employees 
-- FROM employees;

-- Задание 3 (подзапорс). Найти имя и фамилия сотрудника с самой высокой зп
-- SELECT 
-- 	first_name,
-- 	last_name,
--     salary
-- FROM employees
-- ищем того сотрундика у которого зп = результату подзапрос (максимальной зп)
-- WHERE salary = (
-- -- делаем подзапрос для получения самой высокой зп
-- 	SELECT
-- 		max(salary)
-- 	FROM employees
-- );
	


