USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Departures';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Departures (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    LineId INT FOREIGN KEY REFERENCES BusBase.Lines (Id),
    StationId INT FOREIGN KEY REFERENCES BusBase.Stations (Id),
    DayType VARCHAR(50), -- 'Weekend' 'WorkingDay' 'Holidays'
    DepartureTime TIME
)

END
GO