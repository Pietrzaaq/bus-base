USE BusBase;
GO

CREATE FUNCTION BusBase.fnGenerateVehicles (
    @NumberOfRecords INT
)
RETURNS @Vehicles TABLE (
    VehicleTypeId INT,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    ProductionYear INT,
    MileageInKm INT DEFAULT (0),
    IsAvailable BIT DEFAULT (0)
)
BEGIN
    DECLARE @Iterator INT = 0;

    WHILE (@Iterator < @NumberOfRecords)
    BEGIN
        DECLARE @IsBus BIT = ROUND((SELECT Value FROM BusBase.vwNewRand),0)
        DECLARE @IsAvailable BIT = IIF(ROUND((SELECT Value FROM BusBase.vwNewRand) * 9,0) < 8, 1 , 0)
        DECLARE @ProductionYear INT = CAST(ROUND((SELECT Value FROM BusBase.vwNewRand) * (2023 - 1980 + 1) + 1979, 0) AS INT)

        IF (@IsBus)
        INSERT INTO @Vehicles (VehicleTypeId, Brand, Model, ProductionYear, MileageInKm, IsAvailable)
        SELECT
            BusBase.fnGeneratePesel(),
            BusBase.fnGenerateName(),
            BusBase.fnGenerateSurname(),
            @ProductionYear,
            BusBase.fnGenerateMileage(),
            @IsAvailable

        ELSE
        INSERT INTO @Vehicles (VehicleTypeId, Brand, Model, ProductionYear, MileageInKm, IsAvailable)
        SELECT
            BusBase.fnGeneratePesel(),
            BusBase.fnGenerateName(),
            BusBase.fnGenerateSurname(),
            @ProductionYear,
            BusBase.fnGenerateMileage(),
            @IsAvailable

        SET @Iterator = @Iterator + 1
    END

    RETURN;
END

