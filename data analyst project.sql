create schema cars;

use cars;

-- DATA EXPLORATION PROJECT "SECOND HAND CAR DEALER" --

-- FIRST WE READ THE DATA SET-- 
SELECT * FROM secondhand_cars;

-- (TASK #1) STAKEHOLDER ASKED ABOUT THE TOTAL CARS WE HAVE: TO GET A COUNT OF TOTAL RECORDS -- 
SELECT 
	COUNT(*) AS 'TOTAL CARS'
FROM secondhand_cars; 

-- (TASK #2) THE STAKEHOLDER ASKED HOW MANY CARS WILL BE AVAILABLE IN 2023? --
SELECT
	COUNT(*) 
FROM secondhand_cars
	WHERE year = '2023';
    
-- (TASK #3) THE STAKEHOLDER ASKED HOW MANY CARS WILL BE AVAILABLE IN THE YEAR 2020, 2021, 2022? --
SELECT 
	COUNT(*)
FROM secondhand_cars
	WHERE year = '2020'; -- #74 cars will be available in the year 2020 --
 SELECT 
	COUNT(*)
FROM secondhand_cars 
	WHERE year = '2021'; -- #7 cars will be available in the year 2021 --
 SELECT 
	COUNT(*)
FROM secondhand_cars 
	WHERE year = '2022'; -- #7 cars will be available in the year 2022 --

-- ( TASK #3 ALTERNATE METHOD) To make it easier we will use "GROUP BY" for the above problem --
SELECT
	COUNT(*)
FROM secondhand_cars
	WHERE year in (2020,2021,2022)
GROUP BY
	year;

-- (TASK #4) THE STAKEHOLDER ASKED A PRINT OF THE TOTAL CARS BY YEAR, AND WHICH YEAR WE HAD THE MOST CARS AND WHICH YEAR WE HAD THE LEAST. "I DON'T SEE ALL THE DETAILS" --
SELECT
	year,
    COUNT(*) AS 'Total Cars'
FROM secondhand_cars
GROUP BY
	year
ORDER BY 
	COUNT(*) desc;

-- (TASK #5) THE STAKEHOLDER ASKED "OUT OF ALL THE CARS IN 2020, HOW MANY OF THEM WERE RUN BY DIESEL"? --
SELECT 
	COUNT(*)
FROM secondhand_cars
	WHERE fuel = 'Diesel'
    AND year = 2020;
    
-- (TASK #6) THE STAKEHOLDER ASKED 'OUT OF ALL THE CARS IN 2020, HOW MANY OF THEM WERE RUN BY PETROL"?
SELECT 
	COUNT(*)
FROM secondhand_cars
	WHERE fuel = 'Petrol'
    AND year = '2020';

-- (TASK #7)  THE STAKEHOLDER ASKED FOR THE RECORDS OF ALL THE FUEL CARS (PETROL, DIESEL & CNG) COME BY ALL YEARS --

-- Count of petrol cars by year--
SELECT
	year,
    COUNT(*) AS Petrol_Cars
FROM secondhand_cars
	WHERE fuel = 'Petrol'
GROUP BY
	year;
-- Count of diesel cars by year --
SELECT
	year,
    COUNT(*) AS Diesel_Cars
FROM secondhand_cars
	WHERE fuel = 'Diesel'
GROUP BY
	year;
-- Count of CNG cars by year-- 
SELECT
	year,
    COUNT(*) AS CNG_Cars
FROM secondhand_cars
	WHERE fuel = 'CNG'
GROUP BY
	year;  

-- (TASK #8) STAKEHOLDER ASKED "WHICH OF THE YEARS WE HAD MORE THAN 100 CARS?"
SELECT 
	year,
    COUNT(*) AS Number_of_cars
FROM secondhand_cars
GROUP BY
	year
	HAVING COUNT(*) > 100
    ORDER BY COUNT(*);

-- (TASK #9) STAKEHOLDER ASKED FOR A COUNT OF ALL CARS BETWEEN 2015 - 2023 --
SELECT
	COUNT(*)  AS total_cars
FROM secondhand_cars
	WHERE year between '2015' AND '2023';
    
-- (TASK # 10) STAKEHOLDER ASKED FOR DETAILS OF ALL THE CARS BETWEEN THE YEARS 2015 - 2023; A COMPLETE LIST --
SELECT *
FROM secondhand_cars
	WHERE year between '2015' AND '2023';

-- (TASK #11) CTE: FUEL TYPE DISTRIBUTION BY YEAR --
WITH fuel_summary AS (
    SELECT
        year,
        fuel,
        COUNT(*) AS fuel_count,
        SUM(COUNT(*)) OVER (PARTITION BY year) AS total_per_year
    FROM secondhand_cars
    GROUP BY year, fuel
)
SELECT
    year,
    fuel,
    fuel_count,
    total_per_year,
    ROUND((fuel_count / total_per_year) * 100, 2) AS fuel_percentage
FROM fuel_summary
ORDER BY year, fuel_percentage DESC;

-- (TASK #12) WINDOW FUNCTION: RANK YEARS BY TOTAL CAR VOLUME --
SELECT
    year,
    COUNT(*) AS total_cars,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS year_rank,
    LAG(COUNT(*)) OVER (ORDER BY year) AS prev_year_count,
    COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY year) AS yoy_change
FROM secondhand_cars
GROUP BY year
ORDER BY year;

-- (TASK #13) CASE STATEMENT: CATEGORIZE CARS BY ERA --
SELECT
    year,
    fuel,
    COUNT(*) AS total_cars,
    CASE
        WHEN year < 2010 THEN 'Classic (Pre-2010)'
        WHEN year BETWEEN 2010 AND 2015 THEN 'Mid-Era (2010-2015)'
        WHEN year BETWEEN 2016 AND 2019 THEN 'Modern (2016-2019)'
        ELSE 'Latest (2020+)'
    END AS car_era
FROM secondhand_cars
GROUP BY year, fuel
ORDER BY year;

-- (TASK #14) SUBQUERY: YEARS PERFORMING ABOVE AVERAGE INVENTORY --
SELECT
    year,
    COUNT(*) AS total_cars
FROM secondhand_cars
GROUP BY year
HAVING COUNT(*) > (
    SELECT AVG(yearly_count)
    FROM (
        SELECT COUNT(*) AS yearly_count
        FROM secondhand_cars
        GROUP BY year
    ) AS avg_table
)
ORDER BY total_cars DESC;
    
-- END --
	
	




	
    
		
		




