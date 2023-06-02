USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Lines';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Lines (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	[Name] VARCHAR(50),
	LineType VARCHAR(3), -- 'T' means town 'OUT' means out-of-town
	FromStationId INT FOREIGN KEY REFERENCES BusBase.Stations (Id),
	ToStationId INT FOREIGN KEY REFERENCES BusBase.Stations (Id)
)

END
