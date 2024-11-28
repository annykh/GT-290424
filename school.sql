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
