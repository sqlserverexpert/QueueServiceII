CREATE TABLE [dbo].[Subscriptions] (
    [SenderNbr]                  INT           NOT NULL,
    [MessageTypeNbr]             INT           NOT NULL,
    [SubscriberNbr]              INT           NOT NULL,
    [SubscriptionTypeNbr]        TINYINT       NOT NULL,
    [MaxDeliveryRetries]         SMALLINT      CONSTRAINT [DF_dbo_Subscriptions_MaxDeliveryRetries] DEFAULT ((5)) NOT NULL,
    [MaxDeliveryIntervalUnits]   TINYINT       CONSTRAINT [DF_dbo_Subscriptions_MaxDeliveryIntervalUnits] DEFAULT ((1)) NOT NULL,
    [MaxDeliveryIntervalMeasure] NVARCHAR (50) CONSTRAINT [DF_dbo_Subscriptions_MaxDeliveryIntervalMeasure] DEFAULT (N'year') NOT NULL,
    CONSTRAINT [PK_dbo_Subscriptions] PRIMARY KEY CLUSTERED ([SenderNbr] ASC, [MessageTypeNbr] ASC, [SubscriberNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_dbo_Subscriptions_dbo_Channels] FOREIGN KEY ([MessageTypeNbr], [SenderNbr]) REFERENCES [dbo].[Channels] ([MessageTypeNbr], [SenderNbr]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_dbo_Subscriptions_dbo_Subscribers] FOREIGN KEY ([SubscriberNbr]) REFERENCES [dbo].[Subscribers] ([SubscriberNbr]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_dbo_Subscriptions_dbo_SubscriptionTypes] FOREIGN KEY ([SubscriptionTypeNbr]) REFERENCES [dbo].[SubscriptionTypes] ([TypeNbr]) ON DELETE CASCADE ON UPDATE CASCADE
);

