--Para visualizar los comentarios 
SET SERVEROUTPUT ON;
--SELECT * FROM FIDE_PRODUCTOS_TB;
--Procedientos 
--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #1
--Insertar descripción
-- Definición del procedimiento
CREATE OR REPLACE PROCEDURE FIDE_DESCRIPCION_INSERTAR_SP (
  P_descripcion IN VARCHAR2
) IS
BEGIN
  -- Inserción en la tabla
  INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, v_descripcion)
  VALUES (FIDE_DESCRIPCION_SEQ.NEXTVAL, P_descripcion);
 
  -- Mensaje de éxito
  DBMS_OUTPUT.PUT_LINE('Descripción insertada: ' || P_descripcion);
 
EXCEPTION
  -- Manejo de error específico para valor duplicado
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Error: Descripción duplicada - ' || P_descripcion);
  -- Manejo de otros errores
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/

-- Bloque anónimo para llamar al procedimiento
BEGIN
  FIDE_DESCRIPCION_INSERTAR_SP('Producto defectuoso');
  FIDE_DESCRIPCION_INSERTAR_SP('Entrega tardía');
  FIDE_DESCRIPCION_INSERTAR_SP('Facturación incorrecta');
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #2
--Actualizar precios
CREATE OR REPLACE PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP (
  P_id_producto IN NUMBER,
  P_nuevo_precio IN NUMBER
) IS
BEGIN
  UPDATE FIDE_PRODUCTOS_TB
  SET V_PRECIO = P_nuevo_precio
  WHERE V_ID_PRODUCTO = P_id_producto;
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No se encontró el producto con el ID especificado.');
  ELSE
    COMMIT;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

BEGIN
  FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP(4, 92);
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #3
--Eliminar categoría
CREATE OR REPLACE PROCEDURE FIDE_CATEGORIAS_ELIMINAR_SP (
    P_id_categoria IN INT
) AS
BEGIN
    DELETE FROM FIDE_CATEGORIAS_TB
    WHERE V_id_categoria = P_id_categoria;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: La categoría con el ID especificado no existe.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Categoría eliminada correctamente: ID = ' || P_id_categoria);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar categoría: ' || SQLERRM);
END;

--Realiza la eliminación del ID 20
BEGIN
    FIDE_CATEGORIAS_ELIMINAR_SP(20); --Cambia 23 por el ID de la categoría que deseas eliminar
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #4
--Seleccionar categoría
CREATE OR REPLACE PROCEDURE FIDE_CATEGORIAS_SELECCIONAR_SP (
    P_id_categoria IN INT
) AS
    V_nombre_categoria VARCHAR2(255);
BEGIN
    -- Seleccionar la categoría específica
    SELECT V_nombre_categoria
    INTO V_nombre_categoria
    FROM FIDE_CATEGORIAS_TB
    WHERE V_id_categoria = P_id_categoria;

    -- Mostrar el resultado
    DBMS_OUTPUT.PUT_LINE('ID: ' || P_id_categoria || ', Nombre: ' || V_nombre_categoria);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: La categoría con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al seleccionar categoría: ' || SQLERRM);
END;

BEGIN
    FIDE_CATEGORIAS_SELECCIONAR_SP(1); --Cambia 1 por el ID de la categoría que deseas consultar
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #5
--Actualizar nombre de categoría
CREATE OR REPLACE PROCEDURE FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP (
    P_id_categoria IN INT,
    P_nuevo_nombre IN VARCHAR2
) AS
BEGIN
    -- Actualizar el nombre de la categoría
    UPDATE FIDE_CATEGORIAS_TB
    SET V_nombre_categoria = P_nuevo_nombre
    WHERE V_id_categoria = P_id_categoria;

    -- Verificar si la actualización fue exitosa
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: La categoría con el ID especificado no existe.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Categoría actualizada correctamente: ID = ' || P_id_categoria || ', Nuevo Nombre = ' || P_nuevo_nombre);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar categoría: ' || SQLERRM);
END;

BEGIN
    FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP(3, 'Microondas de Última Generación'); -- Cambia 3 y 'Microondas de Última Generación' según sea necesario
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #6
--Actualizar cliente
CREATE OR REPLACE PROCEDURE FIDE_CLIENTES_ACTUALIZAR_SP (
    P_id_cliente IN INT,
    P_nombre_cliente IN VARCHAR2,
    P_apellido_cliente IN VARCHAR2,
    P_email IN VARCHAR2,
    P_telefono IN VARCHAR2,
    P_direccion IN CLOB,
    P_imagen IN VARCHAR2,
    P_rol IN VARCHAR2,
    P_pass IN VARCHAR2
) AS
BEGIN
    -- Actualizar la información del cliente
    UPDATE FIDE_CLIENTES_TB
    SET V_nombre_cliente = P_nombre_cliente,
        V_apellido_cliente = P_apellido_cliente,
        V_email = P_email,
        V_telefono = P_telefono,
        V_direccion = P_direccion,
        V_imagen = P_imagen,
        V_rol = P_rol,
        V_pass = P_pass
    WHERE V_id_cliente = P_id_cliente;

    -- Verificar si la actualización fue exitosa
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: El cliente con el ID especificado no existe.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cliente actualizado correctamente: ID = ' || P_id_cliente);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar cliente: ' || SQLERRM);
END;
/

