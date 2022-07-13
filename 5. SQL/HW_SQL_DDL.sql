-- Создать таблицу employees:
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null
create table employees (
id serial primary key,
employee_name Varchar(50) not null
)

-- Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values
('Dylan Ashton Perry'),
('Patrick Isaac Robinson'),
('Joseph Brian Martin'),
('Sean Evan Richardson'),
('Owen Wyatt Bailey'),
('Mason Sean Griffin'),
('Jesus Devin Powell'),
('Adrian Jose Morris'),
('Angel Connor Rivera'),
('Seth Carter Coleman'),
('Elijah Kyle Diaz'),
('Aiden Aiden Howard'),
('Owen Nathaniel Smith'),
('David Brian Washington'),
('Owen Logan Brooks'),
('Antonio Hunter Long'),
('Zachary Cole Ward'),
('Chase Diego Wilson'),
('Eric Evan Martin'),
('Thomas Jeremiah Lewis'),
('Isaac David Jackson'),
('Kyle Samuel Ross'),
('Aidan Benjamin Brooks'),
('Sean Jeremiah Stewart'),
('Miguel Jacob Flores'),
('Colin Noah Cooper'),
('Jordan Alejandro Hernandez'),
('Adrian Adam Wright'),
('Jonathan Ashton Adams'),
('David Mason Hughes'),
('Jayden Luis Wilson'),
('Evan Joshua Lopez'),
('Christopher Wyatt Edwards'),
('Joseph Adam Butler'),
('Hayden Austin Young'),
('Kyle Alexander Richardson'),
('Jason Alex Roberts'),
('David Patrick Hernandez'),
('Gabriel Ian Murphy'),
('Isaac David Sanchez'),
('Joseph Dylan Patterson'),
('Nathan James Murphy'),
('Sebastian Patrick Long'),
('Logan Jesus Clark'),
('Aiden Carter Murphy'),
('Alejandro Elijah Johnson'),
('Hunter Carter Parker'),
('Richard Wyatt Reed'),
('Evan Miguel Sanders'),
('Matthew Logan Thompson'),
('John Hunter Morgan'),
('Joseph Alejandro Baker'),
('Seth Sean Parker'),
('Alexander Alex Baker'),
('Julian Samuel Flores'),
('Owen Sebastian Martinez'),
('Devin Owen Hernandez'),
('Seth Bryan Alexander'),
('Dylan Carlos Bennett'),
('John Jake Lopez'),
('Jordan Ashton Allen'),
('Jeremiah Landon Walker'),
('Elijah Cameron Bryant'),
('Richard Zachary Simmons'),
('Austin Gavin Campbell'),
('Sebastian Dominic Phillips'),
('Anthony Hayden Bryant'),
('Ethan Samuel Davis'),
('Jonathan Daniel Martin'),
('Matthew Ethan Bell');

-- Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
create table salary (
id serial primary key,
monthly_salary Int not null
)

-- Наполнить таблицу salary 15 строками:
insert into salary (monthly_salary)
values (1000),
	(1100),
	(1200),
	(1300),
	(1400),
	(1500),
	(1600),
	(1700),
	(1800),
	(1900),
	(2000),
	(2100),
	(2200),
	(2300),
	(2400);

-- Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
create table employee_salary (
id serial primary key,
employee_id Int not null unique,
salary_id Int not null
)

-- Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id)
values (1,1),
	(3,5),
	(5,7),
	(7,14),
	(9,12),
	(11,3),
	(13,6),
	(15,7),
	(17,2),
	(19,5),
	(21,11),
	(23,14),
	(25,12),
	(27,15),
	(29,1),
	(31,3),
	(33,8),
	(35,7),
	(37,9),
	(39,5),
	(41,2),
	(43,14),
	(45,13),
	(47,16),
	(49,10),
	(51,11),
	(53,1),
	(55,4),
	(57,8),
	(59,5),
	(80,5),
	(82,7),
	(84,6),
	(86,1),
	(88,12),
	(90,4),
	(92,3),
	(94,9),
	(96,14),
	(98,1);
	
-- Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
create table roles (
id serial primary key,
role_name Int not null unique
)

-- Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name 
type varchar(30);

-- Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values ('Junior Python developer'),
	('Middle Python developer'),
	('Senior Python developer'),
	('Junior Java developer'),
	('Middle Java developer'),
	('Senior Java developer'),
	('Junior JavaScript developer'),
	('Middle JavaScript developer'),
	('Senior JavaScript developer'),
	('Junior Manual QA engineer'),
	('Middle Manual QA engineer'),
	('Senior Manual QA engineer'),
	('Project Manager'),
	('Designer'),
	('HR'),
	('CEO'),
	('Sales manager'),
	('Junior Automation QA engineer'),
	('Middle Automation QA engineer'),
	('Senior Automation QA engineer');

-- Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
)

-- Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values (1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10),
	(11,20),
	(12,19),
	(13,18),
	(14,17),
	(15,16),
	(16,15),
	(17,14),
	(18,13),
	(19,12),
	(20,11),
	(31,10),
	(32,9),
	(33,8),
	(34,7),
	(35,6),
	(36,5),
	(37,4),
	(38,3),
	(39,2),
	(40,1),
	(61,11),
	(62,12),
	(63,13),
	(64,14),
	(65,15),
	(66,16),
	(67,17),
	(68,18),
	(69,19),
	(70,20);



select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;