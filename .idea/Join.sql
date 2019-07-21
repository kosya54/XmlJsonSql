USE world;

SELECT *
FROM city
CROSS JOIN country;

SELECT country.Code AS CountryCode, country.Name AS CountryName, city.Name AS Capital
FROM country
INNER JOIN city
ON country.Capital = city.ID
ORDER BY country.Code;

SELECT city.Name, city.Population, country.Code, country.Name
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
ORDER BY country.Code, city.Name;

SELECT country.Continent, COUNT(city.Name) AS CountCity
FROM country
LEFT JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Continent
ORDER BY COUNT(city.Name) DESC;

SELECT COUNT(countrylanguage.Language) AS CountOfficialLanguage, country.Name
FROM countrylanguage
INNER JOIN country
ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY country.Name
ORDER BY COUNT(countrylanguage.Language) DESC;

