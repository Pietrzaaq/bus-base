USE BusBase;
GO

CREATE FUNCTION BusBase.fnGenerateDrivers (
    @NumberOfRecords INT
)
RETURNS @Drivers TABLE (
	Id INT,
	Pesel VARCHAR(11),
	Firstname VARCHAR(50),
	Lastname VARCHAR(50),
	IsBusDriver BIT DEFAULT(1),
	IsTramDriver BIT DEFAULT(0),
	IsRetired BIT DEFAULT(0)
)
BEGIN
    DECLARE @Iterator INT = 0;

    WHILE (@Iterator < @NumberOfRecords)
    BEGIN
        DECLARE @TramLicense BIT = ROUND((SELECT Value FROM BusBase.vwNewRand),0)
        DECLARE @BusLicense BIT = ROUND((SELECT Value FROM BusBase.vwNewRand),0)

        IF (@TramLicense = 0 AND @BusLicense = 0)
        BEGIN
            SET @TramLicense = ROUND((SELECT Value FROM BusBase.vwNewRand),0)
            SET @BusLicense = 1
        END

        INSERT INTO @Drivers (Pesel, Firstname, Lastname, IsBusDriver, IsTramDriver, IsRetired)
        SELECT
            BusBase.fnGeneratePesel(),
            BusBase.fnGenerateName(),
            BusBase.fnGenerateSurname(),
            @BusLicense,
            @TramLicense,
            ROUND((SELECT Value FROM BusBase.vwNewRand),0)

        SET @Iterator = @Iterator + 1
    END

    RETURN;
END

