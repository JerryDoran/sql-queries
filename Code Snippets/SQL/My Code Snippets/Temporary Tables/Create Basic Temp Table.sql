USE Movies

DROP TABLE #TempPeople

CREATE TABLE #TempPeople
(
	PersonName VARCHAR(MAX),
	PersonDate DATETIME
)

INSERT INTO #TempPeople
SELECT
	ActorName,
	ActorDOB
FROM
	tblActor
WHERE
	ActorDOB < '1940-01-01'

SELECT * FROM #TempPeople