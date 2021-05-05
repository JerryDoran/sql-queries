USE Movies

SELECT
	FilmName,
	FilmReleaseDate
FROM
	tblFilm
WHERE
	FilmReleaseDate = 
			(SELECT
				FilmReleaseDate
			FROM
				tblFilm
			WHERE
				FilmName = 'Casino')