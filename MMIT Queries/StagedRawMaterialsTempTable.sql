DROP TABLE #TempStagedRM

CREATE TABLE #TempStagedRM
	(
		JobOrder VARCHAR(10),
		LotNumber VARCHAR(10),
		MaterialGrade VARCHAR(10),
		MaterialCode VARCHAR(10),
		Lbs VARCHAR(10),
		MaterialTypeID VARCHAR(10),
		InventoryType VARCHAR(10)
	)
INSERT INTO #TempStagedRM

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
		INNER JOIN  #TempStagedRM AS c
		INNER JOIN MaterialTypes as t
		ON c.MaterialTypeID = t.ID
		ON m.Code = t.MaterialCode
		INNER JOIN MaterialInventory AS i
		ON c.LotNumber = i.LotNumber
	WHERE 
		t.InventoryType = 'RM' AND i.CurrentLbs > 0	