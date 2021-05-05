USE Movies
--Use CHAR(8) and code 1 for just the two digit year.
SELECT
	FilmName,
	FilmReleaseDate,
	CONVERT(CHAR(10),FilmReleaseDate,101),
	DATENAME(DW, FilmReleaseDate) + ' ' +
	DATENAME(DD, FilmReleaseDate) + ' ' +
	DATENAME(MM, FilmReleaseDate) + ' ' +
	DATENAME(YY, FilmReleaseDate)
FROM
	tblFilm