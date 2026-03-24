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
