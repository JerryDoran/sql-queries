--Standard Grouping Query

USE Movies

SELECT
	CountryName
	,COUNT(FilmID) AS [Number of Films]
FROM
	tblCountry AS c
	INNER JOIN tblFilm AS f
	ON c.CountryID = f.FilmCountryID
GROUP BY
	CountryName