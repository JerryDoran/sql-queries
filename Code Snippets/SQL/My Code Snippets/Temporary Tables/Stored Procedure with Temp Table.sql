CREATE PROC spInsertIntoTemp(@Text as VARCHAR(MAX))
AS
BEGIN
	
	INSERT INTO #TempFilms
	SELECT
		FilmName,
		FilmReleaseDate
	FROM
		tblFilm
	WHERE
		FilmName LIKE '%' + @Text + '%'
END