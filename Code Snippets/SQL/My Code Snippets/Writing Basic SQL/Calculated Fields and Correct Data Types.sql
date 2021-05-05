USE MOVIES

SELECT 
	FilmName,
	FilmRunTimeMinutes,
	FilmRunTimeMinutes/60.0 AS [RunTimeHours]
FROM
	tblFilm
