
CREATE PROCEDURE dbo.spMatchups_Update 
	@id int,
	@WinnerId int
AS
BEGIN
	
	UPDATE dbo.Matchups
	SET WinnerId = @WinnerId
	WHERE id = @id;		--very important to have this where clause or all records will get updated.
END
GO
