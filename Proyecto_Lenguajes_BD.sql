/*Proyecto Final Lenguajes de Base de Datos */

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