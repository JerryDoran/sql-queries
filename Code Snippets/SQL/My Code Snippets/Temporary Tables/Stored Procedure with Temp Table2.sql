CREATE PROC spSelectFromTemp
AS
BEGIN

	SELECT
		*
	FROM
		#TempFilm
	ORDER BY
		Release DESC
END