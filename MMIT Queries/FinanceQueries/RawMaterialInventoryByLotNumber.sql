SELECT
	MaterialCode,
	Name,
	LotNumber, 
	CurrentLbs AS [Total Lbs],
	IIF(Quarantined = '1', 'YES', 'NO') AS [Quarantined],
	CASE 
		WHEN MaterialCode = '0107' THEN 1.75		
		WHEN MaterialCode = '1101' THEN 24.00
		WHEN MaterialCode = '1707' THEN 2.25
		WHEN MaterialCode = '2180' THEN 9.25
		WHEN MaterialCode = '2195' THEN 7.25
		WHEN MaterialCode = '2305' THEN 32.00
		WHEN MaterialCode = '2310' THEN 32.00
		WHEN MaterialCode = '2525' THEN 70.00
		WHEN MaterialCode = '3205' THEN 325
		WHEN MaterialCode = '3210' THEN 325
		WHEN MaterialCode = '3215' THEN 325
		WHEN MaterialCode = '4301' THEN 1.35
		WHEN MaterialCode = '4320' THEN .5
		WHEN MaterialCode = '4710' THEN 14.00
		WHEN MaterialCode = '4920' THEN 6.00
		WHEN MaterialCode = '6701' THEN 400.99
		WHEN MaterialCode = '6702' THEN 398.99
		WHEN MaterialCode = '6901' THEN 1.00
		WHEN MaterialCode = '6905' THEN 13.25
		WHEN MaterialCode = '6916' THEN 10.80
		WHEN MaterialCode = '7410' THEN 175.00
		WHEN MaterialCode = '8905' THEN 5.25
		WHEN MaterialCode = '8910' THEN 10
		WHEN MaterialCode = '9110' THEN 22.00
		WHEN MaterialCode = '9502' THEN 20.00
		WHEN MaterialCode = '9901' THEN 150.00
    END AS [CostPerLb],
	CASE 
		WHEN MaterialCode = '0107' THEN FORMAT(CurrentLbs*1.75, 'C2', 'en-US')
		WHEN MaterialCode = '1101' THEN FORMAT(CurrentLbs*24, 'C2', 'en-US')
		WHEN MaterialCode = '1707' THEN FORMAT(CurrentLbs*2.25, 'C2', 'en-US')
		WHEN MaterialCode = '2180' THEN FORMAT(CurrentLbs*9.25, 'C2', 'en-US')
		WHEN MaterialCode = '2195' THEN FORMAT(CurrentLbs*7.25, 'C2', 'en-US')
		WHEN MaterialCode = '2305' THEN FORMAT(CurrentLbs*32, 'C2', 'en-US')
		WHEN MaterialCode = '2310' THEN FORMAT(CurrentLbs*32, 'C2', 'en-US')
		WHEN MaterialCode = '2525' THEN FORMAT(CurrentLbs*70, 'C2', 'en-US')
		WHEN MaterialCode = '3205' THEN FORMAT(CurrentLbs*325, 'C2', 'en-US')
		WHEN MaterialCode = '3210' THEN FORMAT(CurrentLbs*325, 'C2', 'en-US')
		WHEN MaterialCode = '3215' THEN FORMAT(CurrentLbs*325, 'C2', 'en-US')
		WHEN MaterialCode = '4301' THEN FORMAT(CurrentLbs*1.35, 'C2', 'en-US')
		WHEN MaterialCode = '4320' THEN FORMAT(CurrentLbs*.5, 'C2', 'en-US')
		WHEN MaterialCode = '4710' THEN FORMAT(CurrentLbs*14, 'C2', 'en-US')
		WHEN MaterialCode = '4920' THEN FORMAT(CurrentLbs*6, 'C2', 'en-US')
		WHEN MaterialCode = '6701' THEN FORMAT(CurrentLbs*400.99, 'C2', 'en-US')
		WHEN MaterialCode = '6702' THEN FORMAT(CurrentLbs*398.99, 'C2', 'en-US')
		WHEN MaterialCode = '6901' THEN FORMAT(CurrentLbs*1, 'C2', 'en-US')
		WHEN MaterialCode = '6905' THEN FORMAT(CurrentLbs*13.25, 'C2', 'en-US')
		WHEN MaterialCode = '6916' THEN FORMAT(CurrentLbs*10.80, 'C2', 'en-US')
		WHEN MaterialCode = '7410' THEN FORMAT(CurrentLbs*175, 'C2', 'en-US')
		WHEN MaterialCode = '8905' THEN FORMAT(CurrentLbs*5.25, 'C2', 'en-US')
		WHEN MaterialCode = '8910' THEN FORMAT(CurrentLbs*10, 'C2', 'en-US')
		WHEN MaterialCode = '9110' THEN FORMAT(CurrentLbs*22, 'C2', 'en-US')
		WHEN MaterialCode = '9502' THEN FORMAT(CurrentLbs*20, 'C2', 'en-US')	
		WHEN MaterialCode = '9901' THEN FORMAT(CurrentLbs*150, 'C2', 'en-US')
	END AS [TotalCost]
	
FROM 
	Materials AS ma
	INNER JOIN MaterialTypes AS mt
	INNER JOIN MaterialInventory AS mi
	ON mt.ID = mi.MaterialTypeID
	ON ma.Code = mt.MaterialCode
WHERE CurrentLbs > 0 AND Code BETWEEN '0105' And '9901' AND Location = 'M' 
--GROUP BY MaterialCode, Name, Code, Location
