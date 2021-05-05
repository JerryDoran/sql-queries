USE Movies

SELECT
	PersonName,
	PersonDOB,
	PersonJob
FROM
	dbo.PeopleInYear(1940)