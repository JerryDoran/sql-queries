CREATE TABLE #TempFilms
(
	Title VARCHAR(MAX),
	Release DATETIME
)

EXEC spInsertIntoTemp 'star'
EXEC spSelectFromTemp