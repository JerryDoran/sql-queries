USE Movies

SELECT TOP 10 WITH TIES
	FilmName AS [Title],
	FilmReleaseDate AS [Released on],
	FilmRunTimeMinutes AS [Duration],
	FilmOscarNominations,
	FilmOscarWins
FROM
	tblFilm
ORDER BY 
	FilmOscarWins DESC