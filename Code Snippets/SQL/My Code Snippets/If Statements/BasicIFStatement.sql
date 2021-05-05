DECLARE @NumFilms INT

SET @NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmRunTimeMinutes > 180)

IF @NumFilms > 5
	PRINT 'There are many long films in the database'