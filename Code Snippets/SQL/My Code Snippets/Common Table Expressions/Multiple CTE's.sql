WITH EarlyFilms AS
(
	SELECT
		FilmName,
		FilmReleaseDate
	FROM
		tblFilm
	WHERE
		FilmReleaseDate < '2000-01-01'
),
RecentFilms AS
(
	SELECT
		FilmName,
		FilmReleaseDate
	FROM
		tblFilm
	WHERE
		FilmReleaseDate >= '2000-01-01'
)
SELECT
	*
FROM
	EarlyFilms AS e
	INNER JOIN RecentFilms AS r
		ON e.FilmName = r.FilmName