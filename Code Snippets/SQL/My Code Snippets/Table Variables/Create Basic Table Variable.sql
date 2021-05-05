USE Movies

DECLARE @TempPeople TABLE		--Declare a table variable
(
	PersonName VARCHAR(MAX),
	PersonDOB DATETIME
)

INSERT INTO @TempPeople
SELECT
	ActorName,
	ActorDOB
FROM
	tblActor
WHERE
	ActorDOB < '1960-01-01'

SELECT * FROM @TempPeople