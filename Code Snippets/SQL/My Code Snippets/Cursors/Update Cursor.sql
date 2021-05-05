DECLARE @FilmOscars INT
DECLARE @TotalOscars INT

SET @TotalOscars = 0

DECLARE FilmCursor CURSOR
	FOR SELECT FilmOscarWins FROM tblFilm
	FOR UPDATE OF FilmOscarWins

OPEN FilmCursor

	--Do something useful, Need to move to the first record
	FETCH NEXT FROM FilmCursor INTO @FilmOscars

	WHILE @@FETCH_STATUS=0
	BEGIN
		SET @TotalOscars +=@FilmOscars

		UPDATE tblFilm
			SET FilmOscarWins = @TotalOscars
			WHERE CURRENT OF FilmCursor

		FETCH NEXT FROM FilmCursor INTO @FilmOscars
	END
	
CLOSE FilmCursor
DEALLOCATE FilmCursor

SELECT * FROM tblFilm