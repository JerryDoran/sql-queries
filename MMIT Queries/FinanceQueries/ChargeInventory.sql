SELECT 
	Grade, 
	Alloy, 
	Name, 
	Sum(WeightMade) AS [LbsMade], 
	Sum(WeightUsed) AS [LbsUsed], 
	Sum([WeightMade]-[WeightUsed]) AS [Lbs]
FROM 
	ChargeInv AS c 
	INNER JOIN Materials AS m
	 ON c.Alloy = m.Code
GROUP BY Grade, Alloy, Name
HAVING (((Sum([WeightMade]-[WeightUsed]))>0))
ORDER BY Alloy;
