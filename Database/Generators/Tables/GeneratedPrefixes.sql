USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'GeneratedPrefixes';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedPrefixes] (
	[Name] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedPrefixes (Name)
VALUES
('Aleja'), ('Ulica'), ('Droga'), ('Zakamarek'), ('Uliczka'), ('Dworzec'), ('Plac'), ('Zaułek')

