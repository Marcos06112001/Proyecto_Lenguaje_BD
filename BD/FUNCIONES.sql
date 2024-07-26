--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #1 
--Función SelectCategoria
CREATE OR REPLACE FUNCTION FIDE_CATEGORIAS_SELECT_FN (
  P_id_categoria INT
) RETURN VARCHAR2 IS
  V_nombre_categoria VARCHAR2(50);
BEGIN
  SELECT V_nombre_categoria INTO V_nombre_categoria 
  FROM FIDE_CATEGORIAS_TB 
  WHERE V_id_categoria = P_id_categoria;
  RETURN V_nombre_categoria;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

--Para seleccionar la categoría con un id específico
SELECT FIDE_CATEGORIAS_SELECT_FN(1) AS nombre_categoria FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #2
--Función para obtener nombre del estado
CREATE OR REPLACE FUNCTION FIDE_ESTADOS_SELECT_FN (
  P_id_estado INT
) RETURN VARCHAR2 IS
  V_descripcion VARCHAR2(50);
BEGIN
  SELECT V_descripcion INTO V_descripcion
  FROM FIDE_ESTADOS_TB
  WHERE V_id_estado = P_id_estado;
  RETURN V_descripcion;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_ESTADOS_SELECT_FN(1) AS descripcion_estado FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #3 
--Función para obtener nombre del la categoria
CREATE OR REPLACE FUNCTION FIDE_CATEGORIAS_SELECT_FN (
  P_id_categoria INT
) RETURN VARCHAR2 IS
  V_nombre_categoria VARCHAR2(255);
BEGIN
  SELECT V_nombre_categoria INTO V_nombre_categoria
  FROM FIDE_CATEGORIAS_TB
  WHERE V_id_categoria = P_id_categoria;
  RETURN V_nombre_categoria;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_CATEGORIAS_SELECT_FN(2) AS nombre_categoria FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #4 
--Función para obtener nombre del producto
CREATE OR REPLACE FUNCTION FIDE_PRODUCTOS_SELECT_FN (
  P_id_producto INT
) RETURN VARCHAR2 IS
  V_nombre_producto VARCHAR2(255);
BEGIN
  SELECT V_nombre_producto INTO V_nombre_producto
  FROM FIDE_PRODUCTOS_TB
  WHERE V_id_producto = P_id_producto;
  RETURN V_nombre_producto;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_PRODUCTOS_SELECT_FN(3) AS nombre_producto FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #5 
--Función para obtener nombre del cliente
CREATE OR REPLACE FUNCTION FIDE_CLIENTES_SELECT_FN (
  P_id_cliente INT
) RETURN VARCHAR2 IS
  V_nombre_cliente VARCHAR2(255);
BEGIN
  SELECT V_nombre_cliente INTO V_nombre_cliente
  FROM FIDE_CLIENTES_TB
  WHERE V_id_cliente = P_id_cliente;
  RETURN V_nombre_cliente;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_CLIENTES_SELECT_FN(4) AS nombre_cliente FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #6
--Función para obtener nombre del empleado
CREATE OR REPLACE FUNCTION FIDE_EMPLEADOS_SELECT_FN (
  P_id_empleado INT
) RETURN VARCHAR2 IS
  V_nombre_empleado VARCHAR2(255);
BEGIN
  SELECT V_nombre_empleado INTO V_nombre_empleado
  FROM FIDE_EMPLEADOS_TB
  WHERE V_id_empleado = P_id_empleado;
  RETURN V_nombre_empleado;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_EMPLEADOS_SELECT_FN(5) AS nombre_empleado FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #6
--Función para obtener nombre del proveedor
CREATE OR REPLACE FUNCTION FIDE_PROVEEDORES_SELECT_FN (
  P_id_proveedor INT
) RETURN VARCHAR2 IS
  V_nombre_proveedor VARCHAR2(255);
BEGIN
  SELECT V_nombre_proveedor INTO V_nombre_proveedor
  FROM FIDE_PROVEEDORES_TB
  WHERE V_id_proveedor = P_id_proveedor;
  RETURN V_nombre_proveedor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_PROVEEDORES_SELECT_FN(6) AS nombre_proveedor FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #7
--Función para obtener detalles del carrito
CREATE OR REPLACE FUNCTION FIDE_CARRITO_SELECT_FN (
  P_id_carrito INT
) RETURN VARCHAR2 IS
  V_detalles VARCHAR2(255);
