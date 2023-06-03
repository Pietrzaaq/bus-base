USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'GeneratedStreetNames';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedStreetNames] (
	[Name] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedStreetNames (Name)
VALUES
('Jana-Pawła'), ('Wyszyńskiego'), ('Dąbrowskiego'), ('Wojska Polskiego'), ('Armii Krajowej'), ('Warszawska'),
              ('Mickiewicza'), ('Krakowska'), ('Akacjowa'), ('Kwiatowa'), ('Stefana'), ('Antracytowa'), ('Zajęcza'), ('Orla'),
              ('Świętej Teresy'), ('Uniwersytecka'), ('Politechniki'), ('Winadizla')

