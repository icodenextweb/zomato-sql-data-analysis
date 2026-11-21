-- Q2: Impact of Online Ordering & Table Booking on Ratings, Cost, and Votes
SELECT
    s.online_order,
    s.book_table,
    COUNT(f.listing_id) AS total_listings,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    ROUND(AVG(f.approx_cost), 0) AS avg_cost_for_two,
    AVG(f.votes) AS avg_votes
FROM fact_zomato_listings f
JOIN dim_service_type s
    ON f.service_id = s.service_id
GROUP BY s.online_order, s.book_table
ORDER BY avg_rating DESC;