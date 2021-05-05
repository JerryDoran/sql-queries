SELECT
	CAST(ReceiptDate AS DATE) AS [DateReceived],
	MONTH([ReceiptDate]) AS [MonthCode],
	UPPER(CONVERT(CHAR(3), ReceiptDate, 100)) AS [Month],
	YEAR([ReceiptDate]) AS [Year],
	ma.Name AS [RawMaterial], 
	LotNumber, 
	SUM(ReceiptLbs) AS [ReceivedLbs], 
	ConsignedTerms, 
	mv.Name AS [Vendor], 
	CustomerRestrictions, 
	PO, 
	MaterialCode
FROM 
	MM_MaterialVendors AS mv
	INNER JOIN MM_Materials AS ma
	INNER JOIN MM_InventoryTypes AS it
	INNER JOIN MM_MaterialTypes AS mt 
	INNER JOIN MM_MaterialInventory AS mi 
	ON mt.ID = mi.MaterialTypeID
	ON it.Type = mt.InventoryType
	ON ma.Code = mt.MaterialCode
	ON mv.VendorID = mi.VendorID
WHERE 
	mi.ReceiptDate BETWEEN '2020-03-30' AND '2020-05-03' AND ma.Code BETWEEN '0105' AND '9901' AND it.Type='RM' AND ReceiptDate>0
GROUP BY 
	ReceiptDate, HeatNumber, ma.Name, LotNumber, ConsignedTerms, mv.Name, CustomerRestrictions, PO, MaterialCode

