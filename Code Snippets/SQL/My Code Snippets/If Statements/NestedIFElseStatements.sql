DECLARE @KidFilms INT
DECLARE @AdultOnlyFilms INT

SET @KidFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmCertificateID = 2)
SET @AdultOnlyFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmCertificateID = 4)

IF @KidFilms > 0
	BEGIN
		PRINT 'WARNING!'
		PRINT 'There are many kid films in the database'
		IF @AdultOnlyFilms > 60
			BEGIN
				PRINT 'Phew! There are enough adult only films to make up for it!'
			END
		ELSE
			BEGIN
				PRINT 'There are not enough adult only films either'
			END
	END
ELSE
	BEGIN
		PRINT 'INFORMATION'
		PRINT 'There are no more than 6 kid films in the database'
	END

	