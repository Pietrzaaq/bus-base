USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'VehicleTypes';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.VehicleTypes
(
    Id INT IDENTITY (1,1) PRIMARY KEY,
    VehicleTypeqName VARCHAR(50),
);

END
GO