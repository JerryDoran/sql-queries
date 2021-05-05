
SELECT 
	h.HeatNumber, 
	c.JobOrder,
	j.JobOrder, 
	MaterialGrade, 
	MaterialCode, 
	TransDate AS [Heat Date], 
	CustCode,
	customer_name,
	LotNumber,
	Lbs,
	Location,
	MaterialSize,
	Owner,
	HeatNumber AS [Heat Num],
	InventoryType,
	MaterialCode,
	Name AS [Material Name],
	Name AS [Supplier]
FROM MM_MaterialOrderSpecs AS m 
		INNER JOIN MM_HeatMast AS h
		INNER JOIN MM_CustomerOrder AS c
			ON h.JobOrder = c.JobOrder
			ON m.ID = c.MaterialOrderSpecsID
		 INNER JOIN MM_MaterialTypes AS t
			ON m.MaterialTypeID = t.ID 
		INNER JOIN mm_customer AS u
			ON m.CustCode = u.code
		LEFT JOIN MM_JobOrder AS j
			ON h.JobOrder = j.JobOrder
WHERE h.TransDate IS NOT NULL 
ORDER BY h.HeatNumber;