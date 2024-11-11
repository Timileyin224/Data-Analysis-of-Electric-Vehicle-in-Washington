/* This dataset shows the Battery Electric Vehicles (BEVs) and
Plug-in Hybrid Electric Vehicles (PHEVs) that are 
currently registered through Washington State Department of Licensing (DOL)*/

--View the table
SELECT * FROM electric_vehicle_population

--verifying the number of columns in the dataset
SELECT COUNT(*)		
FROM information_schema.columns
WHERE table_name = 'electric_vehicle_population'		
-- The data sets has 17 columns

--verifying the number of rows in the dataset
SELECT COUNT(*) AS total_count
FROM electric_vehicle_population
-- The data sets has 210165 rows

/*The columns VIN, DOL Vehicle ID, and Vehicle location ,census tract
were not necessary for my analysis. Therefore, these 3 columns were removed,
reducing the total number of columns from 17 to 13.*/

ALTER TABLE Electric_vehicle_population
DROP COLUMN VIN ,
DROP COLUMN Dol_vehicle_id,
DROP COLUMN vehicle_location,
DROP COLUMN census_tract

-- Verifying that the columns has been deleted
SELECT * FROM electric_Vehicle_Population

-- checking for missing values
SELECT FROM electric_vehicle_population
WHERE county IS NULL
OR model_year IS NULL
OR make IS NULL
OR electric_range IS NULL
OR city IS NULL
OR state IS NULL
OR electric_vehicle_type IS NULL
OR cafv_eligibility IS NULL
OR base_msrp IS NULL
OR legislative_district IS NULL
OR electric_utility IS NULL
-- it shows that there are no null values in the table

-- It was spelled 'make' instead of 'maker' in the table
ALTER TABLE electric_vehicle_population			
RENAME make TO maker		

--checking the table to see that the column names have changed				
SELECT * FROM electric_Vehicle_Population


/*Research Question 1: what vehicle is the most expenxive vehicle
registered to the Washington State Department of licencing?*/

SELECT *
FROM electric_vehicle_population
ORDER BY base_msrp DESC
LIMIT 1
 --Answer : Tesla Roadster is the most expensive vehicle registered to washington.

/* Research question 2: wWhat is the County with the Highest 
number of Electric Vehicles?*/

SELECT county, COUNT(*) AS vehicle_count
FROM electric_vehicle_population
GROUP BY county
ORDER BY vehicle_count DESC
LIMIT 1

-- Answer : The King county has the highest concentration of electric Vehicles

/* Research question 3: What is the most Common Electric
Utility Provider for Electric Vehicle Owners ? */

SELECT electric_utility, COUNT(*) AS count
FROM electric_vehicle_population
GROUP BY electric_utility
ORDER BY count DESC
LIMIT 1

/* Answer : The PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA) is the most common Electric
utility provider */



/* Research question 4: What model year of electric vehicle is highly 
adopted  and in trend in washington? */

SELECT model_year, COUNT(*) AS vehicle_count
FROM electric_vehicle_population
GROUP BY model_year
ORDER BY model_year;

/*Answer: model year 2023 is highly adopted and in trend in 
washington as it has a vehicle count of 60,071 */


/* Research question 5:  What is the most Common Electric Vehicle Make? */
SELECT maker, COUNT(*) AS count
FROM electric_vehicle_population
GROUP BY maker
ORDER BY count DESC
LIMIT 1

-- Answer : Tesla is the most common electric Vehicle Maker .
