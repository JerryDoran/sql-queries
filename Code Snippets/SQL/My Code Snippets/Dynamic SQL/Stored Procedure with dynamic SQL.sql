--Creating stored procedures with one parameter

CREATE PROC spVariableTable
(
	@TableName NVARCHAR(128)
)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)

	SET @SQLString = N'SELECT * FROM ' + @TableName

	EXEC sp_executesql @SQLSTRING
END