--This is how to comment your SQL code
/*
Created by JMD 2.21.2018
Show a list of films
*/
USE Movies

SELECT 
	FilmName AS Title,
	FilmReleaseDate AS [Released on],
	FilmRunTimeMinutes AS Duration,
	FilmOscarNominations
FROM
	tblFilm