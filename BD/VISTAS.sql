-- Vistas
-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #1
-- Esta vista muestra los productos junto con sus categorías y estados.
CREATE OR REPLACE VIEW FIDE_PRODUCTOS_CATEGORIA_ESTADO_V AS
SELECT 
  P.v_id_producto, 
  P.v_nombre_producto, 
  P.v_descripcion_producto, 
  P.v_precio, 
  C.v_nombre_categoria, 
  E.v_descripcion AS estado
FROM 
  FIDE_PRODUCTOS_TB P
  JOIN FIDE_CATEGORIAS_TB C ON P.v_id_categoria = C.v_id_categoria
  JOIN FIDE_ESTADOS_TB E ON P.v_id_estado = E.v_id_estado;
  
SELECT * FROM FIDE_PRODUCTOS_CATEGORIA_ESTADO_V;

--CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #2
-- Esta vista muestra los detalles de los clientes.
CREATE OR REPLACE VIEW FIDE_DETALLES_CLIENTES_V AS
SELECT 
  v_id_cliente, 
  v_nombre_cliente, 
  v_apellido_cliente, 
  v_email, 
  v_telefono, 
  v_direccion, 
  v_imagen,    
  v_rol
FROM 
  FIDE_CLIENTES_TB;


SELECT * FROM FIDE_DETALLES_CLIENTES_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #3
-- Esta vista muestra las ventas con los detalles del cliente y el empleado que realizó la venta.
CREATE OR REPLACE VIEW FIDE_VENTAS_DETALLES_V AS
SELECT 
  V.v_id_venta, 
  C.v_nombre_cliente || ' ' || C.v_apellido_cliente AS nombre_cliente, 
  E.v_nombre_empleado || ' ' || E.v_apellido_empleado AS nombre_empleado, 
  V.v_fecha, 
  V.v_total, 
  ES.v_descripcion AS estado
FROM 
  FIDE_VENTA_TB V
  JOIN FIDE_CLIENTES_TB C ON V.v_id_cliente = C.v_id_cliente
  JOIN FIDE_EMPLEADOS_TB E ON V.v_id_empleado = E.v_id_empleado
  JOIN FIDE_ESTADOS_TB ES ON V.v_id_estado = ES.v_id_estado;
  
SELECT * FROM FIDE_VENTAS_DETALLES_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #4
-- Esta vista muestra los proveedores junto con su estado.
CREATE OR REPLACE VIEW FIDE_PROVEEDORES_ESTADO_V AS
SELECT 
  v_id_proveedor, 
  v_nombre_proveedor, 
  v_contacto_proveedor, 
  v_email_proveedor, 
  v_telefono_proveedor, 
  v_direccion_proveedor, 
  E.v_descripcion AS estado
FROM 
  FIDE_PROVEEDORES_TB P
  JOIN FIDE_ESTADOS_TB E ON P.v_id_estado = E.v_id_estado;
  
SELECT * FROM FIDE_PROVEEDORES_ESTADO_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #5
-- Esta vista muestra los productos en los carritos de los clientes junto con sus estados.
CREATE OR REPLACE VIEW FIDE_PRODUCTOS_CARRITO_V AS
SELECT 
  C.v_id_carrito, 
  CL.v_nombre_cliente || ' ' || CL.v_apellido_cliente AS nombre_cliente, 
  P.v_nombre_producto, 
  C.v_cantidad, 
  C.v_precio_unitario, 
  C.v_subtotal, 
  ES.v_descripcion AS estado
FROM 
  FIDE_CARRITO_TB C
  JOIN FIDE_CLIENTES_TB CL ON C.v_id_cliente = CL.v_id_cliente
  JOIN FIDE_PRODUCTOS_TB P ON C.v_id_producto = P.v_id_producto
  JOIN FIDE_ESTADOS_TB ES ON C.v_id_estado = ES.v_id_estado;
  
SELECT * FROM FIDE_PRODUCTOS_CARRITO_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #6
-- Esta vista muestra los detalles de las compras realizadas a proveedores.
CREATE OR REPLACE VIEW FIDE_DETALLES_COMPRAS_V AS
SELECT 
  CO.v_id_compra, 
  P.v_nombre_proveedor, 
  CO.v_detalles, 
  CO.v_fecha, 
  CO.v_total, 
  ES.v_descripcion AS estado
