DECLARE @prawotramwaj BIT = ROUND(RAND(),0)
DECLARE @prawoautobus BIT = ROUND(RAND(),0)

WHILE (@prawotramwaj = 0 AND @prawoautobus = 0)
BEGIN
    SET @prawotramwaj = ROUND(RAND(),0)
	SET @prawoautobus = ROUND(RAND(),0)
END
SELECT @prawotramwaj, @prawoautobus