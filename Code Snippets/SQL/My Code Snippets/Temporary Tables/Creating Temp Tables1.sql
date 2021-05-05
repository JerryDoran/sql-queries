USE Movies
GO

SELECT 
	FilmName, 
	FilmReleaseDate
INTO #TempFilms		--All temporary tables begin with a '#' symbol
FROM 
	tblFilm
WHERE 
	FilmName LIKE '%star%'

SELECT * FROM #TempFilms