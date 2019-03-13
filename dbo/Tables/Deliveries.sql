CREATE TABLE [dbo].[Deliveries] (
    [SenderNbr]         INT                                         NOT NULL,
    [MessageTypeNbr]    INT                                         NOT NULL,
    [AuthoredUTC]       DATETIME2 (3)                               NOT NULL,
    [SubscriberNbr]     INT                                         NOT NULL,
    [OutcomeOrReceipt]  NVARCHAR (100)                              CONSTRAINT [DF_dbo_Deliveries_OutcomeOrReceipt] DEFAULT (N'') NOT NULL,
    [OutforDeliveryUTC] DATETIME2 (3) GENERATED ALWAYS AS ROW START NOT NULL,
    [SendOrPickupUTC]   DATETIME2 (3) GENERATED ALWAYS AS ROW END   NOT NULL,
    PRIMARY KEY CLUSTERED ([SenderNbr] ASC, [MessageTypeNbr] ASC, [AuthoredUTC] ASC, [SubscriberNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_dbo_Deliveries_dbo_Subscriptions] FOREIGN KEY ([SenderNbr], [MessageTypeNbr], [SubscriberNbr]) REFERENCES [dbo].[Subscriptions] ([SenderNbr], [MessageTypeNbr], [SubscriberNbr]),
    CONSTRAINT [FK_dbo_Deliveries_dbo_Mailbox] FOREIGN KEY ([SenderNbr], [MessageTypeNbr], [AuthoredUTC]) REFERENCES [dbo].[Mailbox] ([SenderNbr], [MessageTypeNbr], [AuthoredUTC]),
    PERIOD FOR SYSTEM_TIME ([OutforDeliveryUTC], [SendOrPickupUTC])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[DeliveriesArchive], DATA_CONSISTENCY_CHECK=ON));

