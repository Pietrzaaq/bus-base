USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.StartRide @LineName VARCHAR(50), @DriverId INT
AS
    DECLARE @ErrorMessage VARCHAR(200);
    DECLARE @MatchingLinesId TABLE (Id INT);
    DECLARE @VehicleId INT;

    DECLARE @FromStation VARCHAR(50);
    DECLARE @ToStation VARCHAR(50);

    BEGIN TRY
        BEGIN TRAN
        IF NOT EXISTS(SELECT NULL FROM BusBase.Drivers WHERE Id = @DriverId)
        BEGIN
            SET @ErrorMessage = 'There is no driver with specified id';
            THROW 50001, @ErrorMessage, 1;
        END

        INSERT INTO
            @MatchingLinesId
        SELECT
            Id
        FROM
            BusBase.Lines L
        WHERE
            L.[Name] LIKE '%' + @LineName + '%'

        IF (SELECT COUNT(*) FROM @MatchingLinesId) > 1
        BEGIN
            SET @ErrorMessage = 'There is more then with selected line name, please try to specify the name';
            THROW 50001, @ErrorMessage, 1;
        END

        SET @VehicleId = (SELECT TOP 1 Id FROM BusBase.Vehicles WHERE IsAvailable = 1);

        IF @VehicleId IS NULL
        BEGIN
            SET @ErrorMessage = 'There is no available busses';
            THROW 50001, @ErrorMessage, 1;
        END

        UPDATE
            BusBase.Vehicles
        SET
            IsAvailable = 0
        WHERE
            Id = @VehicleId

        INSERT INTO
            BusBase.Rides  (LineId, DriverId, VehicleId, ShiftFrom)
        SELECT
            (SELECT Id FROM @MatchingLinesId),
            @DriverId,
            @VehicleId,
            GETDATE()

        SELECT
            @FromStation = L.FromStationId,
            @ToStation = L.ToStationId
        FROM
            BusBase.Lines L
        WHERE
            L.Id = (SELECT TOP 1 Id FROM @MatchingLinesId)

        COMMIT TRAN
        PRINT('Ride from station: ' + @FromStation + ', to station: ' + @ToStation + ' has been started');
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
        SELECT @ErrorMessage;
    END CATCH
GO
