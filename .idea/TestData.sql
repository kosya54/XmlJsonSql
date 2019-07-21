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

DELIMITER $$
CREATE PROCEDURE fillRandomCategories()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 100 DO
        INSERT INTO categories (title)
        VALUES (CONCAT('Категория_', i));
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE fillRandomProducts()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE minID INT;
    DECLARE maxID INT;
    DECLARE minPrice INT DEFAULT 100;
    DECLARE maxPrice INT DEFAULT 1000;
    SET minID = 1;
    SET maxID = 100;
    WHILE i <= 5000 DO
        INSERT INTO products (CategoryID, Name, Description, Price)
        VALUES (FLOOR(RAND() * (maxID - minID + 1) + minID), CONCAT('Наименование_', i), CONCAT('Описание_', i), RAND() * (maxPrice - minPrice) * minPrice);
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL fillRandomCategories();
CALL fillRandomProducts();

SELECT categories.ID AS Идентификатор_категории, categories.Title AS Название_категории, products.Name AS Наименование_товара, products.Description AS Описание_товара, products.Price AS Стоимость
FROM products
LEFT JOIN categories
ON products.CategoryID = categories.ID
LIMIT 3000, 1000;
