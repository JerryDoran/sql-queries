WITH 
	ctetask
AS
(
	SELECT taskid, taskname 
	FROM
	 (VALUES('C', 'CHANGE'),
	  ('H', 'HEAT'),
	  ('S', 'SKULL & PATCH')) x(taskid, taskname)

)

SELECT 
	jo.JobOrder,
	hm.HeatNumber, 
	--FORMAT(cteHeatOwner.TransDate,'MM/dd/yyyy') AS [Date]
	FORMAT(PourDate,'dd MMM') AS PourDate, 
	FORMAT(ScheduleDate,'MM/dd/yyyy') AS ScheduleDate,
	Furnace, 
	CustomerPONumber,
	co.ID,
	Size,
	SurfaceFinish,
	FORMAT(Lbs, '#,###') AS Lbs,
	FORMAT(RequestedDate,'dd MMM') AS RequestedDate, 
	MaterialGrade,
	CASE MaterialCode WHEN 'MZ' THEN MaterialCode + '-' + 'EC' WHEN 'CV' THEN MaterialCode + '-' + 'EN' ELSE MaterialCode END AS Alloy,
	CASE ts.taskname WHEN 'CHANGE' THEN ts.taskname WHEN 'SKULL & PATCH' THEN ts.taskname ELSE '' END AS Status, 
	[Sequence], 
	pl.[Name] AS [PlantName],
	CASE SpecialRemarks WHEN 'Consolidation Heat' THEN 'CON' WHEN 'MINSMP' THEN SpecialRemarks WHEN 'MINDOU' THEN SpecialRemarks 
	WHEN 'MINMEN' THEN SpecialRemarks WHEN 'SMPMEN' THEN SpecialRemarks WHEN 'AETC' THEN SpecialRemarks WHEN 'SLUG' THEN SpecialRemarks ELSE '' END AS Remark
FROM 
	MM_JobOrderConstraints AS jc
	RIGHT JOIN ctetask as ts 
	INNER JOIN MM_CustomerOrderTubes AS ct
	RIGHT JOIN MM_MaterialOrderSpecs AS ms
	RIGHT JOIN MM_CustomerOrder AS co
	RIGHT JOIN MM_JobOrder AS jo
	ON co.JobOrder = jo.JobOrder 
	ON ms.ID = co.MaterialOrderSpecsID
	ON ct.CustomerOrderID = co.ID
	LEFT JOIN MM_MaterialTypes AS mt
	ON ms.MaterialTypeID = mt.ID
	ON ts.taskid = jo.Type
	ON jc.JobOrder = jo.JobOrder
	LEFT JOIN MM_HeatMast AS hm
	ON jo.JobOrder = hm.JobOrder
	LEFT JOIN LotControl.dbo.MM_Plant as pl
	ON ms.CustCode = pl.PlantID
WHERE 
	(jc.[Type]='C' Or jc.Type Is Null) AND ScheduleDate Between '2020-09-28' And '2020-10-26' AND pl.Name='Minerva'
ORDER BY 
	ScheduleDate, Furnace, Sequence;