USE BusBase;
GO

DECLARE @TableName VARCHAR(50) = 'Ticket';

IF NOT EXISTS (SELECT NULL FROM sys.tables WHERE 'name' LIKE @TableName)
BEGIN

CREATE TABLE BusBase.Ticket (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IsReduced BIT,
	[Name]  VARCHAR(50),
	DurationType INT,
	Price NUMERIC,
	Address VARCHAR(50)
)

END