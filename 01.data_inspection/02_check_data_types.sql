SELECT TOP 10 name, address, listed_in_type, COUNT(*) AS total_count
FROM zomato
GROUP BY name, address, listed_in_type
HAVING COUNT(*) > 1 ;