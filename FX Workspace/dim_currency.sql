CREATE TABLE [dim].[currency] (
    [currency_id]   INT            NOT NULL,
    [currency_name] VARCHAR (4000) NOT NULL,
    [currency_code] VARCHAR (100)  NOT NULL,
    [create_dt]     DATETIME2 (6)  NULL,
    [modify_dt]     DATETIME2 (6)  NULL
);

ALTER TABLE [dim].[currency] ADD CONSTRAINT PK_dim_currency PRIMARY KEY NONCLUSTERED (currency_id) NOT ENFORCED;

