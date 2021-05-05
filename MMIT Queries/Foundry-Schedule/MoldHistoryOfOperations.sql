SELECT
	FR,
	SpecialLot,
	Operation,
	PurchasedMold,
	COUNT(FR) AS [# Molds]
FROM MoldHistory
WHERE Operation IN(450, 470, 490)
GROUP BY FR, SpecialLot, Operation, PurchasedMold
