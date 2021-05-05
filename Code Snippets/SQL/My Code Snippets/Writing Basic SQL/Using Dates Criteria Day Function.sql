USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	DAY(FilmReleaseDate) = 22 --All films release are a particular day
ORDER BY
	FilmReleaseDate