SELECT DISTINCT TOP 20
    rate AS raw_rate,
    TRY_CAST(REPLACE(rate, '/5', '') AS FLOAT) AS rating_clean
FROM zomato;