SELECT 
	Grade, 
	Alloy, 
	DateMade, 
	--Heat, (Grade + Alloy) AS [BLEND], 
	SpecialLot, 
	---DATEDIFF(DAY,GETDATE(),DateMade) AS [Days Old],
	FR1, 
	FR2, 
	FR3, 
	FR4,
	Weight,
	UsedDate,
	s.MMLot,
	s.StickerNo
FROM 
	MM_ChargeInv AS c
	INNER JOIN ChargeInvSticker AS s
	ON c.MMLot = s.MMLot
GROUP BY 
	Grade, 
	Alloy, 
	DateMade, 
	Weight,
	Made-Used,
	Heat, 
	--([Grade] + Alloy), 
	SpecialLot, 
	---DATEDIFF(DAY,GETDATE(),DateMade), 
	FR1, 
	FR2, 
	FR3, 
	FR4,
	s.UsedDate,
	s.MMLot,
	s.StickerNo
HAVING((Made-Used)>0 
		AND FR1 Not In ('078157','078158','078159') 
		AND FR2 Not In ('078157','078158','078159') 
		AND FR3 Not In ('078157','078158','078159') 
		AND FR4 Not In ('078157','078158','078159')
		AND UsedDate IS NULL)
ORDER BY Alloy;


