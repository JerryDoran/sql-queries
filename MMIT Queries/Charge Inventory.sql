SELECT 
	Grade, 
	Alloy, 
	--DateMade, 
	--SUM(Made) AS [SumOfMade], 
	--SUM(Used) AS [SumOfUsed], 
	[Made]-[Used] AS [NumOfCharges],
	--SUM(WeightMade) AS [SumOfWeightMade], 
	--SUM(WeightUsed) AS [SumOfWeightUsed], 
	SUM([WeightMade]-[WeightUsed]) AS [OnHand], 
	Heat, (Grade + Alloy) AS [Blend], 
	SpecialLot, 
	-DATEDIFF(DAY,GETDATE(),DateMade) AS [DaysOld],
	FR1, 
	FR2, 
	FR3, 
	FR4	
FROM 
	MM_ChargeInv
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
	FR4
HAVING(SUM(WeightMade-WeightUsed)>0 AND FR1 Not In ('078157','078158','078159') AND FR2 Not In ('078157','078158','078159') AND FR3 Not In ('078157','078158','078159') AND FR4 Not In ('078157','078158','078159'))
ORDER BY Alloy;
