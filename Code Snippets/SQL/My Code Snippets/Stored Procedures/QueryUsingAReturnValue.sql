DECLARE @Count INT

EXEC @Count = spFilmsInYearII @Year = 2000

SELECT @Count AS [Number of Films]