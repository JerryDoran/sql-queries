USE Movies

SELECT
	FilmName,
	FilmDirectorID
FROM
	tblFilm
WHERE
	FilmDirectorID IN
			(SELECT
				DirectorID
			FROM
				tblDirector
			WHERE
				DirectorDOB BETWEEN '1946-01-01' AND '1946-12-31')