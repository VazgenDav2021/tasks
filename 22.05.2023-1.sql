-- 1 Константые величины
-- SELECT "Vazgen";

-- 2 Константые величины через алиасы
-- SELECT -1 AS number;



-- Числа

-- ABS - возвращает абсолютное значение числа 
-- SELECT ABS(-1) AS value;
-- SELECT ABS(1) AS value;

-- POW - возвышение числа в степень, принимает 2 параметра, 1ый число которые возводим в степень, 2ое число степени (3)
-- SELECT POW(2,3) AS value;


-- ROUND - округление числа
-- SELECT ROUND(3.2) AS value;
-- SELECT ROUND(3.4) AS value;
-- SELECT ROUND(3.5) AS value;
-- SELECT ROUND(3.6) AS value;

-- SQRT - получает корень квадратный из числа
-- SELECT SQRT(144) AS value;
-- SELECT SQRT(4) AS value;
-- SELECT SQRT(25) AS value;



-- 1 Найти сумму зарплат тех сотрудников, которые зарабатывают больше 10000

-- USE hr;

-- SELECT SUM(salary) AS total_salary
-- FROM employees
-- WHERE salary > 10000; -- нет смысла


-- SELECT SUM(
-- 	CASE
-- 		WHEN salary > 10000 THEN salary
--         ELSE  0
-- 	END
-- ) as sum_of_all FROM employees;


-- avg - возвращает среднее значение. Прибавляем значениия у делим на количсетво. 100,200,300 =>
--  (100 + 200 + 300) / 3


-- 2 Найти среднюю зарплату тех сотрудников, которые зарабатывают меньше 10000

--  1, 2, 3, null => 1,2,3 => (1 + 2 + 3) / 3 => 2
-- SELECT AVG(
-- 	CASE
-- 		WHEN salary < 10000 THEN salary
--         ELSE  NULL
-- 	END
-- ) as sum_of_all FROM employees; --  '5129.545455'


-- 1, 2, 3, 0 => 1, 2, 3, 0 =>  (1 + 2 + 3 + 0) / 4 => 1.5
-- SELECT AVG(
-- 	CASE
-- 		WHEN salary < 10000 THEN salary
--         ELSE  0
-- 	END
-- ) as sum_of_all FROM employees; --  '4218.691589'


-- СТРОКИ

-- concat помоагает слить строки воядина, принимает неограноченное кол-о аргументов
-- SELECT CONCAT("Привет", "Друг") AS value;
-- SELECT CONCAT("Привет ", "Друг") AS value;
-- SELECT CONCAT("Привет", " Друг") AS value;
-- SELECT CONCAT("Привет", " ", " Друг") AS value;

-- CONACT_WS
-- concat_ws помоагает слить строки воядина, принимает неограноченное кол-о аргументов,. 1ый аргумент
-- это разделитель
-- SELECT CONCAT_WS("+", "Привет", "Лучший", "Друг") AS value; 

-- INSERT
-- insert - помогает заменить в строке конкретную подстроку, 1ым аргументам это строка,
-- которую мы хотим изменить, 2ым аргументом идет индекс подстроки с которой мы хотим начать изменать
-- 3им аргументом идет количество символов которое мы хотим изменить, последним идет подстрока которую мы вставляем
-- SELECT INSERT("Привет дорогой друг", 8, 7, "мой") AS value; 
-- SELECT INSERT("Привет дорогой друг", 8, 7, "") AS value; 

-- LENGTH

-- SELECT LENGTH("") AS value;
-- SELECT LENGTH("A") AS value;
-- SELECT LENGTH("AB") AS value;
-- SELECT LENGTH("ABC") AS value;
-- SELECT LENGTH("AB C") AS value;


-- SELECT LENGTH("А") AS value;
-- SELECT LENGTH("АБ") AS value;
-- SELECT LENGTH("АВВ") AS value;
-- SELECT LENGTH("АБ В") AS value;

-- trim - помогает убрать лишние пробелы
-- SELECT trim("    привет деуг         ")  AS VALUE;


-- left - помогает взять с лева определенное кол-во символов
-- SELECT left ("Мой друг лучший",3) AS value;


-- right - помогает взять с права определенное кол-во символов
-- SELECT right ("Мой друг лучший",6) AS value;


-- replace - помоагет заменить подстроку везде
-- 1ый аргумент строка, в которой мы хотим сдлеать изменения
-- 2ой аргумент это у нас та подстрока которую мы хотим заменить
-- 3ий аргумент это у нас подстрока на которую мы 
-- SELECT replace("800 700 927 77", " ", "-" ) AS value; '800-700-927-77'


-- substring - позволяет из строки взять подсртоку
-- 1ый строка с котороый будем работать
-- 2ой индекс подстроки с корого начинаме вырезать
-- 3ый (опциональный),  это количество символов для отрезание, Если не ставим то отрежет то конца строки
-- SELECT substring("привет мой друг, как дела",8) AS value;
-- SELECT substring("привет мой друг, как дела",8, 8) AS value;

-- lower
-- SELECT lower("ПрИвЕт") AS value;  -- 'привет'
-- upper 
--  SELECT upper("ПрИвЕт") AS value; -- 'ПРИВЕТ'



-- 1. Сделать первый символ строки в верхнем регисте 



