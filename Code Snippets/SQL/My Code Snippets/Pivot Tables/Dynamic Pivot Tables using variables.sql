USE Movies

DECLARE @ColumnNames NVARCHAR(MAX) = ''
DECLARE @SQL NVARCHAR(MAX) = ''

SELECT
	@ColumnNames += QUOTENAME(CountryName) + ','
FROM
	tblCountry

SET @ColumnNames = LEFT(@ColumnNames, LEN(@ColumnNames) - 1)

SET @SQL = 

'SELECT * FROM
(
	SELECT
		CountryName
		,YEAR(f.FilmReleaseDate) AS [FilmYear]
		,FilmID
	FROM
		tblCountry AS c
		INNER JOIN tblFilm AS f
		ON c.CountryID = f.FilmCountryID
) AS BaseData
PIVOT		
(
	COUNT(FilmID)
	FOR CountryName 
	IN (' + @ColumnNames +
		')
) AS PivotTable'

--PRINT @SQL

EXECUTE sp_executesql @SQL
