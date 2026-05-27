-- TRABAJO BASE DE DATOS: BDventas
-- Alumno: Benito

-- ==========================================
-- 5 CONSULTAS BÁSICAS
-- ==========================================
-- 1. Ver todos los datos de los clientes
SELECT * FROM clientes;

-- 2. Ver todos los datos de los comerciales
SELECT * FROM comercial;

-- 3. Ver todos los registros de auditoría
SELECT * FROM auditoria;

-- 4. Ver solo los nombres y ciudades de los clientes
SELECT nombre, ciudad FROM clientes;

-- 5. Ver solo los nombres y la comisión que se llevan los comerciales
SELECT nombre, comision FROM comercial;


-- ==========================================
-- 5 CONSULTAS CON CONDICIONES (WHERE)
-- ==========================================
-- 6. Ver clientes que son de una ciudad específica (ejemplo: Madrid)
SELECT * FROM clientes WHERE ciudad = 'Madrid';

-- 7. Ver comerciales que tienen una comisión superior al 10% (0.10)
SELECT * FROM comercial WHERE comision > 0.10;

-- 8. Ver clientes que tienen asignado un comercial en concreto (ejemplo: el ID 1)
SELECT * FROM clientes WHERE id_comercial = 1;

-- 9. Ver los registros de auditoría a partir del año 2026
SELECT * FROM auditoria WHERE fecha >= '2026-01-01';

-- 10. Ver clientes que tienen una categoría específica (ejemplo: categoría 100)
SELECT * FROM clientes WHERE categoria = 100;


-- ==========================================
-- 3 CONSULTAS CON JOIN
-- ==========================================
-- 11. Ver el nombre del cliente junto con el nombre del comercial que le atiende
SELECT c.nombre AS nombre_cliente, com.nombre AS nombre_comercial 
FROM clientes c 
JOIN comercial com ON c.id_comercial = com.id;

-- 12. Ver los clientes atendidos por comerciales que tienen comisiones altas
SELECT c.nombre, c.ciudad, com.comision 
FROM clientes c 
JOIN comercial com ON c.id_comercial = com.id 
WHERE com.comision > 0.12;

-- 13. Ver clientes que viven en la misma ciudad que su comercial asignado
SELECT c.nombre AS cliente, com.nombre AS comercial, c.ciudad 
FROM clientes c 
JOIN comercial com ON c.id_comercial = com.id 
WHERE c.ciudad = com.ciudad;


-- ==========================================
-- 2 CONSULTAS COMPLEJAS (Libre)
-- ==========================================
-- 14. Mostrar cuántos clientes atiende cada comercial (Agrupación / COUNT)
SELECT id_comercial, COUNT(*) AS numero_de_clientes 
FROM clientes 
GROUP BY id_comercial;

-- 15. Mostrar los datos del comercial que tiene la comisión más alta de la empresa (Subconsulta)
SELECT * FROM comercial 
WHERE comision = (SELECT MAX(comision) FROM comercial);
