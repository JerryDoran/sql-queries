--Declare variables
DECLARE @ID INT	
DECLARE @Name VARCHAR(MAX)
DECLARE @Date DATETIME
		
DECLARE FilmCursor CURSOR 
	FOR SELECT FilmID, FilmName, FilmReleaseDate FROM tblFilm

OPEN FilmCursor

	--Do something useful, Need to move to the first record
	FETCH NEXT FROM FilmCursor	
		INTO @ID, @Name, @Date
		
	WHILE @@FETCH_STATUS = 0		--When value of zero is returned by the FETCH_STATUS variable it means that the cursor is successfully fetching the next record.
		BEGIN

			EXEC spListCharacters @ID, @Name, @Date

			FETCH NEXT FROM FilmCursor 
				INTO @ID, @Name, @Date 
		END

CLOSE FilmCursor
DEALLOCATE FilmCursor