CREATE DATABASE IF NOT EXISTS Gestion_Red_de_Fibra_Optica CHARACTER SET utf8mb4;
USE Gestion_Red_de_Fibra_Optica;

DROP TABLE IF EXISTS Auditoria_Cambios;
DROP TABLE IF EXISTS Puertos_PON;
DROP TABLE IF EXISTS OLT;

CREATE TABLE OLT(
    id_olt INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nodo VARCHAR(100) NOT NULL,
    marca ENUM('Huawei','ZTE','Nokia') NOT NULL,
    ip_gestion VARCHAR(15) UNIQUE NOT NULL,
    fecha_de_instalacion DATE DEFAULT (CURRENT_DATE)
)ENGINE=InnoDB;

CREATE TABLE Puertos_PON(
    id_puerto INT AUTO_INCREMENT PRIMARY KEY,
    id_olt INT,
    numero_puerto TINYINT CHECK (numero_puerto BETWEEN 1 AND 16),
    capacidad_Gbps DECIMAL(4,2) DEFAULT 2.50,
    FOREIGN KEY (id_olt) REFERENCES OLT(id_olt) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Auditoria_Cambios(
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    usuario VARCHAR(50),
    fecha_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER despues_insertar_olt
AFTER INSERT ON OLT
FOR EACH ROW
BEGIN
   INSERT INTO Auditoria_Cambios (mensaje, usuario)
   VALUES (CONCAT('Nueva OLT registrada: ',NEW.nombre_nodo),USER());
END;
//

DELIMITER ;

