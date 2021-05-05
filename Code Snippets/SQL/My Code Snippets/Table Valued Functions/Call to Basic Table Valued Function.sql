USE Movies

SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	dbo.FilmsInYear(2000,2002)		--Must include the schema 'dbo' in front of the function