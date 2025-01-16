-- Агрегатные функции

-- min
-- max
-- sum
-- avg
-- count

-- Найти минимальную зарплату среди сотрудников у которых имя начинается на 'A'.
select min(salary)
from employees
where first_name like 'A%';

-- Найти сумму зарплат сотрудников из департамента 'Human Resources'
select sum(salary)
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep.department_name = 'Human Resources';

-- Найти сотрудников, у которых зарплата меньше чем половина суммы зарплат всех сотрудников
select sum(salary)/2
from employees;

select first_name, last_name
from employees
where salary < (select sum(salary)/2
				from employees);
                
                
-- Вывести список городов, в которых есть сотрудники 
-- с зарплатой ниже средней зарплаты сотрудников в городе Оксфорд.
select distinct city
from locations loc
join departments dep
on loc.location_id = dep.location_id
join employees emp
on dep.department_id = emp.department_id
where emp.salary < (select avg(salary)
					from employees emp
					join departments dep
					on emp.department_id = dep.department_id
					join locations loc
					on dep.location_id = loc.location_id
					where loc.city = 'Oxford');


select avg(salary)
from employees emp
join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id
where loc.city = 'Oxford';

-- Найти сотрудников, которые зарабатывают больше максимальной зарплаты сорудников департамента Shipping.
-- Вывести имена и фамилии сотрудников, а также название департаментов.

select max(salary)
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep.department_name = 'Shipping';

select first_name, last_name, department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
where emp.salary > (select max(salary)
					from employees emp
					join departments dep
					on emp.department_id = dep.department_id
					where dep.department_name = 'Shipping');
                    
                    
-- Вывести имя и фамилию сотрудника с минимальной зарплатой, который работает в городе Seattle.
select min(salary)
from employees emp
join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id
where loc.city = 'Seattle';

select first_name, last_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id
where loc.city = 'Seattle' and emp.salary = (select min(salary)
											from employees emp
											join departments dep
											on emp.department_id = dep.department_id
											join locations loc
											on dep.location_id = loc.location_id
											where loc.city = 'Seattle');
                                            
-- Группировка

-- group by название_поля
-- having условие_фильтрации

-- select
-- from 
-- where
-- join
-- group by
-- having
-- order by/limit

-- Посчитать кол/во сотрудников в каждом департаменте. Вывести ид департамента и кол/во сотрудников.
select department_id, count(employee_id)
from employees
where department_id is not null
group by department_id;

-- Вывести кол/во сотрудников из департаментов 10, 20, 40, 100 по отдельности.
select department_id, count(employee_id)
from employees
where department_id in (10, 20, 40, 100)
group by department_id;

-- Вывести кол/во сотрудников в каждом департаменте, если кол/во больше 10.
select department_id, count(employee_id) as emp_count
from employees
group by department_id
having emp_count > 10;

-- Из департаментов 10, 30, 50 и 100 вывести те, в которых кол/во сотрудников больше 5.
select department_id, count(employee_id) as emp_count
from employees
where department_id in (10, 30, 50, 100)
group by department_id
having emp_count > 5;

-- Вывести максимальные зарплаты по департаментам
select department_id, max(salary)
from employees
group by department_id;

-- SET sql_mode=(SELECT CONCAT(@@sql_mode, ',', 'ONLY_FULL_GROUP_BY'));

select department_name, max(salary)
from employees emp
join departments dep
on emp.department_id = dep.department_id
group by department_name;

-- Вывести те депатраменты, в которых максимальная зарплата выше 10000
-- Вывести имя департмента и зарплату.
select department_name, max(salary) as max_salary
from employees emp
join departments dep
on emp.department_id = dep.department_id
group by department_name
having max_salary > 10000;

-- Посчитать кол/во городов в каждой стране из таблицы locations. 
-- Вывести только те страны(country_id), где кол/во городов больше 3.
select country_id, count(city) as city_count
from locations
group by country_id
having city_count > 3;

-- ПОДЗАПРОСЫ 
-- select column1, column2, ...
-- from table1
-- join (SUBSELECT)
-- on ...

-- Найти имена и фамилии сотрудников с максмальной зарплатой в каждом департаменте
select department_id, max(salary)
from employees
group by department_id;

select first_name, last_name
from employees emp
join (select department_id, max(salary) as max_salary
		from employees
		group by department_id) table_max_salary
on emp.department_id = table_max_salary.department_id
where emp.salary = table_max_salary.max_salary;

-- Найти департамент с наибольшим кол/вом сотрудников.

-- 1. кол/во сотрудников в каждом департаменте
select department_id, count(employee_id) as emp_count
from employees
group by department_id;

-- 2. максимальное кол/во сотрудников 
select max(table_emp_count.emp_count) as max_emp_count
from (select department_id, count(employee_id) as emp_count
		from employees
		group by department_id) table_emp_count;

-- 3. Департамент с максимальным кол/вом сотрудников.
select department_id, count(employee_id) as emp_count
from employees
group by department_id
having emp_count = (select max(table_emp_count.emp_count) as max_emp_count
					from (select department_id, count(employee_id) as emp_count
							from employees
							group by department_id) table_emp_count);

-- 4. Вывести только название деп. с максимальным кол/вом сотрудников.
select department_name
from departments dep
join (select department_id, count(employee_id) as emp_count
		from employees
		group by department_id
		having emp_count = (select max(table_emp_count.emp_count) as max_emp_count
							from (select department_id, count(employee_id) as emp_count
									from employees
									group by department_id) table_emp_count)) max_emp_count_table
on dep.department_id = max_emp_count_table.department_id;
