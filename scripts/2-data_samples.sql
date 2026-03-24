USE Gestion_Red_de_Fibra_Optica;

-- Limpiar la tabla para evitar duplicados
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Puertos_PON;
TRUNCATE TABLE OLT;
SET FOREIGN_KEY_CHECKS = 1;

-- Insertar datos en la tabla OLT

INSERT INTO OLT (nombre_nodo,marca,ip_gestion,fecha_de_instalacion) VALUES
('NODO_CENTRO_LIMA_01','Huawei','10.20.30.1','2024-05-15'),
('NODO_SUR_CHORRILOS_02','ZTE','10.20.40.1','2024-08-20'),
('NODO_ESTE_ATE_03','Huawei','10.20.50.1','2025-01-10');

-- Insertar datos en la tabla de Puertos_PON

INSERT INTO Puertos_PON(id_olt,numero_puerto,capacidad_Gbps) VALUES
(1,1,2.50),
(1,2,2.50),
(1,3,10.00),
(2,1,2.50),
(2,2,2.50);
