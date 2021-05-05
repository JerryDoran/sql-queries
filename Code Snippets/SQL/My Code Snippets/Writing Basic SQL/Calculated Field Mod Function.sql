USE MOVIES

SELECT 
	FilmName,
	FilmRunTimeMinutes,
	FilmRunTimeMinutes/60 AS [Hours],
	FilmRunTimeMinutes%60 AS [Minutes]

FROM
	tblFilm