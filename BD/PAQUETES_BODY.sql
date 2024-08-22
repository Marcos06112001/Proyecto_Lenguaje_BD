--PAQUETE BOBY
CREATE OR REPLACE PACKAGE BODY FIDE_PROYECTO_PKG AS

--PROCEDIMIENTOS 
--PROCEDIMIENTOS FIDE_DESCRIPCION_INSERTAR_SP
PROCEDURE FIDE_DESCRIPCION_INSERTAR_SP (
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

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP
PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP (
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

--PROCEDIMIENTOS FIDE_CATEGORIAS_ELIMINAR_SP
PROCEDURE FIDE_CATEGORIAS_ELIMINAR_SP (
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

--PROCEDIMIENTOS FIDE_CATEGORIAS_SELECCIONAR_SP
PROCEDURE FIDE_CATEGORIAS_SELECCIONAR_SP (
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

--PROCEDIMIENTOS FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP
PROCEDURE FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP (
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

--PROCEDIMIENTOS FIDE_CLIENTES_ACTUALIZAR_SP
PROCEDURE FIDE_CLIENTES_ACTUALIZAR_SP (
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

--PROCEDIMIENTOS FIDE_CLIENTES_CONSULTAR_SP
PROCEDURE FIDE_CLIENTES_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_PROVEEDORES_CONSULTAR_SP
PROCEDURE FIDE_PROVEEDORES_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_ESTADOS_CONSULTAR_SP
PROCEDURE FIDE_ESTADOS_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_CATEGORIAS_INSERTAR_SP
PROCEDURE FIDE_CATEGORIAS_INSERTAR_SP (
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

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_SP
PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_SP (
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

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_SP
PROCEDURE FIDE_CLIENTES_ELIMINAR_SP (
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

--PROCEDIMIENTOS FIDE_VENTA_CONSULTAR_SP
PROCEDURE FIDE_VENTA_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_PROVEEDORES_INSERTAR_SP
PROCEDURE FIDE_PROVEEDORES_INSERTAR_SP (
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

--PROCEDIMIENTOS FIDE_RECLAMACIONES_ACTUALIZAR_SP
PROCEDURE FIDE_RECLAMACIONES_ACTUALIZAR_SP (
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

--PROCEDIMIENTOS FIDE_PRODUCTOS_ELIMINAR_SP
PROCEDURE FIDE_PRODUCTOS_ELIMINAR_SP (
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

--PROCEDIMIENTOS FIDE_DETALLE_VENTA_CONSULTAR_SP
PROCEDURE FIDE_DETALLE_VENTA_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_PROMOCIONES_INSERTAR_SP
PROCEDURE FIDE_PROMOCIONES_INSERTAR_SP (
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

--PROCEDIMIENTOS FIDE_RECLAMACIONES_MOTIVO_INSERTAR_SP
PROCEDURE FIDE_RECLAMACIONES_MOTIVO_INSERTAR_SP (
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


--PROCEDIMIENTOS FIDE_PROVEEDORES_ACTUALIZAR_SP
PROCEDURE FIDE_PROVEEDORES_ACTUALIZAR_SP (
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

--PROCEDIMIENTOS FIDE_PRODUCTOS_CONSULTAR_SP
PROCEDURE FIDE_PRODUCTOS_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_DETALLE_VENTA_INSERTAR_SP
PROCEDURE FIDE_DETALLE_VENTA_INSERTAR_SP (
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

--PROCEDIMIENTOS FIDE_PROVEEDORES_ELIMINAR_SP
PROCEDURE FIDE_PROVEEDORES_ELIMINAR_SP (
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

--PROCEDIMIENTOS FIDE_PROMOCIONES_CONSULTAR_SP
PROCEDURE FIDE_PROMOCIONES_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_REABASTECIMIENTO_CONSULTAR_SP
PROCEDURE FIDE_REABASTECIMIENTO_CONSULTAR_SP (
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

--PROCEDIMIENTOS FIDE_CLIENTES_SELECCIONAR_SP
PROCEDURE FIDE_CLIENTES_SELECCIONAR_SP (
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

--PROCEDIMIENTOS FIDE_CLIENTES_SELECCIONAR_SP
PROCEDURE FIDE_CLIENTES_SELECCIONAR_SP (
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

--PROCEDIMIENTOS FIDE_INSERTAR_RESENA_SP
PROCEDURE FIDE_INSERTAR_RESENA_SP (
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

--PROCEDIMIENTOS FIDE_EMPLEADOS_ACTUALIZAR_SP
PROCEDURE FIDE_EMPLEADOS_ACTUALIZAR_SP (
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

--PROCEDIMIENTOS FIDE_EMPLEADOS_INSERTAR_SP
PROCEDURE FIDE_EMPLEADOS_INSERTAR_SP (
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

--PROCEDIMIENTOS FIDE_AGREGAR_A_CARRITO_SP
PROCEDURE FIDE_AGREGAR_A_CARRITO_SP (
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
        -- Si existe, actualiza la cantidad y subtotal
        UPDATE FIDE_CARRITO_TB
        SET V_cantidad = V_cantidad + p_cantidad,
            V_subtotal = (V_cantidad + p_cantidad) * V_precio_unitario
        WHERE V_id_cliente = p_id_cliente
        AND V_id_producto = p_id_producto;
    ELSE
        -- Obtén el precio unitario del producto
        BEGIN
            SELECT V_precio
            INTO v_precio_unitario
            FROM FIDE_PRODUCTOS_TB
            WHERE V_id_producto = p_id_producto;
            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001, 'Producto no encontrado en FIDE_PRODUCTOS_TB');
        END;

        -- Inserta un nuevo registro en el carrito
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
            FIDE_CARRITO_TB_SEQ.NEXTVAL,
            p_id_cliente,
            p_id_producto,
            1, 
            p_cantidad,
            v_precio_unitario,
            p_cantidad * v_precio_unitario
        );
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;

--PROCEDIMIENTOS FIDE_FINALIZAR_COMPRA
PROCEDURE FIDE_FINALIZAR_COMPRA(
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
        FIDE_COMPRAS_TB_SEQ.NEXTVAL, 
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
END;

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_SP
PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_SP (
    P_id_producto IN INT,
    P_id_categoria IN INT,
    P_id_estado IN INT,
    P_nombre_producto IN VARCHAR2,
    P_descripcion_producto IN VARCHAR2,
    P_precio IN NUMBER,
    P_imagen IN VARCHAR2
) AS
BEGIN
    -- Actualizar la información del producto
    UPDATE FIDE_PRODUCTOS_TB
    SET V_id_categoria = P_id_categoria,
        V_id_estado = P_id_estado,
        V_nombre_producto = P_nombre_producto,
        V_descripcion_producto = P_descripcion_producto,
        V_precio = P_precio,
        V_imagen = P_imagen
    WHERE V_id_producto = P_id_producto;
END;

--PROCEDIMIENTOS FIDE_AGREGAR_PRODUCTO_SP
PROCEDURE FIDE_AGREGAR_PRODUCTO_SP (
    p_id_categoria IN NUMBER,
    p_id_estado IN NUMBER,
    p_nombre_producto IN VARCHAR2,
    p_descripcion_producto IN VARCHAR2,
    p_precio IN NUMBER,
    p_imagen IN VARCHAR2
) AS
BEGIN
    BEGIN
        INSERT INTO FIDE_PRODUCTOS_TB (
            V_ID_PRODUCTO,  -- ID autogenerado por la secuencia
            V_ID_CATEGORIA,
            V_ID_ESTADO,
            V_NOMBRE_PRODUCTO,
            V_DESCRIPCION_PRODUCTO,
            V_PRECIO,
            V_IMAGEN
        ) VALUES (
            FIDE_PRODUCTOS_SEQ.NEXTVAL, -- ID autogenerado por la secuencia
            p_id_categoria,
            p_id_estado,
            p_nombre_producto,
            p_descripcion_producto,
            p_precio,
            p_imagen
        );
    EXCEPTION
        WHEN OTHERS THEN
            -- Captura y muestra el error
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RAISE;
    END;
END;

--FUNCIONES

--FUNCIONES FIDE_CATEGORIAS_SELECT_FN
FUNCTION FIDE_CATEGORIAS_SELECT_FN (
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

--FUNCIONES FIDE_ESTADOS_SELECT_FN
FUNCTION FIDE_ESTADOS_SELECT_FN (
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

--FUNCIONES FIDE_PRODUCTOS_SELECT_FN
FUNCTION FIDE_PRODUCTOS_SELECT_FN (
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

--FUNCIONES FIDE_CLIENTES_SELECT_FN
FUNCTION FIDE_CLIENTES_SELECT_FN (
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

--FUNCIONES FIDE_EMPLEADOS_SELECT_FN
FUNCTION FIDE_EMPLEADOS_SELECT_FN (
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

--FUNCIONES FIDE_PROVEEDORES_SELECT_FN
FUNCTION FIDE_PROVEEDORES_SELECT_FN (
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

--FUNCIONES FIDE_CARRITO_SELECT_FN
FUNCTION FIDE_CARRITO_SELECT_FN (
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

--FUNCIONES FIDE_VENTA_TOTAL_SELECT_FN
FUNCTION FIDE_VENTA_TOTAL_SELECT_FN (
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

--FUNCIONES FIDE_DETALLE_VENTA_SELECT_FN
FUNCTION FIDE_DETALLE_VENTA_SELECT_FN (
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

--FUNCIONES FIDE_RECLAMACIONES_SELECT_FN
FUNCTION FIDE_RECLAMACIONES_SELECT_FN (
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

--FUNCIONES FIDE_DESCRIPCION_SELECT_FN
FUNCTION FIDE_DESCRIPCION_SELECT_FN (
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

--FUNCIONES FIDE_MOTIVOS_CATEGORIA_SELECT_FN
FUNCTION FIDE_MOTIVOS_CATEGORIA_SELECT_FN (
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

--FUNCIONES FIDE_PROMOCIONES_SELECT_FN
FUNCTION FIDE_PROMOCIONES_SELECT_FN (
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

--FUNCIONES FIDE_RESENAS_PRODUCTO_SELECT_FN
FUNCTION FIDE_RESENAS_PRODUCTO_SELECT_FN (
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

--FUNCIONES FIDE_COMPRAS_SELECT_FN
FUNCTION FIDE_COMPRAS_SELECT_FN (
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

--FUNCIONES FIDE_CLIENTES_SELECT_BY_EMAIL_FN
FUNCTION FIDE_CLIENTES_SELECT_BY_EMAIL_FN (
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

--FUNCIONES FIDE_PROVEEDORES_SELECT_BY_NAME_FN
FUNCTION FIDE_PROVEEDORES_SELECT_BY_NAME_FN (
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

--FUNCIONES FIDE_CLIENTE_TB_OBTENER_INFO_FN
FUNCTION FIDE_CLIENTE_TB_OBTENER_INFO_FN(
    P_cliente_id IN INT
) RETURN cliente_info_t IS
    V_cliente_info cliente_info_t;
BEGIN
    SELECT cliente_info_t(V_NOMBRE_CLIENTE, V_APELLIDO_CLIENTE, V_EMAIL, V_TELEFONO, V_DIRECCION, V_IMAGEN)
    INTO V_cliente_info
    FROM FIDE_CLIENTES_TB
    WHERE V_ID_CLIENTE = P_cliente_id;

    RETURN V_cliente_info;
END;

--FUNCIONES OBTENER_REABASTECIMIENTO_STOCK
FUNCTION OBTENER_REABASTECIMIENTO_STOCK
RETURN SYS_REFCURSOR
AS
  p_cursor SYS_REFCURSOR;
BEGIN
  OPEN p_cursor FOR 
  SELECT s.v_id_reabastecimiento,
         p.v_nombre_producto AS NOMBRE_PRODUCTO,
         c.v_nombre_categoria AS NOMBRE_CATEGORIA
  FROM FIDE_REABASTECIMIENTO_STOCK_TB S
  JOIN 
      FIDE_PRODUCTOS_TB p ON s.v_id_producto = p.v_id_producto
    JOIN 
      FIDE_CATEGORIAS_TB c ON p.v_id_categoria = c.v_id_categoria;
  RETURN p_cursor;
END;

--FUNCIONES FIDE_ORDEN_SELECT_FN
FUNCTION FIDE_ORDEN_SELECT_FN (
  P_id_evento INT
) RETURN VARCHAR2 IS
  V_descripcion VARCHAR2(255);
BEGIN
  SELECT V_descripcion INTO V_descripcion
  FROM FIDE_ORDEN_DEL_DIA_TB
  WHERE V_id_evento = P_id_evento;
  RETURN V_descripcion;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No encontrado';
  WHEN OTHERS THEN
    RETURN 'Fallido: ' || SQLERRM;
END;

END FIDE_PROYECTO_PKG; 


