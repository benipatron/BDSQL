# Informe de Base de Datos

## 1. Descripción general
Esta base de datos, denominada `bdventas`, está diseñada para gestionar la información comercial básica de una empresa. Su objetivo principal es almacenar los datos de los clientes, la información de los comerciales encargados de atenderlos y llevar un registro de control mediante una tabla de auditoría.

## 2. Estructura
La base de datos cuenta con la siguiente estructura:
- **Tablas:** Está compuesta por tres tablas principales: `clientes`, `comercial` y `auditoria`.
- **Relaciones:** Lógicamente, existe una conexión entre un cliente y el comercial que lo atiende (mediante el campo `id_comercial` en la tabla de clientes). Sin embargo, a nivel técnico, la base de datos no tiene definidas las relaciones formales (Claves Foráneas / Foreign Keys), por lo que las tablas actúan de manera independiente.

## 3. Análisis
- **Qué está bien diseñado:** La estructura es muy simple y directa, ideal para realizar registros rápidos. La inclusión de una tabla de `auditoria` es un buen punto a favor para mantener la trazabilidad de los movimientos de la empresa.
- **Qué no está claro:** Teniendo en cuenta que la base de datos se llama "bdventas", no queda claro cómo se registra la actividad económica real, ya que no existen tablas para gestionar productos, stock, ni las facturas o pedidos de los clientes.

## 4. Problemas detectados
- **Errores:** El principal problema técnico es la ausencia de restricciones de integridad referencial (no hay relaciones). Esto significa que se podría borrar un comercial que actualmente tiene clientes asignados, dejando datos huérfanos.
- **Cosas mejorables:** Los campos son bastante limitados. Se podrían añadir más detalles de contacto en la tabla de clientes (como teléfono o email) para que sea funcional en un entorno real.

## 5. Propuestas de mejora
Para que esta base de datos sea un sistema de ventas completo y robusto, propongo las siguientes mejoras:
- **Nuevas tablas:** Crear una tabla `productos` (para el catálogo) y una tabla `ventas` (o `pedidos`) que conecte a los clientes con los productos que compran.
- **Mejora de relaciones:** Establecer formalmente la Foreign Key entre `clientes.id_comercial` y `comercial.id` para garantizar la integridad de los datos.
- **Cambios en campos:** Añadir campos de contacto estandarizados y fechas de alta tanto para clientes como para comerciales.

## 6. Conclusión personal
El análisis de `bdventas` me ha servido para comprender que el diseño lógico de una base de datos debe ir siempre acompañado de una implementación técnica estricta (mediante Foreign Keys) para evitar inconsistencias. Es un modelo inicial excelente para practicar consultas simples, pero requeriría un proceso de normalización y expansión para poder sostener la lógica de negocio de una empresa real.
