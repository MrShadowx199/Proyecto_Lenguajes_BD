/*Proyecto Final Lenguajes de Base de Datos */

/*TABLAS*/
-- Tabla Hospital

CREATE TABLE Hospital (
    ID_Hospital NUMBER PRIMARY KEY,
    Nombre_Hospital VARCHAR2(50),
    Direccion_Hospital VARCHAR2(100),
    Telefono_Hospital NUMBER
);

-- Tabla Departamento
CREATE TABLE Departamento (
    ID_Departamento NUMBER PRIMARY KEY,
    Nombre_Departamento VARCHAR2(50)
);

-- Tabla Doctor
CREATE TABLE Doctor (
    ID_Doctor NUMBER PRIMARY KEY,
    Especializacion VARCHAR2(50),
    Nombre_Doctor VARCHAR2(50),
    ID_Departamento NUMBER,
    CONSTRAINT fk_departamento
      FOREIGN KEY (ID_Departamento) 
      REFERENCES Departamento(ID_Departamento)
);

-- Tabla Paciente
CREATE TABLE Paciente (
    ID_Paciente NUMBER PRIMARY KEY,
    Nombre_Paciente VARCHAR2(50),
    PriApellido_Paciente VARCHAR2(50),
    SegApellido_Paciente VARCHAR2(50),
    Numero_Paciente NUMBER,
    Direccion_Paciente VARCHAR2(100),
    Correo_Paciente VARCHAR2(100)
);

-- Tabla Citas
CREATE TABLE Citas (
    ID_Paciente NUMBER,
    ID_Doctor NUMBER,
    Fecha_Cita DATE,
    Hora_Cita TIMESTAMP,
    PRIMARY KEY (ID_Paciente, ID_Doctor),
    CONSTRAINT fk_paciente
      FOREIGN KEY (ID_Paciente) 
      REFERENCES Paciente(ID_Paciente),
    CONSTRAINT fk_doctor
      FOREIGN KEY (ID_Doctor) 
      REFERENCES Doctor(ID_Doctor)
);

-- Tabla Receta
CREATE TABLE Receta (
    ID_Receta NUMBER PRIMARY KEY,
    ID_Paciente NUMBER,
    Nombre_Medicina VARCHAR2(50),
    Fecha_Receta DATE,
    CONSTRAINT fk_receta_paciente
      FOREIGN KEY (ID_Paciente) 
      REFERENCES Paciente(ID_Paciente)
);

-- Tabla Personal
CREATE TABLE Personal (
    ID_Personal NUMBER PRIMARY KEY,
    Nombre_Personal VARCHAR2(50),
    PrimApellido_Personal VARCHAR2(50),
    SegApellido_Personal VARCHAR2(50),
    Numero_Personal NUMBER,
    Direccion_Personal VARCHAR2(100),
    Correo_Personal VARCHAR2(100),
    ID_Departamento NUMBER,
    CONSTRAINT fk_personal_departamento
      FOREIGN KEY (ID_Departamento) 
      REFERENCES Departamento(ID_Departamento)
);


/*DATOS*/
--Tabla Hospital
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (1, 'Hospital ABC', 'Av. Observatorio 123, Ciudad de M�xico', 5551234567);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (2, 'Hospital �ngeles', 'Av. Revoluci�n 456, Monterrey', 8187654321);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (3, 'Hospital General', 'Calle Independencia 789, Guadalajara', 3339876543);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (4, 'Hospital San Jos�', 'Av. Universidad 111, Puebla', 2228765432);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (5, 'Hospital Universitario', 'Calle Hidalgo 234, Monterrey', 8182345678);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (6, 'Hospital Zambrano Hellion', 'Av. Batall�n de San Patricio 112, Monterrey', 8182991000);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (7, 'Hospital M�dica Sur', 'Puente de Piedra 150, Toriello Guerra, Ciudad de M�xico', 5554271000);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (8, 'Hospital de Especialidades CMN Siglo XXI', 'Avenida Cuauht�moc 330, Doctores, Ciudad de M�xico', 5556232100);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (9, 'Hospital San Jos� Tec de Monterrey', 'Av. Morones Prieto 3000 Pte, Monterrey', 8188389000);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (10, 'Hospital General de Tijuana', 'Av. Centenario 4500, Zona R�o, Tijuana', 6641049200);

--Tabla Departamento 
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (201, 'Administraci�n');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (202, 'Recursos Humanos');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (203, 'Contabilidad');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (204, 'Sistemas');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (205, 'Log�stica');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (206, 'Atenci�n al Cliente');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (207, 'Ventas');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (208, 'Marketing');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (209, 'Operaciones');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (210, 'Finanzas');


--Tabla Doctor 
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (1, 'Cardiolog�a', 'Dr. Jorge P�rez', 1);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (2, 'Pediatr�a', 'Dra. Ana Ruiz', 2);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (3, 'Ginecolog�a', 'Dr. Luis Hern�ndez', 3);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (4, 'Dermatolog�a', 'Dra. Mar�a L�pez', 4);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (5, 'Neurolog�a', 'Dr. Carlos Mart�nez', 5);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (6, 'Oncolog�a', 'Dra. Laura Garc�a', 6);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (7, 'Ortopedia', 'Dr. Ricardo S�nchez', 7);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (8, 'Oftalmolog�a', 'Dra. Claudia Rodr�guez', 8);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (9, 'Psiquiatr�a', 'Dr. Manuel Fern�ndez', 9);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (10, 'Urolog�a', 'Dr. Fernando Jim�nez', 10);

