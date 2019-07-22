CREATE DATABASE company CHARACTER SET utf8mb4;

USE company;

CREATE TABLE department 
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE employee
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_id INT UNSIGNED NOT NULL,
    chief_id INT UNSIGNED,
    name VARCHAR(255) NOT NULL,
    salary DOUBLE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department (id),
    FOREIGN KEY (chief_id) REFERENCES employee (id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

INSERT INTO department (name)
VALUES ('Дирекция'),
	   ('ПТО'),
       ('Бухгалтерия'),
       ('Финансовая группа');
       
INSERT INTO employee (department_id, chief_id, name, salary)
VALUES (1, NULL, 'Иванов Иван Иванович', 200000),
	   (1, 1, 'Пинаевский Василий Петрович', 150000),
       (1, 1, 'Глухих Михаил Борисович', 120000),
       (1, 1, 'Замарацкий Петр Васильевич', 170000),
       -- ПТО
       (2, 3, 'Грибоедов Рамиль Фарисович', 50000),
       (2, 5, 'Сидоров Максим Петрович', 45000),
       (2, 5, 'Петров Юрий Михайлович', 30000),
       (2, 5, 'Семенов Семен Факирович', 30000),
       -- Бухгалтерия
       (3, 2, 'Ершова Василина Макаровна', 55000),
       (3, 2, 'Замарацкий Петр Васильевич', 50000),
       (3, 2, 'Замарацкий Петр Васильевич', 50000),
       -- Финансовая группа
       (4, 2, 'Козик Ирина Михайловна', 350000),
       (4, 2, 'Колосовский Денис Борисович', 500000),
       (4, 2, 'Иванченко Мария Петровна', 25000),
       (4, 2, 'Егоров Михаил Дмитриевич', 39000);
