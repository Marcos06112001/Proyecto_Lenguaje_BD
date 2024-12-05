--PAQUETE
CREATE OR REPLACE PACKAGE FIDE_PROYECTO_PKG AS

--PROCEDIMIENTOS 

--PROCEDIMIENTOS FIDE_DESCRIPCION_INSERTAR_SP
PROCEDURE FIDE_DESCRIPCION_INSERTAR_SP (
  P_descripcion IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP
PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_PRECIO_SP (
  P_id_producto IN NUMBER,
  P_nuevo_precio IN NUMBER
);

--PROCEDIMIENTOS FIDE_CATEGORIAS_ELIMINAR_SP
PROCEDURE FIDE_CATEGORIAS_ELIMINAR_SP (
  P_id_categoria IN INT
);

--PROCEDIMIENTOS FIDE_CATEGORIAS_SELECCIONAR_SP
PROCEDURE FIDE_CATEGORIAS_SELECCIONAR_SP (
  P_id_categoria IN INT
);

--PROCEDIMIENTOS FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP
PROCEDURE FIDE_CATEGORIAS_ACTUALIZAR_NOMBRE_SP (
    P_id_categoria IN INT,
    P_nuevo_nombre IN VARCHAR2
);

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
);

--PROCEDIMIENTOS FIDE_CLIENTES_CONSULTAR_SP
PROCEDURE FIDE_CLIENTES_CONSULTAR_SP (
    P_id_cliente IN INT
) ;

--PROCEDIMIENTOS FIDE_PROVEEDORES_CONSULTAR_SP
PROCEDURE FIDE_PROVEEDORES_CONSULTAR_SP (
    P_id_proveedor IN INT DEFAULT NULL
);

--PROCEDIMIENTOS FIDE_ESTADOS_CONSULTAR_SP
PROCEDURE FIDE_ESTADOS_CONSULTAR_SP (
    P_id_estado IN INT
);

