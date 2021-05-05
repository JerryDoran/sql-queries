--Concatenating numbers

DECLARE @Number INT
DECLARE @SQLString NVARCHAR(MAX)
DECLARE @NumberString NVARCHAR(4)

SET @Number = 3
SET @NumberString = CAST(@Number AS NVARCHAR(4))

SET @SQLString = N'SELECT TOP ' + @NumberString + ' * FROM tblFilm ORDER BY FilmReleaseDate'

EXEC sp_executesql @SQLString