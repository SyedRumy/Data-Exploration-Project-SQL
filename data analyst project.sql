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
    
-- END --
	
	




	
    
		
		




