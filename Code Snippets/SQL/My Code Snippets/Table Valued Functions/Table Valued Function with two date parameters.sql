USE [Movies]
GO

ALTER FUNCTION [dbo].[FilmsInYear]
(
	@StartYear INT,
	@EndYear INT
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
	YEAR(FilmReleaseDate) BETWEEN @StartYear AND @EndYear