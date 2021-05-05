USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmRunTimeMinutes IN (90, 120, 150, 180)
ORDER BY
	FilmRunTimeMinutes