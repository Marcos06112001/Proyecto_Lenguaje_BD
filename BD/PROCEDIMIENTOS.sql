--Para visualizar los comentarios 
SET SERVEROUTPUT ON;
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
/
 
BEGIN
  FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP(4, 99);
END;
/

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
    P_id_categoria IN INT,
    P_nombre_categoria IN VARCHAR2
) AS
BEGIN
    -- Insertar una nueva categoría
    INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria)
    VALUES (P_id_categoria, P_nombre_categoria);

    DBMS_OUTPUT.PUT_LINE('Categoría insertada: ' || P_nombre_categoria);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: La categoría con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar categoría: ' || SQLERRM);
END;

BEGIN
    FIDE_CATEGORIAS_INSERTAR_SP(
        P_id_categoria => 1, 
        P_nombre_categoria => 'Electronics' -- Reemplaza con el nombre de la categoría deseada
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
CREATE OR REPLACE PROCEDURE FIDE_PROMOCIONES_INSERTAR_SP (
    P_id_promocion IN INT,
    P_nombre_promocion IN VARCHAR2,
    P_descripcion_promocion IN VARCHAR2,
    P_fecha_inicio IN DATE,
    P_fecha_fin IN DATE,
    P_descuento IN NUMBER
) AS
BEGIN
    -- Insertar una nueva promoción
    INSERT INTO FIDE_PROMOCIONES_TB (V_id_promocion, V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento)
    VALUES (P_id_promocion, P_nombre_promocion, P_descripcion_promocion, P_fecha_inicio, P_fecha_fin, P_descuento);

    DBMS_OUTPUT.PUT_LINE('Promoción insertada: ' || P_nombre_promocion);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: La promoción con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar promoción: ' || SQLERRM);
END;

BEGIN
    FIDE_PROMOCIONES_INSERTAR_SP(
        P_id_promocion => 1, 
        P_nombre_promocion => 'Descuento Verano', 
        P_descripcion_promocion => '20% de descuento en todos los productos',
        P_fecha_inicio => DATE '2024-07-01', 
        P_fecha_fin => DATE '2024-07-31', 
        P_descuento => 20
    );
END;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 26/07/2024
--procedimiento almacenado #20
-- Insertar Reclamación
CREATE OR REPLACE PROCEDURE FIDE_RECLAMACIONES_INSERTAR_SP (
    P_id_reclamacion IN INT,
    P_id_cliente IN INT,
    P_fecha IN DATE,
    P_id_estado IN INT
) AS
BEGIN
    -- Insertar una nueva reclamación
    INSERT INTO FIDE_RECLAMACIONES_TB (v_id_reclamacion, v_id_cliente,v_fecha, v_id_estado)
    VALUES (P_id_reclamacion, P_id_cliente, P_fecha, P_id_estado);

    DBMS_OUTPUT.PUT_LINE('Reclamación insertada con ID: ' || P_id_reclamacion);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: La reclamación con el ID especificado ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar reclamación: ' || SQLERRM);
END;

BEGIN
    FIDE_RECLAMACIONES_INSERTAR_SP(
        P_id_reclamacion => 1,
        P_id_cliente => 1,
        P_fecha => SYSDATE,
        P_id_estado => 1
    );
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

