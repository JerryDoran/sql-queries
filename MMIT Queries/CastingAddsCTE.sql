WITH
	cteCastingAdds
AS
(
	SELECT
		JobOrder, 
		Lbs,
		--SUM(Lbs) AS [Pounds], 
		MaterialTypeID
	FROM 
		MM_JobOrderItems AS job 
	WHERE AddCycle In (1,2)
	--GROUP BY JobOrder, MaterialTypeID
),
	ctecustomer
AS
(
	Select code, name 
	From
	 (values('003', 'SMP'),
	  ('006', 'Minerva'),
	  ('010', 'Douglas'),
	  ('575', 'Mentor')) x(code, name)

),
	cteHeatOwner
AS
(
	SELECT 
		name, 
		h.HeatNumber, 
		c.JobOrder, 
		MaterialGrade, 
		MaterialCode,
		t.ID, 
		TransDate, 
		CustCode
	FROM 
		ctecustomer AS u
		INNER JOIN MM_MaterialOrderSpecs AS m
		INNER JOIN MM_HeatMast AS h
		INNER JOIN MM_CustomerOrder AS c
			ON h.JobOrder = c.JobOrder
			ON m.ID = c.MaterialOrderSpecsID
		INNER JOIN MM_MaterialTypes AS t
			ON m.MaterialTypeID = t.ID 
			ON u.code = m.CustCode
	WHERE 
		TransDate IS NOT NULL

)

	SELECT 
		MM_HeatMast.HeatNumber AS [HEAT NO], 
		SUM(Lbs) AS [POUNDS], 
		cteHeatOwner.MaterialGrade AS GRADE, 
		cteHeatOwner.MaterialCode AS ALLOY, 
		MM_MaterialTypes.MaterialCode AS [RM CODE], 
		MM_Materials.Name AS [RM NAME], 
		cteHeatOwner.name AS OWNER, 
		Furnace AS FURNACE,
		FORMAT(cteHeatOwner.TransDate,'MM/dd/yyyy') AS [Date]
	FROM 
		cteCastingAdds 
		INNER JOIN MM_HeatMast 
			ON cteCastingAdds.JobOrder = MM_HeatMast.JobOrder
		INNER JOIN MM_Materials 
		INNER JOIN MM_MaterialTypes 
			ON MM_Materials.Code = MM_MaterialTypes.MaterialCode 
			ON cteCastingAdds.MaterialTypeID = MM_MaterialTypes.ID
		INNER JOIN cteHeatOwner
			ON MM_HeatMast.HeatNumber = cteHeatOwner.HeatNumber
		INNER JOIN MM_JobOrder 
			ON cteCastingAdds.JobOrder = MM_JobOrder.JobOrder
	WHERE cteHeatOwner.TransDate Between '2019-07-01' AND '2019-07-3'
	GROUP BY MM_HeatMast.HeatNumber, cteHeatOwner.MaterialGrade, cteHeatOwner.MaterialCode, MM_MaterialTypes.MaterialCode, MM_Materials.Name, cteHeatOwner.name, MM_JobOrder.Furnace, cteHeatOwner.TransDate