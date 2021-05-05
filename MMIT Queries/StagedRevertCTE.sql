WITH
	cteStagedJobOrderItems --(JobOrder, LotNumber, MaterialGrade, MaterialCode, MaterialTypeID, InventoryType, Lbs) 
AS
(
	SELECT
		i.JobOrder,
		j.LotNumber,
		MaterialGrade,
		MaterialCode,
		j.Lbs,
		m.MaterialTypeID,
		t.InventoryType		
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
		i.JobOrder NOT IN (29255,23466,19783,29167) AND h.PourDate IS NULL
)
	SELECT
		c.JobOrder,
		c.LotNumber,
		c.MaterialGrade,
		c.MaterialCode,
		Name,
		t.InventoryType,
		Lbs
	FROM
		Materials AS m
		INNER JOIN  cteStagedJobOrderItems AS c
		INNER JOIN MaterialTypes as t
		ON c.MaterialTypeID = t.ID
		ON m.Code = t.MaterialCode
		INNER JOIN MaterialInventory AS i
		ON c.LotNumber = i.LotNumber
	WHERE 
		t.InventoryType = 'R' AND i.CurrentLbs > 0	