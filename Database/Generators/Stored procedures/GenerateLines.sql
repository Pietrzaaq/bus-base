USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.GenerateLines @NumberOfRecords INT
AS
    DECLARE @ErrorMessage VARCHAR(200);
    DECLARE @Iterator INT = 0;

    BEGIN TRY
        BEGIN TRAN

        IF (@NumberOfRecords < 0)
        BEGIN
            SET @ErrorMessage = 'Number of records must be greater than 0';
            THROW 50001, @ErrorMessage, 1;
        END

        WHILE (@Iterator < @NumberOfRecords)
        BEGIN
            DECLARE @Random INT = ROUND(RAND() * 2, 0) + 1
            DECLARE @ZoneType VARCHAR(3) = CHOOSE(@Random, '1', '2', '1+2')
            DECLARE @VehicleLineTypeId INT = (SELECT TOP 1 Id FROM BusBase.VehicleTypes ORDER BY NEWID())
            DECLARE @FromStationId INT = (SELECT TOP 1 Id FROM BusBase.Stations ORDER BY NEWID())
            DECLARE @ToStationId INT = (SELECT TOP 1 Id FROM BusBase.Stations ORDER BY NEWID())

            IF @FromStationId = @ToStationId
            BEGIN
                SET @ToStationId = (SELECT TOP 1 Id FROM BusBase.Stations ORDER BY NEWID())
            END

            INSERT INTO BusBase.Lines (Name, Zone, LineVehicleTypeId, FromStationId, ToStationId)
            SELECT
               (SELECT REPLACE(CONCAT(char(cast((90 - 65 )*rand() + 65 as integer)), STR(ROUND(RAND() * 100, 0))), ' ',  '')),
                @ZoneType,
                @VehicleLineTypeId,
                @FromStationId,
                @ToStationId

            SET @Iterator = @Iterator + 1
        END

        COMMIT TRAN

        PRINT(STR(@NumberOfRecords) + ' lines created successfully');
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
