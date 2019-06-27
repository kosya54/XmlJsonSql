/* Просыте запросы */

USE world;

SELECT Name, District FROM city;
SELECT Name FROM city WHERE CountryCode = 'RUS' ORDER BY Name ASC;
SELECT Name FROM city WHERE CountryCode = 'ESP' OR CountryCode = 'PRT' OR CountryCode = 'GRC' ORDER BY Name DESC;
SELECT Name FROM city WHERE Population BETWEEN 300000 AND 500000 ORDER BY Name ASC;
SELECT Name FROM city WHERE Name LIKE 'A%';
SELECT Name FROM city WHERE Name LIKE '%A%' ORDER BY Name ASC;
SELECT Name FROM city WHERE CountryCode = 'RUS' AND Population >= 1000000 ORDER BY Name ASC;
SELECT Name FROM city WHERE (CountryCode = 'ESP' AND Name LIKE 'A%') OR (CountryCode = 'GRC' AND Population <= 200000) ORDER BY Name ASC;

/* Group by */

SELECT CountryCode, AVG(Population) AS avgPopulation FROM city GROUP BY CountryCode ORDER BY avgPopulation DESC;
SELECT CountryCode, COUNT(Name) AS countCity FROM city GROUP BY CountryCode ORDER BY CountryCode ASC;
SELECT CountryCode, COUNT(Name) AS countCity FROM city GROUP BY CountryCode HAVING countCity >= 2 ORDER BY CountryCode ASC;
SELECT CountryCode, COUNT(Name) AS countCity FROM city WHERE Population >= 1000000 GROUP BY CountryCode HAVING countCity >= 2 ORDER BY CountryCode ASC;

/* Стандартные функции */

SELECT UPPER(Name), LOWER(Continent) FROM country ORDER BY CHAR_LENGTH(Name) DESC;
SELECT Name, SQRT(SurfaceArea / PI()) AS radius FROM country ORDER BY radius DESC;
