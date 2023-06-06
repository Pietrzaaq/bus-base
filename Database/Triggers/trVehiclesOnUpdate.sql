USE BusBase
GO

CREATE TRIGGER trVehiclesOnUpdate
ON BusBase.Vehicles
FOR UPDATE
AS
BEGIN

    DECLARE @UpdatedVehicleIds TABLE (Id INT);
    INSERT INTO @UpdatedVehicleIds (Id)
    SELECT
        V.Id
    FROM
         BusBase.Vehicles V
        INNER JOIN INSERTED I ON V.Id = I.Id
    WHERE
        V.IsAvailable = 0

    IF EXISTS (SELECT NULL FROM @UpdatedVehicleIds)
    BEGIN
        DECLARE @RandomVehicleId INT =
            (SELECT TOP 1 Id FROM BusBase.Vehicles WHERE IsAvailable = 1 ORDER BY NEWID())

        UPDATE BusBase.Rides
            SET
                ShiftTo = GETDATE(),
                VehicleId = @RandomVehicleId
        WHERE
            VehicleId IN (SELECT Id FROM @UpdatedVehicleIds)

    END
END