USE Movies

SELECT
	FilmName,
	FilmReleaseDate,
	CONVERT(CHAR(10),FilmReleaseDate,101)  --Use CHAR(8) and code 1 for just the two digit year.
FROM
	tblFilm