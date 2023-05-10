-- USE learn;

-- -- DROP TABLE IF EXISTS tmp_table;
-- -- CREATE TABLE tmp_table AS
-- -- 	SELECT
-- -- 		*
-- -- 	FROM products
-- -- 	WHERE price > 4000;


-- SELECT 
-- * 
-- FROM tmp_table;


-- CREATE TABLE expessinve_products AS
-- 	SELECT
-- 		*
-- 	FROM products
--     WHERE 1=0;
--     
-- SELECT * FROM expessinve_products;


-- INSERT INTO expessinve_products(id,title,price,discount)
-- 	SELECT 
-- 		*
-- 	FROM products
--     WHERE price > 4000;

-- SELECT * FROM expessinve_products;


-- CREATE VIEW v_expessinve_products AS
-- 	SELECT
-- 		*
-- 	FROM expessinve_products
-- 		WHERE price >= 40000;
--         
-- SELECT * FROM v_expessinve_products;


-- SELECT * FROM products;

-- 1 переминование таблицы 
-- ALTER TABLE products
-- RENAME TO my_products;
-- SELECT * FROM my_products;

-- 2 добавление нового столбца
-- ALTER TABLE my_products
-- ADD COLUMN price_in_dollar integer;
-- SELECT * FROM my_products;

-- 3 изменение типа данных
-- ALTER TABLE my_products
-- MODIFY COLUMN title varchar(24);

-- 4 удаление столбца
-- ALTER TABLE my_products
-- DROP COLUMN price_in_dollar;
-- SELECT * FROM my_products;

-- 5 изменение значение в столбце 
-- UPDATE my_products
-- SET title = 'дорогой'
-- WHERE title LIKE "ролики";
-- SELECT * FROM my_products;

    
    





-- 1. Создайте таблицу goods (id, title, quantity)
-- Добавте данные ('велосипед', 4), ('лыжи',  5), (коньки',  7), ('скейт', 2).

-- CREATE TABLE goods (
-- 	id INTEGER PRIMARY KEY AUTO_INCREMENT,
--  title VARCHAR(128),
--  quantity INTEGER CHECK(quantity BETWEEN 0 AND 100)
-- );


-- INSERT INTO goods (title, quantity) VALUES ("Велосипед", 3);
-- INSERT INTO goods (title, quantity) VALUES ("Лыжи", 10);
-- INSERT INTO goods (title, quantity) VALUES ("Скейт", 2);
-- INSERT INTO goods (title, quantity) VALUES ("Коньки", 5);

-- SELECT * FROM goods;

-- 2. Добавьте поле price (integer) со значением по умолчанию 0
-- Проверьте содержимое таблицы
-- ALTER TABLE goods
-- ADD COLUMN price INTEGER DEFAULT 0;
-- SELECT * FROM goods;

-- 3. Измените тип у price на numeric (перед изменением очситите поле "... set price = null")
-- UPDATE goods
-- SET price = null;
-- SELECT * FROM goods;
-- ALTER TABLE goods
-- MODIFY price NUMERIC(8,2);
-- Измените тип обратно на integer
-- ALTER TABLE goods
-- MODIFY price INTEGER;
-- 4. Переименуйте поле на item_price
-- ALTER TABLE goods
-- CHANGE price item_price integer;
-- SELECT * FROM goods;
-- Удалите это поле 
-- ALTER TABLE goods
-- DROP COLUMN item_price;
-- SELECT * FROM goods;


--  1. Создать таблицу students с полями:
-- name (не null)
-- lastname (не null)
-- avg_mark (от 0 до 5)
-- gender varchar(128) (или “M” или “F”)


-- 2. Добавить 5 записей студентов
-- Олег Петров 4.3 M
-- Семен Степанов 3.1 M 
-- Ольга Семенова 4.7 F 
-- Игорь Романов 3.1 M 
-- Ирина Иванова 2.2 F

-- 3. Добавить поле id integer primary key auto_increment
-- 4. Поменять тип у gender на char(1)
-- 5. переименовать поле name на firstname


-- 6.
-- - найти учеников, у которых оценка больше 4
-- - найти учеников, у которых не входит в диапазон от 3 до 4
-- - найти учеников, у которых имя начинается на И
-- - найти учеников, у которых оценка 2.2 или 3.1 или 4.7   


-- 7.Создать представление, которое содержит всех мужчин

-- 8. Создать представление, которое содержит всех женщин

-- 9. Увеличить всем учащимся оценку в 10 раз


-- 10.  Поменяйте у Олега Петрова фамилию на Сидоров

-- 11.  Для всех учеников, у которых оценка не больше 31 увеличить на 10