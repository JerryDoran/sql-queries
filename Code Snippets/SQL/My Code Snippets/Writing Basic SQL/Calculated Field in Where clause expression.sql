USE MOVIES

SELECT 
	FilmName,
	FilmBoxOfficeDollars,
	FilmBudgetDollars,
	FilmBoxOfficeDollars-FilmBudgetDollars AS [FilmProfitLoss]
FROM
	tblFilm
WHERE
	(FilmBoxOfficeDollars-FilmBudgetDollars) < 0
ORDER BY
	FilmProfitLoss DESC