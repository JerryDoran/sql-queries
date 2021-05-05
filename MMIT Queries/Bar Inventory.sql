SELECT 
	LotNumber, 
	CurrentLbs, 
	MaterialSize, 
	MaterialCode AS [MATERIAL], 
	MaterialGrade, 
	MaterialCode, 
	m.Name, 
	p.Name, 
	Owner, 
	FORMAT(ReceiptDate,'MM/dd/yyyy') AS [Date], 
	ReceiptLbs, 
	HeatNumber, 
	IIf([Quarantined]=-1,'YES','NO') AS Quarantine
FROM 
	LotControl.dbo.Plant AS p
	INNER JOIN MM_Materials AS m 
	INNER JOIN MM_InventoryTypes AS i
	INNER JOIN MM_MaterialTypes AS t
	INNER JOIN mm_MaterialInventory AS a
		ON t.ID = a.MaterialTypeID
		ON i.Type = t.InventoryType
		ON m.Code = t.MaterialCode
		ON p.Code = a.Owner
WHERE 
	a.CurrentLbs>0 AND a.MaterialSize NOT IN (' ') AND i.Type='BAR'
ORDER BY 
	ReceiptDate
