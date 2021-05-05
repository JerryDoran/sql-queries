USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmName NOT LIKE '%twilight%'
ORDER BY
	FilmRunTimeMinutes