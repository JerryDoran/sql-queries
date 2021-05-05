USE Mastermetals

SELECT 
	CONVERT(CHAR(10),TransDate,101) AS [UsageDate],
	UPPER(CONVERT(CHAR(3), TransDate, 100)) AS MonthNames,
	YEAR([TransDate]) AS Years,
	-SUM(Lbs) AS [Total Lbs],
	Location,
	InventoryType,
	RTRIM(LTRIM(MaterialCode)) AS [Material],
	r.Name AS [MaterialName],
	p.Name
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
	TransDate > '2008-01-31' AND MaterialCode > '9901' AND Owner = 'M'
GROUP BY CONVERT(CHAR(10),Transdate,101), UPPER(CONVERT(CHAR(3), TransDate, 100)), YEAR([TransDate]), TransDate, Location, InventoryType, MaterialCode,r.Name, p.Name
ORDER BY TransDate
