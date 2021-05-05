USE Movies
GO

DECLARE @NameList VARCHAR(MAX)
SET @NameList = ''		--Intitialize the variable to an empty string

SELECT
	--@NameList = @NameList + ActorName +', '
	@NameList = @NameList + ActorName + CHAR(10)
FROM
	tblActor
WHERE
	YEAR(ActorDOB) = 1970

PRINT @NameList
