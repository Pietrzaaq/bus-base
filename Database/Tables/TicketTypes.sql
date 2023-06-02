USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'TicketTypes';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.TicketTypes (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    [Zone] VARCHAR(50),
    ActiveTimeInMinutes INT,
    PRICE FLOAT
)

END
GO