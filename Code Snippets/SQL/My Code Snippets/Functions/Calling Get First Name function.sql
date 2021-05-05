SELECT 
	ActorName
	,dbo.fnFirstName(ActorName)
FROM
	tblActor