--PROCEDIMIENTOS FIDE_CATEGORIAS_INSERTAR_SP
PROCEDURE FIDE_CATEGORIAS_INSERTAR_SP (
    P_nombre_categoria IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_SP
PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_SP (
    P_id_producto IN INT,
    P_nombre_producto IN VARCHAR2,
    P_precio IN NUMBER
);

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_SP
PROCEDURE FIDE_CLIENTES_ELIMINAR_SP (
    P_id_cliente IN INT
);

--PROCEDIMIENTOS FIDE_VENTA_CONSULTAR_SP
PROCEDURE FIDE_VENTA_CONSULTAR_SP (
    P_id_venta IN INT
);

--PROCEDIMIENTOS FIDE_PROVEEDORES_INSERTAR_SP
PROCEDURE FIDE_PROVEEDORES_INSERTAR_SP (
    P_id_proveedor IN INT,
    P_nombre_proveedor IN VARCHAR2,
    P_contacto_proveedor IN VARCHAR2,
    P_email_proveedor IN VARCHAR2,
    P_telefono_proveedor IN VARCHAR2,
    P_direccion_proveedor IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_RECLAMACIONES_ACTUALIZAR_SP
PROCEDURE FIDE_RECLAMACIONES_ACTUALIZAR_SP (
    P_id_reclamacion IN INT,
    P_fecha IN DATE
);

--PROCEDIMIENTOS FIDE_PRODUCTOS_ELIMINAR_SP
PROCEDURE FIDE_PRODUCTOS_ELIMINAR_SP (
    P_id_producto IN INT
);

--PROCEDIMIENTOS FIDE_DETALLE_VENTA_CONSULTAR_SP
PROCEDURE FIDE_DETALLE_VENTA_CONSULTAR_SP (
    P_id_detalle_venta IN INT
);

--PROCEDIMIENTOS FIDE_PROMOCIONES_INSERTAR_SP
PROCEDURE FIDE_PROMOCIONES_INSERTAR_SP (
    P_id_estado IN INT,
    P_nombre_promocion IN VARCHAR2,
    P_descripcion_promocion IN VARCHAR2,
    P_fecha_inicio IN DATE,
    P_fecha_fin IN DATE,
    P_descuento IN NUMBER
);

--PROCEDIMIENTOS FIDE_RECLAMACIONES_MOTIVO_INSERTAR_SP
PROCEDURE FIDE_RECLAMACIONES_MOTIVO_INSERTAR_SP (
    p_v_nombre_cliente IN FIDE_CLIENTES_TB.V_nombre_cliente%TYPE,
    P_categoria IN FIDE_MOTIVOS_TB.V_categoria%TYPE,
    P_descripcion IN FIDE_DESCRIPCION_TB.V_descripcion%TYPE,
    P_fecha IN FIDE_RECLAMACIONES_TB.V_fecha%TYPE
);

--PROCEDIMIENTOS FIDE_PROVEEDORES_ACTUALIZAR_SP
PROCEDURE FIDE_PROVEEDORES_ACTUALIZAR_SP (
    P_id_proveedor IN INT,
    P_nombre_proveedor IN VARCHAR2,
    P_contacto_proveedor IN VARCHAR2,
    P_email_proveedor IN VARCHAR2,
    P_telefono_proveedor IN VARCHAR2,
    P_direccion_proveedor IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_PRODUCTOS_CONSULTAR_SP
PROCEDURE FIDE_PRODUCTOS_CONSULTAR_SP (
    P_id_producto IN INT
);

--PROCEDIMIENTOS FIDE_DETALLE_VENTA_INSERTAR_SP
PROCEDURE FIDE_DETALLE_VENTA_INSERTAR_SP (
    P_id_detalle_venta IN INT,
    P_id_venta IN INT,
    P_id_producto IN INT,
    P_cantidad IN NUMBER,
    P_precio_unitario IN NUMBER,
    P_subtotal IN NUMBER
);

--PROCEDIMIENTOS FIDE_PROVEEDORES_ELIMINAR_SP
PROCEDURE FIDE_PROVEEDORES_ELIMINAR_SP (
    P_id_proveedor IN INT
);

--PROCEDIMIENTOS FIDE_PROMOCIONES_CONSULTAR_SP
PROCEDURE FIDE_PROMOCIONES_CONSULTAR_SP (
    P_id_promocion IN INT
);

--PROCEDIMIENTOS FIDE_REABASTECIMIENTO_CONSULTAR_SP
PROCEDURE FIDE_REABASTECIMIENTO_CONSULTAR_SP (
    P_id_reabastecimiento IN INT
) ;

--PROCEDIMIENTOS FIDE_CLIENTES_SELECCIONAR_SP
PROCEDURE FIDE_CLIENTES_SELECCIONAR_SP (
    P_id_cliente IN FIDE_CLIENTES_TB.V_id_cliente%TYPE,
    V_nombre_cliente OUT FIDE_CLIENTES_TB.V_nombre_cliente%TYPE,
    V_apellido_cliente OUT FIDE_CLIENTES_TB.V_apellido_cliente%TYPE,
    V_email OUT FIDE_CLIENTES_TB.V_email%TYPE,
    V_telefono OUT FIDE_CLIENTES_TB.V_telefono%TYPE,
    V_imagen OUT FIDE_CLIENTES_TB.V_imagen%TYPE
);

--PROCEDIMIENTOS FIDE_CLIENTES_SELECCIONAR_SP
PROCEDURE FIDE_CLIENTES_SELECCIONAR_SP (
    p_user_id IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_apellido OUT VARCHAR2,
    p_email OUT VARCHAR2,
    p_telefono OUT VARCHAR2,
    p_direccion OUT VARCHAR2,
    p_imagen OUT VARCHAR2
);

--PROCEDIMIENTOS FIDE_INSERTAR_RESENA_SP
PROCEDURE FIDE_INSERTAR_RESENA_SP (
  p_v_nombre_producto IN FIDE_PRODUCTOS_TB.V_nombre_producto%TYPE,
  p_v_nombre_cliente IN FIDE_CLIENTES_TB.V_nombre_cliente%TYPE,
  p_v_calificacion IN FIDE_RESENAS_PRODUCTO_TB.V_calificacion%TYPE,
  p_v_comentario IN FIDE_RESENAS_PRODUCTO_TB.V_comentario%TYPE,
  p_v_fecha IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_EMPLEADOS_ACTUALIZAR_SP
PROCEDURE FIDE_EMPLEADOS_ACTUALIZAR_SP (
    P_id_empleado IN INT,
    P_nombre_empleado IN VARCHAR2,
    P_apellido_empleado IN VARCHAR2,
    P_email IN VARCHAR2,
    P_telefono IN VARCHAR2,
    P_direccion IN VARCHAR2,
    P_imagen IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_EMPLEADOS_INSERTAR_SP
PROCEDURE FIDE_EMPLEADOS_INSERTAR_SP (
    P_id_estado IN INT,
    P_nombre_empleado IN VARCHAR2,
    P_apellido_empleado IN VARCHAR2,
    P_email IN VARCHAR2,
    P_telefono IN VARCHAR2,
    P_direccion IN VARCHAR2,
    P_imagen IN VARCHAR2
);


--PROCEDIMIENTOS FIDE_AGREGAR_A_CARRITO_SP
PROCEDURE FIDE_AGREGAR_A_CARRITO_SP (
    p_id_cliente IN FIDE_CARRITO_TB.V_id_cliente%TYPE,
    p_id_producto IN FIDE_CARRITO_TB.V_id_producto%TYPE,
    p_cantidad IN FIDE_CARRITO_TB.V_cantidad%TYPE
);

--PROCEDIMIENTOS FIDE_FINALIZAR_COMPRA
PROCEDURE FIDE_FINALIZAR_COMPRA(
    p_id_cliente IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_detalles IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_PRODUCTOS_ACTUALIZAR_SP
PROCEDURE FIDE_PRODUCTOS_ACTUALIZAR_SP (
    P_id_producto IN INT,
    P_id_categoria IN INT,
    P_id_estado IN INT,
    P_nombre_producto IN VARCHAR2,
    P_descripcion_producto IN VARCHAR2,
    P_precio IN NUMBER,
    P_imagen IN VARCHAR2
);

--PROCEDIMIENTOS FIDE_AGREGAR_PRODUCTO_SP
PROCEDURE FIDE_AGREGAR_PRODUCTO_SP (
    p_id_categoria IN NUMBER,
    p_id_estado IN NUMBER,
    p_nombre_producto IN VARCHAR2,
    p_descripcion_producto IN VARCHAR2,
    p_precio IN NUMBER,
    p_imagen IN VARCHAR2
);

--FUNCIONES

--FUNCIONES FIDE_CATEGORIAS_SELECT_FN
FUNCTION FIDE_CATEGORIAS_SELECT_FN (
  P_id_categoria INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_ESTADOS_SELECT_FN
FUNCTION FIDE_ESTADOS_SELECT_FN (
  P_id_estado INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_PRODUCTOS_SELECT_FN
FUNCTION FIDE_PRODUCTOS_SELECT_FN (
  P_id_producto INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_CLIENTES_SELECT_FN
FUNCTION FIDE_CLIENTES_SELECT_FN (
  P_id_cliente INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_EMPLEADOS_SELECT_FN
FUNCTION FIDE_EMPLEADOS_SELECT_FN (
  P_id_empleado INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_PROVEEDORES_SELECT_FN
FUNCTION FIDE_PROVEEDORES_SELECT_FN (
  P_id_proveedor INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_CARRITO_SELECT_FN
FUNCTION FIDE_CARRITO_SELECT_FN (
  P_id_carrito INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_VENTA_TOTAL_SELECT_FN
FUNCTION FIDE_VENTA_TOTAL_SELECT_FN (
  P_id_venta INT
) RETURN NUMBER;

--FUNCIONES FIDE_DETALLE_VENTA_SELECT_FN
FUNCTION FIDE_DETALLE_VENTA_SELECT_FN (
  P_id_detalle_venta INT
) RETURN VARCHAR2 ;

--FUNCIONES FIDE_RECLAMACIONES_SELECT_FN
FUNCTION FIDE_RECLAMACIONES_SELECT_FN (
  P_id_reclamacion INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_DESCRIPCION_SELECT_FN
FUNCTION FIDE_DESCRIPCION_SELECT_FN (
  P_id_descripcion INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_MOTIVOS_CATEGORIA_SELECT_FN
FUNCTION FIDE_MOTIVOS_CATEGORIA_SELECT_FN (
  P_id_motivo INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_PROMOCIONES_SELECT_FN
FUNCTION FIDE_PROMOCIONES_SELECT_FN (
  P_id_promocion INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_RESENAS_PRODUCTO_SELECT_FN
FUNCTION FIDE_RESENAS_PRODUCTO_SELECT_FN (
  P_id_resena_producto INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_COMPRAS_SELECT_FN
FUNCTION FIDE_COMPRAS_SELECT_FN (
  P_id_compra INT
) RETURN VARCHAR2;

--FUNCIONES FIDE_CLIENTES_SELECT_BY_EMAIL_FN
FUNCTION FIDE_CLIENTES_SELECT_BY_EMAIL_FN (
  P_email_cliente VARCHAR2
) RETURN VARCHAR2;

--FUNCIONES FIDE_PROVEEDORES_SELECT_BY_NAME_FN
FUNCTION FIDE_PROVEEDORES_SELECT_BY_NAME_FN (
  P_nombre_proveedor VARCHAR2
) RETURN INT;

--FUNCIONES FIDE_CLIENTE_TB_OBTENER_INFO_FN
FUNCTION FIDE_CLIENTE_TB_OBTENER_INFO_FN(
    P_cliente_id IN INT
) RETURN cliente_info_t;

--FUNCIONES OBTENER_REABASTECIMIENTO_STOCK
FUNCTION OBTENER_REABASTECIMIENTO_STOCK
RETURN SYS_REFCURSOR;

--FUNCIONES FIDE_ORDEN_SELECT_FN
FUNCTION FIDE_ORDEN_SELECT_FN (
  P_id_evento INT
) RETURN VARCHAR2;

END FIDE_PROYECTO_PKG; 