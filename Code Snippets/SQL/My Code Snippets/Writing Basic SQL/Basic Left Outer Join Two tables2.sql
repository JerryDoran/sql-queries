USE Movies

--This query will show only people who have been actors and not directors. It will list all the actors and only the ones that have been directors from the director table
SELECT
	*
FROM
	tblActor AS a
	LEFT OUTER JOIN tblDirector AS d
		ON a.ActorName = d.DirectorName
WHERE 
	d.DirectorID IS NULL