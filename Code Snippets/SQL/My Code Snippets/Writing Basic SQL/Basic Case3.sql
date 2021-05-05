USE MOVIES

SELECT 
	FilmName,
	FilmRunTimeMinutes,
	CASE
		WHEN FilmRunTimeMinutes <= 90 THEN 'Short'
		WHEN FilmRunTimeMinutes <= 150 THEN 'Medium'
		WHEN FilmRunTimeMinutes <= 180 THEN 'Long'
		ELSE 'Epic'
	END AS [Duration],
	FilmReleaseDate
FROM
	tblFilm
WHERE
	CASE
		WHEN FilmRunTimeMinutes <= 90 THEN 'Short'
		WHEN FilmRunTimeMinutes <= 150 THEN 'Medium'
		WHEN FilmRunTimeMinutes <= 180 THEN 'Long'
		ELSE 'Epic'
	END = 'Medium'