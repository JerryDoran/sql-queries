--A basic pivot

USE Movies

SELECT * FROM
(
	SELECT
		c.CountryName
		,f.FilmID
	FROM
		tblCountry AS c
		INNER JOIN tblFilm AS f
		ON c.CountryID = f.FilmCountryID
) AS BaseData
PIVOT
(
	COUNT(FilmID)
	FOR CountryName IN ([China], [France], [Germany], [Japan], [New Zealand], [Russia], [United Kingdom], [United States])
)
AS PivotTable