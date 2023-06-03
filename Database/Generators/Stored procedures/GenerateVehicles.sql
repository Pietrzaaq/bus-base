USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.GenerateVehicles @NumberOfRecords INT
AS
    DECLARE @ErrorMessage VARCHAR(200);
    DECLARE @Iterator INT = 0;
    DECLARE @VehicleTypeBusId INT = (SELECT TOP 1 Id FROM BusBase.VehicleTypes WHERE VehicleTypeName LIKE 'Bus');
    DECLARE @VehicleTypeTramId INT = (SELECT TOP 1 Id FROM BusBase.VehicleTypes WHERE VehicleTypeName LIKE 'Tram');

    BEGIN TRY
        BEGIN TRAN

        IF (@NumberOfRecords < 0)
        BEGIN
            SET @ErrorMessage = 'Number of records must be greater than 0';
            THROW 50001, @ErrorMessage, 1;
        END

        WHILE (@Iterator < @NumberOfRecords)
        BEGIN
            DECLARE @IsBus BIT = ROUND(RAND(),0)
            DECLARE @IsAvailable BIT = IIF(ROUND(RAND() * 9,0) < 8, 1 , 0)
            DECLARE @ProductionYear INT = CAST(ROUND(RAND() * (2023 - 1980 + 1) + 1979, 0) AS INT)

            IF (@IsBus = 1)
            BEGIN

                INSERT INTO BusBase.Vehicles (VehicleTypeId, Brand, Model, ProductionYear, MileageInKm, IsAvailable)
                SELECT
                    @VehicleTypeBusId,
                    (SELECT TOP 1 * FROM BusBase.GeneratedBusBrands ORDER BY NEWID()),
                    (SELECT TOP 1 * FROM BusBase.GeneratedBusModels ORDER BY NEWID()),
                    @ProductionYear,
                    BusBase.fnGenerateMileage(),
                    @IsAvailable
            END

            ELSE
            BEGIN
                INSERT INTO BusBase.Vehicles  (VehicleTypeId, Brand, Model, ProductionYear, MileageInKm, IsAvailable)
                SELECT
                    @VehicleTypeTramId,
                    (SELECT TOP 1 * FROM BusBase.GeneratedTramBrands ORDER BY NEWID()),
                    (SELECT TOP 1 * FROM BusBase.GeneratedTramModels ORDER BY NEWID()),
                    @ProductionYear,
                    BusBase.fnGenerateMileage(),
                    @IsAvailable
            END

            SET @Iterator = @Iterator + 1
        END

        COMMIT TRAN

        PRINT(STR(@NumberOfRecords) + ' vehicles created successfully');
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;

        IF(ISNULL(@ErrorMessage, '') = '')
          SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_STATE() AS ErrorState,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE() AS ErrorLine,
            ERROR_MESSAGE() AS ErrorMessage;
        ELSE
            PRINT @ErrorMessage;
    END CATCH
GO
