USE BusBase;
GO

CREATE OR ALTER VIEW BusBase.vwCurrentYearRidesHistory
AS

    SELECT
        R.Id,
        L.Name AS 'LineName',
        V.Model AS 'VehicleModel',
        D.Firstname + ' ' + D.Lastname AS 'DriverFullName',
        FromA.Name + ' ' + STR(FromA.Number) AS 'FromAddress',
        ToA.Name + ' ' + STR(ToA.Number) AS 'ToAddress',
        V.ProductionYear AS 'VehicleProductionYear',
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
        INNER JOIN BusBase.Stations FromS
        ON L.FromStationId = FromS.Id
        INNER JOIN BusBase.Addresses FromA
        ON FromS.Address = FromA.Id
        INNER JOIN BusBase.Stations ToS
        ON L.ToStationId = ToS.Id
        INNER JOIN BusBase.Addresses ToA
        ON ToS.Address = ToA.Id
    WHERE
        YEAR(R.ShiftFrom) = YEAR(GETDATE())

GO


