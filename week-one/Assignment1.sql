-- 1. How many airplanes have listed speeds? --23 airplanes
-- What is the minimum listed speed and the maximum listed speed? -- max listed speed 432, min listed speed 90 
SELECT *
FROM planes
WHERE speed IS NOT NULL
ORDER BY speed DESC;

-- 2. What is the total distance flown by all of the planes in January 2013? --27,188,805 miles
-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? --81,763 miles
SELECT SUM(distance)
FROM flights
WHERE year = 2013
	AND month = 1;

SELECT SUM(distance)
FROM flights
WHERE year = 2013
	AND month = 1
    AND tailnum IS NULL;

-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
-- Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
-- In a LEFT OUTER JOIN, everything row in the left table is returned. 
-- If the condition is not met, NULL values are used to fill in the columns from the right table.

SELECT manufacturer, SUM(distance)
FROM flights
JOIN planes
	ON flights.tailnum = planes.tailnum
WHERE flights.month = 7
	AND flights.day = 5
    AND flights.year = 2013
GROUP BY manufacturer;

SELECT manufacturer, SUM(distance)
FROM flights
LEFT JOIN planes
	ON flights.tailnum = planes.tailnum
WHERE flights.month = 7
	AND flights.day = 5
    AND flights.year = 2013
GROUP BY manufacturer;

-- 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
-- List airlines and total flights out of JFK in January 2013, order by descending flight_count

SELECT airlines.name, COUNT(*) as flight_count, flights.origin
FROM flights
JOIN planes
JOIN airlines
	ON flights.tailnum = planes.tailnum
    AND flights.carrier = airlines.carrier
WHERE flights.month = 1
    AND flights.year = 2013
    AND flights.origin = "JFK"
GROUP BY airlines.name
ORDER BY flight_count DESC;
