-- Функции для работы с датами и временем

-- Форматирование даты и времени

-- date_format(date, 'format');

-- '2024-05-25' -> 25 May 24
select date_format('2024-05-25', '%e %M %y');

select * from employees;

select hire_date, date_format(hire_date, '%e %M %Y')
from employees;

-- time_format(time, 'format'); 
select time_format('20:34:20', '%h-%i-%s');

-- '28 March 2024' -> 28.03.24
-- str_to_date + date_format

select date_format(str_to_date('28 March 2024', '%d %M %Y'), '%d.%m.%y');

-- 'Jan 30 2025' -> 30-1-2025
select date_format(str_to_date('Jan 30 2025', '%b %d %Y'), '%d-%c-%Y');

select * from employees;

-- Сотрудники, которых приняли на работу в марте
select * from employees
where month(hire_date) = 3;

-- Сотрудники, которых приняли на работу в марте 1998
select * from employees
where hire_date between '1998-03-01' and '1998-03-31';

-- Сотрудники, которых приняли на работу в марте 1998
select * from employees
where year(hire_date) = 1998 and month(hire_date) = 3;

-- Сотрудники, которых приняли на работу после 1 апреля 1997.
select * from employees
where hire_date > '1997-04-01';