FROM 
  FIDE_COMPRAS_TB CO
  JOIN FIDE_PROVEEDORES_TB P ON CO.v_id_proveedor = P.v_id_proveedor
  JOIN FIDE_ESTADOS_TB ES ON CO.v_id_estado = ES.v_id_estado;
 
SELECT * FROM FIDE_DETALLES_COMPRAS_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #7
-- Esta vista muestra los detalles de reabastecimiento de stock de productos.
CREATE OR REPLACE VIEW FIDE_DETALLES_REABASTECIMIENTO_V AS
SELECT 
  R.v_id_reabastecimiento, 
  P.v_nombre_producto, 
  R.v_cantidad, 
  R.v_fecha, 
  R.v_estado, 
  ES.v_descripcion AS estado
FROM 
  FIDE_REABASTECIMIENTO_STOCK_TB R
  JOIN FIDE_PRODUCTOS_TB P ON R.v_id_producto = P.v_id_producto
  JOIN FIDE_ESTADOS_TB ES ON R.v_id_estado = ES.v_id_estado;
 
SELECT * FROM FIDE_DETALLES_REABASTECIMIENTO_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #8
-- Esta vista muestra los detalles de las reclamaciones de clientes.
CREATE OR REPLACE VIEW FIDE_DETALLES_RECLAMACIONES_V AS
SELECT 
  R.v_id_reclamacion, 
  C.v_nombre_cliente || ' ' || C.v_apellido_cliente AS nombre_cliente, 
  R.v_fecha, 
  ES.v_descripcion AS estado
FROM 
  FIDE_RECLAMACIONES_TB R
  JOIN FIDE_CLIENTES_TB C ON R.v_id_cliente = C.v_id_cliente
  JOIN FIDE_ESTADOS_TB ES ON R.v_id_estado = ES.v_id_estado;
 
SELECT * FROM FIDE_DETALLES_RECLAMACIONES_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #9
-- Esta vista muestra las promociones activas.
CREATE OR REPLACE VIEW FIDE_PROMOCIONES_ACTIVAS_V AS
SELECT 
  P.v_id_promocion, 
  P.v_nombre_promocion, 
  P.v_descripcion_promocion, 
  P.v_fecha_inicio, 
  P.v_fecha_fin, 
  P.v_descuento, 
  ES.v_descripcion AS estado
FROM 
  FIDE_PROMOCIONES_TB P
  JOIN FIDE_ESTADOS_TB ES ON P.v_id_estado = ES.v_id_estado
WHERE 
  ES.v_descripcion = 'Activo';
  
SELECT * FROM FIDE_PROMOCIONES_ACTIVAS_V;

-- CREADO POR MARIA Celeste SOLANO HIDALGO
-- FECHA 20/07/2024
-- Vista #10
-- Esta vista muestra los productos junto con sus reseñas y calificaciones por parte de los clientes.
CREATE OR REPLACE VIEW FIDE_PRODUCTOS_RESEÑAS_V AS
SELECT 
  P.v_id_producto, 
  P.v_nombre_producto, 
  R.v_calificacion, 
  R.v_comentario, 
  R.v_fecha, 
  C.v_nombre_cliente || ' ' || C.v_apellido_cliente AS nombre_cliente
FROM 
  FIDE_RESENAS_PRODUCTO_TB R
  JOIN FIDE_PRODUCTOS_TB P ON R.v_id_producto = P.v_id_producto
  JOIN FIDE_CLIENTES_TB C ON R.v_id_cliente = C.v_id_cliente;
  
SELECT * FROM FIDE_PRODUCTOS_RESEÑAS_V;


-- CREADO POR Nicole HIDALGO
-- FECHA 27/07/2024
-- Vista #11
-- Esta vista muestra las promociones activas si  id.
CREATE OR REPLACE VIEW FIDE_PROMOCIONES_ACTIVAS_SIN_ID_V AS
SELECT 
  PE.v_nombre_promocion, 
  PE.v_descripcion_promocion, 
  PE.v_fecha_inicio, 
  PE.v_fecha_fin, 
  PE.v_descuento
