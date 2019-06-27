CREATE DATABASE shop CHARACTER SET utf8mb4;

USE shop;

CREATE TABLE category (
    id int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title varchar(255) NOT NULL
);

CREATE TABLE products (
    id int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoryId int unsigned,
    name VARCHAR(255),
    description VARCHAR(500),
    price DOUBLE,
    deliveryDate DATE,
    FOREIGN KEY (categoryId) REFERENCES category (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO category (title) VALUES ('Спорт');
INSERT INTO category (title) VALUES ('Туризм');
INSERT INTO category (title) VALUES ('Рыбалка');

INSERT INTO products (categoryId, name, description, price, deliveryDate) VALUES (1, 'Велосипед', 'Самый лучший в мире лисапед', 150, NOW());
INSERT INTO products (categoryId, name, description, price, deliveryDate) VALUES (1, 'Лыжи', 'горные', 50, NOW());
INSERT INTO products (categoryId, name, description, price, deliveryDate) VALUES (2, 'Палатка', 'На 3 спальных места', 100, NOW());
INSERT INTO products (categoryId, name, description, price, deliveryDate) VALUES (3, 'Удочка', 'Из бамбука', 70, NOW());
INSERT INTO products (categoryId, name, description, price, deliveryDate) VALUES (3, 'Лодка', 'Из бамбука', 70, DATE_ADD(NOW(), INTERVAL -1 YEAR));

SELECT products.name AS Наименование, 
       category.title AS Категория, 
       EXTRACT(DAY FROM products.deliveryDate) AS День, 
       EXTRACT(MONTH FROM products.deliveryDate) AS Месяц, 
       EXTRACT(YEAR FROM products.deliveryDate) AS Год 
           FROM products 
               LEFT JOIN category 
                   ON products.categoryId = category.id;
                   
SELECT COUNT(name) AS countProducts, EXTRACT(YEAR FROM products.deliveryDate) AS Год FROM products GROUP BY Год;
