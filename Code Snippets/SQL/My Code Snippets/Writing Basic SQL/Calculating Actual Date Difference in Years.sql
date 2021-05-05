USE Movies

SELECT
	FilmName,
	FilmReleaseDate,
	GETDATE(),
	DATEDIFF(DD, FilmReleaseDate, GETDATE()) AS [Days Old],
	DATEDIFF(YY, FilmReleaseDate, GETDATE()) AS [Years Old],
	DATEADD(YY,DATEDIFF(YY, FilmReleaseDate, GETDATE()),FilmReleaseDate) AS [Birth Date in Current Year],
	CASE
		WHEN DATEADD(YY,DATEDIFF(YY, FilmReleaseDate, GETDATE()),FilmReleaseDate) > GETDATE()
		THEN DATEDIFF(YY, FilmReleaseDate, GETDATE()) - 1 
		ELSE DATEDIFF(YY, FilmReleaseDate, GETDATE())
	END
FROM
	tblFilm