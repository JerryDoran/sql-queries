USE Movies

SELECT
	ISNULL(CountryName,'Grand'),
	ISNULL(DirectorName,'Total'),
	AVG(CONVERT(DECIMAL,FilmRunTimeMinutes)),
	COUNT(*)
FROM
	tblFilm AS f
	INNER JOIN tblCountry AS c
		ON c.CountryID = f.FilmCountryID
	INNER JOIN tblDirector as d
		ON d.DirectorID = f.FilmDirectorID
GROUP BY
	CountryName,
	DirectorName WITH ROLLUP
ORDER BY
	CountryName