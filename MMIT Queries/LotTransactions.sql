SELECT 
	mi.LotNumber, 
	mit.Date AS [TransDate], 
	mit.Lbs, 
	mi.CurrentLbs, 
	mta.Action, 
	it.Description, 	
	ma.Name, 
	pl.Name AS [PlantName], 
	mi.Location, 
	mit.Clock, 
	em.Last AS [LastName], 
	mta.ID, 
	mi.MaterialSize, 
	mt.MaterialGrade,
	mt.MaterialCode, 
	mi.HeatNumber
FROM 
	MM_InventoryTypes AS it
	INNER JOIN MM_Materials AS ma
	INNER JOIN MM_MaterialTypes AS mt
	INNER JOIN MM_MaterialTransactionActions AS mta
	INNER JOIN MM_MaterialInventoryTransactions AS mit
	ON mta.ID = mit.ActionID
	INNER JOIN MM_MaterialInventory AS mi
	ON mit.LotNumber = mi.LotNumber
	ON mt.ID = mi.MaterialTypeID
	ON ma.Code = mt.MaterialCode
	INNER JOIN Lotcontrol.dbo.Employee AS em
	ON mit.Clock = em.Clock
	ON it.Type = mt.InventoryType
	INNER JOIN Lotcontrol.dbo.Plant AS pl
	ON mi.Owner = pl.Code
WHERE 
	mi.LotNumber ='268298'
ORDER BY 
	mit.Date;