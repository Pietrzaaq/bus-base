USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Rides';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Rides (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	LineId INT FOREIGN KEY REFERENCES BusBase.Lines (Id),
	DriverId INT FOREIGN KEY REFERENCES BusBase.Drivers (Id),
	VehicleId INT FOREIGN KEY REFERENCES BusBase.Vehicles (Id),
    ShiftFrom DATETIME DEFAULT GETDATE(),
    ShiftTo DATETIME
)

END
GO