BEGIN
  SELECT V_id_producto || ', ' || V_cantidad || ', ' || V_precio_unitario INTO V_detalles
  FROM FIDE_CARRITO_TB
  WHERE V_id_carrito = P_id_carrito;
  RETURN V_detalles;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_CARRITO_SELECT_FN(7) AS detalles_carrito FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #8 
--Función para obtener el total de la venta
CREATE OR REPLACE FUNCTION FIDE_VENTA_TOTAL_SELECT_FN (
  P_id_venta INT
) RETURN NUMBER IS
  V_total NUMBER(10, 2);
BEGIN
  SELECT V_total INTO V_total
  FROM FIDE_VENTA_TB
  WHERE V_id_venta = P_id_venta;
  RETURN V_total;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN -1; -- Valor negativo para indicar error
END;

SELECT FIDE_VENTA_TOTAL_SELECT_FN(8) AS total_venta FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #9
--Función para obtener la descripcion de la venta
CREATE OR REPLACE FUNCTION FIDE_DETALLE_VENTA_SELECT_FN (
  P_id_detalle_venta INT
) RETURN VARCHAR2 IS
  V_detalle VARCHAR2(255);
BEGIN
  SELECT V_id_producto || ', ' || V_cantidad || ', ' || V_precio_unitario INTO V_detalle
  FROM FIDE_DETALLE_VENTA_TB
  WHERE V_id_detalle_venta = P_id_detalle_venta;
  RETURN V_detalle;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_DETALLE_VENTA_SELECT_FN(9) AS detalle_venta FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #10 
--Función para obtener la descripcion de la reclamación
CREATE OR REPLACE FUNCTION FIDE_RECLAMACIONES_SELECT_FN (
  P_id_reclamacion INT
) RETURN VARCHAR2 IS
  V_descripcion VARCHAR2(255);
BEGIN
  SELECT 'Reclamación del cliente ' || V_id_cliente || ' en ' || TO_CHAR(V_fecha, 'DD-MON-YYYY') INTO V_descripcion
  FROM FIDE_RECLAMACIONES_TB
  WHERE V_id_reclamacion = P_id_reclamacion;
  RETURN V_descripcion;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_RECLAMACIONES_SELECT_FN(10) AS descripcion_reclamacion FROM dual;

--CREADO POR Anderson Espinoza Ulate 
--FECHA 20/07/2024
--Función #11 
--Función para obtener la descripcion de la despripción
CREATE OR REPLACE FUNCTION FIDE_DESCRIPCION_SELECT_FN (
  P_id_descripcion INT
) RETURN VARCHAR2 IS
  V_descripcion VARCHAR2(255);
BEGIN
  SELECT V_descripcion INTO V_descripcion
  FROM FIDE_DESCRIPCION_TB
  WHERE V_id_descripcion = P_id_descripcion;
  RETURN V_descripcion;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_DESCRIPCION_SELECT_FN(1) AS descripcion FROM dual;

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--Función #12
--Función para obtener la categroia del motivo
CREATE OR REPLACE FUNCTION FIDE_MOTIVOS_CATEGORIA_SELECT_FN (
  P_id_motivo INT
) RETURN VARCHAR2 IS
  V_categoria VARCHAR2(255);
BEGIN
  SELECT V_categoria INTO V_categoria
  FROM FIDE_MOTIVOS_TB
  WHERE V_id_motivos = P_id_motivo;
  RETURN V_categoria;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_MOTIVOS_CATEGORIA_SELECT_FN(1) AS categoria_motivo FROM dual;

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--Función #12
--Función para obtener la promoción
CREATE OR REPLACE FUNCTION FIDE_PROMOCIONES_SELECT_FN (
  P_id_promocion INT
) RETURN VARCHAR2 IS
  V_nombre_promocion VARCHAR2(255);
BEGIN
  SELECT V_nombre_promocion INTO V_nombre_promocion
  FROM FIDE_PROMOCIONES_TB
  WHERE V_id_promocion = P_id_promocion;
  RETURN V_nombre_promocion;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_PROMOCIONES_SELECT_FN(1) AS nombre_promocion FROM dual;

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--Función #12
--Función para obtener la reseña del producto
CREATE OR REPLACE FUNCTION FIDE_RESENAS_PRODUCTO_SELECT_FN (
  P_id_resena_producto INT
) RETURN VARCHAR2 IS
  V_resena VARCHAR2(255);
