-- Union/union all

-- join

-- outer join - left join/right join


create database school;
use school;

create table students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table competencies(
	id int primary key auto_increment,
    title varchar(128) not null
);

create table courses(
	id int primary key auto_increment,
    teacher_id int,
    title varchar(128) not null
);

create table students2courses(
	id int primary key auto_increment,
    student_id int,
    course_id int
);

create table teachers2competencies(
	id int primary key auto_increment,
    teacher_id int,
    competencies_id int
);

insert into Students (name, age)
values ('Анатолий', 29),
    ('Олег', 25),
    ('Семен', 27),
    ('Олеся', 28),
    ('Ольга', 31),
    ('Иван', 22);
    
insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title) values (1, 'Алгебра логики');
insert into courses (teacher_id, title) values (2, 'Математическая статистика');
insert into courses (teacher_id, title) values (4, 'Высшая математика');
insert into courses (teacher_id, title) values (5, 'Javascript');
insert into courses (teacher_id, title) values (5, 'Базовый Python');

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);

select * from students;
select * from teachers;
select * from courses;
select * from competencies;
select * from students2courses;
select * from teachers2competencies;

-- Вывести имена преподавателей и курсы, которые они ведут.
select t1.name, t2.title
from teachers as t1
join courses as t2
on t1.id = t2.teacher_id;

-- Вывести имена студентов и курсы, которые они проходят
select t1.name, t3.title
from students as t1
join students2courses as t2
on t1.id = t2.student_id
join courses as t3
on t2.course_id = t3.id;

select * from students;
select * from courses;
select * from students2courses;

-- Вывести имена студентов, курсы, которые они проходят и имена преподавателей, которые эти курсы ведут 
-- students, students2courses, courses, teachers
select t1.name as student_name, t3.title, t4.name as teacher_name
from students as t1
join students2courses as t2
on t1.id = t2.student_id
join courses as t3
on t2.course_id = t3.id
join teachers as t4
on t3.teacher_id = t4.id;

-- Вывести преподавателей и их компетенции.
-- teachers, competencies, teachers2competencies
select t1.name, t3.title
from teachers as t1
join teachers2competencies as t2
on t1.id = t2.teacher_id
join competencies as t3
on t2.competencies_id = t3.id;

-- Вывести имена студентов, курсы, которые они проходят, имена преподавателей, которые эти курсы ведут и компетенции преподавателей
-- name(students), title(courses), name(teachers), title(competencies)
select t1.name as student_name, t3.title as course_title, t4.name as teacher_name, t6.title as competence_title
from students as t1
join students2courses as t2
on t1.id = t2.student_id
join courses as t3
on t2.course_id = t3.id
join teachers as t4
on t3.teacher_id = t4.id
join teachers2competencies as t5
on t4.id = t5.teacher_id
join competencies as t6
on t5.competencies_id = t6.id;

-- OUTER JOIN 
-- Перед оператором JOIN указывается одно из ключевых слов LEFT или RIGHT, которые определяют тип соединения:

-- LEFT: выборка будет содержать все строки из первой или левой таблицы
-- RIGHT: выборка будет содержать все строки из второй или правой таблицы

select * from teachers;
select * from courses;

-- Вывести всех преподавателей, даже если они не ведут курс, и если ведут вывести название курса.
select t1.name, t2.title
from teachers as t1
left join courses as t2
on t1.id = t2.teacher_id;

select t2.name, t1.title
from courses as t1
right join teachers as t2
on t1.teacher_id = t2.id;

-- Вывести преподавателей у которых нет курсов.
select t1.name
from teachers as t1
left join courses as t2
on t1.id = t2.teacher_id
where title is null;

-- Вывести всех преподавателей у которых нет компетенций 
select t1.name
from teachers as t1
left join teachers2competencies as t2
on t1.id = t2.teacher_id
where t2.competencies_id is null;

-- Найти имена студентов, которые не проходят ни один курс
select t1.name
from students as t1
left join students2courses as t2
on t1.id = t2.student_id
where t2.course_id is null;

-- Найти курсы, которые не посещает ни один студент
select title
from courses as t1
left join students2courses as t2
on t1.id = t2.course_id
where t2.student_id is null;

-- Найти компетенции, которых нет ни у одного преподавателя
select t1.title
from competencies as t1
left join teachers2competencies as t2
on t1.id = t2.competencies_id
where t2.teacher_id is null;
