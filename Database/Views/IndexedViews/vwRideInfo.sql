USE BusBase;
GO

CREATE VIEW dbo.vwRideInfo
WITH SCHEMABINDING
AS

SELECT
    R.Id,
    L.Zone,
    L.Name AS 'LineName',
    V.MileageInKm,
    V.Model AS 'VehicleModel',
    V.ProductionYear AS 'VehicleProductionYear',
    R.DriverId,
    R.ShiftFrom,
    R.ShiftTo
FROM
    BusBase.Rides R
    INNER JOIN BusBase.Lines L
    ON R.LineId = L.Id
    INNER JOIN BusBase.Vehicles V
    ON R.VehicleId = V.Id
    INNER JOIN BusBase.Drivers D
    ON R.DriverId = D.Id
GO

CREATE UNIQUE CLUSTERED INDEX vwCurrentYearRidesHistoryIndex
   ON dbo.vwRideInfo (Id, Zone, [LineName], MileageInKm, VehicleModel, VehicleProductionYear, ShiftFrom, ShiftTo);
GO
