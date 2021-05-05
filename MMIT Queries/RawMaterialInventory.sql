WITH
	--qryRevertTransactions, joined to qryRevertInventorys by 'LotNumber'
	cteRevertTransactions
AS
(
	SELECT 
	mit.LotNumber, 
	mit.ActionID, 
	SUM(mit.Lbs) AS CastLbs
FROM 
	MM_MaterialInventoryTransactions AS mit
	INNER JOIN MM_MaterialTransactionActions AS mta
	ON mit.ActionID = mta.ID
WHERE
	mit.ActionID=11
GROUP BY 
	mit.LotNumber, mit.ActionID
),
	--qryRevertInventorys
	cteRevertInventoryOne	
AS
(
	SELECT 
	mai.LotNumber, 
	mai.ConsignedTerms, 
	mai.CurrentLbs, 
	SUM(jos.Lbs) AS StagedLbs, 
	mai.[Location] AS [Loc], 
	mav.[Name] AS [Supplier],
	mtt.MaterialCode, 
	mat.[Name] AS [Desc], 
	mai.ReceiptLbs, 
	mai.BankBookLot,
	CASE Quarantined WHEN '1' THEN 'YES' WHEN '0' THEN 'NO' ELSE '' END AS Quarantined,
	--mai.Quarantined, 
	mai.CustomerRestrictions
FROM 
	MM_MaterialVendors AS mav
	RIGHT JOIN MM_Materials AS mat
	INNER JOIN MM_InventoryTypes AS ivt
	INNER JOIN MM_MaterialTypes AS mtt
	INNER JOIN MM_MaterialInventory AS mai
	ON mtt.ID = mai.MaterialTypeID 
	ON ivt.Type = mtt.InventoryType
	ON mat.Code = mtt.MaterialCode
	LEFT JOIN MM_JobOrderStaging AS jos
	ON mai.LotNumber = jos.LotNumber 
	ON mav.VendorID = mai.VendorID
WHERE
	mai.CurrentLbs>0 AND mai.Location='M' AND mat.Code BETWEEN '0105' AND '9901'
GROUP BY 
	mai.LotNumber, 
	mai.ConsignedTerms, 
	mai.CurrentLbs, 
	mai.Location, 
	mav.Name, 
	mtt.MaterialCode, 
	mat.Name,
	mai.ReceiptLbs, 
	mai.BankBookLot, 
	mai.Quarantined, 
	mai.CustomerRestrictions, 
	mat.Code

)
	--qryRevertInventory
SELECT	
	cteRevertInventoryOne.LotNumber, 
	cteRevertInventoryOne.ConsignedTerms, 
	cteRevertInventoryOne.CurrentLbs, 
	cteRevertInventoryOne.StagedLbs, 
	cteRevertTransactions.CastLbs, 
	StagedLbs - ABS(CastLbs) AS [CurrentStagedLbs],
	CurrentLbs - (StagedLbs - ABS(CastLbs)) AS AvailableLbs,
	cteRevertInventoryOne.Loc, 
	cteRevertInventoryOne.Supplier, 
	cteRevertInventoryOne.MaterialCode, 
	cteRevertInventoryOne.[Desc], 
	cteRevertInventoryOne.ReceiptLbs,
	CONCAT(CAST([MaterialCode] AS VARCHAR), [Desc]) AS [RawMaterial], 
	cteRevertInventoryOne.Quarantined, 
	cteRevertInventoryOne.CustomerRestrictions
FROM 
	cteRevertTransactions RIGHT JOIN 
	cteRevertInventoryOne ON 
	cteRevertTransactions.LotNumber = cteRevertInventoryOne.LotNumber
WHERE 
	cteRevertInventoryOne.Loc='M';

