use gt290424;

 create table users(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    salary decimal(10, 4)
 );
 
--  decimal(N, M) - N - кол/во цифр(до и после точки), M - кол/во цифр после точки
 
 insert into users(first_name, last_name, salary)
 values ('John', 'Smith', 2300.5),
		('Bob', 'Brown', 1500.234),
        ('Ben', 'Jameson', 2760.467);
        
-- Функции для работы с числами

-- round - В качестве первого параметра передается число. 
-- Второй параметр указывает на длину. Если длина представляет положительное число, то оно указывает,
-- до какой цифры после запятой идет округление. Если длина представляет отрицательное число, то оно указывает, 
-- до какой цифры с конца числа до запятой идет округление

select round(12.5); -- 13
select round(12.342567, 2); -- 12.34
select round(1234.2345, -2); -- 1200

-- Округлить зарплаты и вывести
select round(salary)
from users;

-- ceiling - возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(12.1); -- 13
select ceiling(12.6); -- 13
select ceiling(12.0000001); -- 13

-- floor - возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(12.9); -- 12
select floor(12.2); -- 12
select floor(12.999999999999999); -- 12

-- Увеличить зарплаты на 10%, округлить и вывести.
select round(salary + (salary * 10 / 100))
from users;

-- abs - возвращает абсолютное значение числа
select abs(-30); -- 30

-- power - возводит число в определенную степень.
select power(5, 2); -- 25
select power(9, 3); -- 729

-- sqrt - получает квадратный корень числа.
select sqrt(225); -- 15

-- rand - генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select rand(); -- диапазон 0 - 1
select round(rand()*10); -- диапазон 0 - 10

-- Функции для работы со строками

-- concat - объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить.
select concat('John', ' ', 'Smith');

select concat(first_name, ' ', last_name) as full_name
from users;

-- length - возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину:
select length('John Smith'); -- 10

-- trim - удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('  John Smith '); -- 'John Smith'

-- ltrim - удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('  John Smith '); -- 'John Smith '

-- rtrim - удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select rtrim('  John Smith '); -- '  John Smith'

-- left - вырезает с начала строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с начала строки:
select left('iphone 16 pro', 6); -- 'iphone'

-- right - вырезает с конца строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с конца строки
select right('iphone 16 pro', 6); -- '16 pro'

-- substring(string, start[, length]) - вырезает из строки string подстроку, начиная с позиции start. 
-- Третий необязательный параметр передает количество вырезаемых символов
select substring('iphone 16 pro', 8); -- '16 pro'
select substring('iphone 16 pro', 8, 2); -- '16'

-- reverse - переворачивает строку наоборот:
select reverse('John'); -- 'nhoJ'

-- replace(search, find, replace) - заменяет в строке search подстроку find на подстроку replace. 
-- Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий - подстрока, на которую надо заменить:
select replace('iphone 17 pro', '17', '16'); -- 'iphone 16 pro'

-- select replace(PRODUCT_DESCRIPTION, 'Monitor', 'monitor')
-- from product_information;

-- lower - переводит строку в нижний регистр:
select lower('John Smith'); -- 'john smith'

-- upper - переводит строку в верхний регистр
select upper('John Smith'); -- 'JOHN SMITH'

-- В таблице users создать поле full_name, которое будет содержать имя и фамилия сотрудника
alter table users
add column full_name varchar(265);

set sql_safe_updates = 0;

update users
set full_name = concat(first_name, ' ', last_name);

select * from users;

select * from employees;

-- Создать поле new_department, где вместо Human Resources из department записан HR.
alter table employees
add column new_department varchar(128);

update employees
set new_department = replace(department, 'Human Resources', 'HR');

select * from employees;

-- Из таблицы employees вывести первые четыре символа из email в нижнем регистре
select lower(left(email, 4))
from employees;

-- Создать новое поле new_email и заполнить эмейлами(в нинжнем регистре) сотрудников добавив в конце сторки '@gmail.com'
-- 'SKING'
-- sking@gmail.com
alter table employees
add column new_email varchar(128);

update employees
set new_email = concat(lower(email), '@gmail.com');

select * from employees;

-- Условные операторы
-- Функция CASE проверяет истинность набора условий и в зависимости от 
-- результата проверки может возвращать тот или иной результат. Эта функция принимает следующую форму:

-- case
-- 	   when условие1 then действие/результат
--     when условие2 then действие/результат
--     when условие3 then действие/результат
--     ...
--     else альтернативный результат
-- end

-- Можно использовать с select оператором и с update оператором

-- Вывести имена, фамилии и зарплаты сотрудников, и новое поле salary_cat со значением:
-- high, если зарлата больше 20000
-- low, если зарплата меньше/равно 20000
select first_name, last_name, salary, case
											when salary > 20000 then 'High'	
                                            when salary <= 20000 then 'Low'
										end as salary_cat
from employees;

-- Создать новое поле salary_cat и заполнить:
-- high, если зарлата больше 20000
-- low, если зарплата меньше/равно 20000

alter table employees
add column salary_cat varchar(10);

update employees
set salary_cat = case
						when salary > 20000 then 'High'
						else 'Low'
				  end;
                                    
select * from employees;

-- Создать новое поле emp_level и заполнить:
-- Junior, если зарплата меньше 5000
-- Middle, если зарплата больше/равно 5000 и меньше 15000
-- Senior, если больше/равно 15000

alter table employees
add column emp_level varchar(20);

update employees
set emp_level = case
					when salary < 5000 then 'Junior'
                    when salary < 15000 then 'Middle'
					else 'Senior'
				end;
                
select * from employees;
