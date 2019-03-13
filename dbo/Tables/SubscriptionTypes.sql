CREATE TABLE [dbo].[SubscriptionTypes] (
    [TypeNbr]  TINYINT        CONSTRAINT [DF_dbo_SubscriptionTypes_TypeNbr] DEFAULT (NEXT VALUE FOR [dbo].[SubscriptionTypeNbrs]) NOT NULL,
    [TypeName] NVARCHAR (50)  NOT NULL,
    [TypeDesc] NVARCHAR (100) CONSTRAINT [DF_dbo_SubscriptionTypes_TypeDesc] DEFAULT (N'') NOT NULL,
    CONSTRAINT [PK_dbo_SubscriptionTypes] PRIMARY KEY CLUSTERED ([TypeNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AK_dbo_SubscriptionTypes_01] UNIQUE NONCLUSTERED ([TypeName] ASC) WITH (FILLFACTOR = 90)
);