FROM 
  FIDE_PROMOCIONES_TB PE
  JOIN FIDE_ESTADOS_TB EST ON Pe.v_id_estado = EST.v_id_estado
WHERE 
  EST.v_descripcion = 'Activo';
  
SELECT * FROM FIDE_PROMOCIONES_ACTIVAS_SIN_ID_V;

-- CREADO POR Nicole HIDALGO
-- FECHA 27/07/2024
-- Vista #12
-- Esta vista muestra las reseñas activas sin  id.
CREATE OR REPLACE VIEW FIDE_PRODUCTOS_RESENAS_SI_ID_V AS
SELECT 
  P.v_nombre_producto, 
  R.v_calificacion, 
  R.v_comentario, 
  R.v_fecha, 
  C.v_nombre_cliente || ' ' || C.v_apellido_cliente AS nombre_cliente
FROM 
  FIDE_RESENAS_PRODUCTO_TB R
  JOIN FIDE_PRODUCTOS_TB P ON R.v_id_producto = P.v_id_producto
  JOIN FIDE_CLIENTES_TB C ON R.v_id_cliente = C.v_id_cliente;
  
SELECT * FROM FIDE_PRODUCTOS_RESENAS_SI_ID_V;

--CREADO POR Nicole HIDALGO
--FECHA 27/07/2024
--Vista #13
--Esta vista muestra las reseñas activas sin  id.
CREATE OR REPLACE VIEW FIDE_PRODUCTOS_CARRITO_RESIVO_V AS
SELECT 
  CL.v_nombre_cliente || ' ' || CL.v_apellido_cliente AS nombre_cliente, 
  P.v_nombre_producto, 
  C.v_cantidad, 
  C.v_precio_unitario, 
  C.v_subtotal, 
  ES.v_descripcion AS estado
FROM 
  FIDE_CARRITO_TB C
  JOIN FIDE_CLIENTES_TB CL ON C.v_id_cliente = CL.v_id_cliente
  JOIN FIDE_PRODUCTOS_TB P ON C.v_id_producto = P.v_id_producto
  JOIN FIDE_ESTADOS_TB ES ON C.v_id_estado = ES.v_id_estado;
  
SELECT * FROM FIDE_PRODUCTOS_CARRITO_RESIVO_V;

--CREADO POR Nicole HIDALGO
--FECHA 30/07/2024
--Vista #14
--Esta vista muestra los detalles de venta
CREATE OR REPLACE VIEW FIDE_DETALLES_PROMOCIONES_V AS
SELECT 
  P.v_nombre_promocion, 
  P.v_descripcion_promocion, 
  P.v_fecha_inicio, 
  P.v_fecha_fin, 
  P.v_descuento, 
  ES.v_descripcion AS estado
FROM FIDE_PROMOCIONES_TB P
  JOIN FIDE_ESTADOS_TB ES ON P.v_id_estado = ES.v_id_estado;
 
SELECT * FROM FIDE_DETALLES_PROMOCIONES_V;

--CREADO POR Nicole HIDALGO
--FECHA 30/07/2024
--Vista #15
CREATE OR REPLACE VIEW FIDE_SELECT_CATEGORIAS_V AS
SELECT 
  P.V_NOMBRE_CATEGORIA,
  P.V_ID_CATEGORIA
FROM FIDE_CATEGORIAS_TB P;

SELECT * FROM FIDE_SELECT_CATEGORIAS_V;

--CREADO POR Nicole HIDALGO
--FECHA 30/07/2024
--Vista #16
-- Esta vista muestra los detalles de los empleados.
CREATE OR REPLACE VIEW FIDE_DETALLES_EMPLEADOS_V AS
SELECT 
  v_id_empleado, 
  v_nombre_empleado, 
  v_apellido_empleado, 
  v_email, 
  v_telefono, 
  v_direccion, 
  V_imagen
FROM 
  FIDE_EMPLEADOS_TB;
  
SELECT * FROM FIDE_DETALLES_EMPLEADOS_V;


