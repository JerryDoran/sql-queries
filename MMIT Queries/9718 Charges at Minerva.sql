SELECT
	s.MMLot, 
	Grade, 
	Alloy, 
	Made, 
	Used,
	[Made]-[Used] AS [NumOfCharges],
	Heat, 
	(Grade + Alloy) AS [BLEND], 
	-DATEDIFF(DAY,GETDATE(),DateMade) AS [Days Old],
	FR1, 
	FR2,
	TransferDate, 
	DateMade,
	PlantID_Loc	
FROM 
	MM_ChargeInv as c
	INNER JOIN MM_ChargeInvSticker AS s
	ON c.MMLot = s.MMLot
GROUP BY
	s.MMLot, 
	Grade, 
	Alloy, 
	TransferDate,
	DateMade,
	Made,
	Used, 
	([Made]-[Used]), 
	Heat, 
	([Grade] + Alloy), 
	-DATEDIFF(DAY,GETDATE(),DateMade), 
	FR1, 
	FR2, 
	FR3, 
	FR4,
	PlantID_Loc
HAVING(FR1 = '009718' AND PlantID_Loc = 'MIN' AND s.MMLot IN('BFR35', 'BFT51', 'CFO20', 'CFO41'))
--ORDER BY TransferDate;

SELECT
	s.MMLot, 
	Grade, 
	Alloy, 
	Made, 
	Used,
	[Made]-[Used] AS [NumOfCharges],
	Heat, 
	(Grade + Alloy) AS [BLEND], 
	-DATEDIFF(DAY,GETDATE(),DateMade) AS [Days Old],
	FR1, 
	FR2,
	TransferDate, 
	DateMade,
	PlantID_Loc	
FROM 
	MM_ChargeInv as c
	INNER JOIN MM_ChargeInvSticker AS s
	ON c.MMLot = s.MMLot
GROUP BY
	s.MMLot, 
	Grade, 
	Alloy, 
	TransferDate,
	DateMade,
	Made,
	Used, 
	([Made]-[Used]), 
	Heat, 
	([Grade] + Alloy), 
	-DATEDIFF(DAY,GETDATE(),DateMade), 
	FR1, 
	FR2, 
	FR3, 
	FR4,
	PlantID_Loc
HAVING((Made - Used) > 0 AND FR1 = '009718' AND PlantID_Loc = 'MEN')
--ORDER BY TransferDate;