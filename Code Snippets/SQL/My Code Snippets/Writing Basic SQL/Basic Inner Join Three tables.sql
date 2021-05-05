USE Movies

SELECT
	*
FROM
	tblFilm AS f
	INNER JOIN tblDirector AS d
		ON f.FilmDirectorID = d.DirectorID
	INNER JOIN tblStudio AS s
		ON f.FilmStudioID = s.StudioID
