USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmName LIKE '%star%' AND
	FilmReleaseDate < '2000-01-01' AND
	FilmRunTimeMinutes > 120
ORDER BY
	FilmReleaseDate