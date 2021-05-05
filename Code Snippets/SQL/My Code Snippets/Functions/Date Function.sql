SELECT FilmName, FilmReleaseDate, [dbo].[fnLongDate](FilmReleaseDate)
FROM tblFilm
