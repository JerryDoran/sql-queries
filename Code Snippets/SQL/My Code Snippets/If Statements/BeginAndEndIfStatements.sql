DECLARE @NumFilms INT

SET @NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmRunTimeMinutes > 180)

IF @NumFilms > 5
	BEGIN
		PRINT 'WARNING!'
		PRINT 'There are many long films in the database'
	END
ELSE
	BEGIN
		PRINT 'INFORMATION'
		PRINT 'There are no more than 6 long films in the database'
	END