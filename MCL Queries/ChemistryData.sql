SELECT 
	a.WF_Analyte_ID
   ,Analyte_Name
   ,Default_Units
   ,Data_Value
   ,Units
   ,Date_Analyzed
FROM 
	ANALYTES AS a 
	INNER JOIN SAMPLE_ANALYTE_DATA AS s
	ON a.WF_Analyte_ID = s.WF_Analyte_ID
WHERE
	Date_Analyzed > '2019-04-01'
ORDER BY
	Date_Analyzed