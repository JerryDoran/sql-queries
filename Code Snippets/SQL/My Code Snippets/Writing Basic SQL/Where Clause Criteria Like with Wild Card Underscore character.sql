USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmName LIKE 'lethal weapon__'
ORDER BY
	FilmRunTimeMinutes