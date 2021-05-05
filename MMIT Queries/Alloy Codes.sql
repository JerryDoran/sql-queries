USE Mastermetals

SELECT DISTINCT 
	MaterialCode
FROM 
	MaterialTypes
WHERE 
	MaterialCode BETWEEN 'AA' AND 'ZX'
ORDER BY
	MaterialCode ASC