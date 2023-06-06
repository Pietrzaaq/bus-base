USE BusBase
GO

CREATE TRIGGER trTicketOnPriceUpdate
ON BusBase.TicketTypes
INSTEAD OF UPDATE
AS
BEGIN

    DECLARE @UpdatedTicketTypes TABLE (Id INT, OldPrice FLOAT, NewPrice FLOAT);
    INSERT INTO @UpdatedTicketTypes (Id, OldPrice, NewPrice)
    SELECT
        T.Id,
        I.PRICE,
        T.PRICE
    FROM
         BusBase.TicketTypes T
        INNER JOIN INSERTED I ON T.Id = I.Id
    WHERE
        T.PRICE != I.PRICE
        AND T.Id NOT IN (SELECT TicketId FROM BusBase.TicketPriceChanges WHERE TicketId = T.Id
            AND DAY(UpdateDate) = DAY(GETDATE())
            AND MONTH(UpdateDate) = MONTH(GETDATE())
            AND YEAR(UpdateDate) = YEAR(GETDATE()))

    IF EXISTS (SELECT NULL FROM @UpdatedTicketTypes)
    BEGIN
        INSERT INTO BusBase.TicketPriceChanges (TicketId, FromPrice, ToPrice, UpdateDate)
        SELECT
            U.Id,
            U.OldPrice,
            U.NewPrice,
            GETDATE()
        FROM
            @UpdatedTicketTypes U
            INNER JOIN BusBase.TicketTypes T ON U.Id = T.Id

        UPDATE T
        SET
            PRICE = U.NewPrice
        FROM
             BusBase.TicketTypes T
             INNER JOIN @UpdatedTicketTypes U ON T.Id = U.Id
    END
END