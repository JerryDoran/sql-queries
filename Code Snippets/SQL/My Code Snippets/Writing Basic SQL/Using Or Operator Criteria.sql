USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmName LIKE 'x%' OR
	FilmName LIKE 'y%' OR
	FilmName LIKE 'W%'
ORDER BY
	FilmReleaseDate