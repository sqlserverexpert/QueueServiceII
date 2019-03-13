CREATE TABLE [dbo].[MessageTypes] (
    [TypeNbr]        INT            CONSTRAINT [DF_dbo_MessageTypes_TypeNbr] DEFAULT (NEXT VALUE FOR [dbo].[MessageTypeNbrs]) NOT NULL,
    [TypeName]       NVARCHAR (50)  NOT NULL,
    [TypeDesc]       NVARCHAR (100) CONSTRAINT [DF_dbo_MessageTypes_TypeDesc] DEFAULT (N'') NOT NULL,
    [Prioritization] SMALLINT       CONSTRAINT [DF_dbo_MessageTypes_Prioritization] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_dbo_MessageTypes] PRIMARY KEY CLUSTERED ([TypeNbr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CK_dbo_MessageTypes_Prioritization_GTZero] CHECK ([Prioritization]>(0)),
    CONSTRAINT [AK_dbo_MessageTypes_01] UNIQUE NONCLUSTERED ([TypeName] ASC) WITH (FILLFACTOR = 90)
);

