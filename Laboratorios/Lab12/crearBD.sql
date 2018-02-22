-- Ejercicio 1

drop TABLE entregan
drop TABLE materiales
drop TABLE proyectos
drop TABLE Proveedores 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
DROP TABLE Materiales
CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores
CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE Proyectos
CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan
CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
) 

BULK INSERT a1172309.a1172309.[Materiales]
	FROM 'e:\wwwroot\a1172309\materiales.csv'
	WITH
	(
		CODEPAGE='ACP',
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n'
	)

BULK INSERT a1172309.a1172309.[Proyectos]
	FROM 'e:\wwwroot\a1172309\proyectos.csv'
	WITH
	(
		CODEPAGE='ACP',
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n'
	)	

BULK INSERT a1172309.a1172309.[Proveedores]
	FROM 'e:\wwwroot\a1172309\proveedores.csv'
	WITH
	(
		CODEPAGE='ACP',
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n'
	)

SET DATEFORMAT dmy

BULK INSERT a1172309.a1172309.[Entregan]
	FROM 'e:\wwwroot\a1172309\entregan.csv'
	WITH
	(
		CODEPAGE='ACP',
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n'
	)

-- Ejercicio 2
INSERT INTO Materiales values(1000,'xxx',1000)

SELECT *
FROM Materiales

Delete from Materiales where Clave = 1000 and Costo = 1000 

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave) 

INSERT INTO Materiales values(1000, 'xxx', 1000)

sp_helpconstraint materiales

ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC) 
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero) 
ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave, RFC, Numero, Fecha) 

sp_helpconstraint entregan

 -- ALTER TABLE tableName drop constraint ConstraintName 

-- Ejercicio 3

SELECT *
FROM Materiales

SELECT *
FROM Proveedores

SELECT *
FROM Proyectos

SELECT *
FROM Entregan

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0)

Delete from Entregan where Clave = 0 

ALTER TABLE entregan add constraint cfentreganclave foreign key (clave) references materiales(clave)

ALTER TABLE entregan add constraint cfentregannumero foreign key (Numero) references proyectos(numero) 

ALTER TABLE entregan add constraint cfentreganrfc foreign key (RFC) references proveedores(RFC) 

sp_helpconstraint materiales
sp_helpconstraint proveedores
sp_helpconstraint proyectos
sp_helpconstraint entregan 


-- Ejercicio 4

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0)

SELECT * 
FROM Entregan 

Delete from Entregan where Cantidad = 0

ALTER TABLE entregan add constraint cantidad check (cantidad > 0)

sp_helpconstraint materiales
sp_helpconstraint proveedores
sp_helpconstraint proyectos
sp_helpconstraint entregan 


