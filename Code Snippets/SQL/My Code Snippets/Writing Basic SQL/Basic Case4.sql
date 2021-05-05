USE MOVIES

SELECT 
	FilmName,
	CASE
		WHEN FilmName LIKE '%twilight%' THEN 'Just Awful'
		ELSE 'Not bad'
	END AS [Rating]	
FROM
	tblFilm