USE world;

SELECT DISTINCT Continent
FROM country
WHERE SurfaceArea >= 950000;

SELECT Name
FROM country
ORDER BY SurfaceArea DESC
LIMIT 5;

SELECT Name
FROM country
ORDER BY SurfaceArea DESC
LIMIT 5, 5;