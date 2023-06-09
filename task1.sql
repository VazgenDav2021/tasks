create database market;

-- Создание базы данных (когда запустете эту строчку, в левом углу он может не вывестись, поэтому перезагрузите его нажав кнопку перезагрузки)
use market;

-- Этот скрипт говорит нашему окружению что мы будем работать именно с этой базой данных, а не с другой
create table products(
    -- После создание баз данных, мы создаем таблицу, у базы данных может быть их несколько
    id integer primary key auto_increment,
    -- Здесь мы передаем параметр под названием "id", даем тип integer-число, primary key - указывает что это значение будет использоваться в качестве первичного ключа, auto_increment - будет автоматочески увеличиватся значение
    title varchar(128),
    -- Здесь мы передаем параметр "title", даем типт varchar(128) - тип строка до 128 символов
    price integer,
    -- Здесь мы передаем параметр "price", у которого тип данных integer - число
    discount decimal(2, 1) -- Здесь мы передаем параметр "discount", у которого тип данных decimal - число который будет содержать десятичные значения с двумя знаками после запятой и одним знаком до запятой
);

-- Очень важно!!!! между добавленными параметрами ставится запятая, а у конечного параметра нечего не ставится, при закрывании скобок ставится ;.
-- Добавляем в таблицу информацию, важно помнить что эту часть надо вызвать 1 раз, ото в таблице у нас будут дубликаты значении
insert into
    products (title, price, discount)
values
    ('велосипед', 50000, 0.9),
    ('ролики', 15000, 0.1),
    ('лыжи', 2500, null),
    ('самокат', 30000, 0.8),
    ('сноуборд', 30000, 0.9),
    ('санки', 1000, null);

-- Формируем наши выборки, важно помнить что выборка только отаброжает. Она не хранит никакие значение
select
    *
from
    products;

-- SELECT- начало выборки (то есть мы хотим получить информацию), *(все значение из таблицы), from products (указывается та таблица откуда мы хотим взять информацию)
select
    title
from
    products;

-- Тут все по аналогии как наверху, только мы тут берем не все поля а только поле "title", можно взять другие поля тоже поменяв "title" например на "price" 
select
    title,
    price
from
    products;

-- Тут все по аналогии как наверху, только мы тут берем не все поля а только поле "title" и "price", можно взять несколько полей одновременно
-- Очень часто нам нужно делать филтрацию во время формирование выборки для этого на поможет оператор "where" 
select
    *
from
    products
where
    price = 50000;

-- Тут мы указали что мы хотим все поля у которых цена ровна 50.000
select
    title
from
    products
where
    price = 50000;

-- Тут мы указали что мы хотим  поля "title", у которого цена ровна 50.000. Можно выбрать несколько полей как и на нерхнем примереalter
-- Пример больше, меньше, строгое сравнение и ровно работают анолагично, важно запомнить что знак не ровно пишется так "<>", можно использовать " !=" но это не соответсвует стандартам языка поэтому лучше не использовать
-- Moжно указывать несколько условиий к примеру 
select
    *
from
    products
where
    price = 50000
    and title = 'велосипед';

-- Дорогие коллеги все эти примеры вам помогут решить домашнее задание, несколько примеров я не написал специально, чтоб вы постепенно начали улучшать свои навыки по самостоятельному нахождению информации.
-- Eсли у вас возникнут проблемы с нахождением информации, то крайне рекомнедуется напистаь вашему члену команды, членам команды которые нашли нужные сведения, помогайте вашим коллегам, так как завта они могут помоч вам)))