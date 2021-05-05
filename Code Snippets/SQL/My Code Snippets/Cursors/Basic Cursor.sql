--Declare a cursor
DECLARE FilmCursor CURSOR
	FOR SELECT FilmID, FilmName, FilmReleaseDate FROM tblFilm

OPEN FilmCursor

	--Do something useful, Need to move to the first record
	FETCH NEXT FROM FilmCursor
	
	WHILE @@FETCH_STATUS = 0		--When value of zero is returned by the FETCH_STATUS variable it means that the cursor is successfully fetching the next record.
		FETCH NEXT FROM FilmCursor
CLOSE FilmCursor
DEALLOCATE FilmCursor