BEGIN
  SELECT V_comentario || ' - Calificación: ' || V_calificacion INTO V_resena
  FROM FIDE_RESENAS_PRODUCTO_TB
  WHERE V_id_resena_producto = P_id_resena_producto;
  RETURN V_resena;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_RESENAS_PRODUCTO_SELECT_FN(1) AS resena_producto FROM dual;

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--Función #12
--Función para obtener detalle de la compra 
CREATE OR REPLACE FUNCTION FIDE_COMPRAS_SELECT_FN (
  P_id_compra INT
) RETURN VARCHAR2 IS
  V_detalles VARCHAR2(255);
BEGIN
  SELECT V_detalles INTO V_detalles
  FROM FIDE_COMPRAS_TB
  WHERE V_id_compra = P_id_compra;
  RETURN V_detalles;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

SELECT FIDE_COMPRAS_SELECT_FN(1) AS detalles_compra FROM dual;

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--Función #13
--Función para obtener el nombre del cliente por correo electrónico
CREATE OR REPLACE FUNCTION FIDE_CLIENTES_SELECT_BY_EMAIL_FN (
  P_email_cliente VARCHAR2
) RETURN VARCHAR2 IS
  v_nombre_cliente VARCHAR2(255);
BEGIN
  SELECT v_nombre_cliente INTO v_nombre_cliente
  FROM FIDE_CLIENTES_TB
  WHERE V_email = P_email_cliente;
  RETURN v_nombre_cliente;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

-- Para seleccionar el nombre del cliente con un correo específico
SELECT FIDE_CLIENTES_SELECT_BY_EMAIL_FN('juan.perez@example.com') AS nombre_cliente FROM dual;

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--Función #14
--Función para obtener detalles de la venta con información adicional
CREATE OR REPLACE FUNCTION FIDE_DETALLE_VENTA_SELECT_FN (
  P_id_detalle_venta INT
) RETURN VARCHAR2 IS
  V_detalles_venta VARCHAR2(4000);
  V_nombre_producto VARCHAR2(255);
BEGIN
  -- Obtener el nombre del producto
  SELECT NVL(FP.V_nombre_producto, 'Desconocido') INTO V_nombre_producto
  FROM FIDE_DETALLE_VENTA_TB FD
  LEFT JOIN FIDE_PRODUCTOS_TB FP ON FD.V_id_producto = FP.V_id_producto
  WHERE FD.V_id_detalle_venta = P_id_detalle_venta;

  -- Construir la cadena de detalles
  SELECT 'Producto: ' || V_nombre_producto || ', ' ||
         'Cantidad: ' || V_cantidad || ', ' ||
         'Precio Unitario: ' || TO_CHAR(V_precio_unitario, 'FM999,999,999.00') || ', ' ||
         'Subtotal: ' || TO_CHAR(V_subtotal, 'FM999,999,999.00')
  INTO V_detalles_venta
  FROM FIDE_DETALLE_VENTA_TB
  WHERE V_id_detalle_venta = P_id_detalle_venta;
  
  RETURN V_detalles_venta;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

-- Para seleccionar los detalles de la venta con un id específico
SELECT FIDE_DETALLE_VENTA_SELECT_FN(1) AS detalles_venta FROM dual;

--CREADO POR Anderson Espinoza
--FECHA 20/07/2024
--Función #15
--Función para obtener el ID del proveedor por nombre
CREATE OR REPLACE FUNCTION FIDE_PROVEEDORES_SELECT_BY_NAME_FN (
  P_nombre_proveedor VARCHAR2
) RETURN INT IS
  V_id_proveedor INT;
BEGIN
  SELECT V_id_proveedor INTO V_id_proveedor
  FROM FIDE_PROVEEDORES_TB
  WHERE V_nombre_proveedor = P_nombre_proveedor;
  RETURN V_id_proveedor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN -1; -- Valor negativo para indicar que no se encontró el proveedor
  WHEN OTHERS THEN
    RETURN -2; -- Valor negativo para indicar error general
END;

-- Para seleccionar el ID del proveedor con un nombre específico
SELECT FIDE_PROVEEDORES_SELECT_BY_NAME_FN('Proveedor XYZ') AS id_proveedor FROM dual;





