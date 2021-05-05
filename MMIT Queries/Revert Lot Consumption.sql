SELECT 
	r.LotNumber, 
	Lbs, 
	CurrentLbs, 
	e.Clock, 
	Last AS [Last Name],
	a.ID AS [Transaction ID], 
	Action, 
	Date AS [Transaction Date],
	MaterialSize, 
	MaterialCode, 
	HeatNumber, 
	v.Name AS [Supplier]	
FROM 
	MaterialVendors AS v
	INNER JOIN Materials AS m
	INNER JOIN MaterialTypes AS t
	INNER JOIN MaterialTransactionActions AS a
	INNER JOIN MaterialInventoryTransactions As i
	ON a.ID = i.ActionID
	INNER JOIN MaterialInventory AS r
	ON i.LotNumber = r.LotNumber 
	ON t.ID = r.MaterialTypeID 
	ON m.Code = t.MaterialCode
	INNER JOIN LotControl.dbo.Employee AS e 
	ON i.Clock = e.Clock 
	ON v.VendorID = r.VendorID
WHERE 
	a.ID In (7,12,14,18)
	AND CAST(Date AS DATE) BETWEEN '01/01/2018' AND '03/21/2018'
	--AND CONVERT(CHAR(10),Date,101) BETWEEN '01/01/2018' AND '03/21/2018' 
	AND MaterialCode ='BX'
ORDER BY
	Date

