USE world;

SELECT CountryCode, AVG(Population) AS AveragePopulation 
FROM city
GROUP BY CountryCode
ORDER BY AveragePopulation DESC;

SELECT CountryCode, COUNT(Name) AS CountCity
FROM city
GROUP BY CountryCode
ORDER BY CountryCode;

SELECT CountryCode, COUNT(Name)
FROM city
GROUP BY CountryCode
HAVING COUNT(Name) >= 2
ORDER BY CountryCode;

SELECT CountryCode, COUNT(Name)
FROM city
WHERE Population >= 1000000
GROUP BY CountryCode
HAVING COUNT(Name) >= 2
ORDER BY CountryCode;