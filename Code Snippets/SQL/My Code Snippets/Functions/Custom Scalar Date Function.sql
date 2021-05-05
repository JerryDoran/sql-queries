USE Movies
GO

CREATE FUNCTION fnLongDate
	(
		--Input parameter for the function
		@FullDate AS DATETIME
	)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN DATENAME(DW,@FullDate) + ' ' + DATENAME(D,@FullDate) + ' ' + DATENAME(M,@FullDate) + ' ' + DATENAME(YY, @FullDate)	
END