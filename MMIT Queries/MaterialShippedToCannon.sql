SELECT 
	mit.LotNumber, 
	(-[Lbs]) AS [Lbs],
	pla.[Name] AS [Plant],
	mts.InventoryType, 
	mat.Code, 
	mav.[Name] AS [Supplier],
	mat.[Name] AS [Material], 
	CAST(mit.[Date] AS DATE) AS [TransDate]
FROM 
	Lotcontrol.dbo.Plant AS pla
	INNER JOIN MM_MaterialVendors AS mav
	RIGHT JOIN MM_Materials AS mat
	INNER JOIN MM_InventoryTypes AS inv
	INNER JOIN MM_MaterialTypes AS mts
	INNER JOIN MM_MaterialTransactionActions AS mta
	INNER JOIN MM_MaterialInventoryTransactions mit 
	ON mta.ID = mit.ActionID
	INNER JOIN MM_MaterialInventory AS mti
	ON mit.LotNumber = mti.LotNumber
	ON mts.ID = mti.MaterialTypeID
	ON inv.Type = mts.InventoryType
	ON mat.Code = mts.MaterialCode
	ON mav.VendorID = mti.VendorID
	ON pla.Code = mti.Owner
WHERE 
	mit.[Date] BETWEEN '2020-07-01' AND '2020-07-10' AND mit.[ActionID] IN (22,24) AND mts.InventoryType IN ('R','RM')
GROUP BY 
	mit.LotNumber, 
	(-[Lbs]),
	pla.[Name],
	mts.InventoryType, 
	mat.Code, 
	mav.[Name], 
	mat.[Name], 
	mit.[Date]
HAVING 
	(-[Lbs])>0;
