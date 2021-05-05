--Declare a cursor
DECLARE FilmCursor CURSOR SCROLL
	FOR SELECT FilmID, FilmName, FilmReleaseDate FROM tblFilm

OPEN FilmCursor

	--Do something useful, Need to move to the first record
	FETCH ABSOLUTE 10 FROM FilmCursor
	
	WHILE @@FETCH_STATUS = 0		--When value of zero is returned by the FETCH_STATUS variable it means that the cursor is successfully fetching the next record.
		FETCH RELATIVE 10 FROM FilmCursor
CLOSE FilmCursor
DEALLOCATE FilmCursor