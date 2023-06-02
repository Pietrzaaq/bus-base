USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'GeneratedTramBrands';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedTramBrands] (
	[Name] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedTramBrands (Name)
VALUES
    ('Konstal'), ('Sanowag'), ('Wagonów'), ('Pafawag'), ('Pesa'), ('HCP'), ('Modertrans'), ('Stadler')

SELECT * FROM BusBase.GeneratedTramBrands

DECLARE @TableName VARCHAR(50) = 'GeneratedBusBrands';
DECLARE @SchemaName VARCHAR(50) = 'BusBase';
DECLARE @NameWithSchema VARCHAR(100) = @SchemaName  + '.' + @TableName;

IF OBJECT_ID(@NameWithSchema) IS NULL
BEGIN

CREATE TABLE BusBase.[GeneratedBusBrands] (
	[Name] VARCHAR(50)
)

END
GO

INSERT INTO BusBase.GeneratedBusBrands (Name)
VALUES
    ('Solaris'), ('Volvo'), ('Mercedes'), ('Star'), ('Żuk'), ('Sindbad'), ('Flixbus'),
                ('Polonus'), ('Daewoo'), ('Aston'), ('Jelcz')

SELECT * FROM BusBase.GeneratedBusBrands

