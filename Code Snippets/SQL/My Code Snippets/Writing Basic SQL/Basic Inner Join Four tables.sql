USE Movies

SELECT
	f.FilmName,
	d.DirectorName,
	s.StudioName,
	c.CountryName
FROM
	tblFilm AS f
	INNER JOIN tblDirector AS d
		ON f.FilmDirectorID = d.DirectorID
	INNER JOIN tblStudio AS s
		ON f.FilmStudioID = s.StudioID
	INNER JOIN tblCountry AS c
		ON f.FilmCountryID = c.CountryID