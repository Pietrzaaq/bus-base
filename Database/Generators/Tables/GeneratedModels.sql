USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'GeneratedTramModels';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedTramModels] (
	[Name] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedTramModels (Name)
VALUES
('122ND'), ('114N'), ('120Na'), ('71-414'), ('MF 01'), ('Lajkonik'), ('MF 19 AC'), ('MF 20 AC'), ('MF13'), ('S111o'),
                ('Cityrunner'), ('Skyline'), ('Powerliner'), ('P21'), ('P34'), ('Galaxydiver')

SELECT * FROM BusBase.GeneratedTramModels

DECLARE @TableName VARCHAR(50) = 'GeneratedBusModels';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedBusModels] (
	[Name] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedBusModels (Name)
VALUES
('Wicher'), ('AMG100'), ('ND15'), ('JD25'), ('DVB Drezno'), ('Citaro G'), ('eCitaro'), ('Brekina'), ('15 VOR'),
                ('Rietze'), ('Airportshuttle'), ('Esda'), ('Lubeck')

SELECT * FROM BusBase.GeneratedBusModels

