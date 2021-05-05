USE MOVIES

SELECT 
	FilmName,
	FilmRunTimeMinutes,
	CASE
		WHEN FilmRunTimeMinutes <= 90 THEN 'Short'
	END

FROM
	tblFilm