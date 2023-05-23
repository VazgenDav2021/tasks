USE learn;

-- 1
-- CREATE TABLE users (
-- 	firstname VARCHAR (5),
--     lastname VARCHAR(44),
--     age integer
-- );
-- INSERT INTO users values ("Vazgen", "Davtyan", 23); -- Error Code: 1406. Data too long for column 'firstname' at row 1
-- INSERT INTO users values ("Olga", "Dubrova", 23);

-- 2
-- DROP TABLE users;
-- CREATE TABLE users (
-- 	firstname VARCHAR(44),
--     lastname VARCHAR(44),
--     age integer
-- );
-- INSERT INTO users values ("Vazgen", "Davtyan", 23);
-- INSERT INTO users values ("Olga", "Dubrova", 44);

-- SELECT * FROM users;


-- 3
-- DROP TABLE users; -- Error Code: 1051. Unknown table 'learn.users'
-- DROP TABLE IF EXISTS users; -- если таблица есть то удали, если нет то нечего делай
-- CREATE TABLE users (
-- 	firstname VARCHAR(44),
--     lastname VARCHAR(44),
--     age integer
-- );

-- INSERT INTO users values ("Vazgen", "Davtyan", 23); 
-- INSERT INTO users values ("Olga", "Dubrova", 44);

-- SELECT * FROM users;


-- 4
USE learn;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	firstname VARCHAR(44),
    lastname VARCHAR(44),
    age integer
);


-- Так писать не стоит 
-- INSERT INTO users values ("Vazgen", "Davtyan", 23); 
-- INSERT INTO users values ("Dubrova", "Olga", 44);

-- Лучше писать так, потому что мы задаем очередность входных данных
-- INSERT INTO users (firstname,lastname, age) values ("Vazgen", "Davtyan", 23); 					
-- INSERT INTO users (lastname,firstname, age) values ("Олга", "firstname", 44);


-- "Идеальный код"

-- INSERT INTO users (firstname,lastname, age) values ("Vazgen", "Davtyan",23),
-- 												   ("Olga", "Dubrova",44),
--                                                    ("Dima", "Ivanov",12),
--                                                    ("Sergey", "Antonov",45);
--                                                    

-- SELECT * FROM users;




-- расмотрим commit, если мы отключим автокомит изменения нужно комитить, 
-- Если добавим информацию она у нас локалъко
-- будет показыватся, но когда мы отключемся и заного подключемся введенные данные пропадут
-- USE learn;
-- SELECT * FROM users; 
-- INSERT INTO users (firstname,lastname, age) values ("Nikolay", "Nikolayev",102);
-- commit;

-- Уделнием данных будет ошибка
-- DELETE FROM products
-- WHERE title = "лыжи"; -- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- SELECT * FROM products;


-- Уделнием данных, успешно
-- SET SQL_SAFE_UPDATES = 0; -- Здесь мы отключаем режим "безопасных изменений", =>  SQL_SAFE_UPDATES становится false (0 => false), (1 => true)
-- DELETE FROM products
-- WHERE title = "лыжи"; -- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- SELECT * FROM products;


-- Удаление таблицы 1
-- SET SQL_SAFE_UPDATES = 0;
-- DELETE FROM products;
-- Удаление таблицы 2
-- TRUNCATE products;
-- SELECT * FROM products;
-- SELECT * FROM users;

-- Изменение данных 
-- UPDATE users
-- SET lastname = "Baghramyan"
-- WHERE firstname = 'Vazgen';
-- SELECT * FROM users;


-- Задание

-- 1. Создайте таблицу goods (id, title, quantity)
-- 2. Добавьте несколько строк
-- 3. Изменить у товара “”помидор” количество на 100
-- 4. Удалить товар под названием “помидор"

-- 1
use learn;
create table goods(
id integer primary key,
title varchar(128),
quantity integer
);
-- 2
insert into goods (id, title, quantity) values(1, 'помидор', 5);
insert into goods (id, title, quantity) values(2, 'арбуз',  5);
insert into goods (id, title, quantity) values(3, 'вишня',  7);


-- 3 
UPDATE goods
SET quantity = 100
WHERE title = 'помидор';


--  4 
DELETE FROM goods
WHERE title =  'помидор';

 