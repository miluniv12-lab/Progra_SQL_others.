-- ============================================
-- PROYECTO FINAL
-- SISTEMA DE GESTIÓN DE REPARACIONES TECNOLÓGICAS
-- ============================================



USE ReparacionesTecnologicas;
GO
CREATE TABLE Usuarios
(
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Correo VARCHAR(100) UNIQUE,
    Direccion VARCHAR(150)
);
CREATE TABLE Equipos
(
    IdEquipo INT PRIMARY KEY IDENTITY(1,1),
    IdUsuario INT NOT NULL,
    TipoEquipo VARCHAR(30),
    Marca VARCHAR(30),
    Modelo VARCHAR(30),
    NumeroSerie VARCHAR(50),
    FechaIngreso DATE,
    Estado VARCHAR(30),

    CONSTRAINT FK_Equipo_Usuario
    FOREIGN KEY(IdUsuario)
    REFERENCES Usuarios(IdUsuario)
);
CREATE TABLE Tecnicos
(
    IdTecnico INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Especialidad VARCHAR(50),
    Telefono VARCHAR(15),
    Correo VARCHAR(100)
);
CREATE TABLE Reparaciones
(
    IdReparacion INT PRIMARY KEY IDENTITY(1,1),
    IdEquipo INT NOT NULL,
    FechaRecepcion DATE,
    ProblemaReportado VARCHAR(200),
    Diagnostico VARCHAR(200),
    Estado VARCHAR(30),

    CONSTRAINT FK_Reparacion_Equipo
    FOREIGN KEY(IdEquipo)
    REFERENCES Equipos(IdEquipo)
);
CREATE TABLE Asignaciones
(
    IdAsignacion INT PRIMARY KEY IDENTITY(1,1),
    IdReparacion INT NOT NULL,
    IdTecnico INT NOT NULL,
    FechaAsignacion DATE,

    CONSTRAINT FK_Asignacion_Reparacion
    FOREIGN KEY(IdReparacion)
    REFERENCES Reparaciones(IdReparacion),

    CONSTRAINT FK_Asignacion_Tecnico
    FOREIGN KEY(IdTecnico)
    REFERENCES Tecnicos(IdTecnico)
);
CREATE TABLE DetallesReparacion
(
    IdDetalle INT PRIMARY KEY IDENTITY(1,1),
    IdReparacion INT NOT NULL,
    DescripcionTrabajo VARCHAR(250),
    RepuestoUtilizado VARCHAR(100),
    Costo DECIMAL(10,2),

    CONSTRAINT FK_Detalle_Reparacion
    FOREIGN KEY(IdReparacion)
    REFERENCES Reparaciones(IdReparacion)
);
