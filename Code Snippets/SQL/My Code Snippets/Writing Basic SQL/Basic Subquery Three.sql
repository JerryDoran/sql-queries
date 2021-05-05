USE Movies

SELECT
	FilmName,
	FilmReleaseDate,
	FilmBudgetDollars
FROM
	tblFilm
WHERE
	FilmBudgetDollars >
			(SELECT
				MAX(FilmBudgetDollars)
			FROM
				tblFilm
			WHERE
				FilmReleaseDate < '2000-01-01')
