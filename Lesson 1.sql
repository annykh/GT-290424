-- comment 

/*
comment
*/

/* select поле1, поле2,... 
from название_таблицы; */

-- Вывести всех покупателей (Вывести таблицу Customers)
-- * - все поля
/* select *
from customers; */

/* select поле1, поле2,... 
from название_таблицы
where Условие; */

-- Вывести покупателей, которым больше 25.
/* select *
from customers
where age > 25; */

-- Вывести имена и фамилии всех покупателей.
/* select first_name, last_name
from customers; */

-- Вывести покупателей в возрасте от 25 до 30(вкл.концы).
/* select *
from customers
where age >= 25 and age <= 30; */

-- where column between min and max

/* select *
from customers
where age between 25 and 30; */

-- Вывести покупателей, которым больше 30 или меньше 25.
/* select *
from customers
where age > 30 or age < 25; */

/* select *
from customers
where age not between 25 and 30; */

-- Вывести таблицу Orders 
/*select *
from orders;*/

-- Вывести те заказы, где сумма заказа(amount) больше 1000
/*select *
from orders
where amount > 1000;*/

-- Вывести только имена товаров и ид покупателей из таблицы Orders
/*select item, customer_id
from orders;*/


-- Вывести имена тех товаров из Orders, сумма заказа которых больше/равно 500 и меньше/равно 1000 .
/*select item
from orders
where amount between 500 and 1000;*/

-- Вывести покупателей из USA или из UK.
/*select *
from customers
where country = 'USA' or country = 'UK';*/

-- where column in (value1, value2, ..)

/*select *
from customers
where country in ('USA', 'UK');*/

-- Вывести покупателей, имя которых не John и не David.
/*select *
from customers
where first_name != 'John' and first_name != 'David';*/

/*select *
from customers
where first_name not in ('John', 'David');*/

-- LIKE
-- % - соответствует любой подстроке, которая может иметь любое количество символов, при этом подстрока может и не содержать ни одного символа

-- 'd%' - строка, которая начинается на букву Д
-- '%.com' - строка, которая заканчивается на '.com'
-- '%ab%' - строка, которая содержит подсторку 'ab'

-- _ - соответствует любому одиночному символу

-- '_b%' - строка, где вторая буква Б
-- '____' - строка из 4 символов
-- '___a' - строка из 4 символов, первые 3 любые, а последняя буква А

-- Вывести покупателей у которых фамилия начинаетя на R.
/*select *
from customers
where last_name like 'r%';*/

-- Вывести покупателей у которых фамилия заканчивается на E
/*select *
from customers
where last_name  like '%e';*/

-- Вывести покупателей у которых имя содержит букву B.
/*select *
from customers
where first_name like '%b%';*/

-- Вывести покупателей у которых в имени вторая буква O.
/*select *
from customers
where first_name like '_o%';*/

-- Вывести покупателей у которых в имени четвертая буква N.
/*select *
from customers
where first_name like '___n%';*/

-- Вывести покупателей у которых в середине имя есть буква B.
/*select *
from customers
where first_name like '_%b%_';*/

-- номер не был указан
-- where phone is null

-- указан номер
-- where phone is not null
