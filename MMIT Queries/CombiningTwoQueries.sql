SELECT 
	j.JobOrder, 
	h.HeatNumber, 
	Furnace, 
	CONVERT(CHAR(10),TransDate,101) AS [Date],
	YEAR([Date]) AS Years, 
	SUM(ReceiptLbs) AS [SumOfReceiptLbs], 
	MaterialGrade, 
	MaterialCode, 
	l.Code
FROM 
	MaterialOrderSpecs AS m
	RIGHT JOIN CustomerOrder AS c 
	RIGHT JOIN HeatMast AS h
	LEFT JOIN MaterialInventory AS i
	ON h.HeatNumber = i.HeatNumber
	LEFT JOIN MaterialTypes AS t
	ON i.MaterialTypeID = t.ID
	LEFT JOIN MaterialInventoryTransactions AS a
	ON i.LotNumber = a.LotNumber
	LEFT JOIN JobOrder AS j 
	ON h.JobOrder = j.JobOrder
	ON c.JobOrder = j.JobOrder
	ON m.ID = c.MaterialOrderSpecsID
	LEFT JOIN LotControl.dbo.Customer as u
	ON m.CustCode = u.Code
	LEFT JOIN LotControl.dbo.Plant as l
	ON u.Plant = l.Code
WHERE 
	h.HeatNumber NOT LIKE '3*' AND InventoryType ='BAR' AND ActionID =19 AND h.TransDate > '2008-08-04'
GROUP BY j.JobOrder, h.HeatNumber, MaterialGrade, MaterialCode,YEAR([Date]), TransDate, l.Code, Furnace	


SELECT 
	h.HeatNumber,
	SUM(-Lbs) AS [InputLbs]
FROM
	Lotcontrol.dbo.Plant AS p
	RIGHT JOIN HeatMast AS h
	LEFT JOIN JobOrder as j
		ON h.JobOrder = j.JobOrder
	LEFT JOIN MaterialInventoryTransactions AS t
	LEFT JOIN MaterialInventory AS m
		ON t.LotNumber = m.LotNumber
	LEFT JOIN MaterialTypes AS a
		ON m.MaterialTypeID = a.ID
	LEFT JOIN Materials AS r
		ON a.MaterialCode = r.Code	
		ON h.TransDate = t.Date
		ON p.Code = m.Owner
WHERE
	TransDate > '2008-01-31'
GROUP BY h.HeatNumber
