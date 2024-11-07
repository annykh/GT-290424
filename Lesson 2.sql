-- CRUD

-- CREATE - create database, create table
-- READ - select ... from
-- UPDATE - alter table, update set
-- DELETE - drop database, drop table, delete...

-- Создание базы данных 
-- create database название_бд;

create database GT290424;
-- create database GT290424; -- Error Code: 1007. Can't create database 'gt290424'; database exists	0.016 sec

-- Активировать бд
use gt290424;

-- первая молния - ctrl + shift + enter
-- вторая молния - ctrl + enter

-- Создание таблиц
-- create table название_таблицы(
-- 	   название_поля тип_данных [ограничения],
--     название_поля тип_данных [ограничения],
--     название_поля тип_данных [ограничения],
-- );

-- Простые типы данных

-- integer/int - целое число
-- numeric/decimal - числовые данные
-- varchar(N) - N макс. кол/во символов в строке - максимум символов 255
-- char(M) - M - фиксированное кол/во символов в строке - макс. 255

-- Ограничения - атрибуты

-- not null - значение в поле не может быть незаполненым (null)
-- unique - значение в поле должно быть уникальным 
-- primary key - not null + unique только один в таблице 
-- check - соответствует какому_либо условию
-- default - значения по умолчанию
-- auto_increment/autoincrement - позволяет создавать уникальный номер автоматически, когда новая 
-- запись вставляется в таблицу. Часто это поле основного ключа, которое мы хотели бы создать 
-- автоматически каждый раз, когда будет вставлена новая запись.

-- Создать таблицу students
-- id целое число, уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject varchar not null
-- mark integer от 0 до 5 (вкл)
-- school_no integer по умолч. 0
-- checked char(1) значение Y/N

create table students(
	id int primary key auto_increment,
    firstname varchar(60) not null,
    lastname varchar(100) not null,
    class int check(class between 1 and 10),
    subject varchar(60) not null,
    mark int check(mark between 0 and 5),
    school_no int default 0,
    checked char(1) check(checked in ('Y', 'N'))
);

-- Вывести таблицу students
select * from students;

-- Заполнение таблицы 
-- insert into название_таблицы(поле1, поле2, поле3,...)
-- values (значение1, значение2, значение3, ...);

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values ('John', 'Smith', 5, 'Math', 4, 34, 'Y');

select * from students;

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values ('Bob', 'Brown', 3, 'Informatics', 5, 23, 'N'),
		('Alex', 'Jameson', 5, 'Math', 3, 34, 'Y');
        
select * from students;

-- Ошибки

insert into students
values ('John', 'Brown', 3, 'Math', 2, 54, 'Y');
-- Error Code: 1136. Column count doesn't match value count at row 1	0.015 sec

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values (5, 'John', 4, 23, 'Math', 'Jameson', 'Y');
-- Error Code: 1366. Incorrect integer value: 'Math' for column 'mark' at row 1	0.000 sec

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values ('John', 'Smith', 3.5, 'Math', 5, 23, 'N');
-- 3.5 = 4

insert into students (lastname, class, subject, mark, school_no, checked)
values ('Smith', 4, 'Math', 3, 34, 'Y');
-- Error Code: 1364. Field 'firstname' doesn't have a default value	0.000 sec

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values ('John', 'Smith', 15, 'Math', 4, 34, 'Y');
-- Error Code: 3819. Check constraint 'students_chk_1' is violated.	0.016 sec

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values ('John', 'Smith', 10, 'Math', 4, 34, 'M');
-- Error Code: 3819. Check constraint 'students_chk_3' is violated.	0.000 sec

insert into students (firstname, lastname, class, subject, mark, school_no, checked)
values ('John', 'Smith', 10, 'Math', 4, 34, 'MN');
-- Error Code: 1406. Data too long for column 'checked' at row 1	0.016 sec

insert into students (firstname, lastname, class, subject, mark, checked)
values ('John', 'Smith', 10, 'Math', 4, 'Y');

select * from students;

insert into students (firstname, lastname, class, subject, mark, checked)
values ('John', 'Smith', 10, 'Math', 4, 34, 'Y');
-- Error Code: 1136. Column count doesn't match value count at row 1	0.000 sec

-- Удаление таблиц 
-- drop table название_таблицы;

drop table students;

-- Удаление базы данных 
-- drop database название_бд;

drop database gt290424; 

-- Создать новую бд gt290424.
create database gt290424;

-- Активировать бд gt290424.
use gt290424;

--  Создать таблицу staff с полями:
-- • id – integer - уникальное значение, не null, с автозаполнением 
-- • firstname - varchar(60) - не null
-- • lastname - varchar(100) - не null
-- • position - varchar(100)
-- • age - integer - от 0 до 110(вкл.)
-- • has_child – либо Y, либо N
-- • username - varchar(100) - уникальный

create table staff(
	id int primary key auto_increment,
    firstname varchar(60) not null,
    lastname varchar(100) not null,
    position varchar(100),
    age int check(age between 0 and 110),
    has_child char(1) check(has_child in ('Y', 'N')),
    username varchar(100) unique
);


-- Добавить 3 сотрудников:
-- ('Ally' , 'Austin' , 'Junior UI Designer' , 28 , 'N' , 'ally1' )
-- ('Daniel', 'Faviet', 'Senior UX Designer', 43, 'Y', 'favietD')
-- ('Lily', 'Chen', 'Senior Teacher', 25, 'Y', 'lilychen')

insert into staff (firstname, lastname, position, age, has_child, username)
values ('Ally' , 'Austin' , 'Junior UI Designer' , 28 , 'N' , 'ally1' ),
('Daniel', 'Faviet', 'Senior UX Designer', 43, 'Y', 'favietD'),
('Lily', 'Chen', 'Senior Teacher', 25, 'Y', 'lilychen');

select * from staff;
  
