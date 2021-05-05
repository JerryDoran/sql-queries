--Parameters of sp_executesql

EXEC sp_executesql
	N'SELECT FilmName, FilmReleaseDate, FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes > @Length AND FilmReleaseDate > @StartDate'
	,N'@Length INT, @StartDate DATETIME'
	,@Length = 120
	,@StartDate = '2000-01-01'