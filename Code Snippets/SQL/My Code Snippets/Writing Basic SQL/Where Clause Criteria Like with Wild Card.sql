USE MOVIES

SELECT 
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	FilmName LIKE '%die hard%'
ORDER BY
	FilmRunTimeMinutes