USE Movies

SELECT
	SUM(CONVERT(BIGINT,FilmBoxOfficeDollars)),
	AVG(CONVERT(DECIMAL,FilmRunTimeMinutes))
FROM
	tblFilm