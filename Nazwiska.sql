
Declare @nazwiska VARCHAR(8000) = 'Kowal, Kowalak, Nowak, Walaszek, Łan, Wiśnia, Warta, Batory, Ułan, Piotrowicz, Masa,
            Treska, Wir, Piekarczyk, Koper, Łoś, Watażka, Koło, Storczyk, Biedra, Tatra, Korytko,
            Dykta, Wilk, Wróbel, Owczarek, Trytytka, Pawlik, Krokus, Krawiec, Warka, Perła,
            Janosik, Pietrzak, Hebel, Antracyt, Tablica, Kreda, Szpilman, Golec, Mostowiak, Dyszko,
            Waran, Baran, Lotka, Gil, Bomber, Bomba, Spejson, Torpeda, Guś, Jachaś, Lufa'
declare @dlnazw varchar(20) = LEN(@nazwiska) - LEN(REPLACE(@nazwiska, ',', '')) +1
DECLARE @liczbanazw INT = CAST(@dlnazw AS INT)
DECLARE @numnazw INT = ROUND(RAND()*@liczbanazw,0) + 1
INSERT INTO demo (name, hint)
VALUES (CHOOSE(@numnazw, 'Kowal', 'Kowalak', 'Nowak', 'Walaszek', 'Łan', 'Wiśnia', 'Warta', 'Batory', 'Ułan', 'Piotrowicz', 'Masa',
            'Treska', 'Wir', 'Piekarczyk', 'Koper', 'Łoś', 'Watażka', 'Koło', 'Storczyk', 'Biedra', 'Tatra', 'Korytko',
            'Dykta', 'Wilk', 'Wróbel', 'Owczarek', 'Trytytka', 'Pawlik', 'Krokus', 'Krawiec', 'Warka', 'Perła',
            'Janosik', 'Pietrzak', 'Hebel', 'Antracyt', 'Tablica', 'Kreda', 'Szpilman', 'Golec', 'Mostowiak', 'Dyszko',
            'Waran', 'Baran', 'Lotka', 'Gil', 'Bomber', 'Bomba', 'Spejson', 'Torpeda', 'Guś', 'Jachaś', 'Lufa'),@dlnazw)