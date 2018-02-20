BULK INSERT a1172309.a1172309.[Materiales]
	FROM 'e:\wwwroot\a1172309\materiales.csv'
	WITH
		(
			CODEPAGE='ACP',
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n'
		)


SELECT * FROM Materiales