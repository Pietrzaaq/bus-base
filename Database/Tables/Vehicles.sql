USE BusBase
GO

DECLARE @TableName VARCHAR(50) = 'Vehicles';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.Vehicles
(
    Id INT IDENTITY (1,1) PRIMARY KEY,
    VehicleTypeId INT FOREIGN KEY REFERENCES BusBase.VehicleTypes (Id),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    ProductionYear INT,
    MileageInKm INT DEFAULT (0),
    IsAvailable BIT DEFAULT (0)
);

END
GO