BEGIN
    FIDE_CLIENTES_ACTUALIZAR_SP(3, 'Luis', 'Martínez', 'luis.martinez@nuevoemail.com', '345-678-9012', 'Boulevard Libertad 789, Ciudad', 'luis_martinez.jpg', 'cliente', 'nuevo_pass');
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #7
--Consultar cliente
CREATE OR REPLACE PROCEDURE FIDE_CLIENTES_CONSULTAR_SP (
    P_id_cliente IN INT
) AS
    V_nombre_cliente FIDE_CLIENTES_TB.V_nombre_cliente%TYPE;
    V_apellido_cliente FIDE_CLIENTES_TB.V_apellido_cliente%TYPE;
    V_email FIDE_CLIENTES_TB.V_email%TYPE;
    V_telefono FIDE_CLIENTES_TB.V_telefono%TYPE;
    V_direccion FIDE_CLIENTES_TB.V_direccion%TYPE;
    V_imagen FIDE_CLIENTES_TB.V_imagen%TYPE;
    V_rol FIDE_CLIENTES_TB.V_rol%TYPE;
    V_pass FIDE_CLIENTES_TB.V_pass%TYPE;
BEGIN
    -- Seleccionar la información del cliente
    SELECT V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass
    INTO V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass
    FROM FIDE_CLIENTES_TB
    WHERE V_id_cliente = P_id_cliente;

    -- Mostrar la información del cliente
    DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || P_id_cliente);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || V_apellido_cliente);
    DBMS_OUTPUT.PUT_LINE('Email: ' || V_email);
    DBMS_OUTPUT.PUT_LINE('Teléfono: ' || V_telefono);
    DBMS_OUTPUT.PUT_LINE('Dirección: ' || V_direccion);
    DBMS_OUTPUT.PUT_LINE('Imagen: ' || V_imagen);
    DBMS_OUTPUT.PUT_LINE('Rol: ' || V_rol);
    DBMS_OUTPUT.PUT_LINE('Contraseña: ' || V_pass);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El cliente con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar cliente: ' || SQLERRM);
END;


BEGIN
    FIDE_CLIENTES_CONSULTAR_SP(1); -- Reemplaza '1' con el ID del cliente que deseas consultar
END;

--CREADO POR Marcos Solis Morales
--FECHA 24/07/2024
--procedimiento almacenado #8
--Consultar proveedor
CREATE OR REPLACE PROCEDURE FIDE_PROVEEDORES_CONSULTAR_SP (
    P_id_proveedor IN INT DEFAULT NULL
) AS
    CURSOR C_proveedores IS
        SELECT V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, 
               V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor
        FROM FIDE_PROVEEDORES_TB
        WHERE (P_id_proveedor IS NULL OR V_id_proveedor = P_id_proveedor);
    
    V_id_proveedor FIDE_PROVEEDORES_TB.V_id_proveedor%TYPE;
    V_id_estado FIDE_PROVEEDORES_TB.V_id_estado%TYPE;
    V_nombre_proveedor FIDE_PROVEEDORES_TB.V_nombre_proveedor%TYPE;
    V_contacto_proveedor FIDE_PROVEEDORES_TB.V_contacto_proveedor%TYPE;
    V_email_proveedor FIDE_PROVEEDORES_TB.V_email_proveedor%TYPE;
    V_telefono_proveedor FIDE_PROVEEDORES_TB.V_telefono_proveedor%TYPE;
    V_direccion_proveedor FIDE_PROVEEDORES_TB.V_direccion_proveedor%TYPE;
BEGIN
    OPEN C_proveedores;
    LOOP
        FETCH C_proveedores INTO V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor,
                                V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor;
        EXIT WHEN C_proveedores%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID Proveedor: ' || V_id_proveedor);
        DBMS_OUTPUT.PUT_LINE('ID Estado: ' || V_id_estado);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_nombre_proveedor);
        DBMS_OUTPUT.PUT_LINE('Contacto: ' || V_contacto_proveedor);
        DBMS_OUTPUT.PUT_LINE('Email: ' || V_email_proveedor);
        DBMS_OUTPUT.PUT_LINE('Teléfono: ' || V_telefono_proveedor);
        DBMS_OUTPUT.PUT_LINE('Dirección: ' || V_direccion_proveedor);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
    CLOSE C_proveedores;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se encontraron proveedores.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar proveedores: ' || SQLERRM);
END;
/

-- Consultar todos los proveedores
BEGIN
    FIDE_PROVEEDORES_CONSULTAR_SP(NULL);
END;
/

-- Consultar un proveedor específico por ID
BEGIN
    FIDE_PROVEEDORES_CONSULTAR_SP(1); -- Reemplaza '1' con el ID del proveedor que deseas consultar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #9
-- Consultar Estado
CREATE OR REPLACE PROCEDURE FIDE_ESTADOS_CONSULTAR_SP (
    P_id_estado IN INT
) AS
    V_descripcion FIDE_ESTADOS_TB.V_descripcion%TYPE;
BEGIN
    -- Seleccionar la información del estado
    SELECT V_descripcion
    INTO V_descripcion
    FROM FIDE_ESTADOS_TB
    WHERE V_id_estado = P_id_estado;

    -- Mostrar la información del estado
    DBMS_OUTPUT.PUT_LINE('ID Estado: ' || P_id_estado);
    DBMS_OUTPUT.PUT_LINE('Descripción: ' || V_descripcion);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El estado con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar estado: ' || SQLERRM);
END;

BEGIN
    FIDE_ESTADOS_CONSULTAR_SP(P_id_estado => 1); -- Reemplaza '1' con el ID del estado que deseas consultar
END;
/


--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #10
-- Insertar Categoría
CREATE OR REPLACE PROCEDURE FIDE_CATEGORIAS_INSERTAR_SP (
    P_nombre_categoria IN VARCHAR2
) AS
    V_id_categoria INT; -- Variable para almacenar el valor de la secuencia
