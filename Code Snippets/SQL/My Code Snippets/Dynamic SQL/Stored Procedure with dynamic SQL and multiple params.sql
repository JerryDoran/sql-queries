--Creating stored procedures with multiple parameters

ALTER PROC spVariableTable
(
	@TableName NVARCHAR(128)
	,@Number INT
)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	DECLARE @NumberString NVARCHAR(4)

	SET @NumberString = CAST(@Number AS NVARCHAR(4))

	SET @SQLString = N'SELECT TOP ' + @NumberString + ' * FROM ' + @TableName

	EXEC sp_executesql @SQLSTRING
END