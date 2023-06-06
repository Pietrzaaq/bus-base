USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Stations';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Stations (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	[Zone] VARCHAR(3), -- '1', '2', '1+2'
	AddressId INT FOREIGN KEY REFERENCES BusBase.Addresses (Id)
)

END
