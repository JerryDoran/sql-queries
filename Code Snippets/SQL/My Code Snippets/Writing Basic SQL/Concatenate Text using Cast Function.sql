USE Movies

SELECT
	FilmName,
	FilmOscarWins,
	FilmName + ' won ' + CAST(FilmOscarWins AS VARCHAR(2)),
	FilmName + ' won ' + CONVERT(VARCHAR(2),FilmOscarWins)
FROM
	tblFilm