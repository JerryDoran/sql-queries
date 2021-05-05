--Using Dynamic SQL
--Need to make sure the string of text is in unicode format.  Need to put an 'N' in the front of the string.

EXECUTE sp_executesql N'SELECT * FROM tblFilm'