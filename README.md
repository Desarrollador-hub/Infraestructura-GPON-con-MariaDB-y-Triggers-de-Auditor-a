# Gestión de Infraestructura GPON con MariaDB y Auditoría Automatizada

## 1. Descripción del Proyecto
Este repositorio contiene el diseño e implementación de una base de datos relacional orientada a la administración de elementos de red pasiva (GPON). El sistema permite gestionar nodos OLT de diversos fabricantes (Huawei, ZTE), supervisar la capacidad de los puertos PON y auditar automáticamente cualquier cambio estructural mediante disparadores (triggers).

## 2. Características Técnicas
- **Entorno de Despliegue:** Debian 13 / MariaDB 11.
- **Automatización:** Triggers para el registro de eventos en tiempo real.
- **Seguridad:** Implementación de privilegios granulares (RBAC) para el perfil `operador_red`.
- **Escalabilidad:** Soporte para arquitecturas multi-fabricante y nodos distribuidos geográficamente.

## 3. Estructura del Repositorio
- `scripts/01_schema_init.sql`: Definición de tablas y triggers.
- `scripts/02_security_config.sql`: Configuración de usuarios y permisos.
- `scripts/03_data_seed.sql`: Carga de datos realistas (Nodos Lima Centro, Sur, Este).
- `scripts/04_queries_reports.sql`: Reportes de inventario y capacidad de red.

## 4. Guía de Despliegue
Para replicar esta infraestructura, ejecute la siguiente secuencia en su terminal de MariaDB:
```bash
sudo mariadb < scripts/01_schema_init.sql
sudo mariadb < scripts/02_security_config.sql
sudo mariadb < scripts/03_data_seed.sql
```

## 5. Validación de Seguridad
El sistema ha sido testeado bajo el usuario `operador_red`, verificando la restricción de comandos `DROP` y la correcta inserción de datos auditados.

## 6. Protocolos de Validación y Control de Errores
Para garantizar la alta disponibilidad y seguridad de la infraestructura GPON, se documentan las siguientes pruebas de estrés:

![Error de Seguridad](pruebas/Seguridad_denegada.png)
### 6.1. Validación de Seguridad (RBAC)
Se intentó la eliminación de tablas críticas con el usuario `operador_red`. El sistema aplicó correctamente la restricción de privilegios.

**Prueba:** `DROP TABLE OLT;`  
**Resultado:** `ERROR 1142 (42000): DROP command denied`
### 6.2. Integridad de Datos e IPs
Se validó la restricción de unicidad para evitar duplicidad de IPs de gestión en los nodos Huawei/ZTE.
**Resultado:** `ERROR 1062 (23000): Duplicate entry`
### 6.3. Auditoría de Eventos
Cada inserción genera un registro automático en la tabla de logs, asegurando la trazabilidad de la red.
