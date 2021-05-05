SELECT 
	customer_name, 
	MaterialCode AS [Alloy],
	MaterialGrade,
	o.ID,
	CustomerPONumber,
	Size,
	Weight,
	SurfaceFinish,
	OrderStatus,
	o.JobOrder,
	SpecialRemarks,
	RequestedDate AS [Due Date],
	OrderDate AS [Ordered Date],
	h.HeatNumber
FROM
	customer AS u
	INNER JOIN MaterialOrderSpecs AS s
	INNER JOIN CustomerOrderTubes AS t
	INNER JOIN CustomerOrder AS o
		ON t.CustomerOrderID = o.ID
		ON s.ID = o.MaterialOrderSpecsID
	INNER JOIN MaterialTypes AS a
		ON s.MaterialTypeID = a.ID
	    ON u.code = s.CustCode
	LEFT JOIN HeatMast as h
		ON o.JobOrder = h.JobOrder
WHERE
	OrderStatus <> 'Canceled' AND RequestedDate BETWEEN '2018-01-01' AND '2018-03-01'
ORDER BY RequestedDate		