BEGIN
    -- Obtener el siguiente valor de la secuencia
    SELECT FIDE_CATEGORIAS_SEQ.NEXTVAL INTO V_id_categoria FROM dual;

    -- Insertar una nueva categoría con el ID generado por la secuencia
    INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria)
    VALUES (V_id_categoria, P_nombre_categoria);

    DBMS_OUTPUT.PUT_LINE('Categoría insertada: ' || P_nombre_categoria || ' con ID: ' || V_id_categoria);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: La categoría con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar categoría: ' || SQLERRM);
END;

BEGIN
    FIDE_CATEGORIAS_INSERTAR_SP(
        P_nombre_categoria => 'Electrónica'
    );
END;


--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #11
--Actualizar Producto
CREATE OR REPLACE PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_SP (
    P_id_producto IN INT,
    P_nombre_producto IN VARCHAR2,
    P_precio IN NUMBER
) AS
BEGIN
    -- Actualizar la información del producto
    UPDATE FIDE_PRODUCTOS_TB
    SET V_nombre_producto = P_nombre_producto,
        V_precio = P_precio
    WHERE V_id_producto = P_id_producto;

    DBMS_OUTPUT.PUT_LINE('Producto actualizado: ' || P_nombre_producto);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El producto con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar producto: ' || SQLERRM);
END;

BEGIN
    FIDE_PRODUCTOS_ACTUALIZAR_SP(
        P_id_producto => 1, 
        P_nombre_producto => 'Smartphone', 
        P_precio => 29
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #12
--Eliminar Cliente
CREATE OR REPLACE PROCEDURE FIDE_CLIENTES_ELIMINAR_SP (
    P_id_cliente IN INT
) AS
BEGIN
    -- Eliminar cliente
    DELETE FROM FIDE_CLIENTES_TB
    WHERE V_id_cliente = P_id_cliente;

    DBMS_OUTPUT.PUT_LINE('Cliente eliminado con ID: ' || P_id_cliente);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El cliente con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar cliente: ' || SQLERRM);
END;

BEGIN
    FIDE_CLIENTES_ELIMINAR_SP(P_id_cliente => 1); -- Reemplaza '1' con el ID del cliente que deseas eliminar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #13
-- Consultar Venta
CREATE OR REPLACE PROCEDURE FIDE_VENTA_CONSULTAR_SP (
    P_id_venta IN INT
) AS
    V_id_cliente FIDE_VENTA_TB.V_id_cliente%TYPE;
    V_id_empleado FIDE_VENTA_TB.V_id_empleado%TYPE;
    V_fecha FIDE_VENTA_TB.V_fecha%TYPE;
    V_total FIDE_VENTA_TB.V_total%TYPE;
BEGIN
    -- Seleccionar la información de la venta
    SELECT V_id_cliente, V_id_empleado, V_fecha, V_total
    INTO V_id_cliente, V_id_empleado, V_fecha, V_total
    FROM FIDE_VENTA_TB
    WHERE V_id_venta = P_id_venta;

    -- Mostrar la información de la venta
    DBMS_OUTPUT.PUT_LINE('ID Venta: ' || P_id_venta);
    DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || V_id_cliente);
    DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || V_id_empleado);
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || V_fecha);
    DBMS_OUTPUT.PUT_LINE('Total: ' || V_total);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: La venta con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar venta: ' || SQLERRM);
END;

BEGIN
    FIDE_VENTA_CONSULTAR_SP(P_id_venta => 1); -- Reemplaza '1' con el ID de la venta que deseas consultar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #14
--Consultar Venta
CREATE OR REPLACE PROCEDURE FIDE_VENTA_CONSULTAR_SP (
    P_id_venta IN INT
) AS
    V_id_cliente FIDE_VENTA_TB.V_id_cliente%TYPE;
    V_id_empleado FIDE_VENTA_TB.V_id_empleado%TYPE;
    V_fecha FIDE_VENTA_TB.V_fecha%TYPE;
    V_total FIDE_VENTA_TB.V_total%TYPE;
BEGIN
    -- Seleccionar la información de la venta
    SELECT V_id_cliente, V_id_empleado, V_fecha, V_total
    INTO V_id_cliente, V_id_empleado, V_fecha, V_total
    FROM FIDE_VENTA_TB
    WHERE V_id_venta = P_id_venta;

    -- Mostrar la información de la venta
    DBMS_OUTPUT.PUT_LINE('ID Venta: ' || P_id_venta);
    DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || V_id_cliente);
    DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || V_id_empleado);
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || V_fecha);
    DBMS_OUTPUT.PUT_LINE('Total: ' || V_total);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: La venta con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar venta: ' || SQLERRM);
END;



--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #15
-- Insertar Proveedor
CREATE OR REPLACE PROCEDURE FIDE_PROVEEDORES_INSERTAR_SP (
    P_id_proveedor IN INT,
    P_nombre_proveedor IN VARCHAR2,
    P_contacto_proveedor IN VARCHAR2,
    P_email_proveedor IN VARCHAR2,
    P_telefono_proveedor IN VARCHAR2,
    P_direccion_proveedor IN VARCHAR2
) AS
BEGIN
    -- Insertar un nuevo proveedor
    INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor)
    VALUES (P_id_proveedor, P_nombre_proveedor, P_contacto_proveedor, P_email_proveedor, P_telefono_proveedor, P_direccion_proveedor);

    DBMS_OUTPUT.PUT_LINE('Proveedor insertado: ' || P_nombre_proveedor);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: El proveedor con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar proveedor: ' || SQLERRM);
END;

