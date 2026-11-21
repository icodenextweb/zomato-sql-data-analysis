-- Q3: Price Tier Segmentation 
SELECT
    CASE
        WHEN approx_cost < 400 THEN '1. Budget (< 400)'
        WHEN approx_cost BETWEEN 400 AND 800 THEN '2. Mid-Range (400-800)'
        WHEN approx_cost BETWEEN 801 AND 1500 THEN '3. Premium (801-1500)'
        ELSE '4. Luxury (> 1500)'
    END AS price_tier,
    COUNT(listing_id) AS total_listings,
    ROUND(AVG(rating), 2) AS avg_rating,
    AVG(votes) AS avg_votes
FROM fact_zomato_listings
WHERE approx_cost IS NOT NULL
GROUP BY
    CASE
        WHEN approx_cost < 400 THEN '1. Budget (< 400)'
        WHEN approx_cost BETWEEN 400 AND 800 THEN '2. Mid-Range (400-800)'
        WHEN approx_cost BETWEEN 801 AND 1500 THEN '3. Premium (801-1500)'
        ELSE '4. Luxury (> 1500)'
    END
ORDER BY price_tier;