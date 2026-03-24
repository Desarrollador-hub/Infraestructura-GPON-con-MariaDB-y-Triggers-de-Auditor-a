-- CONFIGURACION DE SEGURIDAD Y PRIVILEGIOS
-- Objetivo: Crear un usuario operador con privilegios restringidos
USE Gestion_Red_de_Fibra_Optica;

-- Crear el usuario operador

CREATE USER IF NOT EXISTS 'operador_red'@'localhost' IDENTIFIED BY 'clave.red.2026';
-- Otorgar privilegios especificos de lectura e insercion
GRANT SELECT, INSERT ON Gestion_Red_de_Fibra_Optica.* TO 'operador_red'@'localhost';
-- Aplicar los cambios en la tabla de privilegios inmediatamente
FLUSH PRIVILEGES;
