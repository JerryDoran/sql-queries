USE Movies

--If using aggregate funtions in the SELECT list then any field that is not aggregated must be put into the GROUP BY clause
SELECT
	CountryName,
	AVG(FilmRunTimeMinutes)
FROM
	tblFilm AS f
	INNER JOIN tblCountry AS c 
		ON c.CountryID = f.FilmCountryID
GROUP BY CountryName
ORDER BY
	CountryName ASC