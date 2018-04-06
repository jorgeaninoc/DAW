------    CREAR TABLAS    -----

CREATE TABLE Clientes_Banca
(
  NoCuenta varchar(5) not null,
  Nombre varchar(30),
  Saldo numeric(10,2)
)

CREATE TABLE Tipos_Movimiento
(
  ClaveM varchar(2) not null,
  Descripcion varchar(30),
)

SET DATEFORMAT dmy
CREATE TABLE Movimientos
(
    NoCuenta varchar(5) not null,
  ClaveM varchar(2) not null,
   Fecha DATETIME not null,
  Monto numeric(10,2)
)



ALTER TABLE Clientes_Banca add constraint llaveClientes_Bancarias PRIMARY KEY (NoCuenta)
--sp_helpconstraint Clientes_Banca
ALTER TABLE Tipos_Movimiento add constraint llaveTipos_Movimiento PRIMARY KEY (ClaveM)
--sp_helpconstraint Tipos_Movimiento
ALTER TABLE Movimientos add constraint llaveMovimientos_clave PRIMARY KEY (ClaveM, NoCuenta, Fecha)
--sp_helpconstraint Movimientos

ALTER TABLE Movimientos add constraint fkCB
foreign key (ClaveM) references Tipos_Movimiento(ClaveM);
--sp_helpconstraint Movimientos --Para verificar

ALTER TABLE Movimientos add constraint fkTM
foreign key (NoCuenta) references Clientes_Banca(NoCuenta);
--sp_helpconstraint Movimientos --Para verificar

------    PARTE 1    -----
--Inserta la siguiente transacción y ejecútala.

BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1

--Revisa si la tabla de clientes_banca sufrió algún cambio.
---- Es decir, si dio de alta el registro que se describe en la transacción.
SELECT *
FROM Clientes_Banca

--Inserta la siguiente transacción y ejecútala.
BEGIN TRANSACTION PRUEBA2
INSERT INTO CLIENTES_BANCA VALUES('004','Ricardo Rios Maldonado',19000);
INSERT INTO CLIENTES_BANCA VALUES('005','Pablo Ortiz Arana',15000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Manuel Alvarado',18000);


SELECT * FROM CLIENTES_BANCA

SELECT * FROM CLIENTES_BANCA where NoCuenta='001'

ROLLBACK TRANSACTION PRUEBA2

------    PARTE 2: Comprobando la propiedad de Atomicidad en una BD    -----
--Inserta la siguiente transacción y ejecútala.
BEGIN TRANSACTION PRUEBA3
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico');
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

--Inserta la siguiente transacción y ejecútala.
BEGIN TRANSACTION PRUEBA4
INSERT INTO MOVIMIENTOS VALUES('001','A', GETDATE(), 500);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4

SELECT * FROM CLIENTES_BANCA
SELECT * FROM Movimientos
SELECT * FROM Tipos_Movimiento

------    PARTE 3: Manejando Fallas en una Transacción     -----
--Captura y ejecuta la siguiente transacción:
BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('007','Oscar Perez Alvarado',8000);

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

--Paa comprobar el cambio
SELECT * FROM CLIENTES_BANCA

DELETE
FROM Clientes_Banca
WHERE NoCuenta = 005
AND NoCuenta = 006
AND NoCuenta = 007

------    PARTE 4: --------
--Una transacción que registre el retiro de una cajero.
--  nombre del store procedure REGISTRAR_RETIRO_CAJERO que recibe 2 parámetros
-- en NoCuenta y el monto a retirar.
	CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
		@NoCliente varchar(5),
		@Monto numeric(10,2)
	as
		BEGIN TRANSACTION PRUEBA6
		INSERT INTO Movimientos
    VALUES(@NoCliente,'A',GETDATE(),@Monto);
		UPDATE Clientes_Banca
    SET Saldo = Saldo - @Monto
		WHERE NoCliente=@NoCliente

		IF @@ERROR = 0
		COMMIT TRANSACTION PRUEBA6
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION PRUEBA6
		END
  GO

--Una transacción que registre el deposito en ventanilla. Nombre del store procedure
-- REGISTRAR_DEPOSITO_VENTANILLA que recibe 2 parámetros en NoCuenta y el monto a depositar.
	CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
		@NoCliente varchar(5),
		@Monto numeric(10,2)
	as
		BEGIN TRANSACTION PRUEBA7
		INSERT INTO Movimientos
    VALUES(@NoCliente,'B',GETDATE(),@Monto);
		UPDATE Clientes_Banca
    SET Saldo = Saldo + @Monto
		WHERE NoCliente=@NoCliente

		IF @@ERROR = 0
		COMMIT TRANSACTION PRUEBA7
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION PRUEBA7
		END
  GO