USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Addresses';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[Addresses] (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	[Prefix] VARCHAR(10),
	[Name] VARCHAR(50),
	AddressNumber INT
)

CREATE NONCLUSTERED INDEX IX_BusBase_Name
ON BusBase.[Addresses](Name ASC)

END
GO