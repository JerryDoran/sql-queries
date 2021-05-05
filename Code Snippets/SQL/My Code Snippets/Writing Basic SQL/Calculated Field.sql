USE MOVIES

SELECT 
	FilmName,
	FilmBoxOfficeDollars,
	FilmBudgetDollars,
	FilmBoxOfficeDollars-FilmBudgetDollars AS [FilmProfitLoss]
FROM
	tblFilm
ORDER BY
	FilmProfitLoss DESC