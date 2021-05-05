DECLARE @Names VARCHAR(MAX)
DECLARE @Count INT

EXEC spFilmsInYear 
	@Year = 2000,
	@FilmList = @Names OUTPUT,
	@FilmCount = @Count OUTPUT

SELECT
	@Count AS [Number of Films],
	@Names AS [List of Films]
	  