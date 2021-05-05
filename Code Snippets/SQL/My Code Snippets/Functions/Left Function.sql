SELECT 
	DirectorName,
	LEFT(DirectorName,CHARINDEX(' ',DirectorName)-1)
FROM
	tblDirector