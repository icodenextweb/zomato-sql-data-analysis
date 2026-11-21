-- 1. Create empty table
CREATE TABLE dim_service_type (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    online_order NVARCHAR(10),
    book_table NVARCHAR(10),
    listed_in_type NVARCHAR(50)
);

-- 2. add unique combinations from cleaned table
INSERT INTO dim_service_type (online_order, book_table, listed_in_type)
SELECT DISTINCT
    online_order,
    book_table,
    listed_in_type
FROM zomato_clean;

-- 3. check all the combinations
SELECT COUNT(*) AS total_services FROM dim_service_type;
SELECT TOP 10 * FROM dim_service_type;