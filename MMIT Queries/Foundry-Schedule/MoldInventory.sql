/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Mold]
	  ,[FR]
      ,[SpecialLot]
      ,[WIPType]
      ,[CountPoint]
      ,[Operation]
      ,[LastTouch]
      ,[Plant]
      ,[PlantID]
      ,[Pieces]
  FROM [Lotcontrol].[dbo].[Mold]
  WHERE Operation IN('490','450','470') AND FR = '009665'