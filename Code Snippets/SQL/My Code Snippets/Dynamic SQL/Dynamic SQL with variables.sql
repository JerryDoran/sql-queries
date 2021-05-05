--Using Dynamic SQL
--Need to make sure the string of text is in unicode format.  Need to put an 'N' in the front of the string.

DECLARE @TableName NVARCHAR(128)
DECLARE @SQLString NVARCHAR(MAX)

SET @TableName = N'tblActor' --You can enter in differenct table names.

SET @SQLString = N'SELECT * FROM ' + @TableName

EXEC sp_executesql @SQLString