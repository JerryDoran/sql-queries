SELECT 
	mi.LotNumber, 
	SUM(mi.CurrentLbs) AS [TotLbs], 
	mi.MaterialSize,
	RTRIM(LTRIM(mt.MaterialCode)) AS [Material],
	mt.MaterialGrade, 
	ms.[Name] AS MaterialName, 
	pl.[Name] AS Plant, 
	mi.[Owner] AS MatOwner,
	FORMAT(ReceiptDate,'MM/dd/yyyy') AS [Date],
	mi.HeatNumber,
	CASE Quarantined WHEN '1' THEN 'YES' WHEN '0' THEN 'NO' ELSE '' END AS Quarantined
	--IIf([Quarantined]=-1,'YES','NO') AS Quarantine
FROM 
	Lotcontrol.dbo.Plant AS pl
	INNER JOIN MM_Materials AS ms
	INNER JOIN MM_InventoryTypes AS it
	INNER JOIN MM_MaterialTypes AS mt
	INNER JOIN MM_MaterialInventory AS mi
	ON mt.ID = mi.MaterialTypeID
	ON it.Type = mt.InventoryType
	ON ms.Code = mt.MaterialCode
	ON pl.Code = mi.Owner
WHERE 
	mi.MaterialSize NOT IN (' ') AND pl.Name ='Minerva' AND it.Type='BAR' AND mi.CurrentLbs>0
GROUP BY 
	mi.LotNumber, 
	mi.MaterialSize, 
	RTRIM(LTRIM(mt.MaterialCode)),
	mt.MaterialGrade, 
	ms.Name, 
	pl.Name, 
	mi.Owner, 
	FORMAT(ReceiptDate,'MM/dd/yyyy'),
	mi.HeatNumber, 
	Quarantined,
	it.Type, 
	mi.CurrentLbs
ORDER BY 
	RTRIM(LTRIM(mt.MaterialCode));
