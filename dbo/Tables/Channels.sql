CREATE TABLE [dbo].[Channels] (
    [SenderNbr]      INT NOT NULL,
    [MessageTypeNbr] INT NOT NULL,
    CONSTRAINT [PK_dbo_Channels] PRIMARY KEY CLUSTERED ([MessageTypeNbr] ASC, [SenderNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_dbo_Channels_dbo_MessageTypes] FOREIGN KEY ([MessageTypeNbr]) REFERENCES [dbo].[MessageTypes] ([TypeNbr]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_dbo_Channels_dbo_Senders] FOREIGN KEY ([SenderNbr]) REFERENCES [dbo].[Senders] ([SenderNbr]) ON DELETE CASCADE ON UPDATE CASCADE
);

