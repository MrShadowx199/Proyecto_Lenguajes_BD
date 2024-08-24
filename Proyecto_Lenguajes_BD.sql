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

--Forma de dropear las tablas por si algo sale mal
DROP TABLE Hospital;
DROP TABLE Departamento;
DROP TABLE Doctor;
DROP TABLE Paciente;
DROP TABLE Citas;
DROP TABLE Receta;
DROP TABLE Personal;



/*DATOS*/
--Tabla Hospital
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (1, 'Hospital ABC', 'Av. Observatorio 123, Ciudad de México', 5551234567);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (2, 'Hospital Ángeles', 'Av. Revolución 456, Monterrey', 8187654321);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (3, 'Hospital General', 'Calle Independencia 789, Guadalajara', 3339876543);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (4, 'Hospital San José', 'Av. Universidad 111, Puebla', 2228765432);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (5, 'Hospital Universitario', 'Calle Hidalgo 234, Monterrey', 8182345678);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (6, 'Hospital Zambrano Hellion', 'Av. Batallón de San Patricio 112, Monterrey', 8182991000);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (7, 'Hospital Médica Sur', 'Puente de Piedra 150, Toriello Guerra, Ciudad de México', 5554271000);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (8, 'Hospital de Especialidades CMN Siglo XXI', 'Avenida Cuauhtémoc 330, Doctores, Ciudad de México', 5556232100);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (9, 'Hospital San José Tec de Monterrey', 'Av. Morones Prieto 3000 Pte, Monterrey', 8188389000);
INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (10, 'Hospital General de Tijuana', 'Av. Centenario 4500, Zona Río, Tijuana', 6641049200);

--Tabla Departamento
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (201, 'Administración');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (202, 'Recursos Humanos');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (203, 'Contabilidad');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (204, 'Sistemas');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (205, 'Logística');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (206, 'Atención al Cliente');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (207, 'Ventas');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (208, 'Marketing');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (209, 'Operaciones');
INSERT INTO Departamento (ID_Departamento, Nombre_Departamento) VALUES (210, 'Finanzas');


