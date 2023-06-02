USE BusBase;
GO

CREATE OR ALTER PROCEDURE BusBase.FinishRide @RideId INT
AS
    DECLARE @ErrorMessage VARCHAR(200);
    DECLARE @MatchingLinesId TABLE (Id INT);

    DECLARE @FromStation VARCHAR(50);
    DECLARE @ToStation VARCHAR(50);

    BEGIN TRY
        BEGIN TRAN
        IF NOT EXISTS(SELECT NULL FROM BusBase.Rides WHERE Id = @RideId)
        BEGIN
            SET @ErrorMessage = 'There is no rides with specified id';
            THROW 50001, @ErrorMessage, 1;
        END

        DECLARE @VehicleId INT = (SELECT TOP 1 VehicleId FROM BusBase.Rides WHERE Id = @RideId);

        UPDATE
            BusBase.Vehicles
        SET
            IsAvailable = 1
        WHERE
            Id = @VehicleId

        UPDATE
            BusBase.Rides
        SET
            ShiftTo = GETDATE()
        WHERE
            Id = @RideId

        SELECT
            @FromStation = L.FromStationId,
            @ToStation = L.ToStationId
        FROM
            BusBase.Lines L
        WHERE
            L.Id = (SELECT TOP 1 Id FROM @MatchingLinesId)

        COMMIT TRAN
        PRINT('Ride from station: ' + @FromStation + ', to station: ' + @ToStation + ' has been finished.')
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
        SELECT @ErrorMessage;
    END CATCH
GO
