CREATE TABLE [dbo].[Senders] (
    [SenderNbr]     INT           CONSTRAINT [DF_dbo_Senders_SenderNbr] DEFAULT (NEXT VALUE FOR [dbo].[SenderNbrs]) NOT NULL,
    [AppSourceName] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_dbo_Senders] PRIMARY KEY CLUSTERED ([SenderNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AK_dbo_Senders_01] UNIQUE NONCLUSTERED ([AppSourceName] ASC) WITH (FILLFACTOR = 90)
);

