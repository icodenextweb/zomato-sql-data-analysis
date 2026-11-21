SELECT DISTINCT TOP 20
    approx_cost_for_two_people AS raw_cost,
    TRY_CAST(REPLACE(approx_cost_for_two_people, ',', '') AS INT) AS cost_clean
FROM zomato
WHERE approx_cost_for_two_people LIKE '%,%';