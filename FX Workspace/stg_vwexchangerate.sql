CREATE VIEW [stg].[vwexchangerate]
AS
SELECT
1 AS source_id, 
e.base_currency_id AS source_base_currency_id,
bc.currency_id as base_currency_id,
e.quote_currency_id as source_quote_currency_id,
qc.currency_id as quote_currency_id,
e.exchange_date,
e.exchange_rate
FROM ECB.dbo.silver_exchange_rate e 
LEFT JOIN srcmap.currency bc on bc.source_id = 1 and bc.source_currency_id = e.base_currency_id
LEFT JOIN srcmap.currency qc on qc.source_id = 1 and qc.source_currency_id = e.quote_currency_id
UNION ALL
SELECT
2 AS source_id, 
e.base_currency_id AS source_base_currency_id,
bc.currency_id as base_currency_id,
e.quote_currency_id as source_quote_currency_id,
qc.currency_id as quote_currency_id,
e.exchange_date,
e.exchange_rate
FROM PERS.dbo.silver_exchange_rate e 
LEFT JOIN srcmap.currency bc on bc.source_id = 2 and bc.source_currency_id = e.base_currency_id
LEFT JOIN srcmap.currency qc on qc.source_id = 2 and qc.source_currency_id = e.quote_currency_id

GO
