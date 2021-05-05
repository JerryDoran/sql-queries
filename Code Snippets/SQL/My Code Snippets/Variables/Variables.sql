USE Movies
GO

SET NOCOUNT ON --Suppresses the row count message

--Declaring variables
DECLARE @MyDate DATETIME
DECLARE @NumFilms INT
DECLARE @NumActors INT
DECLARE @NumDirectors INT

--Setting the value of a variable
SET @MyDate = '1980-01-01'
SET @NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmReleaseDate >= @MyDate)
SET @NumActors =(SELECT COUNT(*) FROM tblActor WHERE ActorDOB >= @MyDate)
SET @NumDirectors = (SELECT COUNT(*) FROM tblDirector WHERE DirectorDOB >= @MyDate)

SELECT 'Number of films', @NumFilms
UNION
SELECT 'Number of actors', @NumActors

PRINT 'Number of films = ' + CAST(@NumFilms AS VARCHAR(MAX))
PRINT 'Number of actors = ' + CAST(@NumActors AS VARCHAR(MAX))
PRINT 'Number of directors = ' + CAST(@NumDirectors AS VARCHAR(MAX))

SELECT FilmName AS [Name], FilmReleaseDate AS [Date], 'Film' AS [Type]
FROM tblFilm
WHERE FilmReleaseDate >= @MyDate

UNION All

SELECT ActorName, ActorDOB, 'Actor'
FROM tblActor
WHERE ActorDOB > @MyDate

UNION ALL

SELECT DirectorName, DirectorDOB, 'Director'
FROM tblDirector
WHERE DirectorDOB >= @MyDate
ORDER BY [Date] ASC