-- Q1: Top 10 locations by restaurant listings, with avg rating & avg cost
SELECT TOP 10
    l.location,
    COUNT(f.listing_id) AS total_listings,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    ROUND(AVG(f.approx_cost), 0) AS avg_cost_for_two
FROM fact_zomato_listings f
JOIN dim_location l 
    ON f.location_id = l.location_id
WHERE l.location IS NOT NULL
GROUP BY l.location
ORDER BY total_listings DESC;