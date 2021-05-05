SELECT 
	pl.[Name], 
	Grade, 
	MaterialCode, 
	CustomerPONumber, 
	CAST(RequestedDate AS DATE) AS DueDate,
	CAST([Date] AS DATE) AS ChangeDate, 
	[Action], 
	CustomerOrderID, 
	Change
FROM 
	LotControl.dbo.Customer AS cu 
	INNER JOIN MM_MaterialOrderSpecs AS ms
	INNER JOIN MM_CustomerOrder AS co
	ON ms.ID = co.MaterialOrderSpecsID
	INNER JOIN MM_MaterialGrades AS mg 
	INNER JOIN MM_MaterialTypes AS mt
	ON mg.Grade = mt.MaterialGrade
	ON ms.MaterialTypeID = mt.ID 
	INNER JOIN MM_CustomerOrderChangeLog AS cc
	ON co.ID = cc.CustomerOrderID
	ON cu.Code = ms.CustCode
	INNER JOIN LotControl.dbo.Plant AS pl
	ON cu.Plant = pl.Code
WHERE 
	cc.Date Between '2019-12-02' And '2019-12-10' AND cc.[Action] IN ('UPDATE', 'UPDATETUBE');
	