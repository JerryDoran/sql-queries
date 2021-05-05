USE Movies

SELECT
	ActorName,
	RIGHT(ActorName,LEN(ActorName) - CHARINDEX(' ',ActorName)) + 
	', ' + LEFT(ActorName,CHARINDEX(' ',ActorName)-1) AS [Reverse Full Name]
FROM
	tblActor
ORDER BY
	[Reverse Full Name]