UPDATE Doctor SET ID_Departamento = 201 WHERE ID_Doctor = 1;
UPDATE Doctor SET ID_Departamento = 202 WHERE ID_Doctor = 2;
UPDATE Doctor SET ID_Departamento = 203 WHERE ID_Doctor = 3;
UPDATE Doctor SET ID_Departamento = 204 WHERE ID_Doctor = 4;
UPDATE Doctor SET ID_Departamento = 205 WHERE ID_Doctor = 5;
UPDATE Doctor SET ID_Departamento = 206 WHERE ID_Doctor = 6;
UPDATE Doctor SET ID_Departamento = 207 WHERE ID_Doctor = 7;
UPDATE Doctor SET ID_Departamento = 208 WHERE ID_Doctor = 8;
UPDATE Doctor SET ID_Departamento = 209 WHERE ID_Doctor = 9;
UPDATE Doctor SET ID_Departamento = 210 WHERE ID_Doctor = 10;

--Tabla Receta
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (1, 1, 'Paracetamol', TO_DATE('2024-08-15', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (2, 2, 'Ibuprofeno', TO_DATE('2024-08-16', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (3, 3, 'Amoxicilina', TO_DATE('2024-08-17', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (4, 4, 'Metformina', TO_DATE('2024-08-18', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (5, 5, 'Loratadina', TO_DATE('2024-08-19', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (6, 6, 'Enalapril', TO_DATE('2024-08-20', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (7, 7, 'Losart�n', TO_DATE('2024-08-21', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (8, 8, 'Omeprazol', TO_DATE('2024-08-22', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (9, 9, 'Simvastatina', TO_DATE('2024-08-23', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (10, 10, 'Atorvastatina', TO_DATE('2024-08-24', 'YYYY-MM-DD'));

--Tabla Citas
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (1, 1, TO_DATE('2024-08-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (2, 2, TO_DATE('2024-08-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (3, 3, TO_DATE('2024-08-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (4, 4, TO_DATE('2024-08-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-18 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (5, 5, TO_DATE('2024-08-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-19 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (6, 6, TO_DATE('2024-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (7, 7, TO_DATE('2024-08-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-21 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (8, 8, TO_DATE('2024-08-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-22 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (9, 9, TO_DATE('2024-08-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-23 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Citas (ID_Paciente, ID_Doctor, Fecha_Cita, Hora_Cita) VALUES (10, 10, TO_DATE('2024-08-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-24 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));


--Tabla Paciente
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (1, 'Carlos', 'G�mez', 'L�pez', 5551234567, 'Calle 1, Ciudad A', 'carlos.gomez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (2, 'Ana', 'Mart�nez', 'P�rez', 5559876543, 'Calle 2, Ciudad B', 'ana.martinez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (3, 'Luis', 'Ram�rez', 'Garc�a', 5554567890, 'Calle 3, Ciudad C', 'luis.ramirez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (4, 'Mar�a', 'L�pez', 'Rodr�guez', 5556543210, 'Calle 4, Ciudad D', 'maria.lopez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (5, 'Jorge', 'Garc�a', 'Mart�nez', 5557890123, 'Calle 5, Ciudad E', 'jorge.garcia@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (6, 'Luc�a', 'Hern�ndez', 'G�mez', 5558901234, 'Calle 6, Ciudad F', 'lucia.hernandez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (7, 'Ra�l', 'P�rez', 'Mart�nez', 5553210987, 'Calle 7, Ciudad G', 'raul.perez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (8, 'Claudia', 'Rodr�guez', 'Gonz�lez', 5554321098, 'Calle 8, Ciudad H', 'claudia.rodriguez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (9, 'Andr�s', 'S�nchez', 'Hern�ndez', 5555678901, 'Calle 9, Ciudad I', 'andres.sanchez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (10, 'Marta', 'Fern�ndez', 'Ram�rez', 5556789012, 'Calle 10, Ciudad J', 'marta.fernandez@mail.com');

--Tabla Personal
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (1, 'Juan', 'Hern�ndez', 'Garc�a', 5559871234, 'Calle 11, Ciudad A', 'juan.hernandez@mail.com', 201);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (2, 'Laura', 'Mart�nez', 'L�pez', 5558762345, 'Calle 12, Ciudad B', 'laura.martinez@mail.com', 202);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (3, 'Pedro', 'G�mez', 'Ram�rez', 5557653456, 'Calle 13, Ciudad C', 'pedro.gomez@mail.com', 203);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (4, 'Ana', 'L�pez', 'Mart�nez', 5556544567, 'Calle 14, Ciudad D', 'ana.lopez@mail.com', 204);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (5, 'Luis', 'Fern�ndez', 'Gonz�lez', 5555435678, 'Calle 15, Ciudad E', 'luis.fernandez@mail.com', 205);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (6, 'Mar�a', 'Garc�a', 'Hern�ndez', 5554326789, 'Calle 16, Ciudad F', 'maria.garcia@mail.com', 206);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (7, 'Jorge', 'Rodr�guez', 'S�nchez', 5553217890, 'Calle 17, Ciudad G', 'jorge.rodriguez@mail.com', 207);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (8, 'Claudia', 'Gonz�lez', 'Fern�ndez', 5552108901, 'Calle 18, Ciudad H', 'claudia.gonzalez@mail.com', 208);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (9, 'Andr�s', 'L�pez', 'Ram�rez', 5551099012, 'Calle 19, Ciudad I', 'andres.lopez@mail.com', 209);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (10, 'Luc�a', 'Hern�ndez', 'G�mez', 5550980123, 'Calle 20, Ciudad J', 'lucia.hernandez@mail.com', 210);

--Verificaci�n de informaci�n en tablas
SELECT * FROM hospital;
SELECT * FROM citas;
SELECT * FROM departamento;
SELECT * FROM doctor;
SELECT * FROM paciente; 
SELECT * FROM personal;
SELECT * FROM receta;

