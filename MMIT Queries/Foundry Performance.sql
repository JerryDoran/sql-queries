USE Foundry

SELECT 
	StartTime,
	CAST(EndTime AS DATE) AS PourDate,
	PourTime, 
	FR, 
	COUNT(ChargeWgt) AS [ChargesPoured],
	LEFT([MasterHeat],2) AS [Alloy],
	SUM(ChargeWgt) AS [PouredLbs],
	FurnaceName,
	RIGHT([MasterHeat],4) AS [HeatNumber]
FROM 
	MeltLog AS m
	INNER JOIN FurnaceConfig as f
		ON m.FurnaceCode = f.FurnaceCode
WHERE CAST(EndTime AS DATE) BETWEEN '2018-03-01' AND '2018-03-02'
GROUP BY
	StartTime, 
	EndTime,
	PourTime, 
	FR, 
	LEFT([MasterHeat],2),
	FurnaceName, 
	RIGHT([MasterHeat],4)

--HAVING (((EndTime) Between '2018-03-01' AND '2018-03-02'))
ORDER BY EndTime


