WITH cleaned_data AS (
    SELECT
        name,
        address,
        phone,
        location,
        rest_type,
        cuisines,
        online_order,
        book_table,
        listed_in_type,
        listed_in_city,
        TRY_CAST(REPLACE(rate, '/5', '') AS FLOAT) AS rating,
        TRY_CAST(REPLACE(approx_cost_for_two_people, ',', '') AS INT) AS approx_cost,
        TRY_CAST(votes AS INT) AS votes,
        ROW_NUMBER() OVER (
            PARTITION BY name, address, listed_in_type 
            ORDER BY TRY_CAST(votes AS INT) DESC
        ) AS rn
    FROM zomato
)
SELECT
    name,
    address,
    phone,
    location,
    rest_type,
    cuisines,
    online_order,
    book_table,
    listed_in_type,
    listed_in_city,
    rating,
    approx_cost,
    votes
INTO zomato_clean
FROM cleaned_data
WHERE rn = 1;
