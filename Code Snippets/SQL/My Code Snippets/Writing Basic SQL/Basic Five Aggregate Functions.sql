USE Movies

SELECT
	SUM(FilmRunTimeMinutes) AS [TotalRunTime],
	AVG(FilmRunTimeMinutes) AS [AverageRunTime],
	MAX(FilmRunTimeMinutes) AS [MaxRunTime],
	MIN(FilmRunTimeMinutes) AS [MinRunTime],
	COUNT(FilmRunTimeMinutes) AS [CountRunTime]
FROM
	tblFilm