USE Movies

SELECT
	d.DirectorID,
	d.DirectorName,
	f.FilmName,
	f.FilmDirectorID
FROM
	tblDirector AS d		
	LEFT OUTER JOIN tblFilm AS f
		ON d.DirectorID = f.FilmDirectorID
WHERE
	f.FilmID IS NULL