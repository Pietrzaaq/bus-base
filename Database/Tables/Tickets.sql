USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Tickets';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Tickets (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TicketTypeId INT FOREIGN KEY REFERENCES BusBase.Addresses (Id),
    Discount BIT,
    [Name] VARCHAR(50)
)

END
GO