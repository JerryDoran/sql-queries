--Pivot with row groups

USE Movies

SELECT * FROM
(
	SELECT
		c.CountryName
		,YEAR(f.FilmReleaseDate) AS [FilmYear]
		,f.FilmID
	FROM
		tblCountry AS c
		INNER JOIN tblFilm AS f
		ON c.CountryID = f.FilmCountryID
) AS BaseData
PIVOT		--Specify the pivot operator
(
	COUNT(FilmID)
	FOR CountryName IN ([China]
						,[France]
						,[Japan]
						,[New Zealand]
						,[United Kingdom]
						,[United States]
						,[Germany]
						,[Russia])
)
AS PivotTable
ORDER BY
	FilmYear DESC