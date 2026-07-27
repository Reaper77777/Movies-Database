-- Forcefully disconnect everyone from the Movies database and drop it
USE master;
GO

ALTER DATABASE Movies SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE Movies;
GO