USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmReleaseDate BETWEEN '2000-01-01' AND '2000-12-31'
ORDER BY
	FilmReleaseDate