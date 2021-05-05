USE Movies
GO

CREATE PROCEDURE spFilmsInYearII
	(
		@Year INT		
	)
AS
BEGIN
	
	SELECT 
		FilmName
	FROM
		tblFilm
	WHERE
		YEAR(FilmReleaseDate) = @Year
	ORDER BY
		FilmName ASC

	RETURN @@ROWCOUNT

END
GO
