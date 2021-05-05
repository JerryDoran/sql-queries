/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [MMLot]
      ,[MadeTubLot]
  FROM [Mastermetals].[dbo].[ChargeInvSticker]
  WHERE MMlot IN ('bhv80', 'bhv96', 'bhw18', 'bhw36', 'bhw59', 'bhw80', 'bhx13', 'chd99', 'che11', 'che28', 'che50', 'che65', 'che67', 'che89', 'bhv81', 'bhw37')
  GROUP BY MMlot, MadeTubLot