BEGIN
    FIDE_PROVEEDORES_INSERTAR_SP(
        P_id_proveedor => 1, 
        P_nombre_proveedor => 'Proveedor A',
        P_contacto_proveedor => 'Juan Pérez',
        P_email_proveedor => 'juan.perez@proveedora.com',
        P_telefono_proveedor => '1234567890',
        P_direccion_proveedor => '123 Calle Principal'
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #16
-- Actualizar Reclamación
CREATE OR REPLACE PROCEDURE FIDE_RECLAMACIONES_ACTUALIZAR_SP (
    P_id_reclamacion IN INT,
    P_fecha IN DATE
) AS
BEGIN
    -- Actualizar la información de la reclamación
    UPDATE FIDE_RECLAMACIONES_TB
    SET V_fecha = P_fecha
    WHERE V_id_reclamacion = P_id_reclamacion;

    DBMS_OUTPUT.PUT_LINE('Reclamación actualizada con ID: ' || P_id_reclamacion);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: La reclamación con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar reclamación: ' || SQLERRM);
END;

BEGIN
    FIDE_RECLAMACIONES_ACTUALIZAR_SP(
        P_id_reclamacion => 1, 
        P_fecha => SYSDATE -- Puedes reemplazar SYSDATE con la fecha deseada
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #17
-- Eliminar Producto
CREATE OR REPLACE PROCEDURE FIDE_PRODUCTOS_ELIMINAR_SP (
    P_id_producto IN INT
) AS
BEGIN
    -- Eliminar producto
    DELETE FROM FIDE_PRODUCTOS_TB
    WHERE V_id_producto = P_id_producto;

    DBMS_OUTPUT.PUT_LINE('Producto eliminado con ID: ' || P_id_producto);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El producto con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar producto: ' || SQLERRM);
END;

BEGIN
    FIDE_PRODUCTOS_ELIMINAR_SP(P_id_producto => 1); -- Reemplaza '1' con el ID del producto que deseas eliminar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #18
-- Consultar Detalle de Venta
CREATE OR REPLACE PROCEDURE FIDE_DETALLE_VENTA_CONSULTAR_SP (
    P_id_detalle_venta IN INT
) AS
    V_id_venta FIDE_DETALLE_VENTA_TB.V_id_venta%TYPE;
    V_id_producto FIDE_DETALLE_VENTA_TB.V_id_producto%TYPE;
    V_cantidad FIDE_DETALLE_VENTA_TB.V_cantidad%TYPE;
    V_precio_unitario FIDE_DETALLE_VENTA_TB.V_precio_unitario%TYPE;
    V_subtotal FIDE_DETALLE_VENTA_TB.V_subtotal%TYPE;
BEGIN
    -- Seleccionar la información del detalle de venta
    SELECT V_id_venta, V_id_producto, V_cantidad, V_precio_unitario, V_subtotal
    INTO V_id_venta, V_id_producto, V_cantidad, V_precio_unitario, V_subtotal
    FROM FIDE_DETALLE_VENTA_TB
    WHERE V_id_detalle_venta = P_id_detalle_venta;

    -- Mostrar la información del detalle de venta
    DBMS_OUTPUT.PUT_LINE('ID Detalle Venta: ' || P_id_detalle_venta);
    DBMS_OUTPUT.PUT_LINE('ID Venta: ' || V_id_venta);
    DBMS_OUTPUT.PUT_LINE('ID Producto: ' || V_id_producto);
    DBMS_OUTPUT.PUT_LINE('Cantidad: ' || V_cantidad);
    DBMS_OUTPUT.PUT_LINE('Precio Unitario: ' || V_precio_unitario);
    DBMS_OUTPUT.PUT_LINE('Subtotal: ' || V_subtotal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El detalle de venta con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar detalle de venta: ' || SQLERRM);
END;

BEGIN
    FIDE_DETALLE_VENTA_CONSULTAR_SP(P_id_detalle_venta => 1); -- Reemplaza '1' con el ID del detalle de venta que deseas consultar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--procedimiento almacenado #19
-- Insertar Promoción
-- Procedimiento modificado para usar la secuencia
CREATE OR REPLACE PROCEDURE FIDE_PROMOCIONES_INSERTAR_SP (
    P_id_estado IN INT,
    P_nombre_promocion IN VARCHAR2,
    P_descripcion_promocion IN VARCHAR2,
    P_fecha_inicio IN DATE,
    P_fecha_fin IN DATE,
    P_descuento IN NUMBER
) AS
    V_id_promocion INT; -- Variable para almacenar el valor de la secuencia
BEGIN
    -- Obtener el siguiente valor de la secuencia
    SELECT FIDE_PROMOCIONES_SEQ.NEXTVAL INTO V_id_promocion FROM dual;

    -- Insertar una nueva promoción con el ID generado por la secuencia
    INSERT INTO FIDE_PROMOCIONES_TB (V_id_promocion, V_id_estado, V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento)
    VALUES (V_id_promocion, P_id_estado, P_nombre_promocion, P_descripcion_promocion, P_fecha_inicio, P_fecha_fin, P_descuento);

    DBMS_OUTPUT.PUT_LINE('Promoción insertada: ' || P_nombre_promocion || ' con ID: ' || V_id_promocion);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: La promoción con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar promoción: ' || SQLERRM);
END;

BEGIN
    FIDE_PROMOCIONES_INSERTAR_SP(
        P_id_estado => 1, 
        P_nombre_promocion => 'Descuento Veloz', 
        P_descripcion_promocion => '50% de descuento en todos los de casa',
        P_fecha_inicio => DATE '2024-08-17', 
        P_fecha_fin => DATE '2024-12-11', 
        P_descuento => 10
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #20
-- Insertar Reclamación
CREATE OR REPLACE PROCEDURE FIDE_RECLAMACIONES_MOTIVO_INSERTAR_SP (
    p_v_nombre_cliente IN FIDE_CLIENTES_TB.V_nombre_cliente%TYPE,
    P_categoria IN FIDE_MOTIVOS_TB.V_categoria%TYPE,
    P_descripcion IN FIDE_DESCRIPCION_TB.V_descripcion%TYPE,
    P_fecha IN FIDE_RECLAMACIONES_TB.V_fecha%TYPE
) AS
    P_id_cliente FIDE_CLIENTES_TB.V_id_cliente%TYPE;
    P_id_motivos FIDE_MOTIVOS_TB.V_id_motivos%TYPE;
    P_id_descripcion FIDE_DESCRIPCION_TB.V_id_descripcion%TYPE;
BEGIN
    -- Obtener el ID del cliente
    BEGIN
        SELECT V_id_cliente INTO P_id_cliente
        FROM FIDE_CLIENTES_TB
        WHERE V_nombre_cliente = p_v_nombre_cliente;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002, 'Cliente no encontrado: ' || p_v_nombre_cliente);
    END;

    -- Insertar o recuperar el ID de la categoría en FIDE_MOTIVOS_TB
    BEGIN
        INSERT INTO FIDE_MOTIVOS_TB (V_id_motivos, V_categoria)
        VALUES (FIDE_MOTIVOS_SEQ.NEXTVAL, P_categoria)
        RETURNING V_id_motivos INTO P_id_motivos;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            SELECT V_id_motivos INTO P_id_motivos
            FROM FIDE_MOTIVOS_TB
            WHERE V_categoria = P_categoria;
    END;

    -- Insertar o recuperar el ID de la descripción en FIDE_DESCRIPCION_TB
    BEGIN
        INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
        VALUES (FIDE_DESCRIPCION_SEQ.NEXTVAL, P_descripcion)
        RETURNING V_id_descripcion INTO P_id_descripcion;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            SELECT V_id_descripcion INTO P_id_descripcion
            FROM FIDE_DESCRIPCION_TB
            WHERE V_descripcion = P_descripcion;
    END;

    -- Insertar la reclamación en la tabla FIDE_RECLAMACIONES_TB
    INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_fecha)
    VALUES (FIDE_RECLAMACIONES_SEQ.NEXTVAL, P_id_cliente , P_fecha);

    COMMIT;
END;


--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #21
-- Actualizar Proveedor
CREATE OR REPLACE PROCEDURE FIDE_PROVEEDORES_ACTUALIZAR_SP (
    P_id_proveedor IN INT,
    P_nombre_proveedor IN VARCHAR2,
    P_contacto_proveedor IN VARCHAR2,
    P_email_proveedor IN VARCHAR2,
    P_telefono_proveedor IN VARCHAR2,
    P_direccion_proveedor IN VARCHAR2
) AS
BEGIN
    -- Actualizar la información del proveedor
    UPDATE FIDE_PROVEEDORES_TB
    SET V_nombre_proveedor = P_nombre_proveedor,
        V_contacto_proveedor = P_contacto_proveedor,
        V_email_proveedor = P_email_proveedor,
        V_telefono_proveedor = P_telefono_proveedor,
        V_direccion_proveedor = P_direccion_proveedor
    WHERE V_id_proveedor = P_id_proveedor;

    DBMS_OUTPUT.PUT_LINE('Proveedor actualizado con ID: ' || P_id_proveedor);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El proveedor con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar proveedor: ' || SQLERRM);
END;

BEGIN
    FIDE_PROVEEDORES_ACTUALIZAR_SP(
        P_id_proveedor => 1,
        P_nombre_proveedor => 'Proveedor B',
        P_contacto_proveedor => 'Ana Gómez',
        P_email_proveedor => 'ana.gomez@proveedora.com',
        P_telefono_proveedor => '0987654321',
        P_direccion_proveedor => '456 Calle Secundaria'
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #22
-- Consultar Producto
CREATE OR REPLACE PROCEDURE FIDE_PRODUCTOS_CONSULTAR_SP (
    P_id_producto IN INT
) AS
    V_nombre_producto FIDE_PRODUCTOS_TB.V_nombre_producto%TYPE;
    V_precio FIDE_PRODUCTOS_TB.V_precio%TYPE;
BEGIN
    -- Seleccionar la información del producto
    SELECT V_nombre_producto, V_precio
    INTO V_nombre_producto, V_precio
    FROM FIDE_PRODUCTOS_TB
    WHERE V_id_producto = P_id_producto;

    -- Mostrar la información del producto
    DBMS_OUTPUT.PUT_LINE('ID Producto: ' || P_id_producto);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_nombre_producto);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || V_precio);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El producto con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar producto: ' || SQLERRM);
END;

BEGIN
    FIDE_PRODUCTOS_CONSULTAR_SP(P_id_producto => 1); -- Reemplaza '1' con el ID del producto que deseas consultar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #23
-- Insertar Detalle de Venta
CREATE OR REPLACE PROCEDURE FIDE_DETALLE_VENTA_INSERTAR_SP (
    P_id_detalle_venta IN INT,
    P_id_venta IN INT,
    P_id_producto IN INT,
    P_cantidad IN NUMBER,
    P_precio_unitario IN NUMBER,
    P_subtotal IN NUMBER
) AS
BEGIN
    -- Insertar un nuevo detalle de venta
    INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_cantidad, V_precio_unitario, V_subtotal)
    VALUES (P_id_detalle_venta, P_id_venta, P_id_producto, P_cantidad, P_precio_unitario, P_subtotal);

    DBMS_OUTPUT.PUT_LINE('Detalle de venta insertado con ID: ' || P_id_detalle_venta);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: El detalle de venta con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar detalle de venta: ' || SQLERRM);
