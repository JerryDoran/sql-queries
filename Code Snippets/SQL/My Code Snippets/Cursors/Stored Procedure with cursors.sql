CREATE PROC spListCharacters
(
	@FilmID INT,
	@FilmName VARCHAR(MAX),
	@FilmDate DATETIME
)
AS
BEGIN

	PRINT @FilmName + ' released on ' + CONVERT(CHAR(10), @FilmDate,103)
	PRINT '====================================================='
	PRINT 'List of Characters'

	SELECT 
		CastCharacterName
	FROM	
		tblCast
	WHERE
		CastFilmID=@FilmID

END











