
WITH FilmCounts(Country, NumberOfFilms) AS
(
	SELECT
		FilmCountryID,
		COUNT(*)
	FROM
		tblFilm
	GROUP BY
		FilmCountryID
)

SELECT
	Country
	,NumberOfFilms
FROM
	FilmCounts