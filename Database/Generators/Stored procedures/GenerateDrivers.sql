USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.GenerateDrivers @NumberOfRecords INT
AS
    DECLARE @ErrorMessage VARCHAR(200);

    BEGIN TRY
        BEGIN TRAN

        IF (@NumberOfRecords < 0)
        BEGIN
            SET @ErrorMessage = 'Number of records must be greater than 0';
            THROW 50001, @ErrorMessage, 1;
        END

        INSERT INTO BusBase.Drivers (Pesel, Firstname, Lastname, IsBusDriver, IsTramDriver, IsRetired)
        SELECT
            D.Pesel, D.Firstname, D.Lastname, D.IsBusDriver, D.IsTramDriver, D.IsRetired
        FROM BusBase.fnGenerateDrivers(@NumberOfRecords) D

        COMMIT TRAN

        PRINT(STR(@NumberOfRecords) + ' drivers created successfully');
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
