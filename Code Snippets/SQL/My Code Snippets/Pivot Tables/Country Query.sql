SELECT
	--',[' + CountryName + ']' Or
	',' + QUOTENAME(CountryName)
FROM	
	tblCountry