END;

BEGIN
    FIDE_DETALLE_VENTA_INSERTAR_SP(
        P_id_detalle_venta => 1,
        P_id_venta => 1,
        P_id_producto => 1,
        P_cantidad => 2,
        P_precio_unitario => 15,
        P_subtotal => 30
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #24
-- Eliminar Proveedor
CREATE OR REPLACE PROCEDURE FIDE_PROVEEDORES_ELIMINAR_SP (
    P_id_proveedor IN INT
) AS
BEGIN
    -- Eliminar proveedor
    DELETE FROM FIDE_PROVEEDORES_TB
    WHERE V_id_proveedor = P_id_proveedor;

    DBMS_OUTPUT.PUT_LINE('Proveedor eliminado con ID: ' || P_id_proveedor);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El proveedor con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar proveedor: ' || SQLERRM);
END;

BEGIN
    FIDE_PROVEEDORES_ELIMINAR_SP(P_id_proveedor => 1); -- Reemplaza '1' con el ID del proveedor que deseas eliminar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #25
-- Consultar Promoción
CREATE OR REPLACE PROCEDURE FIDE_PROMOCIONES_CONSULTAR_SP (
    P_id_promocion IN INT
) AS
    V_nombre_promocion FIDE_PROMOCIONES_TB.V_nombre_promocion%TYPE;
    V_descripcion_promocion FIDE_PROMOCIONES_TB.V_descripcion_promocion%TYPE;
    V_fecha_inicio FIDE_PROMOCIONES_TB.V_fecha_inicio%TYPE;
    V_fecha_fin FIDE_PROMOCIONES_TB.V_fecha_fin%TYPE;
    V_descuento FIDE_PROMOCIONES_TB.V_descuento%TYPE;
BEGIN
    -- Seleccionar la información de la promoción
    SELECT V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento
    INTO V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento
    FROM FIDE_PROMOCIONES_TB
    WHERE V_id_promocion = P_id_promocion;

    -- Mostrar la información de la promoción
    DBMS_OUTPUT.PUT_LINE('ID Promoción: ' || P_id_promocion);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_nombre_promocion);
    DBMS_OUTPUT.PUT_LINE('Descripción: ' || V_descripcion_promocion);
    DBMS_OUTPUT.PUT_LINE('Fecha Inicio: ' || V_fecha_inicio);
    DBMS_OUTPUT.PUT_LINE('Fecha Fin: ' || V_fecha_fin);
    DBMS_OUTPUT.PUT_LINE('Descuento: ' || V_descuento);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: La promoción con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar promoción: ' || SQLERRM);
