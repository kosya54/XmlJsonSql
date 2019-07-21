USE world;
#1
SELECT Name, District 
FROM city;

#2
SELECT Name
FROM city 
WHERE CountryCode = 'RUS'
ORDER BY Name;

#3
SELECT Name
FROM city
WHERE CountryCode IN('ESP', 'PRT', 'GRC')
ORDER BY Name DESC;

#4
SELECT Name 
FROM city 
WHERE Population BETWEEN 300000 AND 500000 
ORDER BY Name;

#5
SELECT Name
FROM city 
WHERE Name LIKE 'A%';

#6
SELECT Name
FROM city 
WHERE Name LIKE '%A%' 
ORDER BY Name;

#7
SELECT Name
FROM city
WHERE CountryCode = 'RUS' AND Population >= 1000000 
ORDER BY Name;

#8
SELECT Name
FROM city 
WHERE (CountryCode = 'ESP' AND Name LIKE 'A%') OR (CountryCode = 'GRC' AND Population <= 200000) 
ORDER BY Name;
