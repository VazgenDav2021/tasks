-- CREATE DATABASE learn; создание базы данных

-- USE  learn; использование базы данных (очень важно запустить при начале работе, дальше можно не вызывать)

-- create table products(
--  id integer primary key auto_increment,
--     title varchar(128),
--     price integer,
--     discount decimal(2,1)
-- ); // инициализация таблицы, вызываем один раз при начале работы


-- insert into products (title, price, discount) values
-- 	('велосипед',50000,0.9),
--   ('ролики',15000,0.1),
--   ('лыжи',2500,null),
--   ('самокат',30000,0.8),
--   ('сноуборд',30000,0.9),
--   ('санки',1000,null); // добавления продуктов в таблицу, вызываем один раз, если вызывете несколько раз то в таблице появятся дубликаты
  
  
-- select 
-- 	id,
--     discount,
-- 	title
-- from products  
-- where title like 'л%' 
-- 	or price between 10000 and 30000
--     and title like 'к%';


-- SELECT 
-- 	id,
--     discount,
-- 	title
-- FROM products  
-- WHERE title LIKE 'л%' 
-- 	AND price BETWEEN 2000 AND 2501;

-- SELECT
-- 	title,
--     price,
--     price / 80 as price_USD 
-- FROM products; Использование alisa, создание нового поля в выборке, главно учесть что новое поле появляется только в выборке, в таблицу она не попадет


-- SELECT
-- 	price AS price_ud,
-- 	id,
--     discount,
--     title,
--     CASE
-- 		WHEN price BETWEEN 100 AND 3000
-- 			THEN 'Эконом'
-- 		WHEN price BETWEEN 3000 AND 30000
-- 			THEN 'Средний'
-- 		WHEN price BETWEEN 30000 AND 40000
-- 			THEN 'ВИП'
-- 	END AS category_name
-- FROM products; // конструкция WHEN, для проверки условия и на ее основе создание дового поля в выборке "category_name"



-- SELECT
-- 	price AS price_ud,
-- 	id,
--     discount,
--     title,
--     CASE
-- 		WHEN price BETWEEN 0 AND 3000
-- 			THEN 'Эконом'
-- 		WHEN price BETWEEN 3000 AND 30000
-- 			THEN 'Средний'
-- 		ELSE 'ВИП'
-- 	END AS category_name
-- FROM products; // более локаничный написания верхнего примера с использованием оператора THEN




-- Написать выборку, с новум полем (real_price)
-- В real_price будет входить price - (умножения (*) price и discount)
-- Если discount у нас NULL, то умножать на единицу если не null то умножить на дискоунт

-- SELECT
-- 	title,
--     price,
--     discount,
-- 	CASE
-- 		WHEN discount IS NULL
-- 			THEN price * 1
-- 		ELSE price - (price * discount)
-- 	END AS real_price
-- FROM products;


-- SELECT
-- 	title,
--     price,
--     discount,
--     price - price * COALESCE(discount,0) AS real_price
-- FROM products;

-- COALESCE (поле которое проверяется на значение, присвоенное значение когда первый аргумент null)


-- SELECT 
-- 	price 
-- FROM products
-- ORDER BY price; // Оператор ORDER BY - позволяет вам сформировать сортировку на основе выбранного поля (на данном примере это поле "price")


-- SELECT
-- 	title
-- FROM products
-- ORDER BY title DESC; // Оператор DESC - сортирует вашу выборку от большого значения к меньшему


-- SELECT *
-- FROM products
-- ORDER BY price, discount; // Можно делать сортировки по двум, трем и нескольким признаком, важно учитывать что сортировка будет проходить по очереди начиня с первого признака заканчивая до N-ого

-- SELECT *
-- FROM products
-- ORDER BY price DESC, discount DESC; // Пример использование DES по 2ум признакам

-- SELECT 'Vazgen'; // выведение константы

-- SELECT 'Vazgen' AS name; // category_name, просто колонка будет называтся 'name'


-- SELECT abs(-1) as value;  abs - показывает абсолютное число, отбрасыва минус
-- SELECT pow(4,3) as value; pow - возведения числа в степень
-- SELECT round(4.6) as value; round - округления числа согласно мат правилам (пример внизу)
-- SELECT sqrt(144) as value; sqrt - расчет квадараного корня

-- 0.1 - 0.4 -> меньшую сторону
-- 0.5 - 0.9 -> большую сторону


-- 6.6 ->7
-- 6.4 -> 6
-- 6.5 ->7


-- SELECT concat('привет ', 'друг ', 'как ', 'кедла') as value; // concat - конкатенация (склеивание) строки, важно при каждом новой строке указывать разделитель
-- SELECT concat_ws(' ', 'привет', 'друг', 'друг', 'друг', 'друг') as value; //concat_was - делает конкатенацию, плюс в том что один раз ставим разделитель в качестве первого аргумента
-- SELECT insert('Привет дорогой друг', 8, 7, 'дорогойдорогой' ) as value; insert - помогает заменить пдстоку из строки
-- SELECT length('м') as value; // показывает 'длину' строки, важно учесть что при кирилице любой символ будет учитывать как 2 а не 1, поскольку наш компжтер считает длину на основе занимаемого места (байт)
-- SELECT trim('     мой друг      ') as value; // удаляет личние пробелы слева и справа
-- SELECT locate('друг', 'мой друг') as value; // находит место подстроки в строке














