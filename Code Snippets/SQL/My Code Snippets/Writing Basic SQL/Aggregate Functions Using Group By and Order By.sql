USE Movies

SELECT
	ISNULL(CountryName,'TOTAL'),
	SUM(FilmRunTimeMinutes) AS [TotalRunTime],
	AVG(CONVERT(DECIMAL,FilmRunTimeMinutes)) AS [AverageRunTime],
	MAX(FilmRunTimeMinutes) AS [MaxRunTime],
	MIN(FilmRunTimeMinutes) AS [MinRunTime],
	COUNT(FilmRunTimeMinutes) AS [CountRunTime]
FROM
	tblFilm AS f
	INNER JOIN tblCountry AS c
	ON c.CountryID = f.FilmCountryID
GROUP BY 
	CountryName WITH ROLLUP
ORDER BY
	CountryName ASC