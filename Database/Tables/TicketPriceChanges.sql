USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'TicketPriceChanges';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.TicketPriceChanges (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TicketId INT,
    FromPrice FLOAT,
    ToPrice FLOAT,
    UpdateDate DATETIME
)

END
GO