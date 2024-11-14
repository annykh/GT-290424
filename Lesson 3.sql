-- create database db_name;

-- use db_name;

-- create table table_name1(
-- 	column1 data_type constraint,
--     column2 data_type constraint
-- );

-- insert into table_name1 (column1, column2, ...)
-- values (value1, value2, ...);

-- drop table table_name1;

-- drop database db_name;

use gt290424;

create table products(
	id int primary key auto_increment,
    title varchar(128) not null,
    quantity int check(quantity > 0)
);

insert into products (title, quantity)
values ('Apple', 4), 
	('Banana', 8), 
	('Kiwi', 10), 
	('Avocado', 10), 
	('Mango', 2), 
	('Pineapple', 20);
    
select * from products;

-- Изменение таблицы и столбцов 

-- alter table table_name
-- add column column_name data_type constraint -- добавление столбца
-- drop column column_name -- удаление столбца
-- modify column column_name new_data_type -- изменение типа данных 
-- change column column_name new_column_name data_type-- изменение названия

-- Добавить новое поле price целое число по умолч. 0
alter table products
add column price int default 0;

-- Изменить тип поля price на numeric
alter table products
modify column price numeric;

-- Переименовать поле price на item_price
alter table products
change column price item_price numeric;

-- Удалить поле item_price
alter table products
drop column item_price;

select * from products;

-- Создать поле quality целое число
-- Изменить тип поля quality на decimal

-- alter table products
-- add column quality int,
-- modify column quality decimal;
-- Error Code: 1054. Unknown column 'quality' in 'products'	0.031 sec

alter table products
add column quality int;

alter table products
modify column quality decimal;

-- Изменить тип поля quantity на decimal
-- Переименовать поле title на item_title

alter table products
modify column quantity decimal,
change title item_title varchar(128);

-- Изменить тип quality на integer
alter table products
modify column quality int;

-- Удалить поле quality
alter table products
drop column quality;

-- Создать таблицу students1 с полями
-- name строка(60) (не null)
-- lastname строка(100) (не null)
-- avg_mark целое число (от 0 до 5 вкл.)
-- gender строка(128) (или 'M' или 'F')

create table students1(
	name varchar(60) not null,
    lastname varchar(100) not null,
    avg_mark int check(avg_mark between 0 and 5),
    gender varchar(128) check(gender in ('M', 'F'))
);

-- first - в начало
-- after column_name - после поля
-- before column_name - до поля

--  Добавить поле id integer primary key auto_increment в начало таблицы 
alter table students1
add column id int primary key auto_increment first;

-- Добавить поле age (тип целое число) после lastname
alter table students1 
add column age int after lastname;

-- Поменять тип у gender на char(1)
-- Переименовать поле name на firstname
alter table students1
modify column gender char(1),
change column name firstname varchar(60);

 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );

insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
 
select * from employees;

-- Изменение и удаление данных 

-- Отключить безопасный режим обновления данных
set sql_safe_updates = 0;

-- update table_name
-- set column1 = new_value, column2 = new_value
-- [where condition]

-- Изменить департамент сотрудника Steven King на IT
update employees
set department = 'IT'
where first_name = 'Steven' and last_name = 'King';
-- matched: 1  Changed: 1  Warnings: 0	

select * from employees;

-- Повысить зарплату Laura Bissot на 5000.
update employees
set salary = salary + 5000
where first_name = 'Laura' and last_name = 'Bissot';

-- Изменить фамилию Luis Popp на Smith
update employees
set last_name = 'Smith'
where first_name = 'Luis' and last_name = 'Popp';


-- delete from table_name
-- [where condition]; 

-- Удалить сотрудника Adam Fripp из таблицы
delete from employees
where first_name = 'Adam' and last_name = 'Fripp';

-- Повысить зарплату работников отдела IT в 2 раза
update employees
set salary = salary * 2
where department = 'IT';

-- Всех работников отдела shipping уволили. Удалите работников shipping из таблицы.
delete from employees
where department = 'shipping';

-- John Russell перевели в отдел Marketing и повысили зарплату на 5000. 
-- Измените данные для работника John Russell. 
update employees
set department = 'Marketing', salary = salary + 5000
where first_name = 'John' and last_name = 'Russell';

-- Удалить сотрудников с employee_id 2, 7, 10
delete from employees
where employee_id in (2, 7, 10);
-- where employee_id = 2 or employee_id = 7 or employee_id = 10;

-- Включить безопасный режим обновления данных
set sql_safe_updates = 1;

-- Пагинация и сортировка

-- Пагинация - получение диапазона строк
-- limit N -- N - кол/во строк, которое нужно вывести
-- limit M, N -- M - кол/во строк, которое нужно пропустить, N - кол/во строк, которое нужно вывести

-- вывести первых трех сотрудников
select * from employees
limit 3;

-- вывести первых двух сотрудников из отдела IT
select * from employees
where department = 'IT'
limit 2;

-- Вывести трех сотрудников, которые получают больше 2000, пропуская первых двух.
select * from employees
where salary > 2000
limit 2, 3;

-- order by column_name (asc)- по возр.
-- order by column_name desc - по убыв.

-- Вывести всех сотрудников, отсортировать выборку по возр. зарплат
select * from employees
order by salary;

-- Вывести сотрудников которые получают больше 10000 и отсотритовать по фамилиям по алф. порядку
select * from employees
where salary > 10000
order by last_name;
