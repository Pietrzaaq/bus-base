USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.GenerateAddresses @NumberOfRecords INT
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

            INSERT INTO BusBase.Addresses (Prefix, Name, Number)
            SELECT
                (SELECT TOP 1 Name FROM BusBase.GeneratedPrefixes ORDER BY NEWID()),
                (SELECT TOP 1 Name FROM BusBase.GeneratedStreetNames ORDER BY NEWID()),
                ROUND(RAND() * 100,0) + 1

            SET @Iterator = @Iterator + 1
        END

        COMMIT TRAN

        PRINT(STR(@NumberOfRecords) + ' addresses created successfully');
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
