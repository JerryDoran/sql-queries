USE Movies
GO

--Creating a Multi Statement Table Valued Function (MSTVF)
--Need to define a table variable '@t' in the return statement of the function
CREATE FUNCTION PeopleInYear
(
	@BirthYear INT
)
RETURNS @t TABLE
(
	PersonName VARCHAR(MAX),
	PersonDOB DATETIME,
	PersonJob VARCHAR(8)
)
AS
BEGIN

	INSERT INTO @t
	SELECT
		DirectorName,
		DirectorDOB,
		'Director'
	FROM
		tblDirector
	WHERE
		YEAR(DirectorDOB) =@BirthYear

	INSERT INTO @t
	SELECT
		actorName,
		actorDOB,
		'actor'
	FROM
		tblactor
	WHERE
		YEAR(actorDOB) =@BirthYear

	RETURN

END
