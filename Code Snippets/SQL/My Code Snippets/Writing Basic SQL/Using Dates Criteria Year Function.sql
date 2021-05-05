USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	YEAR(FilmReleaseDate) = 2000 --All films release in the year 2000
ORDER BY
	FilmReleaseDate