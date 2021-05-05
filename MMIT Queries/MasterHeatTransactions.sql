SELECT 
	hm.HeatNumber, 
	mi.LotNumber, 
	mit.Lbs, 
	mi.CurrentLbs,
	mi.Owner AS [Plant], 
	mi.Location AS [Loc],
	em.Last,
	em.Name AS [Emp],
	mta.Action AS [Activity], 
	FORMAT(mit.Date,'MM/dd/yyyy') AS [Date],	
	mi.MaterialSize AS [Size], 
	mt.MaterialCode AS [Alloy], 
	mt.MaterialGrade AS [Grade]
FROM 
	MM_Materials AS ma
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
	INNER JOIN MM_HeatMast AS hm 
	ON mi.HeatNumber = hm.HeatNumber
WHERE 
	hm.HeatNumber = 'n733' AND mta.ID In (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30)
ORDER BY 
	mit.Date;
