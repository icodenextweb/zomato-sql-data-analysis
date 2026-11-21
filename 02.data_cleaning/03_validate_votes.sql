SELECT DISTINCT TOP 20
    votes AS raw_votes,
    TRY_CAST(votes AS INT) AS votes_clean
FROM zomato;