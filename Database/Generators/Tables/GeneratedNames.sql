USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'GeneratedNames';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedNames] (
	[Name] VARCHAR(50)
)

END
GO

-- DECLARE @Names TABLE (Name VARCHAR(50))
INSERT INTO BusBase.GeneratedNames (Name)
VALUES 
    ('Jan'),
    ('Marcin'),
    ('Marek'),
    ('Joanna'),
    ('Weronika'),
    ('Kacper'),
    ('Wiktor'),
    ('Wiktoria'),
    ('Dawid'),
    ('Mateusz'),
    ('Agnieszka'),
    ('Piotr'),
    ('Aleksander'),
    ('Aleksandra'),
    ('Katarzyna'),
    ('Andrzej'),
    ('Adrian'),
    ('Bartosz'),
    ('Michał'),
    ('Władysław'),
    ('Patryk'),
    ('Szymon'),
    ('Angelika'),
    ('Filip'),
    ('Krysztof'),
    ('Zdzisław'),
    ('Jadwiga'),
    ('Dariusz'),
    ('Sara'),
    ('Kinga'),
    ('Artur'),
    ('Stefan'),
    ('Hanna'),
    ('Tytus'),
    ('Modest'),
    ('Wojciech'),
    ('Patrycja')
