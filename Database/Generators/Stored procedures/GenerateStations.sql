USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.GenerateStations @NumberOfRecords INT
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

            INSERT INTO BusBase.Stations (Zone, Address)
            SELECT
                @ZoneType,
               (SELECT TOP 1 Id FROM BusBase.Addresses ORDER BY NEWID())

            SET @Iterator = @Iterator + 1
        END

        COMMIT TRAN

        PRINT(STR(@NumberOfRecords) + ' stations created successfully');
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
