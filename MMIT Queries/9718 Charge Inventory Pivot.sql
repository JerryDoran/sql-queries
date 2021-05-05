SELECT * FROM
(
SELECT
	Grade, 
	Alloy, 
	DateMade, 
	SUM(Made) AS [SumOfMade], 
	SUM(Used) AS [SumOfUsed], 
	[Made]-[Used] AS [NumOfCharges],
	SUM(WeightMade) AS [SumOfWeightMade], 
	SUM(WeightUsed) AS [SumOfWeightUsed], 
	SUM([WeightMade]-[WeightUsed]) AS [OnHand], 
	Heat, (Grade + Alloy) AS [BLEND], 
	SpecialLot, 
	-DATEDIFF(DAY,GETDATE(),DateMade) AS [Days Old],
	FR1, 
	FR2, 
	FR3, 
	FR4,
	PlantID_Loc	
FROM 
	ChargeInv as c
	INNER JOIN ChargeInvSticker AS s
	ON c.MMLot = s.MMLot
GROUP BY 
	Grade, 
	Alloy, 
	DateMade, 
	[Made]-[Used], 
	Heat, 
	([Grade] + Alloy), 
	SpecialLot, 
	-DATEDIFF(DAY,GETDATE(),DateMade), 
	FR1, 
	FR2, 
	FR3, 
	FR4,
	PlantID_Loc
HAVING(SUM(WeightMade-WeightUsed)>0 AND FR1 Not In ('078157','078158','078159') AND FR2 Not In ('078157','078158','078159') AND FR3 Not In ('078157','078158','078159') AND FR4 Not In ('078157','078158','078159') AND FR1 = '009718')
ORDER BY Heat
) AS BaseData
PIVOT
(
	COUNT(OnHand)
		FOR FR1 IN ([009718])
)
	AS PivotTable