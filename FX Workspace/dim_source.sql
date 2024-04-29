CREATE TABLE [dim].[source](
	[source_id] [int] NOT NULL,
	[source_name] [varchar](4000) NOT NULL,
	[source_code] [varchar](100) NOT NULL,
	[create_dt] [datetime2](6) NULL,
	[modify_dt] [datetime2](6) NULL
) ON [PRIMARY]

ALTER TABLE [dim].[source] ADD CONSTRAINT PK_dim_source PRIMARY KEY NONCLUSTERED (source_id) NOT ENFORCED;