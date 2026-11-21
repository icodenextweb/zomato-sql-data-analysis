CREATE TABLE dim_restaurant (
    restaurant_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255),
    address NVARCHAR(MAX),
    phone NVARCHAR(150),
    rest_type NVARCHAR(150),
    cuisines NVARCHAR(MAX)
);

INSERT INTO dim_restaurant (name, address, phone, rest_type, cuisines)
SELECT DISTINCT
    name,
    address,
    phone,
    rest_type,
    cuisines
FROM zomato_clean;

--Check how many unique restaurants we found: 
SELECT COUNT(*) AS total_restaurants FROM dim_restaurant;
SELECT TOP 10 * FROM dim_restaurant;