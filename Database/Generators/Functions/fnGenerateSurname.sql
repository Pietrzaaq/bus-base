USE BusBase;
GO

CREATE OR ALTER FUNCTION BusBase.fnGenerateSurname()
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Name VARCHAR(50) = (SELECT TOP 1 [Surname] FROM BusBase.GeneratedSurname ORDER BY (SELECT NewId FROM BusBase.vwNewId))
    RETURN @Name
END;

