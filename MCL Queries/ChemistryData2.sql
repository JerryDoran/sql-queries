SELECT        a.WF_Analyte_ID, a.Analyte_Name, a.Default_Units, sa.Data_Value, sa.Units, sa.Date_Analyzed, sh.Field_Value, sh.Field_ID, 
                         SAMPLE_HEADER_FIELD_DEFINITION.Field_Name
FROM            SAMPLE_TEST_RUNS AS tr INNER JOIN
                         SAMPLE_ANALYTE_DATA AS sa ON tr.WF_Run_ID = sa.WF_Run_ID INNER JOIN
                         SAMPLES AS s ON tr.WF_Sample_ID = s.WF_Sample_ID INNER JOIN
                         SAMPLE_HEADER_FIELD_DATA AS sh ON s.WF_Sample_ID = sh.WF_Sample_ID INNER JOIN
                         SAMPLE_HEADER_FIELD_DEFINITION ON sh.Field_ID = SAMPLE_HEADER_FIELD_DEFINITION.Field_ID LEFT OUTER JOIN
                         ANALYTES AS a ON sa.WF_Analyte_ID = a.WF_Analyte_ID
WHERE        (sa.Date_Analyzed > '2018-01-01') AND (sh.Field_ID = '142')
ORDER BY sa.Date_Analyzed