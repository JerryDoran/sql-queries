CREATE PROC spFilmList
AS
BEGIN
SELECT
	FilmName
	,FilmReleaseDate
	,FilmRunTimeMinutes
FROM
	tblFilm
ORDER BY
	FilmName ASC
END