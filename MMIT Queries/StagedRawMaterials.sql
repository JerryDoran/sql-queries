SELECT
	FirstSet.JobOrder,
	FirstSet.LotNumber,
	FirstSet.MaterialGrade,
	FirstSet.MaterialCode,
	FirstSet.Lbs,
	SecondSet.Name,
	SecondSet.InventoryType
FROM
(
	SELECT 
		i.JobOrder, 
		j.Lbs, 
		j.LotNumber, 
		PourDate, 
		MaterialGrade, 
		MaterialCode, 
		m.MaterialTypeID
	FROM 
		JobOrderStaging AS j
		INNER JOIN JobOrderItems AS i
		ON j.JobOrderItemsID = i.ID
		INNER JOIN MaterialInventory AS m
		ON j.LotNumber = m.LotNumber
		INNER JOIN MaterialOrderSpecs AS s
		INNER JOIN HeatMast AS h
		RIGHT JOIN CustomerOrder AS c
		ON h.JobOrder = c.JobOrder
		ON s.ID = c.MaterialOrderSpecsID
		LEFT JOIN MaterialTypes as t
		ON s.MaterialTypeID = t.ID
		ON i.JobOrder = c.JobOrder
	WHERE 
		i.JobOrder NOT IN (29255,23466,19783,29167) AND h.PourDate IS NULL AND m.CurrentLbs > 0
ORDER BY i.JobOrder
) AS FirstSet
INNER JOIN
(
	SELECT
		FirstSet.JobOrder,
		FirstSet.LotNumber,
		FirstSet.MaterialGrade,
		FirstSet.MaterialCode,
		Name,
		InventoryType,
		FirstSet.Lbs
	FROM
		Materials AS m
		INNER JOIN  FirstSet
		INNER JOIN MaterialTypes as t
		ON FirstSet.MaterialTypeID = t.MaterialTypeID
		ON m.Code = t.MaterialCode
		INNER JOIN MaterialInventory AS i
		ON FirstSet.LotNumber = i.LotNumber
WHERE t.InventoryType = 'RM' AND i.CurrentLbs > 0	
) AS SecondSet
