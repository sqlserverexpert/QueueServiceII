﻿CREATE TABLE [dbo].[DeliveriesArchive] (
    [SenderNbr]         INT            NOT NULL,
    [MessageTypeNbr]    INT            NOT NULL,
    [SenderUTC]         DATETIME2 (3)  NOT NULL,
    [SubscriberNbr]     INT            NOT NULL,
    [OutcomeOrReceipt]  NVARCHAR (100) NOT NULL,
    [OutforDeliveryUTC] DATETIME2 (3)  NOT NULL,
    [SendOrPickupUTC]   DATETIME2 (3)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_DeliveriesArchive]
    ON [dbo].[DeliveriesArchive]([SendOrPickupUTC] ASC, [OutforDeliveryUTC] ASC) WITH (DATA_COMPRESSION = PAGE);

