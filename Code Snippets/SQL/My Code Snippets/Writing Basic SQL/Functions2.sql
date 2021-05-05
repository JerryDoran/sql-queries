USE MOVIES

SELECT 
	FilmName,
	UPPER(FilmName),
	FilmReleaseDate,
	DATENAME(M,FilmReleaseDate),	
	DATEDIFF(D,FilmReleaseDate,GETDATE()) --how old the film is in days
FROM
	tblFilm