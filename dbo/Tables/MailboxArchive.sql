CREATE TABLE [dbo].[MailboxArchive] (
    [SenderNbr]      INT              NOT NULL,
    [MessageTypeNbr] INT              NOT NULL,
    [SenderUTC]      DATETIME2 (3)    NOT NULL,
    [Payload]        VARBINARY (5000) NOT NULL,
    [PostUTC]        DATETIME2 (3)    NOT NULL,
    [DeliveryUTC]    DATETIME2 (3)    NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_MailboxArchive]
    ON [dbo].[MailboxArchive]([DeliveryUTC] ASC, [PostUTC] ASC) WITH (DATA_COMPRESSION = PAGE);

