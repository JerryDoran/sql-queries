USE Movies
GO


DECLARE @ID INT
DECLARE @Name VARCHAR(MAX)
DECLARE @Date DATETIME

SELECT TOP 1
	@ID = ActorID, 
	@Name = ActorName,
	@Date = ActorDOB
FROM 
	tblActor
WHERE
	ActorDOB >= '1970-01-01'
ORDER BY
	ActorDOB ASC

SELECT @Name, @Date

SELECT
	f.FilmName,
	c.CastCharacterName
FROM
	tblFilm AS f
	INNER JOIN tblCast AS c ON f.FilmID = c.CastFilmID
WHERE
	c.CastActorID = @ID 