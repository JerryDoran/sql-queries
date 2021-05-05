USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmRunTimeMinutes > 180 AND
	(FilmName LIKE 's%' OR
	FilmName LIKE 't%')
ORDER BY
	FilmReleaseDate