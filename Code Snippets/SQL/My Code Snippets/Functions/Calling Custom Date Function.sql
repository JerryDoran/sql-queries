SELECT FilmName, FilmReleaseDate, [dbo].[fnLongDate]		--need to add schema tag '[dbo] preceding your function name.
FROM tblFilm