--Tabla Doctor
-- Tabla Doctor
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (1, 'Cardiología', 'Dr. Jorge Pérez', 201);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (2, 'Pediatría', 'Dra. Ana Ruiz', 202);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (3, 'Ginecología', 'Dr. Luis Hernández', 203);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (4, 'Dermatología', 'Dra. María López', 204);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (5, 'Neurología', 'Dr. Carlos Martínez', 205);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (6, 'Oncología', 'Dra. Laura García', 206);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (7, 'Ortopedia', 'Dr. Ricardo Sánchez', 207);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (8, 'Oftalmología', 'Dra. Claudia Rodríguez', 208);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (9, 'Psiquiatría', 'Dr. Manuel Fernández', 209);
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento) VALUES (10, 'Urología', 'Dr. Fernando Jiménez', 210);
/*
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
*/
--Tabla Paciente
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (1, 'Carlos', 'Gómez', 'López', 5551234567, 'Calle 1, Ciudad A', 'carlos.gomez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (2, 'Ana', 'Martínez', 'Pérez', 5559876543, 'Calle 2, Ciudad B', 'ana.martinez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (3, 'Luis', 'Ramírez', 'García', 5554567890, 'Calle 3, Ciudad C', 'luis.ramirez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (4, 'María', 'López', 'Rodríguez', 5556543210, 'Calle 4, Ciudad D', 'maria.lopez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (5, 'Jorge', 'García', 'Martínez', 5557890123, 'Calle 5, Ciudad E', 'jorge.garcia@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (6, 'Lucía', 'Hernández', 'Gómez', 5558901234, 'Calle 6, Ciudad F', 'lucia.hernandez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (7, 'Raúl', 'Pérez', 'Martínez', 5553210987, 'Calle 7, Ciudad G', 'raul.perez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (8, 'Claudia', 'Rodríguez', 'González', 5554321098, 'Calle 8, Ciudad H', 'claudia.rodriguez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (9, 'Andrés', 'Sánchez', 'Hernández', 5555678901, 'Calle 9, Ciudad I', 'andres.sanchez@mail.com');
INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) VALUES (10, 'Marta', 'Fernández', 'Ramírez', 5556789012, 'Calle 10, Ciudad J', 'marta.fernandez@mail.com');

--Tabla Receta
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (1, 1, 'Paracetamol', TO_DATE('2024-08-15', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (2, 2, 'Ibuprofeno', TO_DATE('2024-08-16', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (3, 3, 'Amoxicilina', TO_DATE('2024-08-17', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (4, 4, 'Metformina', TO_DATE('2024-08-18', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (5, 5, 'Loratadina', TO_DATE('2024-08-19', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (6, 6, 'Enalapril', TO_DATE('2024-08-20', 'YYYY-MM-DD'));
INSERT INTO Receta (ID_Receta, ID_Paciente, Nombre_Medicina, Fecha_Receta) VALUES (7, 7, 'Losartán', TO_DATE('2024-08-21', 'YYYY-MM-DD'));
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


--Tabla Personal
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (1, 'Juan', 'Hernández', 'García', 5559871234, 'Calle 11, Ciudad A', 'juan.hernandez@mail.com', 201);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (2, 'Laura', 'Martínez', 'López', 5558762345, 'Calle 12, Ciudad B', 'laura.martinez@mail.com', 202);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (3, 'Pedro', 'Gómez', 'Ramírez', 5557653456, 'Calle 13, Ciudad C', 'pedro.gomez@mail.com', 203);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (4, 'Ana', 'López', 'Martínez', 5556544567, 'Calle 14, Ciudad D', 'ana.lopez@mail.com', 204);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (5, 'Luis', 'Fernández', 'González', 5555435678, 'Calle 15, Ciudad E', 'luis.fernandez@mail.com', 205);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (6, 'María', 'García', 'Hernández', 5554326789, 'Calle 16, Ciudad F', 'maria.garcia@mail.com', 206);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (7, 'Jorge', 'Rodríguez', 'Sánchez', 5553217890, 'Calle 17, Ciudad G', 'jorge.rodriguez@mail.com', 207);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (8, 'Claudia', 'González', 'Fernández', 5552108901, 'Calle 18, Ciudad H', 'claudia.gonzalez@mail.com', 208);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (9, 'Andrés', 'López', 'Ramírez', 5551099012, 'Calle 19, Ciudad I', 'andres.lopez@mail.com', 209);
INSERT INTO Personal (ID_Personal, Nombre_Personal, PrimApellido_Personal, SegApellido_Personal, Numero_Personal, Direccion_Personal, Correo_Personal, ID_Departamento) VALUES (10, 'Lucía', 'Hernández', 'Gómez', 5550980123, 'Calle 20, Ciudad J', 'lucia.hernandez@mail.com', 210);

--Verificación de información en tablas
SELECT * FROM hospital;
SELECT * FROM citas;
SELECT * FROM departamento;
SELECT * FROM doctor;
SELECT * FROM paciente;
SELECT * FROM personal;
SELECT * FROM receta;

/*STORE PROCEDURES*/

/*Tabla Doctor*/
--Insertar un doctor
CREATE OR REPLACE PROCEDURE INSERTAR_DOCTOR(
    p_ID_Doctor NUMBER,
    p_Especializacion VARCHAR2,
    p_Nombre_Doctor VARCHAR2,
    p_ID_Departamento NUMBER
) AS
BEGIN
INSERT INTO Doctor (ID_Doctor, Especializacion, Nombre_Doctor, ID_Departamento)
VALUES (p_ID_Doctor, p_Especializacion, p_Nombre_Doctor, p_ID_Departamento);
END;

--Eliminar Doctor
CREATE OR REPLACE PROCEDURE ELIMINAR_DOCTOR(p_ID_Doctor NUMBER) AS
BEGIN
DELETE FROM Doctor WHERE ID_Doctor = p_ID_Doctor;
END;

--Actualizar Doctor
CREATE OR REPLACE PROCEDURE ACTUALIZAR_DOCTOR(
    p_ID_Doctor NUMBER,
    p_Especializacion VARCHAR2,
    p_Nombre_Doctor VARCHAR2,
    p_ID_Departamento NUMBER
) AS
BEGIN
UPDATE Doctor
SET Especializacion = p_Especializacion,
    Nombre_Doctor = p_Nombre_Doctor,
    ID_Departamento = p_ID_Departamento
WHERE ID_Doctor = p_ID_Doctor;
END;
/* STORE PROCEDURE CON EXPRESIONES REGULARES */
--Buscar Doctor
CREATE OR REPLACE PROCEDURE BUSCAR_DOCTOR(
    p_Criterio VARCHAR2,
    p_Nombre_Doctor OUT VARCHAR2,
    p_Especializacion OUT VARCHAR2,
    p_ID_Departamento OUT NUMBER
) AS
BEGIN
    IF REGEXP_LIKE(p_Criterio, '^[A-Za-z ]+$') THEN
SELECT Nombre_Doctor, Especializacion, ID_Departamento
INTO p_Nombre_Doctor, p_Especializacion, p_ID_Departamento
FROM Doctor
WHERE UPPER(Nombre_Doctor) LIKE UPPER('%' || p_Criterio || '%')
   OR UPPER(Especializacion) LIKE UPPER('%' || p_Criterio || '%');
ELSE
        p_Nombre_Doctor := NULL;
        p_Especializacion := NULL;
        p_ID_Departamento := NULL;
        DBMS_OUTPUT.PUT_LINE('Los datos insertados son incorrectos');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_Nombre_Doctor := NULL;
        p_Especializacion := NULL;
        p_ID_Departamento := NULL;
        DBMS_OUTPUT.PUT_LINE('No se encontró información que coincida con lo indicado');
END;


/*Tabla Paciente*/
--Insertar Paciente
CREATE OR REPLACE PROCEDURE INSERTAR_PACIENTE(
    p_ID_Paciente NUMBER,
    p_Nombre_Paciente VARCHAR2,
    p_PriApellido_Paciente VARCHAR2,
    p_SegApellido_Paciente VARCHAR2,
    p_Numero_Paciente NUMBER,
    p_Direccion_Paciente VARCHAR2,
    p_Correo_Paciente VARCHAR2
) AS
BEGIN
INSERT INTO Paciente (
    ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente,
    Numero_Paciente, Direccion_Paciente, Correo_Paciente
) VALUES (
             p_ID_Paciente, p_Nombre_Paciente, p_PriApellido_Paciente, p_SegApellido_Paciente,
             p_Numero_Paciente, p_Direccion_Paciente, p_Correo_Paciente
         );
END;

--Actualizar Paciente
CREATE OR REPLACE PROCEDURE ACTUALIZAR_PACIENTE(
    p_ID_Paciente NUMBER,
    p_Nombre_Paciente VARCHAR2,
    p_PriApellido_Paciente VARCHAR2,
    p_SegApellido_Paciente VARCHAR2,
    p_Numero_Paciente NUMBER,
    p_Direccion_Paciente VARCHAR2,
    p_Correo_Paciente VARCHAR2
) AS
BEGIN
UPDATE Paciente
SET Nombre_Paciente = p_Nombre_Paciente,
    PriApellido_Paciente = p_PriApellido_Paciente,
    SegApellido_Paciente = p_SegApellido_Paciente,
    Numero_Paciente = p_Numero_Paciente,
    Direccion_Paciente = p_Direccion_Paciente,
    Correo_Paciente = p_Correo_Paciente
WHERE ID_Paciente = p_ID_Paciente;
END;

--Eliminar Paciente
CREATE OR REPLACE PROCEDURE ELIMINAR_PACIENTE(p_ID_Paciente NUMBER) AS
BEGIN
DELETE FROM Paciente WHERE ID_Paciente = p_ID_Paciente;
END;

/* STORE PROCEDURE CON EXPRESIONES REGULARES */
--Buscar Paciente
CREATE OR REPLACE PROCEDURE BUSCAR_PACIENTE(
    p_Criterio VARCHAR2,
    p_Nombre_Paciente OUT VARCHAR2,
    p_PriApellido_Paciente OUT VARCHAR2,
    p_SegApellido_Paciente OUT VARCHAR2,
    p_Numero_Paciente OUT NUMBER,
    p_Direccion_Paciente OUT VARCHAR2,
    p_Correo_Paciente OUT VARCHAR2
) AS
BEGIN
    IF REGEXP_LIKE(p_Criterio, '^[A-Za-z ]+$') THEN
SELECT Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente,
       Numero_Paciente, Direccion_Paciente, Correo_Paciente
INTO p_Nombre_Paciente, p_PriApellido_Paciente, p_SegApellido_Paciente,
    p_Numero_Paciente, p_Direccion_Paciente, p_Correo_Paciente
FROM Paciente
WHERE UPPER(Nombre_Paciente) LIKE UPPER('%' || p_Criterio || '%')
   OR UPPER(PriApellido_Paciente) LIKE UPPER('%' || p_Criterio || '%')
   OR UPPER(SegApellido_Paciente) LIKE UPPER('%' || p_Criterio || '%');
ELSE
        p_Nombre_Paciente := NULL;
        p_PriApellido_Paciente := NULL;
        p_SegApellido_Paciente := NULL;
        p_Numero_Paciente := NULL;
        p_Direccion_Paciente := NULL;
        p_Correo_Paciente := NULL;
        DBMS_OUTPUT.PUT_LINE('Los datos insertados son incorrectos');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_Nombre_Paciente := NULL;
        p_PriApellido_Paciente := NULL;
        p_SegApellido_Paciente := NULL;
        p_Numero_Paciente := NULL;
        p_Direccion_Paciente := NULL;
        p_Correo_Paciente := NULL;
        DBMS_OUTPUT.PUT_LINE('No se encontró información que coincida con lo indicado');
END;

/* STORE PROCEDURE CON EXPRESIONES REGULARES */
--Verificar inserción de correo de Paciente
CREATE OR REPLACE PROCEDURE VALIDAR_CORREO(p_ID_Paciente NUMBER, p_Correo_Paciente OUT VARCHAR2, p_Estado OUT VARCHAR2)
AS
BEGIN
SELECT Correo_Paciente
INTO p_Correo_Paciente
FROM Paciente
WHERE ID_Paciente = p_ID_Paciente;

IF REGEXP_LIKE(p_Correo_Paciente, '^[^@]+@[^@]+\.[^@]+$') THEN
        p_Estado := 'Correo válido';
ELSE
        p_Estado := 'Correo inválido';
END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_Correo_Paciente := NULL;
        p_Estado := 'No se ha encontrado información relacionada a este correo';
END;

HEAD

/*FUNCIONES*/
--Contador de citas por paciente
CREATE OR REPLACE FUNCTION CONTADOR_CITAS(
    p_ID_Paciente NUMBER)
    RETURN NUMBER AS
    v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM Citas
WHERE ID_Paciente = p_ID_Paciente;

RETURN v_count;
END;

--Contador pacientes por doctor
CREATE OR REPLACE FUNCTION CONTADOR_PACIENTES(
    p_ID_Doctor NUMBER)
    RETURN NUMBER AS
    v_count NUMBER;
BEGIN
SELECT COUNT(DISTINCT ID_Paciente)
INTO v_count
FROM Citas
WHERE ID_Doctor = p_ID_Doctor;

RETURN v_count;
END;

/* CURSORES Y CURSORES DEL SISTEMA */
-- CURSOR CITAS
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE DISPLAY_CITAS
IS
    CURSOR CITAS_CURSOR IS
SELECT ID_PACIENTE, ID_DOCTOR, FECHA_CITA, HORA_CITA
FROM CITAS;

V_ID_PACIENTE CITAS.ID_PACIENTE%TYPE;
    V_ID_DOCTOR  CITAS.ID_DOCTOR%TYPE;
    V_FECHA_CITA CITAS.FECHA_CITA%TYPE;
    V_HORA_CITA  CITAS.HORA_CITA%TYPE;
BEGIN
OPEN CITAS_CURSOR;
LOOP
FETCH CITAS_CURSOR INTO V_ID_PACIENTE, V_ID_DOCTOR, V_FECHA_CITA, V_HORA_CITA;
        EXIT WHEN CITAS_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || V_ID_PACIENTE ||
                             ', Doctor ID: ' || V_ID_DOCTOR ||
                             ', Appointment Date: ' || V_FECHA_CITA ||
                             ', Appointment Time: ' || V_HORA_CITA);
END LOOP;

CLOSE CITAS_CURSOR;
END;
/

-- SYS REFCURSOR RECETAS
CREATE OR REPLACE PROCEDURE GET_RECETA_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_RECETA, ID_PACIENTE, NOMBRE_MEDICINA, FECHA_RECETA
FROM RECETA;
END;
/

-- SYS REFCURSOR PEROSNAL
CREATE OR REPLACE PROCEDURE GET_PERSONAL_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_PERSONAL,
       NOMBRE_PERSONAL,
       PRIMAPELLIDO_PERSONAL,
       SEGAPELLIDO_PERSONAL,
       NUMERO_PERSONAL,
       DIRECCION_PERSONAL,
       CORREO_PERSONAL,
       ID_DEPARTAMENTO
FROM PERSONAL;
END;

/* CURSORES Y CURSORES DEL SISTEMA */
-- CURSOR CITAS
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE DISPLAY_CITAS
IS
    CURSOR CITAS_CURSOR IS
SELECT ID_PACIENTE, ID_DOCTOR, FECHA_CITA, HORA_CITA
FROM CITAS;
V_ID_PACIENTE CITAS.ID_PACIENTE%TYPE;
    V_ID_DOCTOR  CITAS.ID_DOCTOR%TYPE;
    V_FECHA_CITA CITAS.FECHA_CITA%TYPE;
    V_HORA_CITA  CITAS.HORA_CITA%TYPE;
BEGIN
OPEN CITAS_CURSOR;
LOOP
FETCH CITAS_CURSOR INTO V_ID_PACIENTE, V_ID_DOCTOR, V_FECHA_CITA, V_HORA_CITA;
        EXIT WHEN CITAS_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || V_ID_PACIENTE ||
                             ', Doctor ID: ' || V_ID_DOCTOR ||
                             ', Appointment Date: ' || V_FECHA_CITA ||
                             ', Appointment Time: ' || V_HORA_CITA);
END LOOP;

CLOSE CITAS_CURSOR;
END;


-- SYS REFCURSOR RECETAS
CREATE OR REPLACE PROCEDURE GET_RECETA_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_RECETA, ID_PACIENTE, NOMBRE_MEDICINA, FECHA_RECETA
FROM RECETA;
END;


-- PEROSNAL
CREATE OR REPLACE PROCEDURE GET_PERSONAL_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_PERSONAL,
       NOMBRE_PERSONAL,
       PRIMAPELLIDO_PERSONAL,
       SEGAPELLIDO_PERSONAL,
       NUMERO_PERSONAL,
       DIRECCION_PERSONAL,
       CORREO_PERSONAL,
       ID_DEPARTAMENTO
FROM PERSONAL;
END;

CREATE OR REPLACE PROCEDURE AGREGAR_PERSONAL(
    p_ID_Personal        IN NUMBER,
    p_Nombre_Personal    IN VARCHAR2,
    p_PrimApellido_Personal IN VARCHAR2,
    p_SegApellido_Personal IN VARCHAR2,
    p_Numero_Personal    IN VARCHAR2,
    p_Direccion_Personal IN VARCHAR2,
    p_Correo_Personal    IN VARCHAR2,
    p_ID_Departamento    IN NUMBER
)
IS
BEGIN
INSERT INTO Personal (
    ID_PERSONAL,
    NOMBRE_PERSONAL,
    PRIMAPELLIDO_PERSONAL,
    SEGAPELLIDO_PERSONAL,
    NUMERO_PERSONAL,
    DIRECCION_PERSONAL,
    CORREO_PERSONAL,
    ID_DEPARTAMENTO
) VALUES (
             p_ID_Personal,
             p_Nombre_Personal,
             p_PrimApellido_Personal,
             p_SegApellido_Personal,
             p_Numero_Personal,
             p_Direccion_Personal,
             p_Correo_Personal,
             p_ID_Departamento
         );
END;


CREATE OR REPLACE PROCEDURE ELIMINAR_PERSONAL(
    p_ID_Personal IN NUMBER
)
IS
BEGIN
DELETE FROM Personal
WHERE ID_PERSONAL = p_ID_Personal;
END;





-- Hospital
CREATE OR REPLACE PROCEDURE GET_HOSPITAL_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_HOSPITAL,
       NOMBRE_HOSPITAL,
       DIRECCION_HOSPITAL,
       TELEFONO_HOSPITAL
FROM HOSPITAL;
END;

CREATE OR REPLACE PROCEDURE AGREGAR_HOSPITAL(
    P_ID_HOSPITAL IN HOSPITAL.ID_HOSPITAL%TYPE,
    P_NOMBRE_HOSPITAL IN HOSPITAL.NOMBRE_HOSPITAL%TYPE,
    P_DIRECCION_HOSPITAL IN HOSPITAL.DIRECCION_HOSPITAL%TYPE,
    P_TELEFONO_HOSPITAL IN HOSPITAL.TELEFONO_HOSPITAL%TYPE
) IS
BEGIN
INSERT INTO HOSPITAL (ID_HOSPITAL, NOMBRE_HOSPITAL, DIRECCION_HOSPITAL, TELEFONO_HOSPITAL)
VALUES (P_ID_HOSPITAL, P_NOMBRE_HOSPITAL, P_DIRECCION_HOSPITAL, P_TELEFONO_HOSPITAL);
END;
/


-- Doctor
CREATE OR REPLACE PROCEDURE GET_DOCTOR_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_DOCTOR,
       ESPECIALIZACION,
       NOMBRE_DOCTOR,
       ID_DEPARTAMENTO
FROM DOCTOR;
END;

CREATE OR REPLACE PROCEDURE AGREGAR_DOCTOR(
    P_ID_DOCTOR IN DOCTOR.ID_DOCTOR%TYPE,
    P_ESPECIALIZACION IN DOCTOR.ESPECIALIZACION%TYPE,
    P_NOMBRE_DOCTOR IN DOCTOR.NOMBRE_DOCTOR%TYPE,
    P_ID_DEPARTAMENTO IN DOCTOR.ID_DEPARTAMENTO%TYPE
) IS
BEGIN
INSERT INTO DOCTOR (ID_DOCTOR, ESPECIALIZACION, NOMBRE_DOCTOR, ID_DEPARTAMENTO)
VALUES (P_ID_DOCTOR, P_ESPECIALIZACION, P_NOMBRE_DOCTOR, P_ID_DEPARTAMENTO);
END;
/

CREATE OR REPLACE PROCEDURE ELIMINAR_DOCTOR(
    P_ID_DOCTOR IN DOCTOR.ID_DOCTOR%TYPE
) IS
BEGIN
DELETE FROM DOCTOR
WHERE ID_DOCTOR = P_ID_DOCTOR;
END;
/


-- Paciente
CREATE OR REPLACE PROCEDURE GET_PACIENTE_CURSOR (P_CURSOR OUT SYS_REFCURSOR)
IS
BEGIN
OPEN P_CURSOR FOR
SELECT ID_PACIENTE,
       NOMBRE_PACIENTE,
       PRIAPELLIDO_PACIENTE,
       SEGAPELLIDO_PACIENTE,
       NUMERO_PACIENTE,
       DIRECCION_PACIENTE,
       CORREO_PACIENTE
FROM PACIENTE;
END;

CREATE OR REPLACE PROCEDURE AGREGAR_PACIENTE (
    P_ID_PACIENTE IN PACIENTE.ID_PACIENTE%TYPE,
    P_NOMBRE_PACIENTE IN PACIENTE.NOMBRE_PACIENTE%TYPE,
    P_PRIAPELLIDO_PACIENTE IN PACIENTE.PRIAPELLIDO_PACIENTE%TYPE,
    P_SEGAPELLIDO_PACIENTE IN PACIENTE.SEGAPELLIDO_PACIENTE%TYPE,
    P_NUMERO_PACIENTE IN PACIENTE.NUMERO_PACIENTE%TYPE,
    P_DIRECCION_PACIENTE IN PACIENTE.DIRECCION_PACIENTE%TYPE,
    P_CORREO_PACIENTE IN PACIENTE.CORREO_PACIENTE%TYPE
)
IS
BEGIN
INSERT INTO PACIENTE (
    ID_PACIENTE,
    NOMBRE_PACIENTE,
    PRIAPELLIDO_PACIENTE,
    SEGAPELLIDO_PACIENTE,
    NUMERO_PACIENTE,
    DIRECCION_PACIENTE,
    CORREO_PACIENTE
) VALUES (
             P_ID_PACIENTE,
             P_NOMBRE_PACIENTE,
             P_PRIAPELLIDO_PACIENTE,
             P_SEGAPELLIDO_PACIENTE,
             P_NUMERO_PACIENTE,
             P_DIRECCION_PACIENTE,
             P_CORREO_PACIENTE
         );
END;

CREATE OR REPLACE PROCEDURE ELIMINAR_PACIENTE (
    P_ID_PACIENTE IN PACIENTE.ID_PACIENTE%TYPE
)
IS
BEGIN
DELETE FROM PACIENTE WHERE ID_PACIENTE = P_ID_PACIENTE;
END;

/*PAQUETES*/
--Este paquete maneja operaciones para la tabla Hospital.

CREATE OR REPLACE PACKAGE pkg_hospital IS
    -- Función para obtener el nombre del hospital por ID
    FUNCTION obtener_nombre_hospital(p_id_hospital NUMBER) RETURN VARCHAR2;

    -- Procedimiento para actualizar el teléfono del hospital
    PROCEDURE actualizar_telefono_hospital(p_id_hospital NUMBER, p_nuevo_telefono NUMBER);

    -- Función para contar el número de hospitales
    FUNCTION contar_hospitales RETURN NUMBER;

    -- Procedimiento para eliminar un hospital por ID
    PROCEDURE eliminar_hospital(p_id_hospital NUMBER);
END pkg_hospital;
/

CREATE OR REPLACE PACKAGE BODY pkg_hospital IS
    FUNCTION obtener_nombre_hospital(p_id_hospital NUMBER) RETURN VARCHAR2 IS
        v_nombre_hospital VARCHAR2(50);
BEGIN
SELECT Nombre_Hospital INTO v_nombre_hospital
FROM Hospital
WHERE ID_Hospital = p_id_hospital;
RETURN v_nombre_hospital;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Hospital no encontrado';
END obtener_nombre_hospital;

    PROCEDURE actualizar_telefono_hospital(p_id_hospital NUMBER, p_nuevo_telefono NUMBER) IS
BEGIN
UPDATE Hospital
SET Telefono_Hospital = p_nuevo_telefono
WHERE ID_Hospital = p_id_hospital;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error al actualizar el teléfono del hospital.');
END actualizar_telefono_hospital;

    FUNCTION contar_hospitales RETURN NUMBER IS
        v_numero_hospitales NUMBER;
BEGIN
SELECT COUNT(*) INTO v_numero_hospitales FROM Hospital;
RETURN v_numero_hospitales;
END contar_hospitales;

    PROCEDURE eliminar_hospital(p_id_hospital NUMBER) IS
BEGIN
DELETE FROM Hospital WHERE ID_Hospital = p_id_hospital;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error al eliminar el hospital.');
END eliminar_hospital;
END pkg_hospital;
/

--Este paquete maneja operaciones para la tabla Doctor.

CREATE OR REPLACE PACKAGE pkg_doctor IS
    -- Función para obtener la especialización de un doctor por ID
    FUNCTION obtener_especializacion(p_id_doctor NUMBER) RETURN VARCHAR2;

    -- Procedimiento para actualizar la especialización de un doctor
    PROCEDURE actualizar_especializacion(p_id_doctor NUMBER, p_nueva_especializacion VARCHAR2);

    -- Función para contar el número de doctores en un departamento
    FUNCTION contar_doctores_departamento(p_id_departamento NUMBER) RETURN NUMBER;

    -- Procedimiento para eliminar un doctor por ID
    PROCEDURE eliminar_doctor(p_id_doctor NUMBER);
END pkg_doctor;
/

CREATE OR REPLACE PACKAGE BODY pkg_doctor IS
    FUNCTION obtener_especializacion(p_id_doctor NUMBER) RETURN VARCHAR2 IS
        v_especializacion VARCHAR2(50);
BEGIN
SELECT Especializacion INTO v_especializacion
FROM Doctor
WHERE ID_Doctor = p_id_doctor;
RETURN v_especializacion;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Doctor no encontrado';
END obtener_especializacion;

    PROCEDURE actualizar_especializacion(p_id_doctor NUMBER, p_nueva_especializacion VARCHAR2) IS
BEGIN
UPDATE Doctor
SET Especializacion = p_nueva_especializacion
WHERE ID_Doctor = p_id_doctor;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error al actualizar la especialización del doctor.');
END actualizar_especializacion;

    FUNCTION contar_doctores_departamento(p_id_departamento NUMBER) RETURN NUMBER IS
        v_numero_doctores NUMBER;
BEGIN
SELECT COUNT(*) INTO v_numero_doctores
FROM Doctor
WHERE ID_Departamento = p_id_departamento;
RETURN v_numero_doctores;
END contar_doctores_departamento;

    PROCEDURE eliminar_doctor(p_id_doctor NUMBER) IS
BEGIN
DELETE FROM Doctor WHERE ID_Doctor = p_id_doctor;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error al eliminar el doctor.');
END eliminar_doctor;
END pkg_doctor;
/


--Este paquete maneja operaciones para la tabla Paciente.

CREATE OR REPLACE PACKAGE pkg_paciente IS
    -- Función para obtener el nombre completo de un paciente por ID
    FUNCTION obtener_nombre_completo_paciente(p_id_paciente NUMBER) RETURN VARCHAR2;

    -- Procedimiento para actualizar la dirección de un paciente
    PROCEDURE actualizar_direccion_paciente(p_id_paciente NUMBER, p_nueva_direccion VARCHAR2);

    -- Función para contar el número de pacientes
    FUNCTION contar_pacientes RETURN NUMBER;

    -- Procedimiento para eliminar un paciente por ID
    PROCEDURE eliminar_paciente(p_id_paciente NUMBER);
END pkg_paciente;
/

CREATE OR REPLACE PACKAGE BODY pkg_paciente IS
    FUNCTION obtener_nombre_completo_paciente(p_id_paciente NUMBER) RETURN VARCHAR2 IS
        v_nombre_completo VARCHAR2(150);
BEGIN
SELECT Nombre_Paciente || ' ' || PriApellido_Paciente || ' ' || SegApellido_Paciente
INTO v_nombre_completo
FROM Paciente
WHERE ID_Paciente = p_id_paciente;
RETURN v_nombre_completo;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Paciente no encontrado';
END obtener_nombre_completo_paciente;

    PROCEDURE actualizar_direccion_paciente(p_id_paciente NUMBER, p_nueva_direccion VARCHAR2) IS
BEGIN
UPDATE Paciente
SET Direccion_Paciente = p_nueva_direccion
WHERE ID_Paciente = p_id_paciente;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error al actualizar la dirección del paciente.');
END actualizar_direccion_paciente;

    FUNCTION contar_pacientes RETURN NUMBER IS
        v_numero_pacientes NUMBER;
BEGIN
SELECT COUNT(*) INTO v_numero_pacientes FROM Paciente;
RETURN v_numero_pacientes;
END contar_pacientes;

    PROCEDURE eliminar_paciente(p_id_paciente NUMBER) IS
BEGIN
DELETE FROM Paciente WHERE ID_Paciente = p_id_paciente;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error al eliminar el paciente.');
END eliminar_paciente;
END pkg_paciente;
/

--========--
--TRIGGERS--
--========--
--  Trigger para Verificar la Existencia de un Paciente antes de Insertar una Cita
CREATE OR REPLACE TRIGGER trg_check_patient_exists
BEFORE INSERT ON Citas
FOR EACH ROW
DECLARE
v_count NUMBER;
BEGIN
    -- Verificar la existencia del paciente
SELECT COUNT(*)
INTO v_count
FROM Paciente
WHERE ID_Paciente = :NEW.ID_Paciente;

IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El paciente no existe.');
END IF;
END;

---------------------------------------------------------------------------------------

-- Trigger para Validar la Unicidad del Número de Teléfono del Personal
CREATE OR REPLACE TRIGGER trg_unique_personal_phone
BEFORE INSERT OR UPDATE ON Personal
                            FOR EACH ROW
DECLARE
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM Personal
WHERE Numero_Personal = :NEW.Numero_Personal
  AND ID_Personal <> :NEW.ID_Personal;

IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20015, 'El número de teléfono ya está en uso.');
END IF;
END;

---------------------------------------------------------------------------------------

-- Trigger para Validar el Formato del Correo Electrónico
CREATE OR REPLACE TRIGGER trg_validate_email_format
BEFORE INSERT OR UPDATE ON Paciente
                            FOR EACH ROW
DECLARE
v_email_format BOOLEAN;
BEGIN
    v_email_format := REGEXP_LIKE(:NEW.Correo_Paciente, '^[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,}$');
    IF NOT v_email_format THEN
        RAISE_APPLICATION_ERROR(-20003, 'Formato de correo electrónico no válido.');
END IF;
END;
---------------------------------------------------------------------------------------

-- Este trigger evita que se elimine un registro de la tabla Departamento si tiene doctores asociados en la tabla Doctor.
CREATE OR REPLACE TRIGGER trg_prevent_department_deletion
BEFORE DELETE ON Departamento
FOR EACH ROW
DECLARE
v_count NUMBER;
BEGIN
    -- Contar el número de doctores asociados al departamento
SELECT COUNT(*)
INTO v_count
FROM Doctor
WHERE ID_Departamento = :OLD.ID_Departamento;

-- Si existen doctores asociados, lanzar un error
IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'No se puede eliminar el departamento porque tiene doctores asociados.');
END IF;
END;


---------------------------------------------------------------------------------------

-- Trigger para Prevenir la Eliminación de Pacientes con Citas Pendientes
CREATE OR REPLACE TRIGGER trg_prevent_patient_deletion
BEFORE DELETE ON Paciente
FOR EACH ROW
DECLARE
v_citas_count NUMBER;
BEGIN
SELECT COUNT(*) INTO v_citas_count
FROM Citas
WHERE ID_Paciente = :OLD.ID_Paciente AND Fecha_Cita > SYSDATE;

IF v_citas_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'No se puede eliminar el paciente porque tiene citas futuras.');
END IF;
END;
---------------------------------------------------------------------------------------
-- Trigger para Verificar la Existencia de un Departamento Antes de Insertar o Actualizar un Doctor
CREATE OR REPLACE TRIGGER trg_check_department_exists
BEFORE INSERT OR UPDATE ON Doctor
                            FOR EACH ROW
DECLARE
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM Departamento
WHERE ID_Departamento = :NEW.ID_Departamento;

IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El departamento especificado no existe.');
END IF;
END;
------------------------------------------------------------------------------------

-- Trigger para Prevenir la Eliminación de un Hospital si Hay Doctores Asociados
CREATE OR REPLACE TRIGGER trg_prevent_hospital_deletion
BEFORE DELETE ON Hospital
FOR EACH ROW
DECLARE
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM Doctor
WHERE ID_Departamento IN (SELECT ID_Departamento FROM Departamento WHERE ID_Hospital = :OLD.ID_Hospital);

IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede eliminar el hospital porque hay doctores asociados.');
END IF;
END;
-----------------------------------------------------------------------------------------------------------------



--============--
--SQL DINAMICO--
--============--
-- Procedimiento Almacenado con SQL Dinámico para Obtener Pacientes por Nombre
CREATE OR REPLACE PROCEDURE obtener_pacientes_por_nombre(p_nombre IN VARCHAR2) IS
    v_sql_query VARCHAR2(4000);
    v_cursor SYS_REFCURSOR;
    v_nombre Paciente.Nombre_Paciente%TYPE;
BEGIN
    v_sql_query := 'SELECT Nombre_Paciente FROM Paciente WHERE Nombre_Paciente LIKE :nombre';

OPEN v_cursor FOR v_sql_query USING '%' || p_nombre || '%';

LOOP
FETCH v_cursor INTO v_nombre;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Paciente encontrado: ' || v_nombre);
END LOOP;

CLOSE v_cursor;
END;

SET SERVEROUTPUT ON;

---------------------------------------------------------------------------------------

-- Procedimiento Almacenado con SQL Dinámico para Actualizar la Especialización de un Doctor
CREATE OR REPLACE PROCEDURE actualizar_especializacion_doctor(
    p_id_doctor IN NUMBER,
    p_especializacion IN VARCHAR2
) IS
    v_sql_update VARCHAR2(4000);
BEGIN
    v_sql_update := 'UPDATE Doctor SET Especializacion = :espec WHERE ID_Doctor = :id';

EXECUTE IMMEDIATE v_sql_update USING p_especializacion, p_id_doctor;

DBMS_OUTPUT.PUT_LINE('Especialización del Doctor actualizada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar la especialización del Doctor: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------

-- Procedimiento Almacenado con SQL Dinámico para Eliminar Recetas de un Paciente
CREATE OR REPLACE PROCEDURE eliminar_recetas_paciente(p_id_paciente IN NUMBER) IS
    v_sql_delete VARCHAR2(4000);
    v_count NUMBER;
BEGIN
    -- Verifica si existen recetas para el paciente
SELECT COUNT(*) INTO v_count FROM Receta WHERE ID_Paciente = p_id_paciente;

IF v_count > 0 THEN
        v_sql_delete := 'DELETE FROM Receta WHERE ID_Paciente = :id_paciente';
EXECUTE IMMEDIATE v_sql_delete USING p_id_paciente;
DBMS_OUTPUT.PUT_LINE('Recetas del paciente eliminadas correctamente.');
ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontraron recetas para el paciente.');
END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar las recetas del paciente: ' || SQLERRM);
END;
---------------------------------------------------------------------------------------

-- Procedimiento Almacenado con SQL Dinámico para Insertar un Nuevo Hospital
CREATE OR REPLACE PROCEDURE insertar_hospital(
    p_id_hospital IN NUMBER,
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_telefono IN NUMBER
) IS
    v_sql_insert VARCHAR2(4000);
    v_count NUMBER;
BEGIN
    -- Verifica si el hospital ya existe
SELECT COUNT(*) INTO v_count FROM Hospital WHERE ID_Hospital = p_id_hospital;

IF v_count = 0 THEN
        v_sql_insert := 'INSERT INTO Hospital (ID_Hospital, Nombre_Hospital, Direccion_Hospital, Telefono_Hospital) VALUES (:id, :nombre, :direccion, :telefono)';
EXECUTE IMMEDIATE v_sql_insert USING p_id_hospital, p_nombre, p_direccion, p_telefono;
DBMS_OUTPUT.PUT_LINE('Hospital insertado correctamente.');
ELSE
        DBMS_OUTPUT.PUT_LINE('El Hospital ya existe.');
END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar el hospital: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------

-- Procedimiento Almacenado con SQL Dinámico para Obtener Doctores por Departamento
CREATE OR REPLACE PROCEDURE obtener_doctores_por_departamento(p_id_departamento IN NUMBER) IS
    v_sql_query VARCHAR2(4000);
    v_cursor SYS_REFCURSOR;
    v_nombre_doctor Doctor.Nombre_Doctor%TYPE;
    v_especializacion Doctor.Especializacion%TYPE;
BEGIN
    v_sql_query := 'SELECT Nombre_Doctor, Especializacion FROM Doctor WHERE ID_Departamento = :id_departamento';

OPEN v_cursor FOR v_sql_query USING p_id_departamento;

LOOP
FETCH v_cursor INTO v_nombre_doctor, v_especializacion;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Doctor: ' || v_nombre_doctor || ', Especialización: ' || v_especializacion);
END LOOP;

CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener doctores por departamento: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------
-- Procedimiento para Obtener Recetas por Fecha
CREATE OR REPLACE PROCEDURE obtener_recetas_por_fecha(p_fecha IN DATE) IS
    v_sql_query VARCHAR2(4000);
    v_cursor SYS_REFCURSOR;
    v_id_receta Receta.ID_Receta%TYPE;
    v_nombre_medicina Receta.Nombre_Medicina%TYPE;
BEGIN
    v_sql_query := 'SELECT ID_Receta, Nombre_Medicina FROM Receta WHERE Fecha_Receta = :fecha';

OPEN v_cursor FOR v_sql_query USING p_fecha;

LOOP
FETCH v_cursor INTO v_id_receta, v_nombre_medicina;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Receta: ' || v_id_receta || ', Medicina: ' || v_nombre_medicina);
END LOOP;

CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener recetas por fecha: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------
-- Procedimiento para Actualizar la Dirección de un Paciente
CREATE OR REPLACE PROCEDURE actualizar_direccion_paciente(
    p_id_paciente IN NUMBER,
    p_direccion IN VARCHAR2
) IS
    v_sql_update VARCHAR2(4000);
BEGIN
    v_sql_update := 'UPDATE Paciente SET Direccion_Paciente = :direccion WHERE ID_Paciente = :id';

EXECUTE IMMEDIATE v_sql_update USING p_direccion, p_id_paciente;

DBMS_OUTPUT.PUT_LINE('Dirección del paciente actualizada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar la dirección del paciente: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------
-- Procedimiento para Eliminar un Doctor
CREATE OR REPLACE PROCEDURE eliminar_doctor(p_id_doctor IN NUMBER) IS
    v_sql_delete VARCHAR2(4000);
BEGIN
    v_sql_delete := 'DELETE FROM Doctor WHERE ID_Doctor = :id';

EXECUTE IMMEDIATE v_sql_delete USING p_id_doctor;

DBMS_OUTPUT.PUT_LINE('Doctor eliminado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el doctor: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------
-- Procedimiento para Insertar un Nuevo Paciente
CREATE OR REPLACE PROCEDURE insertar_paciente(
    p_id_paciente IN NUMBER,
    p_nombre IN VARCHAR2,
    p_pri_apellido IN VARCHAR2,
    p_seg_apellido IN VARCHAR2,
    p_numero IN NUMBER,
    p_direccion IN VARCHAR2,
    p_correo IN VARCHAR2
) IS
    v_sql_insert VARCHAR2(4000);
BEGIN
    v_sql_insert := 'INSERT INTO Paciente (ID_Paciente, Nombre_Paciente, PriApellido_Paciente, SegApellido_Paciente, Numero_Paciente, Direccion_Paciente, Correo_Paciente) ' ||
                    'VALUES (:id, :nombre, :pri_apellido, :seg_apellido, :numero, :direccion, :correo)';

EXECUTE IMMEDIATE v_sql_insert USING p_id_paciente, p_nombre, p_pri_apellido, p_seg_apellido, p_numero, p_direccion, p_correo;

DBMS_OUTPUT.PUT_LINE('Paciente insertado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar el paciente: ' || SQLERRM);
END;

---------------------------------------------------------------------------------------
-- Procedimiento para Actualizar el Número de Teléfono de un Hospital
CREATE OR REPLACE PROCEDURE actualizar_telefono_hospital(
    p_id_hospital IN NUMBER,
    p_telefono IN NUMBER
) IS
    v_sql_update VARCHAR2(4000);
BEGIN
    v_sql_update := 'UPDATE Hospital SET Telefono_Hospital = :telefono WHERE ID_Hospital = :id';

EXECUTE IMMEDIATE v_sql_update USING p_telefono, p_id_hospital;

DBMS_OUTPUT.PUT_LINE('Teléfono del hospital actualizado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el teléfono del hospital: ' || SQLERRM);
END;



