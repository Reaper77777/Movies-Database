USE Movies;
GO

-- 1. Reset: Drop the Producer table if it already exists to clear previous errors
IF OBJECT_ID('FK_Movies_Producer', 'F') IS NOT NULL
    ALTER TABLE Movies DROP CONSTRAINT FK_Movies_Producer;
GO

DROP TABLE IF EXISTS Producer;
GO

-- 2. Create the initial Producer table
CREATE TABLE Producer (
    ProducerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    CompanyName VARCHAR(100) NULL,
    City VARCHAR(40) NULL
);
GO

-- 3. Link Producer to Movies
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Movies') AND name = 'ProducerID')
BEGIN
    ALTER TABLE Movies ADD ProducerID INT NULL;
END
GO

ALTER TABLE Movies
ADD CONSTRAINT FK_Movies_Producer 
FOREIGN KEY (ProducerID) REFERENCES Producer(ProducerID);
GO

-- 4. Add the requested attributes
ALTER TABLE Producer
ADD 
    FavoriteColor VARCHAR(25) NULL,
    Licensed BIT NULL,
    StartDate DATE NULL;
GO

-- 5. Drop FavoriteColor
ALTER TABLE Producer
DROP COLUMN FavoriteColor;
GO

-- 6. Modify City data type to VARCHAR(50)
ALTER TABLE Producer
ALTER COLUMN City VARCHAR(50) NULL;
GO

-- 7. Make Licensed NOT NULL
ALTER TABLE Producer
ALTER COLUMN Licensed BIT NOT NULL;
GO
