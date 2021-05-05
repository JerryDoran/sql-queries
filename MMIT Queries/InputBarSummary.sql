SELECT 
	h.HeatNumber,
	SUM(-Lbs) AS [InputLbs]
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
	TransDate > '2008-01-31'
GROUP BY h.HeatNumber
ORDER BY h.HeatNumber
