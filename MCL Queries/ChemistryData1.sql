SELECT
	a.WF_Analyte_ID
	,tr.WF_Sample_ID
	,ws.WF_WorkOrder_ID
	--,WF_Customer_ID
	,Analyte_Name
	,Default_Units
	,Data_Value
	,Units
	,Date_Analyzed
	,Field_Value AS [MasterHeat]
	,Field_ID	
FROM
	ANALYTES AS a INNER JOIN
    SAMPLE_ANALYTE_DATA AS sa 
	ON a.WF_Analyte_ID = sa.WF_Analyte_ID 
	INNER JOIN SAMPLE_TEST_RUNS AS tr
	ON sa.WF_Run_ID = tr.WF_Run_ID 
	INNER JOIN SAMPLES AS s
	ON tr.WF_Sample_ID = s.WF_Sample_ID 
	INNER JOIN SAMPLE_HEADER_FIELD_DATA AS sh
	ON s.WF_Sample_ID = sh.WF_Sample_ID
	INNER JOIN WORK_ORDER_SAMPLES AS ws
	ON s.WF_Sample_ID = ws.WF_Sample_ID
	--LEFT JOIN WORK_ORDER_CUSTOMERS AS wo
	--ON ws.WF_WorkOrder_ID = wo.WF_WorkOrder_ID
WHERE
	(sa.Date_Analyzed > '2019-04-04') AND Field_ID = '142'
ORDER BY sa.Date_Analyzed