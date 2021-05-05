USE Movies

IF OBJECT_ID('dbo.tblFilmTest') IS NOT NULL
DROP TABLE dbo.tblFilmTest;
GO

CREATE TABLE dbo.tblFilmTest
(
	FilmID INT IDENTITY PRIMARY KEY,
	FilmName XML
);

INSERT INTO dbo.tblFilmTest (FilmName)
SELECT TOP 5
	FilmName
FROM tblFilm;

SELECT * FROM tblFilmTest
FOR XML AUTO, TYPE, ELEMENTS, ROOT