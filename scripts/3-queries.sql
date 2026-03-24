USE Gestion_Red_de_Fibra_Optica;
-- Consulta 1: Informe detallado de Red
-- Muestra que puertos pertenecen a que OLT y su marca.

SELECT
   olt.nombre_nodo AS 'Nodo',
   olt.marca AS 'Fabricante',
   p.numero_puerto AS 'Puerto_Fisico',
   p.capacidad_Gbps AS 'Velocidad_Gbps'
FROM OLT AS olt
JOIN Puertos_PON AS p ON olt.id_olt = p.id_olt
ORDER BY olt.nombre_nodo ASC;

-- Consulta 2: Revision de Auditoria
-- Permite ver quién ha realizado cambios en la infraestructura
SELECT * FROM Auditoria_Cambios ORDER BY fecha_evento DESC; 
