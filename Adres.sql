Declare @ulicatyp VARCHAR(8000) = 'Aleja , Ulica , Droga , Zakamarek , Uliczka , Dworzec , Plac , Zaułek '
declare @dlul varchar(20) = LEN(@ulicatyp) - LEN(REPLACE(@ulicatyp, ',', '')) +1
DECLARE @liczbault INT = CAST(@dlul AS INT)
DECLARE @losul INT = ROUND(RAND()*@liczbault,0) + 1
DECLARE @nazwaul VARCHAR(8000) = 'Jana-Pawła, Wyszyńskiego, Dąbrowskiego, Wojska Polskiego, Armii Krajowej, Warszawska,
              Mickiewicza, Krakowska, Akacjowa, Kwiatowa, Stefana, Antracytowa, Zajęcza, Orla,
              Świętej Teresy, Uniwersytecka, Politechniki, Winadizla'
DECLARE @liczbaad varchar(20) = LEN(@nazwaul) - LEN(REPLACE(@nazwaul, ',', '')) +1
DECLARE @liczbul INT = CAST(@liczbaad AS INT)
DECLARE @losad INT = ROUND(RAND()*@liczbul,0) + 1

DECLARE @adres VARCHAR(50) = CONCAT(CHOOSE(@losul, 'Aleja ', 'Ulica ', 'Droga ', 'Zakamarek ', 'Uliczka ', 'Dworzec ', 'Plac ', 'Zaułek ')
                                    , CHOOSE(@losad, 'Jana-Pawła', 'Wyszyńskiego', 'Dąbrowskiego', 'Wojska Polskiego', 'Armii Krajowej', 'Warszawska',
              'Mickiewicza', 'Krakowska', 'Akacjowa', 'Kwiatowa', 'Stefana', 'Antracytowa', 'Zajęcza', 'Orla',
              'Świętej Teresy', 'Uniwersytecka', 'Politechniki', 'Winadizla'))

DECLARE @returned_id VARCHAR(50)
WHILE (1=1)
BEGIN
Select @returned_id  = name
from demo
WHERE name = @adres

if @returned_id is null
BEGIN
    INSERT INTO demo (name, hint)
VALUES (@adres, @nazwaul)
BREAK
END

    SET @losul = ROUND(RAND()*@liczbault,0) + 1
    SET @losad = ROUND(RAND()*@liczbul,0) + 1
    SET @adres = CONCAT(CHOOSE(@losul, 'Aleja ', 'Ulica ', 'Droga ', 'Zakamarek ', 'Uliczka ', 'Dworzec ', 'Plac ', 'Zaułek ')
                                    , CHOOSE(@losad, 'Jana-Pawła', 'Wyszyńskiego', 'Dąbrowskiego', 'Wojska Polskiego', 'Armii Krajowej', 'Warszawska',
              'Mickiewicza', 'Krakowska', 'Akacjowa', 'Kwiatowa', 'Stefana', 'Antracytowa', 'Zajęcza', 'Orla',
              'Świętej Teresy', 'Uniwersytecka', 'Politechniki', 'Winadizla'))
    
END