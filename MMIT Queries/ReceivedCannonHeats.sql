SELECT 
	ms.[Name] AS [Material], 
	CONCAT(CAST(MaterialGrade AS VARCHAR),MaterialCode) AS [Alloy], 
	MaterialCode, 
	mi.HeatNumber, 
	VendorLotNumber, 
	mi.PO, 
	SUM(mi.ReceiptLbs) AS [TotReceiptLbs], 
	mi.MaterialSize, 
	CAST(RequestedDate AS DATE) AS [DueDate], 
	pl.[Name] AS [Plant], 
	SurfaceFinish, 
	CAST(ReceiptDate AS DATE) AS [ReceiptTotDate]
FROM 
	LotControl.dbo.Plant AS pl 
	INNER JOIN MM_Materials AS ms
	INNER JOIN MM_InventoryTypes AS it
	INNER JOIN MM_MaterialTypes AS mt
	INNER JOIN MM_MaterialInventory AS mi
	ON mt.ID = mi.MaterialTypeID
	ON it.Type = mt.InventoryType
	ON ms.Code = mt.MaterialCode 
	ON pl.Code = mi.Owner
	INNER JOIN MM_HeatMast AS hm
	ON mi.HeatNumber = hm.HeatNumber
	INNER JOIN MM_CustomerOrder AS co
	INNER JOIN MM_CustomerOrderTubes AS ct
	ON co.ID = ct.CustomerOrderID
	INNER JOIN MM_JobOrder AS jo 
	ON co.JobOrder = jo.JobOrder
	ON hm.JobOrder = jo.JobOrder
WHERE 
	mi.ReceiptDate BETWEEN '2020-06-03' And '2020-06-04'
GROUP BY 
	ms.[Name], 
	CONCAT(CAST(MaterialGrade AS VARCHAR),MaterialCode), 
	mt.MaterialCode, 
	mi.HeatNumber, 
	mi.VendorLotNumber, 
	mi.PO, 
	mi.MaterialSize, 
	co.RequestedDate, 
	pl.[Name], 
	ct.SurfaceFinish, 
	CAST(ReceiptDate AS DATE), 
	mi.ContainerType, 
	it.[Type]
HAVING 
	SUM(mi.ReceiptLbs)>30 AND mi.ContainerType='OTHER' AND it.Type='BAR';
