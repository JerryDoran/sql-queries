USE Movies

SELECT
	ActorName,
	LEFT(ActorName,CHARINDEX(' ',ActorName)-1) AS [First Name],
	RIGHT(ActorName,LEN(ActorName) - CHARINDEX(' ',ActorName)) AS [Last Name]
FROM
	tblActor