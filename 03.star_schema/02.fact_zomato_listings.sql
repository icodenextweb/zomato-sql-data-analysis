-- 1. Create facts table with foreign keys
CREATE TABLE fact_zomato_listings (
    listing_id INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_id INT FOREIGN KEY REFERENCES dim_restaurant(restaurant_id),
    location_id INT FOREIGN KEY REFERENCES dim_location(location_id),
    service_id INT FOREIGN KEY REFERENCES dim_service_type(service_id),
    rating FLOAT,
    approx_cost INT,
    votes INT
);

-- 2. Join Tables
INSERT INTO fact_zomato_listings (restaurant_id, location_id, service_id, rating, approx_cost, votes)
SELECT
    r.restaurant_id,
    l.location_id,
    s.service_id,
    z.rating,
    z.approx_cost,
    z.votes
FROM zomato_clean z
JOIN dim_restaurant r
    ON ISNULL(z.name, '') = ISNULL(r.name, '')
    AND ISNULL(z.address, '') = ISNULL(r.address, '')
    AND ISNULL(z.phone, '') = ISNULL(r.phone, '')
    AND ISNULL(z.rest_type, '') = ISNULL(r.rest_type, '')
    AND ISNULL(z.cuisines, '') = ISNULL(r.cuisines, '')
JOIN dim_location l
    ON ISNULL(z.location, '') = ISNULL(l.location, '')
    AND ISNULL(z.listed_in_city, '') = ISNULL(l.listed_in_city, '')
JOIN dim_service_type s
    ON ISNULL(z.online_order, '') = ISNULL(s.online_order, '')
    AND ISNULL(z.book_table, '') = ISNULL(s.book_table, '')
    AND ISNULL(z.listed_in_type, '') = ISNULL(s.listed_in_type, '');

SELECT COUNT(*) AS total_fact_rows FROM fact_zomato_listings;
SELECT TOP 10 * FROM fact_zomato_listings;