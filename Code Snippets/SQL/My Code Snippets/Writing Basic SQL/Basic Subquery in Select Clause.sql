USE Movies

SELECT
	FilmName,
	FilmRunTimeMinutes,
	(SELECT
			AVG(FilmRunTimeMinutes)
		FROM
			tblFilm) AS [AverageRunTime]
FROM
	tblFilm
WHERE
	FilmRunTimeMinutes <= 
		(SELECT
			AVG(FilmRunTimeMinutes)
		FROM
			tblFilm)