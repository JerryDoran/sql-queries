DECLARE @Counter INT
DECLARE @MaxOscars INT
DECLARE @NumFilms INT

SET @MaxOscars = (SELECT MAX(FilmOscarNominations) FROM tblFilm)
SET @Counter = 0

WHILE @Counter <= @MaxOscars
	BEGIN
		SET @NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmOscarNominations = @Counter)

		IF @NumFilms = 0 BREAK
		
		PRINT CAST(@NumFilms AS VARCHAR(3)) + ' film(s) have been nominated for ' + CAST(@Counter AS VARCHAR(2)) + ' Oscars'
		
		SET @Counter = @Counter + 1
	END