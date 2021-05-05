USE Movies

SELECT
	FilmName,
	FilmReleaseDate
FROM
	tblFilm
WHERE
	FilmOscarWins =
			(SELECT
				MAX(FilmOscarWins)
			FROM
				tblFilm)