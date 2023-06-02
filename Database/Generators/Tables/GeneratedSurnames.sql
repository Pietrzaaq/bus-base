USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'GeneratedSurnames';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedSurnames] (
	[Surname] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedSurnames (Surname)
VALUES 
    ('Kowal'),
    ('Kowalak'),
    ('Nowak'),
    ('Walaszek'),
    ('Łan'),
    ('Wiśnia'),
    ('Warta'),
    ('Batory'),
    ('Ułan'),
    ('Piotrowicz'),
    ('Masa'),
    ('Treska'),
    ('Wir'),
    ('Piekarczyk'),
    ('Koper'),
    ('Łoś'),
    ('Watażka'),
    ('Koło'),
    ('Storczyk'),
    ('Biedra'),
    ('Tatra'),
    ('Korytko'),
    ('Dykta'),
    ('Wilk'),
    ('Wróbel'),
    ('Owczarek'),
    ('Trytytka'),
    ('Pawlik'),
    ('Krokus'),
    ('Krawiec'),
    ('Warka'),
    ('Perła'),
    ('Janosik'),
    ('Pietrzak'),
    ('Hebel'),
    ('Antracyt'),
    ('Tablica'),
    ('Kreda'),
    ('Szpilman'),
    ('Golec'),
    ('Mostowiak'),
    ('Dyszko'),
    ('Waran'),
    ('Baran'),
    ('Lotka'),
    ('Gil'),
    ('Bomber'),
    ('Bomba'),
    ('Spejson'),
    ('Torpeda'),
    ('Guś'),
    ('Jachaś'),
    ('Lufa')
