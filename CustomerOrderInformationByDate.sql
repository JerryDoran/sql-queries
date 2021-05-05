SELECT 
	pl.Name AS [Plant], 
	MaterialGrade AS [Grade], 
	MaterialCode AS [Alloy], 
	co.ID, 
	CustomerPONumber AS [PO], 
	Size, 
	Weight AS [OrderedAmount], 
	SurfaceFinish AS [Finish], 
	OrderStatus, 
	co.JobOrder, 
	SpecialRemarks, 
	CAST(RequestedDate AS DATE) AS [DueDate], 
	CAST(OrderDate AS DATE) AS [OrderDate], 
	hm.HeatNumber
FROM 
	MaterialGrades AS mg
	INNER JOIN MaterialOrderSpecs AS ms
	INNER JOIN CustomerOrderTubes AS ct
	INNER JOIN CustomerOrder AS co
		ON ct.CustomerOrderID = co.ID
		ON ms.ID = co.MaterialOrderSpecsID
	INNER JOIN MaterialTypes AS mt
		ON ms.MaterialTypeID = mt.ID
		ON mg.Grade = mt.MaterialGrade
	LEFT JOIN HeatMast AS hm
		ON co.JobOrder = hm.JobOrder
	INNER JOIN Lotcontrol.dbo.Customer AS cu 
		ON ms.CustCode = cu.Code
	INNER JOIN Lotcontrol.dbo.Plant	AS pl
			ON cu.Plant = pl.Code
WHERE 
	co.RequestedDate BETWEEN '2018-01-01' AND '2018-03-01'
ORDER BY RequestedDate
