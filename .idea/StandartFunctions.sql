USE world;

SELECT UPPER(Name), LOWER(Continent) 
FROM country 
ORDER BY CHAR_LENGTH(Name) DESC;

SELECT Name, SQRT(SurfaceArea / PI()) AS Radius
FROM country 
ORDER BY Radius DESC; 

CREATE DATABASE shop CHARACTER SET utf8mb4;

USE shop;

CREATE TABLE categories
(
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL
);

CREATE TABLE products
(
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT UNSIGNED NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(500),
    Price DOUBLE NOT NULL,
    DeliveryDate DATE NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES categories (ID) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

INSERT INTO categories (Title)
VALUES ('Спорт'), 
	   ('Туризм'), 
       ('Рыбалка');

INSERT INTO products (CategoryID, Name, Description, Price, DeliveryDate) 
VALUES (1, 'Велосипед', 'Самый лучший в мире лисапед', 150, '2019-06-27'), 
	   (1, 'Лыжи', 'горные', 50, '2018-06-27'), 
       (2, 'Палатка', 'На 3 спальных места', 100, '2018-06-27'), 
       (3, 'Удочка', 'Из бамбука', 70, '2015-06-27'), 
       (3, 'Лодка', 'Из бамбука', 70, '2009-06-27');

SELECT products.Name AS Наименование,
	   categories.Title AS Категория,
       DAY(DeliveryDate) AS День,
       MONTH(DeliveryDate) AS Месяц,
       YEAR(DeliveryDate) AS Год
FROM products
LEFT JOIN categories
ON products.CategoryID = categories.ID;
                   
SELECT COUNT(Name) AS CountProducts,
	   YEAR(DeliveryDate) AS Year
FROM products 
GROUP BY YEAR(DeliveryDate);
