SELECT 
	Grade, 
	MaterialCode, 
	CustomerPONumber AS [PO], 
	pl.Name AS [Plant], 
	FORMAT(RequestedDate,'MM/dd/yyyy') AS [DueDate], 
	CONCAT(CONVERT(Varchar(2),[Grade]),[MaterialCode]) AS [Alloy], 
	--CAST(Date AS DATE) AS [ChangeDate],
	FORMAT(Date,'MM/dd/yyyy') AS [Date], 
	Action AS [ChangeAction], 
	CustomerOrderID AS [ID], 
	Change
FROM 
	MM_MaterialOrderSpecs as ms
	INNER JOIN MM_CustomerOrder AS co
	ON ms.ID = co.MaterialOrderSpecsID
	INNER JOIN MM_MaterialGrades AS mg
	INNER JOIN MM_MaterialTypes AS mt
	ON mg.Grade = mt.MaterialGrade
	ON ms.MaterialTypeID = mt.ID
	INNER JOIN MM_CustomerOrderChangeLog AS cl
	ON co.ID = cl.CustomerOrderID
	INNER JOIN LotControl.dbo.Customer AS cu
	INNER JOIN LotControl.dbo.Plant AS pl
	ON cu.Plant = pl.Code
	ON ms.CustCode = cu.Code
WHERE 
	Date BETWEEN '2018-11-01' AND '2018-11-27' AND pl.Name ='Minerva';
