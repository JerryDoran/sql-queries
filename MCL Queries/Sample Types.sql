/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Sample_Type_ID]
      ,[Sample_Type]
      ,[Auto_Sample_ID_Prefix]
      ,[Object_Label]
      ,[UseRequiredFieldValidators]
      ,[UseTestRequiredFieldValidators]
  FROM [PCC_WFLIMS].[dbo].[SAMPLE_TYPES]