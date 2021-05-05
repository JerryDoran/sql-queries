--Common Table Expressions, or CTE's for short
--Creates a temporary set of records that can immediately be used in a Select statement for example

WITH EarlyFilms AS
(
	SELECT
		FilmName,
		FilmReleaseDate,
		FilmRunTimeMinutes
	FROM
		tblFilm
	WHERE
		FilmReleaseDate < '2000-01-01'
)
SELECT
	*
FROM
	EarlyFilms
WHERE
	FilmRunTimeMinutes > 120 
		
	