USE BusBase
GO

CREATE TABLE BusBase.Buses
(
	Id INT IDENTITY(1,1) PRIMARY KEY,

	ModelNumber INT,
	IsAvailable BIT DEFAULT(0)
)
GO