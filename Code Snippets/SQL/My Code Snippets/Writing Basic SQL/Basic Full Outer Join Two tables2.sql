USE Movies

--This query will show only people who have been directors and not actors. It will list all the directors from director table and only the ones that have been actors from the actor table
SELECT
	*
FROM
	tblActor AS a
	FULL OUTER JOIN tblDirector AS d
		ON a.ActorName = d.DirectorName
