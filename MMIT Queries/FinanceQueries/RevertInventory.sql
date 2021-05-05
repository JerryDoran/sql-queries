SELECT
	FirstSet.LotNumber,
	FirstSet.HeatNumber,
	FirstSet.CurrentLbs,
	FirstSet.Lbs,
	FirstSet.MaterialSize,
	FirstSet.MaterialCode,
	FirstSet.Plant,
	FirstSet.Name,
	FirstSet.Quarantined,
	SecondSet.CastLbs
FROM
(
	SELECT 
		mi.LotNumber, 
		HeatNumber, 
		CurrentLbs, 
		Lbs, 
		MaterialSize, 
		MaterialCode, 
		p.Name AS [Plant], 
		mv.Name, 
		IIF(Quarantined = '1', 'YES', 'NO') AS [Quarantined]
	FROM 
		MaterialVendors AS mv
		RIGHT JOIN InventoryTypes AS it
		INNER JOIN MaterialTypes AS mt
		INNER JOIN MaterialInventory AS mi
		ON mt.ID = mi.MaterialTypeID 
		ON it.Type = mt.InventoryType
		LEFT JOIN JobOrderStaging AS jo
		ON mi.LotNumber = jo.LotNumber
		ON mv.VendorID = mi.VendorID
		INNER JOIN Lotcontrol.dbo.Plant AS p 
		ON mi.Owner = p.Code
	WHERE CurrentLbs > 0 AND Location ='M' AND BankBookLot = 'False' AND Type ='R'
) AS FirstSet
LEFT JOIN
(
	SELECT 
		LotNumber, 
		ActionID, 
		Sum(Lbs) AS CastLbs
	FROM 
		MaterialInventoryTransactions AS mt
	GROUP BY 
		LotNumber, ActionID
	HAVING
		ActionID = '11'

) AS SecondSet
ON FirstSet.LotNumber = SecondSet.LotNumber
ORDER BY FirstSet.MaterialCode;
