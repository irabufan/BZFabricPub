CREATE TABLE [fact].[exchange_rate](
	[source_id] [int] NOT NULL,
	[source_base_currency_id] [varchar](100) NOT NULL,
	[base_currency_id] [int] NOT NULL,
	[source_quote_currency_id] [varchar](100) NOT NULL,
	[quote_currency_id] [int] NOT NULL,
	[exchange_date] [date] NOT NULL,
	[exchange_rate] [decimal](28, 12) NULL
) ON [PRIMARY]
GO
