USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	MONTH(FilmReleaseDate) = 5 --All films release in the month of May
ORDER BY
	FilmReleaseDate