USE Movies

SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm
WHERE
	YEAR(FilmReleaseDate) = 2000