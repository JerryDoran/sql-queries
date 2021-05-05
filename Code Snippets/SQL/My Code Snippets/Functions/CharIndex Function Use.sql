USE Movies
GO

CREATE FUNCTION fnFirstName
	(
		@FullName AS VARCHAR(MAX)
	)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @SpacePosition AS INT
	DECLARE @Answer AS VARCHAR(MAX)

	SET @SpacePosition = CHARINDEX(' ',@FullName)

	IF @SpacePosition = 0
		SET @Answer = @FullName
	ELSE
		SET @Answer = LEFT(@FullName,@SpacePosition -1)

	RETURN @Answer

END