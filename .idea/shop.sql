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
    FOREIGN KEY (categoryId) REFERENCES category (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO category (title) VALUES ('Спорт');
INSERT INTO category (title) VALUES ('Туризм');
INSERT INTO category (title) VALUES ('Рыбалка');

INSERT INTO products (categoryId, name, description, price) VALUES (1, 'Велосипед', 'Самый лучший в мире лисапед', 150);
INSERT INTO products (categoryId, name, description, price) VALUES (1, 'Лыжи', 'горные', 50);
INSERT INTO products (categoryId, name, description, price) VALUES (2, 'Палатка', 'На 3 спальных места', 100);
INSERT INTO products (categoryId, name, description, price) VALUES (3, 'Удочка', 'Из бамбука', 70);

SELECT products.id, products.name, category.id, category.title, products.price FROM products INNER jOIN category ON products.categoryId = category.id;

DELETE FROM products WHERE price > 100;
UPDATE products SET name = 'Коньки', price = 88 WHERE id = 1;
