DECLARE FilmCursor CURSOR FORWARD_ONLY
	FOR SELECT FilmID, FilmName, FilmReleaseDate FROM tblFilm

GO

OPEN FilmCursor

	--Do something useful, Need to move to the first record
	FETCH NEXT FROM FilmCursor
	
CLOSE FilmCursor
DEALLOCATE FilmCursor