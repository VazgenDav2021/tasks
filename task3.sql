
-- SELECT left ('мой доеогой друг', 3) AS value;
-- SELECT right ('мой доеогой друг', 4) AS value;
-- SELECT substring('мой дорогой друг', 5, 2) AS value;
-- SELECT substring('мой дорогой друг', 5) AS value;
-- SELECT replace('8 800 700 88 88', ' ', '-') AS value;
-- SELECT lower('ПрИвет МоЙ ДрУг') AS value;
-- SELECT upper('ПрИвет МоЙ ДрУг') AS value;



-- USE learn;

-- SELECT 
-- 	id,
--     concat('Очень хорошие', ' ' , title) as new_title,
--     pow(price,2) as new_price
-- FROM products;


-- USE hr;

-- SELECT sum(salary) AS total_sum FROM employees;
-- SELECT sum(
-- 	CASE
-- 		WHEN salary < 1000
-- 			THEN 0
-- 		ELSE salary
-- 	END

-- ) AS total_sum FROM employees;

-- SELECT avg(salary) AS avg_sallary FROM employees;







-- Создание таблицы, важно учтивывать что при добавлении каждой колонки надо ставить запятую, кроме последней
-- CREATE TABLE users (
-- 	   name varchar(64), тип данных строка, которая принимает не больше 64 символов (чаще всего пишут 2 в какой то степени)
--     lastname varchar(64),тип данных строка, которая принимает не больше 64 символов   (чаще всего пишут 2 в какой то степени)
--     age integer тип данных целое число (1, -1, 0) но не как (1.4, 5.6 -10.3)
-- );


-- DROP TABLE  users; --Удаление таблицы, если таблицы нет и мы заного вызовем комдану упадет ошибка (мол такой таблицы и так нет) 
-- CREATE TABLE users (
-- 	   name varchar(64),
--     lastname varchar(64),
--     age integer
-- );



-- DROP TABLE IF EXISTS users; -- Данная комманда очень полезна для пересоздания, означает "если таблица есть удали если нет то не удалай" 
-- CREATE TABLE users (
-- 	name varchar(64),
--     lastname varchar(64),
--     age integer
-- );

-- INSERT INTO users values ("Иван", "Иванов", 29);  -- Добацление данных в таблицу 
-- INSERT INTO users (name, lastname, age) values ("Иван", "Иванов", 29); -- более правельный подход добавления, сначала указываем очереднесть входных данных


-- Если мы хотим добавить несколько пользователей можем сдлеать так
-- INSERT INTO users values ("ас", "Иванов", 29);
-- INSERT INTO users values ("Иван", "Иванов", 29);
-- INSERT INTO users values ("Иван", "Иванов", 29);


-- Но если так выглядит более лаканично
-- INSERT INTO users (name, lastname, age) VALUES ("Иван", "Иванов", 29), 
-- 											   ("Иван", "Иванов", 29);






-- use learn;
-- DROP TABLE IF EXISTS users;
-- CREATE TABLE users (
-- 	name varchar(64),
--     lastname varchar(64),
--     age integer
-- );
-- INSERT INTO users VALUES ("ас", "Иванов", 29);	
-- commit; // здесь мы коммитим наши изменения, чтобы вспомнить разницы выключите автокомит 
-- (заходим в query в верхней панеле и выключаем auto-commit transactions), посмотите нашу лекцию чтобы обновить знания (DML DDL TCL DCL)
-- SELECT * FROM users;



-- Пример - 9 
-- USE learn;
-- SELECT * FROM products;
-- SET SQL_SAFE_UPADTES = 0; -- Нам необходимо задать параметр “SQL_SAFE_UPDATES” = 0, таким образом мы даем возможность изменять и удалять данные.
-- Без этого  в MySQL у нас такой возможности не будет, по умалчаниж здесь значение единица, таким образом MySQL ограждает нас от того чтоб мы случайно не удалили или изменили данные
-- DELETE FROM products
-- WHERE title = 'велосипед'; -- Удаляем тот продукт у которого название 'велосипед' 			

-- delete from products;	-- удаляет все значения из таблицы, тут ключевое 'значение', то есть оператор предназначен для работы с данными (повториь DML DDL TCL DCL)


-- insert into products (title, price, discount) values
--         ('велосипед',50000,0.9),
-- 		('ролики',15000,0.1),
-- 		('лыжи',2500,null),
-- 		('самокат',30000,0.8),
-- 		('сноуборд',30000,0.9),
-- 		('санки',1000,null);
        
-- truncate table products; -- удаление таблицы (повториь DML DDL TCL DCL)


-- UPDATE products
-- SET price = 30000
-- WHERE title = 'лыжи' -- Изменить цену товаров, у которых title 'лыжи' 


-- UPDATE products
-- SET discount = 1
-- WHERE discount IS NULL; -- изменить скидку у техт товаров у которых скидка null

-- UPDATE products
-- SET price = price * 2; -- умножить сумму на 2 у всех товаров (если не пишем условие то данная манипуляция отработает на всех данных)
-- SELECT * FROM products;



-- USE products;
-- CREATE TABLE expenssive_products AS -- создание новой таблице на основе результата выборке другой, создаем новую таблицу expenssive_products,
-- на основе таблицы products и помещем те товары  у которых цена > 50000
-- 	SELECT * from products
--     WHERE price > 50000;
--     
-- SELECT * from ankap2;




-- CREATE TABLE tmp_table as 
-- 	SELECT
-- 		title,
--         price
-- 	FROM products
--     WHERE 1=0; -- здесь создаем новую таблицу tmp_table на основе products, просото пишем 1=0 чтобы условие было неверно и таблица tmp_table была пуста, только взяля поля title и price
--     
-- INSERT INTO tmp_table (title,price)
-- 	SELECT
-- 		title,
--         price
-- 	FROM expenssive_products; -- добавляем в пустую таблицу tmp_table товары из expenssive_products
 