END;

BEGIN
    FIDE_PROMOCIONES_CONSULTAR_SP(P_id_promocion => 1); -- Reemplaza '1' con el ID de la promoción que deseas consultar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 30/07/2024
--procedimiento almacenado #26
--Consulta del reabastecimiento
CREATE OR REPLACE PROCEDURE FIDE_REABASTECIMIENTO_CONSULTAR_SP (
    P_id_reabastecimiento IN INT
) AS
    V_fecha FIDE_REABASTECIMIENTO_STOCK_TB.V_fecha%TYPE;
    V_cantidad FIDE_REABASTECIMIENTO_STOCK_TB.V_cantidad%TYPE;
    V_id_producto FIDE_REABASTECIMIENTO_STOCK_TB.V_id_producto%TYPE;
    V_id_estado FIDE_REABASTECIMIENTO_STOCK_TB.V_id_estado%TYPE;
    V_estado FIDE_REABASTECIMIENTO_STOCK_TB.V_estado%TYPE;
BEGIN
    -- Seleccionar la información del reabastecimiento
    SELECT V_fecha, V_cantidad, V_id_producto, V_id_estado, V_estado
    INTO V_fecha, V_cantidad, V_id_producto, V_id_estado, V_estado
    FROM FIDE_REABASTECIMIENTO_STOCK_TB
    WHERE V_id_reabastecimiento = P_id_reabastecimiento;

    -- Mostrar la información del reabastecimiento
    DBMS_OUTPUT.PUT_LINE('ID Reabastecimiento: ' || P_id_reabastecimiento);
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || V_fecha);
    DBMS_OUTPUT.PUT_LINE('Cantidad: ' || V_cantidad);
    DBMS_OUTPUT.PUT_LINE('ID Producto: ' || V_id_producto);
    DBMS_OUTPUT.PUT_LINE('ID Estado: ' || V_id_estado);
    DBMS_OUTPUT.PUT_LINE('Estado: ' || V_estado);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: El reabastecimiento con el ID especificado no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar reabastecimiento: ' || SQLERRM);
END;

BEGIN
    FIDE_REABASTECIMIENTO_CONSULTAR_SP(P_id_reabastecimiento => 6); -- Reemplaza '6' con el ID del reabastecimiento que deseas consultar
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 31/07/2024
--procedimiento almacenado #27
--Ingresar nuevos productos
CREATE OR REPLACE PROCEDURE FIDE_CLIENTES_SELECCIONAR_SP (
    P_id_cliente IN FIDE_CLIENTES_TB.V_id_cliente%TYPE,
    V_nombre_cliente OUT FIDE_CLIENTES_TB.V_nombre_cliente%TYPE,
    V_apellido_cliente OUT FIDE_CLIENTES_TB.V_apellido_cliente%TYPE,
    V_email OUT FIDE_CLIENTES_TB.V_email%TYPE,
    V_telefono OUT FIDE_CLIENTES_TB.V_telefono%TYPE,
    V_imagen OUT FIDE_CLIENTES_TB.V_imagen%TYPE
) AS
BEGIN
    SELECT V_nombre_cliente,
           V_apellido_cliente,
           V_email,
           V_telefono,
           V_imagen
    INTO   V_nombre_cliente,
           V_apellido_cliente,
           V_email,
           V_telefono,
           V_imagen
    FROM   FIDE_CLIENTES_TB
    WHERE  V_id_cliente = P_id_cliente;
END;


