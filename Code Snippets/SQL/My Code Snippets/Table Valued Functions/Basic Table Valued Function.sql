USE Movies
GO

--Creating Table valued function
CREATE FUNCTION FilmsInYear
(
	@FilmYear INT
)
RETURNS TABLE
AS
RETURN
	SELECT
		FilmName,
		FilmReleaseDate,
		FilmRunTimeMinutes
	FROM
		tblFilm
	WHERE
		YEAR(FilmReleaseDate) = @FilmYear