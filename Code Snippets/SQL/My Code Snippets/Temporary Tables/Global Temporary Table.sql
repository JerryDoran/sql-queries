USE Movies
GO

CREATE TABLE ##TempFilm		--Global temporary table has two '##' in front of it
	(
		Title VARCHAR(MAX),
		ReleaseDate DATETIME
	)
INSERT INTO ##TempFilm

SELECT 
	FilmName, 
	FilmReleaseDate
FROM 
	tblFilm
WHERE 
	FilmName LIKE '%star%'

SELECT * FROM ##TempFilm