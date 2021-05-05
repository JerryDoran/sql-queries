DECLARE @NumFilms INT

SET @NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmRunTimeMinutes > 180)

IF @NumFilms > 10
	PRINT 'There are many long films in the database'
ELSE
	PRINT 'There are no more than 10 long films in the database'