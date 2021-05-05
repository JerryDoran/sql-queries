
SELECT 
	i.JobOrder, 
	s.Lbs, 
	s.LotNumber, 
	h.PourDate, 
	MaterialGrade,
	MaterialCode, 
	m.MaterialTypeID	
FROM 
	JobOrderStaging AS s
	INNER JOIN JobOrderItems AS i
	ON s.JobOrderItemsID = i.ID
	INNER JOIN MaterialInventory AS m
	ON s.LotNumber = m.LotNumber
	INNER JOIN MaterialOrderSpecs AS a
	INNER JOIN HeatMast As h	
	RIGHT JOIN CustomerOrder AS c
	ON h.JobOrder = c.JobOrder 
	ON a.ID = c.MaterialOrderSpecsID
	LEFT JOIN MaterialTypes AS t 
	ON a.MaterialTypeID = t.ID	
	ON i.JobOrder = c.JobOrder 
WHERE 
	i.JobOrder NOT IN (29255,23466,19783,29167)
	AND CAST(PourDate AS DATE) IS NULL
ORDER BY
	i.JobOrder