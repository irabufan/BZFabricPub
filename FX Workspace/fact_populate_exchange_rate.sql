CREATE   PROCEDURE [fact].[populate_exchange_rate]
(
@source_id INT
)
AS
BEGIN

-- Create a Common Table Expression (CTE) named 'datecte'
;WITH datecte AS (
    -- Select distinct exchange dates from the view 'vwexchangerate' in the 'stg' schema
    SELECT DISTINCT exchange_date 
    FROM [stg].[vwexchangerate]
    WHERE source_id = @source_id  -- Filter rows where 'source_id' matches the input parameter
    EXCEPT  -- Set operator to return rows from the first query that are not present in the second query
    -- Select distinct exchange dates from the 'exchange_rate' table in the 'fact' schema
    SELECT DISTINCT exchange_date 
    FROM fact.exchange_rate
    WHERE source_id = @source_id  -- Filter rows where 'source_id' matches the input parameter
)
-- Insert into the 'exchange_rate' table in the 'fact' schema
INSERT INTO fact.exchange_rate (
    [source_id]
    ,[source_base_currency_id]
    ,[base_currency_id]
    ,[source_quote_currency_id]
    ,[quote_currency_id]
    ,[exchange_date]
    ,[exchange_rate]
)
SELECT 
    [source_id]
    ,[source_base_currency_id]
    ,[base_currency_id]
    ,[source_quote_currency_id]
    ,[quote_currency_id]
    ,[exchange_date]
    ,[exchange_rate]
FROM [stg].[vwexchangerate]  -- Select from the view 'vwexchangerate' in the 'stg' schema
WHERE source_id = @source_id  -- Filter rows where 'source_id' matches the input parameter
AND exchange_date IN (SELECT exchange_date FROM datecte)  -- Filter rows where 'exchange_date' is in the 'datecte' CTE
;


END

GO
