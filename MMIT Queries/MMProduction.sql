USE Mastermetals

SELECT 
	h.HeatNumber,
	h.JobOrder,
	CONVERT(CHAR(10),Transdate,101) AS [Date],
	Furnace,
	t.LotNumber,
	Lbs,
	Location,
	Owner,
	InventoryType,
	MaterialCode,
	r.Name AS [MaterialName],
	p.Name 
FROM
	Lotcontrol.dbo.Plant AS p
	RIGHT JOIN MM_HeatMast AS h
	LEFT JOIN MM_JobOrder as j
		ON h.JobOrder = j.JobOrder
	LEFT JOIN MM_MaterialInventoryTransactions AS t
	LEFT JOIN MM_MaterialInventory AS m
		ON t.LotNumber = m.LotNumber
	LEFT JOIN MM_MaterialTypes AS a
		ON m.MaterialTypeID = a.ID
	LEFT JOIN MM_Materials AS r
		ON a.MaterialCode = r.Code	
		ON h.TransDate = t.Date
		ON p.Code = m.Owner
WHERE
	TransDate > '2008-01-31' AND MaterialCode > '9901' AND Owner = 'M'
ORDER BY h.HeatNumber


	
	
	
	
	