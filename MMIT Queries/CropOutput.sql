SELECT 
		h.HeatNumber,
		SUM(ReceiptLbs) AS CropLbs
	FROM 
		MaterialInventoryTransactions AS t
		RIGHT JOIN HeatMast AS h
		LEFT JOIN MaterialInventory AS i
		ON h.HeatNumber = i.HeatNumber
		LEFT JOIN JobOrder AS j
		ON h.JobOrder = j.JobOrder
		ON t.LotNumber = i.LotNumber
	WHERE 
		i.MaterialSize='CROPS' AND i.HeatNumber NOT LIKE '3%' AND i.ReceiptLbs >0 AND i.ReceiptDate > '2018-01-01' AND t.ActionID = 19 AND j.Furnace <> 'OUTSIDE'
    GROUP BY h.HeatNumber
	ORDER BY h.HeatNumber