BEGIN
    FIDE_AGREGAR_PRODUCTO_SP(
        p_id_producto => 47,         
        p_id_categoria => 1,        
        p_id_estado    => 1,       
        p_nombre_producto => 'Portatil 2024',  
        p_descripcion_producto => 'Un Portatil 2024 de última generación con gran cámara y batería de larga duración.', 
        p_precio => 49,  
        p_imagen  => 'https://s.alicdn.com/@sc04/kf/H38ed09b3c9dd470e8354108c2cee69afF.jpg_720x720q50.jpg'  
    );
END;


--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 31/07/2024
--procedimiento almacenado #28
--Selecciona perfil
CREATE OR REPLACE PROCEDURE FIDE_CLIENTES_SELECCIONAR_SP (
    p_user_id IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_apellido OUT VARCHAR2,
    p_email OUT VARCHAR2,
    p_telefono OUT VARCHAR2,
    p_direccion OUT VARCHAR2,
    p_imagen OUT VARCHAR2
)
AS
BEGIN
    SELECT V_NOMBRE_CLIENTE, V_APELLIDO_CLIENTE, V_EMAIL, V_TELEFONO, V_DIRECCION, V_IMAGEN
    INTO p_nombre, p_apellido, p_email, p_telefono, p_direccion, p_imagen
    FROM FIDE_CLIENTES_TB
    WHERE V_ID_CLIENTE = p_user_id;
END;
BEGIN
FIDE_CLIENTES_SELECCIONAR_SP(P_id_cliente => 1);
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 8/08/2024
--procedimiento almacenado #29
--agregar reseñas de productos
CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_RESENA_SP (
  p_v_nombre_producto IN FIDE_PRODUCTOS_TB.V_nombre_producto%TYPE,
  p_v_nombre_cliente IN FIDE_CLIENTES_TB.V_nombre_cliente%TYPE,
  p_v_calificacion IN FIDE_RESENAS_PRODUCTO_TB.V_calificacion%TYPE,
  p_v_comentario IN FIDE_RESENAS_PRODUCTO_TB.V_comentario%TYPE,
  p_v_fecha IN VARCHAR2
) AS
  v_id_producto FIDE_PRODUCTOS_TB.V_id_producto%TYPE;
  v_id_cliente FIDE_CLIENTES_TB.V_id_cliente%TYPE;
BEGIN
  -- Obtener el ID del producto basado en el nombre del producto
  BEGIN
    SELECT V_id_producto INTO v_id_producto
    FROM FIDE_PRODUCTOS_TB
    WHERE V_nombre_producto = p_v_nombre_producto;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Producto no encontrado: ' || p_v_nombre_producto);
  END;

  -- Obtene el ID del cliente basado en el nombre del cliente
  BEGIN
    SELECT V_id_cliente INTO v_id_cliente
    FROM FIDE_CLIENTES_TB
    WHERE V_nombre_cliente = p_v_nombre_cliente;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20002, 'Cliente no encontrado: ' || p_v_nombre_cliente);
  END;

  -- Inserta la reseña en la tabla FIDE_RESENAS_PRODUCTO_TB
  INSERT INTO FIDE_RESENAS_PRODUCTO_TB (V_id_resena_producto, V_id_producto, V_id_cliente, V_calificacion, V_comentario, V_fecha)
  VALUES (FIDE_RESENAS_SEQ.NEXTVAL, v_id_producto, v_id_cliente, p_v_calificacion, p_v_comentario, TO_DATE(p_v_fecha, 'YYYY-MM-DD'));
  COMMIT;
END;

--CREADO POR Nicole Hidalgo 
--FECHA 16/08/2024
--procedimiento almacenado #30
--Actualizar empleados
CREATE OR REPLACE PROCEDURE FIDE_EMPLEADOS_ACTUALIZAR_SP (
    P_id_empleado IN INT,
    P_nombre_empleado IN VARCHAR2,
    P_apellido_empleado IN VARCHAR2,
    P_email IN VARCHAR2,
    P_telefono IN VARCHAR2,
    P_direccion IN VARCHAR2,
    P_imagen IN VARCHAR2
) AS
BEGIN
    -- Actualizar la información del empleado
    UPDATE FIDE_EMPLEADOS_TB
    SET V_nombre_empleado = P_nombre_empleado,
        V_apellido_empleado = P_apellido_empleado,
        V_email = P_email,
        V_telefono = P_telefono,
        V_direccion = P_direccion,
        V_imagen = P_imagen
    WHERE V_id_empleado = P_id_empleado;

    -- Verificar si la actualización fue exitosa
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: El empleado con el ID especificado no existe.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Empleado actualizado correctamente: ID = ' || P_id_empleado);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar empleado: ' || SQLERRM);
END;

BEGIN
    FIDE_EMPLEADOS_ACTUALIZAR_SP(11, 'Natali', 'Ramirez', 'natali.ramirez@nuevoemail.com', '789-012-3456', 'Avenida Central 123, Ciudad', 'https://cdn.pixabay.com/photo/2016/11/07/17/03/beautiful-women-1806280_1280.jpg');
END;

--CREADO POR Nicole Hidalgo 
--FECHA 16/08/2024
--procedimiento almacenado #31
--Insertar nuevo empleado
CREATE OR REPLACE PROCEDURE FIDE_EMPLEADOS_INSERTAR_SP (
    P_id_estado IN INT,
    P_nombre_empleado IN VARCHAR2,
    P_apellido_empleado IN VARCHAR2,
    P_email IN VARCHAR2,
    P_telefono IN VARCHAR2,
    P_direccion IN VARCHAR2,
    P_imagen IN VARCHAR2
)
AS
BEGIN
    INSERT INTO FIDE_EMPLEADOS_TB (
        V_id_empleado, 
        V_id_estado, 
        V_nombre_empleado, 
        V_apellido_empleado, 
        V_email, 
        V_telefono, 
        V_direccion, 
        V_imagen
    )
    VALUES (
        FIDE_EMPLEADOS_SEQ.NEXTVAL, 
        P_id_estado,
        P_nombre_empleado,
        P_apellido_empleado,
        P_email,
        P_telefono,
        P_direccion,
        P_imagen
    );
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Manejar el error de valor duplicado aquí
        RAISE_APPLICATION_ERROR(-20001, 'Valor duplicado detectado para V_id_empleado.');
