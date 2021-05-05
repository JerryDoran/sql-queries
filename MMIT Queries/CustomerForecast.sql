WITH
	ctecustomer
AS
(
	Select code, name 
	From
	 (values('003', 'SMP'),
	  ('006', 'Minerva'),
	  ('010', 'Douglas'),
	  ('575', 'Mentor')) x(code, name)

)

SELECT 
	name, 
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
FROM ctecustomer AS u 
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
WHERE OrderStatus <> 'Canceled' AND CAST(RequestedDate AS DATE) BETWEEN '2019-08-01' AND '2019-12-29'
ORDER BY RequestedDate;




--	cteHeatOwner
--AS
--(
--	SELECT 
--		name, 
--		h.HeatNumber, 
--		c.JobOrder, 
--		MaterialGrade, 
--		MaterialCode,
--		t.ID, 
--		TransDate, 
--		CustCode
--	FROM 
--		ctecustomer AS u
--		INNER JOIN MaterialOrderSpecs AS m
--		INNER JOIN HeatMast AS h
--		INNER JOIN CustomerOrder AS c
--			ON h.JobOrder = c.JobOrder
--			ON m.ID = c.MaterialOrderSpecsID
--		INNER JOIN MaterialTypes AS t
--			ON m.MaterialTypeID = t.ID 
--			ON u.code = m.CustCode
--	WHERE 
--		TransDate IS NOT NULL

--)