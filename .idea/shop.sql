CREATE DATABASE shop CHARACTER SET utf8mb4;

USE shop;

CREATE TABLE categories
(
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL
);

CREATE TABLE products 
(
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT UNSIGNED NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(500),
    Price DOUBLE NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES categories (ID) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

INSERT INTO categories (Title)
VALUES ('Спорт'), 
	   ('Туризм'), 
       ('Рыбалка');

INSERT INTO products (CategoryID, Name, Description, Price) 
VALUES (1, 'Велосипед', 'Самый лучший в мире лисапед', 150), 
	   (1, 'Лыжи', 'горные', 50), 
       (2, 'Палатка', 'На 3 спальных места', 100), 
       (3, 'Удочка', 'Из бамбука', 70);

SELECT products.ID, products.Name, categories.ID, categories.Title, products.Price
FROM products
INNER jOIN categories
ON products.CategoryID = categories.ID;

DELETE 
FROM products
WHERE Price > 100;

UPDATE products
SET Name = 'Коньки', Price = 88 
WHERE ID = 2;