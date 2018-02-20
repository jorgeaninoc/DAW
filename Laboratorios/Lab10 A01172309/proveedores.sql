BULK INSERT a1172309.a1172309.[Proveedores]
	FROM 'e:\wwwroot\a1172309\proveedores.csv'
	WITH
		(
			CODEPAGE='ACP',
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n'
		)