-- 1. Create an empty table
CREATE TABLE dim_location (
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    location NVARCHAR(150),
    listed_in_city NVARCHAR(50)
);

-- 2. Add unique locations into the table
INSERT INTO dim_location (location, listed_in_city)
SELECT DISTINCT
    location,
    listed_in_city
FROM zomato_clean;

-- 3. check how many unique locations are there
SELECT COUNT(*) AS total_locations FROM dim_location;
SELECT TOP 10 * FROM dim_location;