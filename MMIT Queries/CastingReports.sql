SELECT
	FirstSet.HeatNumber,
	FirstSet.JobOrder,
	FirstSet.TransDate,
	FirstSet.Furnace,
	FirstSet.LotNumber,
	FirstSet.Pounds,
	FirstSet.[Location],
	FirstSet.[Owner],
	FirstSet.InventoryType,
	FirstSet.MaterialCode,
	FirstSet.MaterialName,
	FirstSet.[Name],
	SecondSet.MaterialGrade,
	SecondSet.Code,
	ThirdSet.HeatOwner,
	FourthSet.Supplier
FROM
(
	SELECT 
		hm.HeatNumber, 
		hm.JobOrder,
		CAST(hm.TransDate AS DATE) AS TransDate,
		jo.Furnace, 
		mt.LotNumber, 
		mt.Lbs,
		-1 * Lbs as [Pounds],
		mi.[Location], 
		mi.[Owner], 
		ma.InventoryType, 
		ma.MaterialCode, 
		ms.[Name] AS MaterialName, 
		pl.[Name]
	FROM 
		Lotcontrol.dbo.Plant AS pl
		RIGHT JOIN MM_HeatMast AS hm
		LEFT JOIN MM_JobOrder AS jo
		ON hm.JobOrder = jo.JobOrder
		LEFT JOIN MM_MaterialInventoryTransactions AS mt
		LEFT JOIN MM_MaterialInventory AS mi
		ON mt.LotNumber = mi.LotNumber
		LEFT JOIN MM_MaterialTypes AS ma
		ON mi.MaterialTypeID = ma.ID
		LEFT JOIN MM_Materials AS ms
		ON ma.MaterialCode = ms.Code
		ON hm.TransDate = mt.Date
		ON pl.Code = mi.Owner
	WHERE
		hm.TransDate >'1/31/2008'
) AS FirstSet
INNER JOIN
(
	SELECT 
		hm.HeatNumber, 
		mt.MaterialGrade, 
		mt.MaterialCode AS [Code], 
		jc.MaterialTypeID
	FROM 
		MM_HeatMast AS hm 
		INNER JOIN MM_MaterialTypes AS mt
		RIGHT JOIN MM_JobOrderConstraints jc
		ON mt.ID = jc.MaterialTypeID
		ON hm.JobOrder = jc.JobOrder
	WHERE 
		mt.InventoryType = 'BAR'
) AS SecondSet
ON FirstSet.HeatNumber = SecondSet.HeatNumber
INNER JOIN
(
	SELECT 
		hm.HeatNumber, 
		co.JobOrder, 
		mt.MaterialGrade, 
		mt.MaterialCode, 
		hm.TransDate, 
		ms.CustCode, 		
		CASE cu.code WHEN '003' THEN 'SMP' WHEN '006' THEN 'Minerva' WHEN '010' THEN 'Douglas' WHEN '575' THEN 'Mentor' END AS HeatOwner
	FROM 
		MM_MaterialOrderSpecs AS ms
		INNER JOIN MM_HeatMast AS hm
		INNER JOIN MM_CustomerOrder AS co
		ON hm.JobOrder = co.JobOrder ON 
		ms.ID = co.MaterialOrderSpecsID
		INNER JOIN MM_MaterialTypes AS mt
		ON ms.MaterialTypeID = mt.ID
		INNER JOIN mm_customer as cu
		ON ms.CustCode = cu.code
	WHERE 
		hm.HeatNumber IS NOT NULL AND hm.TransDate IS NOT NULL
) AS ThirdSet
ON FirstSet.HeatNumber = ThirdSet.HeatNumber
LEFT JOIN
(
	SELECT 
		hm.HeatNumber, 
		hm.JobOrder, 
		hm.TransDate AS [HeatDate], 
		jo.Furnace, 
		mi.LotNumber, 
		mi.Lbs AS [Weight], 
		mn.[Location], 
		mn.MaterialSize, 
		mn.[Owner], 
		mn.HeatNumber AS [HeatNum], 
		mt.InventoryType, 
		mt.MaterialCode, 
		ms.[Name] AS MaterialName, 
		pl.[Name], 
		mv.[Name] AS [Supplier]
	FROM 
		MM_HeatMast AS hm
		LEFT JOIN MM_JobOrder AS jo
		ON hm.JobOrder = jo.JobOrder
		LEFT JOIN Lotcontrol.dbo.Plant AS pl
		RIGHT JOIN MM_MaterialVendors AS mv
		RIGHT JOIN MM_Materials AS ms
		RIGHT JOIN MM_MaterialTypes AS mt
		RIGHT JOIN MM_MaterialInventoryTransactions mi
		LEFT JOIN MM_MaterialInventory AS mn
		ON mi.LotNumber = mn.LotNumber
		ON mt.ID = mn.MaterialTypeID ON 
		ms.Code = mt.MaterialCode
		ON mv.VendorID = mn.VendorID
		ON pl.Code = mn.Owner
		ON hm.TransDate = mi.Date
	WHERE 
		hm.TransDate > '8/31/2008' AND mt.InventoryType ='R'	
)AS FourthSet
ON FourthSet.LotNumber = FirstSet.LotNumber
GROUP BY
	FirstSet.HeatNumber,
	FirstSet.JobOrder,
	FirstSet.TransDate,
	FirstSet.Furnace,
	FirstSet.LotNumber,
	FirstSet.Pounds,
	FirstSet.[Location],
	FirstSet.[Owner],
	FirstSet.InventoryType,
	FirstSet.MaterialCode,
	FirstSet.MaterialName,
	FirstSet.[Name],
	Thirdset.HeatOwner,
	FourthSet.MaterialSize,
	FourthSet.HeatDate,
	SecondSet.MaterialGrade,
	SecondSet.Code,
	FourthSet.Supplier
HAVING
	FirstSet.HeatNumber BETWEEN 'N890' AND 'N900'
ORDER BY
	FirstSet.HeatNumber


