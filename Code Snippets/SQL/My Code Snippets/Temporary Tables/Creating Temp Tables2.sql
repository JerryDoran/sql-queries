USE Movies
GO

CREATE TABLE #TempFilms
	(
		Title VARCHAR(MAX),
		ReleaseDate DATETIME
	)
INSERT INTO #TempFilms

SELECT 
	FilmName, 
	FilmReleaseDate
FROM 
	tblFilm
WHERE 
	FilmName LIKE '%star%'

SELECT * FROM #TempFilms