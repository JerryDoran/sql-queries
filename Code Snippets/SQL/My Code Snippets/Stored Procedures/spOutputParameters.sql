USE Movies
GO

ALTER PROCEDURE spFilmsInYear
	(
		@Year INT,
		@FilmList VARCHAR(MAX) OUTPUT,
		@FilmCount INT OUTPUT
	)
AS
BEGIN
	
	DECLARE @Films VARCHAR(MAX)
	SET @Films = ''		--Intitialize the variable to an empty string
	SELECT 
		@Films = @Films + FilmName + ', '
	FROM
		tblFilm
	WHERE
		YEAR(FilmReleaseDate) = @Year
	ORDER BY
		FilmName ASC

	SET @FilmCount =@@ROWCOUNT	--Set the value of the output parameter to the row count.
	SET @FilmList = @Films		--Set the value of the output parameter to the film list.

END
GO
