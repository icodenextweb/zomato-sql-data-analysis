-- Q5:Highest-Rated Popular Restaurant Top 5 Locations
WITH ranked_restaurants AS (
    SELECT
        l.location,
        r.name AS restaurant_name,
        r.cuisines,
        f.rating,
        f.votes,
        f.approx_cost,
        ROW_NUMBER() OVER (
            PARTITION BY l.location
            ORDER BY f.rating DESC, f.votes DESC
        ) AS rank_in_area
    FROM fact_zomato_listings f
    JOIN dim_location l ON f.location_id = l.location_id
    JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
    WHERE l.location IN ('Whitefield', 'Electronic City', 'BTM', 'HSR', 'Marathahalli')
      AND f.votes >= 500
)
SELECT
    location,
    restaurant_name,
    cuisines,
    rating,
    votes,
    approx_cost
FROM ranked_restaurants
WHERE rank_in_area = 1
ORDER BY rating DESC;