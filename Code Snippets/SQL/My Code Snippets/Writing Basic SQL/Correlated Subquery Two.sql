USE Movies

SELECT
	c.CountryName,
	f.FilmName,
	f.FilmRunTimeMinutes
FROM
	tblFilm AS f
	INNER JOIN tblCountry AS c
		ON c.CountryID = f.FilmCountryID
WHERE
	f.FilmRunTimeMinutes > 
		(
			SELECT AVG(FilmRunTimeMinutes)
			FROM tblFilm AS g
			WHERE g.FilmCountryID = f.FilmCountryID
		)