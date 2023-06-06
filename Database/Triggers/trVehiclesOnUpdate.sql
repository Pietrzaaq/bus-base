USE BusBase
GO

CREATE TRIGGER trVehiclesOnUpdate
ON BusBase.Rides
FOR UPDATE
AS
BEGIN
    DECLARE @RandomVehicleId INT =
        (SELECT TOP 1 Id FROM BusBase.Vehicles WHERE IsAvailable = 0 ORDER BY NEWID())

--     DECLARE @CurrentlyRunningRide INT =
--         ((SELECT TOP 1
--             R.Id
--         FROM
--             BusBase.Vehicles V
--             INNER JOIN BusBase.Rides R on V.Id = R.VehicleId
--         WHERE
--             V.Id = @RandomVehicleId
--             AND R.ShiftTo IS NULL) IS NULL)

--     IF @CurrentlyRunningRide = 1
--         UPDATE BusBase.Rides
--         SET ShiftTo = GETDATE()

    UPDATE BusBase.Vehicles
    SET
        IsAvailable = 1
    WHERE
        Id = @RandomVehicleId

    SELECT @RandomVehicleId
END