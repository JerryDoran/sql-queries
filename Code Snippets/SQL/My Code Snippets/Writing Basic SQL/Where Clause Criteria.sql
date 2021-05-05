USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmRunTimeMinutes BETWEEN 120 AND 150
ORDER BY
	FilmRunTimeMinutes