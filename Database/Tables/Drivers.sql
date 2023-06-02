USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Drivers';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Drivers (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Pesel VARCHAR(11),
	Firstname VARCHAR(50),
	Lastname VARCHAR(50),
	IsBusDriver BIT DEFAULT(1),
	IsTramDriver BIT DEFAULT(0),
	IsRetired BIT DEFAULT(0)
)

END
