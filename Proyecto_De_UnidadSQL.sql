create database Empresa_ControBel;
use Empresa_Controbel;

CREATE TABLE Usuario_Empleado (
    id_Usuario_Empleado INT PRIMARY KEY,
    Nombre_Usuario VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    Puesto_Empresa ENUM('Empleado', 'Empresa', 'Admin') NOT NULL
);

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto ENUM('Personal Administrativo', 'Personal de Recursos Humanos', 'Ingeniero Nivel 1', 'Ingeniero Nivel 2', 'Ingeniero Nivel 3') NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_Usuario_Empleado INT,
    FOREIGN KEY (id_Usuario_Empleado) REFERENCES Usuario_Empleado(id_Usuario_Empleado)
);

CREATE TABLE Empresas (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    seguridad VARCHAR(255)
);

CREATE TABLE Proyectos (
    id_proyecto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_empresa INT,
    descripcion TEXT,
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE Facturas (
    id_factura INT PRIMARY KEY,
    id_empresa INT,
    monto NUMERIC NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    producto_servicio VARCHAR(255)
);

CREATE TABLE Pagos_Proveedores (
    id_pago INT PRIMARY KEY,
    id_proveedor INT,
    id_factura INT,
    monto NUMERIC NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura)
);

CREATE TABLE Empleados_Proyectos (
    id_empleado INT,
    id_proyecto INT,
    PRIMARY KEY (id_empleado, id_proyecto),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);


CREATE TABLE Facturas_Empleados (
    id_factura INT,
    id_empleado INT,
    PRIMARY KEY (id_factura, id_empleado),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);


INSERT INTO Usuario_Empleado VALUES 
(1, 'Julio6469_2', 'DomingosDeRelax2', 'Empleado'),
(2, 'Alverto6570_3', 'MiSalarioAlto', 'Empleado'),
(3, 'Mario6671_4', 'MiSalarioBajo', 'Empleado'),
(4, 'Gabriel6772_5', 'MiguelAlArco', 'Admin');

INSERT INTO Empleados VALUES
(1, 'Julio', 'Ingeniero de Nivel 1', 10000, 4),
(2, 'Mario', 'Personal Administrativo', 5000, 3),
(3, 'Alverto', 'Ingeniero Nivel 3', 20000, 2),
(4, 'Gabriel', 'Ingeniero de Nivel 2', 15000, 1);

INSERT INTO Empresas VALUE
(1, 'El Caballo Rojo', 'Alta'),
(2, 'Cruz Roja', 'Media Alta'),
(3, 'El Cafe de La Merced', 'Media'),
(4, 'El Infantes', 'Muy Baja');

 INSERT INTO Proyectos VALUE
(1, 'Mejoramiento', 3, 'Se mantiene un mantenimiento de cada 3 meses en la empresa'),
(2, 'AutoSuperación', 4, 'Se mantiene un  mantenimiento de cada 6 casi 7 meses, preocupante'),
(3, 'Avances Notorios', 2, 'Se mantiene un mantenimiento constante de cada un mes y medio a dos meses, puede mejorar'),
(4, 'Constancia', 1, 'Se mantiene un mantenimiento de cada un mes, puede mantenerse en esa área pero puede mejorar');
   
INSERT INTO Facturas VALUE
(2, 2, 15000, '2022-06-15'),
(4, 4, 6500, '2020-09-29'),
(1, 1, 22000, '2017-03-22'),
(3, 3, 10000, '2021-11-26');
    
INSERT INTO Proveedores VALUE
(1, 'Julio', 'Sistema Operativo de Gestion Financiero'),
(2, 'Mario', 'Computadora de Alta Gama'),
(3, 'Alverto', 'Base de Datos Avanzada con alta Seguridad'),
(4, 'Gabriel', 'Base de Datos de Seguridad media');
  
INSERT INTO Pagos_Proveedores VALUE
(5, 1, 1, 12000, '2024-03-26'),
(6, 2, 2, 7000, '2022-05-14'),
(7, 3, 3, 33500, '2025-02-28'),
(8, 4, 4, 22000, '2023-06-05');

INSERT INTO Empleados_Proyectos VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO Facturas_Empleados VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

SELECT * FROM Facturas WHERE monto = 22000;

SELECT * FROM Pagos_Proveedores WHERE fecha = '2022-05-14';

SELECT id_proyecto, nombre, descripcion FROM Proyectos WHERE id_proyecto = 1;

SELECT Nombre_Usuario, password, Puesto_Empresa FROM Usuario_Empleado WHERE id_Usuario_Empleado = 1;