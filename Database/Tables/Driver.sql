USE BusBase
GO

CREATE TABLE Driver
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	IsRetired VARCHAR(50) NOT NULL,
	-- WorkingHours
	CreatedDate DATETIME DEFAULT(GETDATE()) 
)
GO