SELECT * 
FROM planes;

SELECT *,
CONCAT(month, "/", day, "/", year) as DATE
FROM weather;

SELECT *
FROM planes
ORDER BY seats DESC;

SELECT * 
FROM planes
WHERE engine = "Reciprocating";

SELECT * 
FROM flights
LIMIT 5;

SELECT * 
FROM flights
ORDER BY air_time DESC;

SELECT * 
FROM flights
WHERE air_time IS NOT NULL
ORDER BY air_time;

SELECT *
FROM flights
WHERE carrier = "AS"
	AND year = 2013
	AND month = 6
    AND day BETWEEN 1 and 3;
    
SELECT *
FROM airlines
WHERE name LIKE "%America%";

SELECT COUNT(*)
FROM flights
WHERE dest = "MIA";

SELECT COUNT(*)
FROM flights
WHERE dest = "MIA"
	AND month = 1
    AND year = 2013;
    
SELECT COUNT(*)
FROM flights
WHERE dest = "MIA"
	AND month = 7
    AND year = 2013;

SELECT AVG(alt)
FROM airports;