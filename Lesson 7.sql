-- Функции для работы с числами

-- round
-- ceiling
-- floor

-- abs
-- power
-- sqrt
-- rand

-- Функции для работы со строками
-- concat
-- length
-- trim
-- left
-- right
-- substring
-- reverse
-- replace
-- lower
-- upper

-- Условные операторы 
-- case
-- 	when condition1 then result1
--     when condition2 then result2
--     else result
-- end

use gt290424;
select * from employees;

-- Создать поле commission с типом данных decimal(10, 2)
alter table employees
add column commission decimal(10, 2);

-- Заполнить поле commission:
-- Если зарплата больше 3000 и меньше 6000, то 5
-- Если зарплата больше/равна 6000 и меньше 10000, то 10
-- Если зарплата больше/равна 10000, то 20
set sql_safe_updates = 0;

update employees
set commission = case
						when salary > 3000 and salary < 6000 then 5
                        when salary < 10000 and salary >= 6000 then 10
                        when salary >= 10000 then 20
				  end;
                  
select * from employees;

-- Создать поле final_salary decimal(10, 2) и заполнить формулой salary + salary * commission / 100
alter table employees
add column final_salary decimal(10, 2);

update employees
set final_salary = salary + salary * commission / 100;

-- Если коммисия не null, то final_salary = salary + salary * commission / 100
-- Если коммисия null, то final_salary = salary

update employees
set final_salary = case
						when commission is not null then salary + salary * commission / 100
                        else salary
					end;
                    
                    
-- Функция COALESCE принимает список значений и возвращает первое из них, 
-- которое не равно NULL:                  
-- coalesce(value1, value2, value3...)

-- coalesce(7*null+10, null, null*10, 0, 45) -- 0


update employees
set final_salary = coalesce(salary + salary * commission / 100, salary);

select * from employees;

-- Создать поле commission_info с типом varchar(128) и заполнить:
-- Если коммисия не null, строка 'commission%', где commission это значения поля 'commission'
-- Если коммисия null, то 0

alter table employees
add column commission_info varchar(128);

update employees
set commission_info = case
							when commission is not null then concat(commission, '%')
                            else 0
					  end;
                      
update employees
set commission_info = coalesce(concat(commission, '%'), 0);

update employees
set commission_info = if(commission is not null, concat(commission, '%'), 0);

-- Функция IF в зависимости от результата условного выражения возвращает одно из двух значений. 
-- if(Условие, значение1, значени2)
-- Если условие, передаваемое в качестве первого параметра, верно, 
-- то возвращается первое значение, иначе возвращается второе значение. 

-- Вывести имя сотрудника и зарплату, и поле salary_info со значением 'high', если зарплата больше 10000, или 'low' если меньше/равна.
select first_name, salary, if(salary > 10000, 'high', 'low') as salary_info
from employees;

-- Вывести имя и э-мейл сотрудника, и поле email_size со значнием 'Символов больше 5', если кол/во символов в поле email больше 5, либо значение 'Символов достаточно ' в ост. случ.
select first_name, email, if(length(email) > 5, 'Символов больше 5', 'Символов достаточно') as email_size
from employees;

-- Функция IFNULL проверяет значение некоторого выражения. 
-- Если оно равно NULL, то функция возвращает значение, которое передается в качестве второго параметра.
-- ifnull(выражение, значение)

-- Вывести поле salary, commission и поле comm_info со значением 'нет коммиссии', если commission со значением Null
select salary, commission, ifnull(commission, 'нет коммиссии') as comm_info
from employees;


-- Функции для работы с датами и временем

-- Типы данных для даты и времени
-- date - 1 январа 1000 года до 31 декабря 9999(yyyy-mm-dd год-месяц-день). 1000-01-01 до 9999-12-31 (3 байт)
-- time - 838:59:59 до 838:59:59 - hh:mm:ss час:минуты:секунды (3 байт)
-- datetime - yyyy-mm-dd hh:mm:ss (8 байт)
-- timestamp - yyyy-mm-dd hh:mm:ss - 1970-01-10 00:00:01 до 2038-01-19 03:14:07 (4 байт)
-- year - yyyy 1901 до 2155 (1 байт)

-- Текущая дата и время
select now();
select sysdate();
select current_timestamp();

-- Текущая дата
select current_date();
select curdate();

-- Текущее время
select current_time();
select curtime();

-- Парсинг даты и времени

-- DAYOFMONTH(date) возвращает день месяца в виде числового значения
select dayofmonth('2024-08-20');

-- DAYOFWEEK(date) возвращает день недели в виде числового значения
select dayofweek('2024-08-20'); -- (где 1 - sunday)

-- DAYOFYEAR(date) возвращает номер дня в году
select dayofyear('2024-08-20'); -- 233

-- MONTH(date) возвращает месяц даты
select month('2024-08-20');

-- YEAR(date) возвращает год из даты
select year('2024-08-20');

-- WEEK(date [, first]) возвращает номер недели года. Необязательный параметр позволяет задать стартовый день недели. 
-- Если этот параметр равен 1, то первым днем считается понедельник, иначе воскресенье
select week('2024-08-20');
select week('2024-08-20', 1);

-- DAYNAME(date) возвращает название дня недели
select dayname('2024-08-20'); -- 'Tuesday'

-- MONTHNAME(date) возвращает название текущего месяца
select monthname('2024-08-20'); -- 'August'

-- HOUR(time) возвращает час времени
select hour('12:34:45');

-- MINUTE(time) возвращает минуту времени
select minute('12:34:45');

-- SECOND(time) возвращает секунду времени
select second('12:34:45');

-- Функция EXTRACT извлекает из даты и времени какой-то определенный компонент.
-- extract(unit from datetime)

-- Параметр unit может представлять одно из следующих значений:

-- SECOND (секунды)
-- MINUTE (минуты)
-- HOUR (час)
-- DAY (день)
-- MONTH (месяц)
-- YEAR (год)
-- MINUTE_SECOND (минуты и секунды)
-- HOUR_MINUTE (часы и минуты)
-- DAY_HOUR (день и часы)
-- YEAR_MONTH (год и месяц)
-- HOUR_SECOND (часы, минуты и секунды)
-- DAY_MINUTE (день, часы и минуты)
-- DAY_SECOND (день, часы, минуты и секунды)

-- '2024-08-20 11:34:20' 

-- Вывести день
select extract(day from '2024-08-20 11:34:20');

-- Вывести минуты и секунды
select extract(minute_second from '2024-08-20 11:34:20');

-- Вывести день и часы 
select extract(day_hour from '2024-08-20 11:34:20');

-- Вывести год текущей даты и времени
select extract(year from now());

-- STR_TO_DATE преобразует строку в дату, определенного формата.
-- 'August 20 2024' -> 2024-08-20
-- str_to_date('string', 'format');
select str_to_date('August 20 2024', '%M %d %Y'); -- '2024-08-20'

-- 'Jan 18 35' -> yyyy-mm-dd
select str_to_date('Jan 18 35', '%b %d %y'); -- '2035-01-18'

-- 'September 4 2024 14-44-30' -> yyyy-mm-dd hh:mm:ss
select str_to_date('September 4 2024 14-44-30', '%M %e %Y %H-%i-%s'); -- '2024-09-04 14:44:30'
