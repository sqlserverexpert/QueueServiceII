CREATE TABLE [dbo].[Subscribers] (
    [SubscriberNbr]  INT            CONSTRAINT [DF_dbo_Subscribers_SubscriberNbr] DEFAULT (NEXT VALUE FOR [dbo].[SubscriberNbrs]) NOT NULL,
    [CallBackURL]    NVARCHAR (300) NOT NULL,
    [InactivatedUTC] DATETIME2 (3)  CONSTRAINT [DF_dbo_Subscribers_InactivatedUTC] DEFAULT ('99991231') NOT NULL,
    [IsActive]       AS             (isnull(CONVERT([bit],case when [InactivatedUTC]<=getutcdate() then (0) else (1) end),(0))),
    CONSTRAINT [PK_dbo_Subscriber] PRIMARY KEY CLUSTERED ([SubscriberNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AK_dbo_Subscriber_01] UNIQUE NONCLUSTERED ([CallBackURL] ASC) WITH (FILLFACTOR = 90)
);

