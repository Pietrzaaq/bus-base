USE BusBase;
GO

CREATE OR ALTER VIEW BusBase.vwTownLines
AS

    SELECT
        L.Id,
        L.Name AS 'LineName',
        FromA.Name + ' ' + STR(FromA.Number) AS 'FromAddress',
        ToA.Name + ' ' + STR(ToA.Number) AS 'ToAddress'
    FROM
        BusBase.Lines L
        INNER JOIN BusBase.Stations FromS
        ON L.FromStationId = FromS.Id
        INNER JOIN BusBase.Addresses FromA
        ON FromS.Address = FromA.Id
        INNER JOIN BusBase.Stations ToS
        ON L.ToStationId = ToS.Id
        INNER JOIN BusBase.Addresses ToA
        ON ToS.Address = ToA.Id
    WHERE
        L.LineType LIKE 'T'

GO


