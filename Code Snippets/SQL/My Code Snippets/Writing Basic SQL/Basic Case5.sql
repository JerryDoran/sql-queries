USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	CASE
		WHEN FilmReleaseDate < '1927-10-01' THEN 'Silent era'
		ELSE 'Talkie era'
	END AS [Era Type]
	
FROM
	tblFilm