USE Mastermetals

SELECT
	CAST(TransDate AS DATE) AS [ConsumedDate],
	h.HeatNumber,
	-SUM(Lbs) AS Lbs,
	Location,
	Owner,
	InventoryType,
	MaterialCode,
	LTRIM(RTRIM(r.Name)) AS [MaterialName],
	p.Name 
FROM
	Lotcontrol.dbo.Plant AS p
	RIGHT JOIN HeatMast AS h
	LEFT JOIN JobOrder as j
		ON h.JobOrder = j.JobOrder
	LEFT JOIN MaterialInventoryTransactions AS t
	LEFT JOIN MaterialInventory AS m
		ON t.LotNumber = m.LotNumber
	LEFT JOIN MaterialTypes AS a
		ON m.MaterialTypeID = a.ID
	LEFT JOIN Materials AS r
		ON a.MaterialCode = r.Code	
		ON h.TransDate = t.Date
		ON p.Code = m.Owner
WHERE
	CAST(TransDate AS DATE) BETWEEN '2018-01-01' AND '2018-09-05' AND InventoryType = 'RM' AND h.HeatNumber <> 'NP01'
GROUP BY Location, InventoryType, r.Name, MaterialCode, p.Name, Owner, h.HeatNumber, TransDate
ORDER BY h.HeatNumber