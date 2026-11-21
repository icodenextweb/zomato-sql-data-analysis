-- Q4: Top 10 Restaurant Types by Volume, Rating, and Cost
SELECT TOP 10
    r.rest_type,
    COUNT(f.listing_id) AS total_listings,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    ROUND(AVG(f.approx_cost), 0) AS avg_cost_for_two,
    AVG(f.votes) AS avg_votes
FROM fact_zomato_listings f
JOIN dim_restaurant r
    ON f.restaurant_id = r.restaurant_id
WHERE r.rest_type IS NOT NULL
GROUP BY r.rest_type
ORDER BY total_listings DESC;