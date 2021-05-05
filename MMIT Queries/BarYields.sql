SELECT
	FirstSet.JobOrder,
	FirstSet.HeatNumber,
	FirstSet.Furnace,
	FirstSet.PourDate,
	FirstSet.Years,
	FirstSet.Months,
	FirstSet.MonthNames,
	FirstSet.SumOfReceiptLbs,
	FirstSet.MaterialGrade,
	FirstSet.MaterialCode,
	FirstSet.Code,
	SecondSet.InputLbs,
	CASE WHEN SumOfReceiptLbs > InputLbs THEN InputLbs*90 ELSE SumOfReceiptLbs END AS [OutputLbs],
	CONVERT(DECIMAL(10,2),CASE WHEN SumOfReceiptLbs > InputLbs THEN 90 ELSE SumOfReceiptLbs/InputLbs * 100 END) AS [Yield]
FROM
(
	SELECT 
		j.JobOrder, 
		h.HeatNumber, 
		Furnace,
		CAST(TransDate AS DATE) AS PourDate,
		MONTH([TransDate]) AS Months,
		UPPER(CONVERT(CHAR(3), TransDate, 100)) AS MonthNames,
		YEAR([TransDate]) AS Years, 
		SUM(ReceiptLbs) AS [SumOfReceiptLbs], 
		MaterialGrade, 
		MaterialCode, 
		l.Code
	FROM 
		MM_MaterialOrderSpecs AS e
		RIGHT JOIN MM_CustomerOrder AS c 
		RIGHT JOIN MM_HeatMast AS h
		LEFT JOIN MM_MaterialInventory AS i
		ON h.HeatNumber = i.HeatNumber
		LEFT JOIN MM_MaterialTypes AS t
		ON i.MaterialTypeID = t.ID
		LEFT JOIN MM_MaterialInventoryTransactions AS a
		ON i.LotNumber = a.LotNumber
		LEFT JOIN MM_JobOrder AS j 
		ON h.JobOrder = j.JobOrder
		ON c.JobOrder = j.JobOrder
		ON e.ID = c.MaterialOrderSpecsID
		LEFT JOIN LotControl.dbo.Customer as u
		ON e.CustCode = u.Code
		LEFT JOIN LotControl.dbo.Plant as l
		ON u.Plant = l.Code
	WHERE 
		h.HeatNumber NOT LIKE '3*' AND InventoryType ='BAR' AND ActionID =19 AND h.TransDate > '2008-08-04'
	GROUP BY j.JobOrder, h.HeatNumber, MaterialGrade, MaterialCode,YEAR([TransDate]), TransDate, l.Code, Furnace
) AS FirstSet
INNER JOIN
(
	SELECT 
		h.HeatNumber,
		SUM(-Lbs) AS [InputLbs]
	FROM
		Lotcontrol.dbo.Plant AS p
		RIGHT JOIN MM_HeatMast AS h
		LEFT JOIN MM_JobOrder as j
			ON h.JobOrder = j.JobOrder
		LEFT JOIN MM_MaterialInventoryTransactions AS t
		LEFT JOIN MM_MaterialInventory AS m
			ON t.LotNumber = m.LotNumber
		LEFT JOIN MM_MaterialTypes AS a
			ON m.MaterialTypeID = a.ID
		LEFT JOIN MM_Materials AS r
			ON a.MaterialCode = r.Code	
			ON h.TransDate = t.Date
			ON p.Code = m.Owner
	WHERE
		TransDate > '2008-08-04'
	GROUP BY h.HeatNumber
) AS SecondSet
ON FirstSet.HeatNumber = SecondSet.HeatNumber

WHERE FirstSet.PourDate BETWEEN '2018-01-01' AND '2018-12-31'
ORDER BY FirstSet.HeatNumber