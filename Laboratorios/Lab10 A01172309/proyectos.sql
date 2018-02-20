BULK INSERT a1172309.a1172309.[Proyectos]
	FROM 'e:\wwwroot\a1172309\proyectos.csv'
	WITH
		(
			CODEPAGE='ACP',
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n'
		)