USE Mastermetals


SELECT 
	TOP 5 *
FROM
	CustomerOrder
FOR XML AUTO

SELECT 
	TOP 5 *
FROM
	CustomerOrder
FOR XML AUTO, TYPE

SELECT 
	TOP 5 *
FROM
	CustomerOrder
FOR XML AUTO, TYPE, ELEMENTS

SELECT 
	TOP 5 *
FROM
	CustomerOrder
FOR XML AUTO, TYPE, ELEMENTS, ROOT

SELECT TOP 100
	OrderDate
	,CustomerPONumber
	,OrderStatus
	,SpecialRemarks
	,JobOrder
FROM
	CustomerOrder
FOR XML AUTO, TYPE, ELEMENTS, ROOT('myRoot')
