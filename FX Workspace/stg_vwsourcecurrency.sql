CREATE VIEW [stg].[vwsourcecurrency]
AS
SELECT 1 as source_id, 
currency_id as source_currency_id, 
currency_name as source_currency_name, 
currency_id as source_currency_code,
create_dt as source_create_dt,
modify_dt as source_modify_dt
FROM ECB.dbo.silver_currency
UNION ALL
SELECT 2 as source_id, 
currency_id as source_currency_id, 
currency_name as source_currency_name, 
currency_id as source_currency_code,
create_dt as source_create_dt,
modify_dt as source_modify_dt
FROM PERS.dbo.silver_currency


GO
