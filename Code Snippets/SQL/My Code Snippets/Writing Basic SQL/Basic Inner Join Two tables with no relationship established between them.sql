USE Movies

--This query will show matching records between both tables.  It will show Actors who have been Directors where fields from both tables are equal.
SELECT
	*
FROM
	tblActor AS a
	INNER JOIN tblDirector AS d
		ON a.ActorName = d.DirectorName