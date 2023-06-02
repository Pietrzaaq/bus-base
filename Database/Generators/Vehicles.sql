DECLARE @tramwajmarka VARCHAR(8000) = 'Konstal, Sanowag, Wagonów, Pafawag, Pesa, HCP, Modertrans, Stadler'
DECLARE @tramwajmodel VARCHAR(8000) = '122ND, 114N, 120Na, 71-414, MF 01, Lajkonik, MF 19 AC, MF 20 AC, MF13, S111o,
                Cityrunner Skyline, Powerliner, P21, P34, Galaxydiver'
DECLARE @tmarka INT = LEN(@tramwajmarka) - LEN(REPLACE(@tramwajmarka, ',', '')) +1
DECLARE @tmodel INT = LEN(@tramwajmodel) - LEN(REPLACE(@tramwajmodel, ',', '')) +1
DECLARE @tlosmarka INT = ROUND(RAND() * @tmarka,0)
DECLARE @tlosmodel INT = ROUND(RAND() * @tmodel,0)
DECLARE @rok INT = CAST(ROUND(RAND() * (2023 - 1980 + 1) + 1979, 0) AS INT);
DECLARE @przebieg int = ROUND(RAND() * 1000000,0)
DECLARE @sprawnosc VARCHAR(3) = CHOOSE(ROUND(RAND() * 9,0), 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'NIE')
DECLARE @tramwaj VARCHAR(100) = CONCAT(CHOOSE(@tlosmarka,'Konstal', 'Sanowag', 'Wagonów', 'Pafawag', 'Pesa', 'HCP', 'Modertrans', 'Stadler') , ' ',
                                       CHOOSE(@tlosmodel, '122ND', '114N', '120Na', '71-414', 'MF 01', 'Lajkonik', 'MF 19 AC', 'MF 20 AC', 'MF13', 'S111o',
                'Cityrunner', 'Skyline', 'Powerliner', 'P21', 'P34', 'Galaxydiver'))
SELECT @tramwaj, @rok, @przebieg, @sprawnosc


DECLARE @autobusmarka VARCHAR(8000) = 'Solaris, Volvo, Mercedes, Star, Żuk, Sindbad, Flixbus,
                Polonus, Daewoo, Aston, Jelcz'
DECLARE @autobusmodel VARCHAR(8000) = 'Wicher, AMG100, ND15, JD25, DVB Drezno, Citaro G, eCitaro, Brekina, `15 VOR,
                Rietze, Airportshuttle, Esda, Lubeck'
DECLARE @amarka INT = LEN(@autobusmarka) - LEN(REPLACE(@autobusmarka, ',', '')) +1
DECLARE @amodel INT = LEN(@autobusmodel) - LEN(REPLACE(@autobusmodel, ',', '')) +1
DECLARE @alosmarka INT = ROUND(RAND() * @amarka,0)
DECLARE @alosmodel INT = ROUND(RAND() * @amodel,0)
DECLARE @roka INT = CAST(ROUND(RAND() * (2023 - 1980 + 1) + 1979, 0) AS INT);
DECLARE @przebiega int = ROUND(RAND() * 1000000,0)
DECLARE @sprawnosca VARCHAR(3) = CHOOSE(ROUND(RAND() * 9,0), 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'TAK', 'NIE')
DECLARE @autobus VARCHAR(100) = CONCAT(CHOOSE(@alosmarka,'Solaris', 'Volvo', 'Mercedes', 'Star', 'Żuk', 'Sindbad', 'Flixbus',
                'Polonus', 'Daewoo', 'Aston', 'Jelcz') , ' ',
                                       CHOOSE(@alosmodel, 'Wicher', 'AMG100', 'ND15', 'JD25', 'DVB Drezno', 'Citaro G', 'eCitaro', 'Brekina', '`15 VOR',
                'Rietze', 'Airportshuttle', 'Esda', 'Lubeck'))
SELECT @autobus, @roka, @przebiega, @sprawnosca