END;


BEGIN
    FIDE_EMPLEADOS_INSERTAR_SP(
        P_id_estado => 1, 
        P_nombre_empleado => 'Jasin', 
        P_apellido_empleado => 'Chavarria', 
        P_email => 'jasin.chavarria@example.com', 
        P_telefono => '1232227890', 
        P_direccion => 'Calle 1', 
        P_imagen => 'https://weremote.net/wp-content/uploads/2022/08/mujer-sonriente-apunta-arriba.jpg'
    );
END;


--CREADO POR Maria Celest Solano 
--FECHA 16/08/2024
--procedimiento almacenado #32
--Modificar un cliente
create or replace PROCEDURE FIDE_CLIENTES_ACTUALIZAR_SP (
    P_id_cliente IN INT,
    P_nombre_cliente IN VARCHAR2,
    P_apellido_cliente IN VARCHAR2,
    P_email IN VARCHAR2,
    P_telefono IN VARCHAR2,
    P_direccion IN CLOB,
    P_imagen IN VARCHAR2,
    P_rol IN VARCHAR2,
    P_pass IN VARCHAR2
) AS
BEGIN
    -- Actualizar la información del cliente
    UPDATE FIDE_CLIENTES_TB
    SET V_nombre_cliente = P_nombre_cliente,
        V_apellido_cliente = P_apellido_cliente,
        V_email = P_email,
        V_telefono = P_telefono,
        V_direccion = P_direccion,
        V_imagen = P_imagen,
        V_rol = P_rol,
        V_pass = P_pass
    WHERE V_id_cliente = P_id_cliente;

    COMMIT; -- Asegúrate de hacer commit si es necesario
END;

--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 19/08/2024
--procedimiento almacenado #33
--AGREGAR A CARRITO
CREATE OR REPLACE PROCEDURE AGREGARALCARRITO (
    p_id_cliente IN FIDE_CARRITO_TB.V_id_cliente%TYPE,
    p_id_producto IN FIDE_CARRITO_TB.V_id_producto%TYPE,
    p_cantidad IN FIDE_CARRITO_TB.V_cantidad%TYPE
)
AS
    v_existencia NUMBER;
    v_precio_unitario NUMBER(10, 2);
BEGIN
    -- Verifica si el producto ya existe en el carrito del cliente
    SELECT COUNT(*)
    INTO v_existencia
    FROM FIDE_CARRITO_TB
    WHERE V_id_cliente = p_id_cliente
    AND V_id_producto = p_id_producto;

    IF v_existencia > 0 THEN
        -- Si existe, actualiza la cantidad
        UPDATE FIDE_CARRITO_TB
        SET V_cantidad = V_cantidad + p_cantidad,
            V_subtotal = V_cantidad * V_precio_unitario
        WHERE V_id_cliente = p_id_cliente
        AND V_id_producto = p_id_producto;
    ELSE
        BEGIN
            -- Obtén el precio unitario del producto
            BEGIN
                SELECT V_precio_unitario
                INTO v_precio_unitario
                FROM FIDE_PRODUCTOS_TB
                WHERE V_id_producto = p_id_producto;

                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RAISE_APPLICATION_ERROR(-20001, 'Producto no encontrado en FIDE_PRODUCTOS_TB');
            END;

            -- Inserta un nuevo registro
            INSERT INTO FIDE_CARRITO_TB (
                V_id_carrito,
                V_id_cliente,
                V_id_producto,
                V_id_estado,
                V_cantidad,
                V_precio_unitario,
                V_subtotal
            )
            VALUES (
                FIDE_CARRITO_TB_SEQ.NEXTVAL, -- Asegúrate de tener una secuencia para V_id_carrito
                p_id_cliente,
                p_id_producto,
                1, -- Estado por defecto, ajusta si es necesario
                p_cantidad,
                v_precio_unitario,
                p_cantidad * v_precio_unitario
            );
        END;
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 19/08/2024
--procedimiento almacenado #34
--FINALIZAR COMPRA
CREATE OR REPLACE PROCEDURE FIDE_FINALIZAR_COMPRA(
    p_id_cliente IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_detalles IN VARCHAR2
) AS
    v_total NUMBER(10, 2);
    v_id_compra NUMBER;
BEGIN
    -- Calcular el total de la compra
    SELECT SUM(V_subtotal) INTO v_total
    FROM FIDE_CARRITO_TB
    WHERE V_id_cliente = p_id_cliente;

    -- Insertar la compra en la tabla FIDE_COMPRAS_TB
    INSERT INTO FIDE_COMPRAS_TB (V_id_compra, V_id_proveedor, V_id_estado, V_detalles, V_fecha, V_total)
    VALUES (
        FIDE_COMPRAS_TB_SEQ.NEXTVAL, -- Suponiendo que existe una secuencia para generar ID de compra
        p_id_proveedor,
        1, -- Suponiendo que 1 es el ID del estado para compras completadas
        p_detalles,
        SYSDATE,
        v_total
    );

    -- Limpiar el carrito después de realizar la compra
    DELETE FROM FIDE_CARRITO_TB WHERE V_id_cliente = p_id_cliente;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END FIDE_FINALIZAR_COMPRA;





