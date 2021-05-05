USE Movies
GO

ALTER PROCEDURE spVariableData
	(
		@infoType VARCHAR(9)  --This can be ALL, AWARD or FINANCIAL
	)
AS
BEGIN
	
	IF @infoType = 'ALL'
		BEGIN
			(SELECT * FROM tblFilm)
			RETURN	--Stops execution of stored procedure and returns to the calling procedure.
		END

	IF @infoType = 'AWARD'
		BEGIN
			(SELECT FilmName, FilmOscarWins, FilmOscarNominations FROM tblFilm)
			RETURN	--Stops execution of stored procedure and returns to the calling procedure.
		END

	IF @infoType = 'FINANCIAL'
		BEGIN
			(SELECT FilmName, FilmBoxOfficeDollars, FilmBudgetDollars FROM tblFilm)
			RETURN	--Stops execution of stored procedure and returns to the calling procedure.
		END

	SELECT 'You must choose ALL, AWARD or FINANCIAL'


END
GO
