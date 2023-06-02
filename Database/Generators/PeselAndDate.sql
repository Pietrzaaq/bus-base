DECLARE @rok as INT;
SET @rok = CAST(ROUND(RAND() * (2023 - 1950 + 1) + 1949, 0) AS INT);
DECLARE @miesiac INT = ROUND(RAND()*11,0) + 1;
DECLARE @miesiacstr varchar(2);
DECLARE @dzien INT = ROUND(RAND()*30,0) + 1;
DECLARE @dzienstr varchar(2);

IF (@miesiac < 10)
BEGIN
    SET @miesiacstr = CONCAT('0', CAST(@miesiac AS VARCHAR(1)) );
END
ELSE
BEGIN
    SET @miesiacstr = CAST(@miesiac AS varchar(2));
END

IF (@dzien < 10)
BEGIN
    SET @dzienstr = CONCAT('0', CAST(@dzien as VARCHAR(1)));
END
ELSE
BEGIN
    SET @dzienstr = CAST(@dzien AS VARCHAR(2));
END

DECLARE @randomValue VARCHAR(5);
DECLARE @reszta VARCHAR(5) = CAST(RAND() * 100000 AS INT) % 100000;

WHILE LEN(@reszta) < 5
BEGIN
    SET @reszta = CONCAT('0', @reszta);
END

DECLARE @pesel varchar(11) = CONCAT(
    CONVERT(VARCHAR(2), SUBSTRING(CAST(@rok AS VARCHAR(4)), LEN(CAST(@rok AS VARCHAR(4))) - 1, 2)),
    @miesiacstr,
    @dzienstr,
    @reszta
);

WHILE EXISTS(SELECT 1 FROM demo WHERE name = @pesel)
BEGIN
    SET @reszta = CAST(RAND() * 100000 AS INT) % 100000;

    WHILE LEN(@reszta) < 5
    BEGIN
        SET @reszta = CONCAT('0', @reszta);
    END

    SET @pesel = CONCAT(
        CONVERT(VARCHAR(2), SUBSTRING(CAST(@rok AS VARCHAR(4)), LEN(CAST(@rok AS VARCHAR(4))) - 1, 2)),
        @miesiacstr,
        @dzienstr,
        @reszta
    );
END

SELECT @pesel, @reszta
