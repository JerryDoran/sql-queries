USE MOVIES

SELECT 
	FilmName,
	FilmBoxOfficeDollars,
	FilmBoxOfficeDollars*0.2 AS [FilmTax],
	FilmBudgetDollars + (FilmBoxOfficeDollars*0.2) AS [FilmTotal]
FROM
	tblFilm