CREATE TABLE [dbo].[Mailbox] (
    [SenderNbr]      INT                                         NOT NULL,
    [MessageTypeNbr] INT                                         NOT NULL,
    [AuthoredUTC]    DATETIME2 (3)                               NOT NULL,
    [Payload]        VARBINARY (5000)                            NOT NULL,
    [PostUTC]        DATETIME2 (3) GENERATED ALWAYS AS ROW START NOT NULL,
    [DeliveryUTC]    DATETIME2 (3) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_dbo_Mailbox] PRIMARY KEY CLUSTERED ([SenderNbr] ASC, [MessageTypeNbr] ASC, [AuthoredUTC] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_dbo_Mailbox_dbo_Channels] FOREIGN KEY ([MessageTypeNbr], [SenderNbr]) REFERENCES [dbo].[Channels] ([MessageTypeNbr], [SenderNbr]),
    PERIOD FOR SYSTEM_TIME ([PostUTC], [DeliveryUTC])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[MailboxArchive], DATA_CONSISTENCY_CHECK=ON));

