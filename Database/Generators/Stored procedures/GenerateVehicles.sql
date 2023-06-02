USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.GenerateVehicles @NumberOfRecords INT
AS
    DECLARE @ErrorMessage VARCHAR(200);

    BEGIN TRY
        BEGIN TRAN

        IF (@NumberOfRecords < 0)
        BEGIN
            SET @ErrorMessage = 'Number of records must be greater than 0';
            THROW 50001, @ErrorMessage, 1;
        END

        INSERT INTO BusBase.Vehicles (VehicleTypeId, Brand, Model, ProductionYear, MileageInKm, IsAvailable)
        SELECT
            VehicleTypeId, Brand, Model, ProductionYear, MileageInKm, IsAvailable
        FROM BusBase.fnGenerateVehicles(@NumberOfRecords) D

        COMMIT TRAN

        PRINT(STR(@NumberOfRecords) + ' drivers created successfully');
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;

        PRINT @ErrorMessage;
    END CATCH
GO
