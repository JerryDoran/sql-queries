USE MOVIES

SELECT 
	FilmName,
	UPPER(FilmName),
	FilmReleaseDate,
	DATENAME(M,FilmReleaseDate)	
FROM
	tblFilm