SELECT
MaterialGrade, 
	MaterialCode, 
	LTRIM(RTRIM(m.Name)) AS [Name],
	ROUND(CurrentLbs, 0, -1)AS [CurrentLbs]
FROM 
	LotControl.dbo.Plant AS p
	INNER JOIN Materials AS m 
	INNER JOIN InventoryTypes AS i
	INNER JOIN MaterialTypes AS t
	INNER JOIN MaterialInventory AS a
		ON t.ID = a.MaterialTypeID
		ON i.Type = t.InventoryType
		ON m.Code = t.MaterialCode
		ON p.Code = a.Owner
WHERE 
	a.CurrentLbs>0 AND a.MaterialSize NOT IN (' ') AND i.Type='BAR' AND Owner = 'M'
ORDER BY 
	MaterialCode