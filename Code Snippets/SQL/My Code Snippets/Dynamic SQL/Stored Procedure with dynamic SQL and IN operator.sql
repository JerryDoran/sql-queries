--Dynamic SQL and the IN operator

CREATE PROC spFilmYears
(
	@YearList NVARCHAR(MAX)
)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	SET @SQLString = 
		N'SELECT *
		FROM tblFilm
		WHERE YEAR(FilmReleaseDate) IN (' + @YearList + N')
		ORDER BY FilmReleaseDate'
	
	EXEC sp_executesql @SQLString
END

