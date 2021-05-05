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
		JobOrderItems AS job 
	WHERE AddCycle In (1,2)
	--GROUP BY JobOrder, MaterialTypeID
),
	cteHeatOwner
AS
(
	SELECT 
		customer_name, 
		h.HeatNumber, 
		c.JobOrder, 
		MaterialGrade, 
		MaterialCode,
		t.ID, 
		TransDate, 
		CustCode
	FROM 
		customer AS u
		INNER JOIN MaterialOrderSpecs AS m
		INNER JOIN HeatMast AS h
		INNER JOIN CustomerOrder AS c
			ON h.JobOrder = c.JobOrder
			ON m.ID = c.MaterialOrderSpecsID
		INNER JOIN MaterialTypes AS t
			ON m.MaterialTypeID = t.ID 
			ON u.code = m.CustCode
	WHERE 
		TransDate IS NOT NULL

)

	SELECT 
		HeatMast.HeatNumber AS [HEAT NO], 
		SUM(Lbs) AS [POUNDS], 
		cteHeatOwner.MaterialGrade AS GRADE, 
		cteHeatOwner.MaterialCode AS ALLOY, 
		MaterialTypes.MaterialCode AS [RM CODE], 
		Name AS [RM NAME], 
		customer_name AS OWNER, 
		Furnace AS FURNACE,
		FORMAT(cteHeatOwner.TransDate,'MM/dd/yyyy') AS [Date]
	FROM 
		cteCastingAdds 
		INNER JOIN HeatMast 
			ON cteCastingAdds.JobOrder = HeatMast.JobOrder
		INNER JOIN Materials 
		INNER JOIN MaterialTypes 
			ON Materials.Code = MaterialTypes.MaterialCode 
			ON cteCastingAdds.MaterialTypeID = MaterialTypes.ID
		INNER JOIN cteHeatOwner
			ON HeatMast.HeatNumber = cteHeatOwner.HeatNumber
		INNER JOIN JobOrder 
			ON cteCastingAdds.JobOrder = JobOrder.JobOrder
	WHERE cteHeatOwner.TransDate Between '2019-07-01' AND '2019-07-03'
	GROUP BY HeatMast.HeatNumber, cteHeatOwner.MaterialGrade, cteHeatOwner.MaterialCode, MaterialTypes.MaterialCode, Materials.Name, cteHeatOwner.customer_name, JobOrder.Furnace, cteHeatOwner.TransDate
	
		