--CREADO POR NICOLE Hidalgo
--FECHA 20/07/2024
--CREACION DE UNA TABLA PARA ESTADOS (ACTIVO/INAGTIVOS) DONDE SU LLAVE PRIMARIA VA SER  V_id_estado
--TABLA #1 
--CREACI?N DE UNA TABLA QUE CONTIENE LOS ATRIBUTOS V_id_estado Y V_descripcion, SIENDO V_id_estado LA LLAVE PRIMARIA Y V_descripcion VARCHAR2
CREATE TABLE FIDE_ESTADOS_TB (
  V_id_estado INT PRIMARY KEY ,
  V_descripcion VARCHAR2(50)
);

--CREADO POR NICOLE Hidalgo
--FECHA 20/07/2024
--CREACION DE UNA TABLA PARA CATEGORIA DONDE SU LLAVE PRIMARIA VA SER V_id_categoria
--TABLA #2 
--CREACI?N DE UNA TABLA QUE CONTIENE LOS ATRIBUTOS V_id_categoria  Y V_nombre_categoria, SIENDO V_id_categoria LA LLAVE PRIMARIA Y V_nombre_categoria VARCHAR2
CREATE TABLE FIDE_CATEGORIAS_TB (
  V_id_categoria INT PRIMARY KEY ,
  V_nombre_categoria VARCHAR2(255)
);
 
--CREADO POR NICOLE Hidalgo
--FECHA 20/07/2024
--CREACION DE UNA TABLA PARA PRODUCTOS DONDE SU LLAVE PRIMARIA VA SER V_id_producto
--TABLA #3
--CREACI?N DE UNA TABLA QUE CONTIENE LOS ATRIBUTOS V_id_producto, V_id_categoria,V_id_estado,V_nombre_producto,V_descripcion_producto, V_precio Y 
--V_imagen, SIENDO V_id_producto LA LLAVE PRIMARIA,  V_id_categoria Y V_id_estado LA LLAVE FORANIA, V_nombre_producto VARCHAR2, V_descripcion_producto
--VARCHAR2, V_precio NUMBER Y V_imagen VARCHAR2
CREATE TABLE FIDE_PRODUCTOS_TB (
  V_id_producto INT PRIMARY KEY,
  V_id_categoria INT,
  V_id_estado INT,
  V_nombre_producto VARCHAR2(255),
  V_descripcion_producto VARCHAR2(255),
  V_precio NUMBER(10, 2),
  V_imagen VARCHAR2(255),
  CONSTRAINT FK_PRODUCTOS_CATEGORIAS FOREIGN KEY (V_id_categoria) REFERENCES FIDE_CATEGORIAS_TB(V_id_categoria),
  CONSTRAINT FK_PRODUCTOS_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--CREADO POR NICOLE Hidalgo
--FECHA 20/07/2024
--CREACION DE UNA TABLA PARA CLIENTES DONDE SU LLAVE PRIMARIA VA SER V_id_cliente
--TABLA #4
--CREACI?N DE UNA TABLA QUE CONTIENE LOS ATRIBUTOS V_id_cliente INT PRIMARY KEY,V_nombre_cliente), V_apellido_cliente VARCHAR2(255),V_email, V_telefono,
--V_direccion,V_imagen,V_rol VARCHAR2(50),V_pass,
--SIENDO V_id_cliente LA LLAVE PRIMARIA,  V_apellido_cliente VARCHAR2(255),V_email VARCHAR2,V_telefono VARCHAR2,V_imagen VARCHAR2,
--V_rol VARCHAR2,V_pass VARCHAR2 Y  V_direccion CLOB *POSIBLE CAMBIO* 
CREATE TABLE FIDE_CLIENTES_TB (
  V_id_cliente INT PRIMARY KEY,
  V_nombre_cliente VARCHAR2(255),
  V_apellido_cliente VARCHAR2(255),
  V_email VARCHAR2(255),
  V_telefono VARCHAR2(20),
  V_direccion CLOB,
  V_imagen VARCHAR2(255),
  V_rol VARCHAR2(50),
  V_pass VARCHAR2(50)
);
 
--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 20/07/2024
--TABLA #5
--TABLA FIDE_EMPLEADOS_TB 
--La llave primaria es V_id_empleado
CREATE TABLE FIDE_EMPLEADOS_TB (
  V_id_empleado INT PRIMARY KEY,
  V_id_estado INT,
  V_nombre_empleado VARCHAR2(255),
  V_apellido_empleado VARCHAR2(255),
  V_email VARCHAR2(255),
  V_telefono VARCHAR2(20),
  V_direccion VARCHAR2(255),
  V_imagen VARCHAR2(255),
  CONSTRAINT FK_EMPLEADOS_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 20/07/2024
--TABLA #6
--TABLA FIDE_PROVEEDORES_TB
--La llave primaria es V_id_proveedor
CREATE TABLE FIDE_PROVEEDORES_TB (
  V_id_proveedor INT PRIMARY KEY,
  V_id_estado INT,
  V_nombre_proveedor VARCHAR2(255),
  V_contacto_proveedor VARCHAR2(255),
  V_email_proveedor VARCHAR2(255),
  V_telefono_proveedor VARCHAR2(20),
  V_direccion_proveedor VARCHAR2(255),
  CONSTRAINT FK_PROVEEDORES_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 20/07/2024
--TABLA #7
--TABLA FIDE_CARRITO_TB  
--La llave primaria es V_id_carrito
CREATE TABLE FIDE_CARRITO_TB (
  V_id_carrito INT PRIMARY KEY,
  V_id_cliente INT,
  V_id_producto INT,
  V_id_estado INT,
  V_cantidad INT,
  V_precio_unitario NUMBER(10, 2),
  V_subtotal NUMBER(10, 2),
  CONSTRAINT FK_CARRITO_CLIENTES FOREIGN KEY (V_id_cliente) REFERENCES FIDE_CLIENTES_TB(V_id_cliente),
  CONSTRAINT FK_CARRITO_PRODUCTOS FOREIGN KEY (V_id_producto) REFERENCES FIDE_PRODUCTOS_TB(V_id_producto),
  CONSTRAINT FK_CARRITO_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 20/07/2024
--TABLA #8
--TABLA FIDE_VENTA_TB  
--La llave primaria es V_id_venta
CREATE TABLE FIDE_VENTA_TB (
  V_id_venta INT PRIMARY KEY,
  V_id_cliente INT,
  V_id_empleado INT,
  V_id_estado INT,
  V_fecha DATE,
  V_total NUMBER(10, 2),
  CONSTRAINT FK_VENTA_CLIENTES FOREIGN KEY (V_id_cliente) REFERENCES FIDE_CLIENTES_TB(V_id_cliente),
  CONSTRAINT FK_VENTA_EMPLEADOS FOREIGN KEY (V_id_empleado) REFERENCES FIDE_EMPLEADOS_TB(V_id_empleado),
  CONSTRAINT FK_VENTA_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);


--Creado por Anderson Espinoza Ulate 
--Tabla #9
--TABLA FIDE_DETALLE_VENTA_TB   
--La llave primaria es V_id_detalle_venta
CREATE TABLE FIDE_DETALLE_VENTA_TB (
  V_id_detalle_venta INT PRIMARY KEY,
  V_id_venta INT,
  V_id_producto INT,
  V_id_estado INT,
  V_cantidad INT,
  V_precio_unitario NUMBER(10, 2),
  V_subtotal NUMBER(10, 2),
  CONSTRAINT FK_DETALLE_VENTA_VENTA FOREIGN KEY (V_id_venta) REFERENCES FIDE_VENTA_TB(V_id_venta),
  CONSTRAINT FK_DETALLE_VENTA_PRODUCTOS FOREIGN KEY (V_id_producto) REFERENCES FIDE_PRODUCTOS_TB(V_id_producto),
  CONSTRAINT FK_DETALLE_VENTA_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);
 
--Creado por Anderson Espinoza Ulate 
--Tabla #10 
--La llave primaria es  V_id_reclamacion
--TABLA FIDE_RECLAMACIONES_TB   
CREATE TABLE FIDE_RECLAMACIONES_TB (
  V_id_reclamacion INT PRIMARY KEY,
  V_id_cliente INT,
  V_id_estado INT,
  V_fecha DATE,
  CONSTRAINT FK_RECLAMACIONES_CLIENTES FOREIGN KEY (V_id_cliente) REFERENCES FIDE_CLIENTES_TB(V_id_cliente),
  CONSTRAINT FK_RECLAMACIONES_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--Creado por Anderson Espinoza Ulate 
--Tabla #11
--La llave primaria es   V_id_descripcion
--Tabla FIDE_DESCRIPCION_TB
CREATE TABLE FIDE_DESCRIPCION_TB (
  V_id_descripcion INT PRIMARY KEY,
  V_descripcion VARCHAR2(255)
);

--Creado por Anderson Espinoza Ulate 
--Tabla #12
--La llave primaria es V_id_motivos
--TABLA FIDE_Motivos_TB 
CREATE TABLE FIDE_MOTIVOS_TB (
  V_id_motivos INT PRIMARY KEY,
  V_id_reclamacion INT,
  V_id_descripcion INT,
  V_id_estado INT,
  V_categoria VARCHAR2(255),
  V_fecha DATE,
  CONSTRAINT FK_MOTIVOS_RECLAMACIONES FOREIGN KEY (V_id_reclamacion) REFERENCES FIDE_RECLAMACIONES_TB(V_id_reclamacion),
  CONSTRAINT FK_MOTIVOS_DESCRIPCIONES FOREIGN KEY (V_id_descripcion) REFERENCES FIDE_DESCRIPCION_TB(V_id_descripcion),
  CONSTRAINT FK_MOTIVOS_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--Creado por Anderson Espinoza Ulate 
--Tabla #13
--La llave primaria es V_id_promocion
--TABLA FIDE_PROMOCIONES_TB   
CREATE TABLE FIDE_PROMOCIONES_TB (
  V_id_promocion INT PRIMARY KEY,
  V_id_estado INT,
  V_nombre_promocion VARCHAR2(255),
  V_descripcion_promocion VARCHAR2(255),
  V_fecha_inicio DATE,
  V_fecha_fin DATE,
  V_descuento NUMBER(5,2),
  CONSTRAINT FK_PROMOCIONES_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--TABLA #14
--TABLA FIDE_RESENAS_PRODUCTO_TB 
--La llave primaria es  V_id_resena_producto  
CREATE TABLE FIDE_RESENAS_PRODUCTO_TB (
  V_id_resena_producto INT PRIMARY KEY,
  V_id_producto INT,
  V_id_cliente INT,
  V_calificacion INT,
  V_comentario VARCHAR2(255),
  V_fecha DATE,
  CONSTRAINT FK_RESENAS_PRODUCTO_PRODUCTOS FOREIGN KEY (V_id_producto) REFERENCES FIDE_PRODUCTOS_TB(V_id_producto),
  CONSTRAINT FK_RESENAS_PRODUCTO_CLIENTES FOREIGN KEY (V_id_cliente) REFERENCES FIDE_CLIENTES_TB(V_id_cliente)
);
--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--TABLA #15
--La llave primaria es  V_id_compra
--TABLA FIDE_COMPRAS_TB  
CREATE TABLE FIDE_COMPRAS_TB (
  V_id_compra INT PRIMARY KEY,
  V_id_proveedor INT,
  V_id_estado INT,
  V_detalles VARCHAR2(255),
  V_fecha DATE,
  V_total NUMBER(10, 2),
  CONSTRAINT FK_COMPRAS_PROVEEDORES FOREIGN KEY (V_id_proveedor) REFERENCES FIDE_PROVEEDORES_TB(V_id_proveedor),
  CONSTRAINT FK_COMPRAS_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);
 --CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--TABLA #16
--La llave primaria es V_id_evento 
--TABLA FIDE_ORDEN_DEL_DIA_TB  
CREATE TABLE FIDE_ORDEN_DEL_DIA_TB (
  V_id_evento INT PRIMARY KEY,
  V_id_empleado INT,
  V_id_estado INT,
  V_titulo VARCHAR2(255),
  V_descripcion  VARCHAR2(255),
  V_fecha_inicio DATE,
  V_fecha_fin DATE,
  CONSTRAINT FK_ORDEN_DEL_DIA_EMPLEADOS FOREIGN KEY (V_id_empleado) REFERENCES FIDE_EMPLEADOS_TB(V_id_empleado),
  CONSTRAINT FK_ORDEN_DEL_DIA_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);
 --CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--TABLA #17
--La llave primaria es V_id_reabastecimiento
--TABLA FIDE_REABASTECIMIENTO_STOCK_TB  
CREATE TABLE FIDE_REABASTECIMIENTO_STOCK_TB (
  V_id_reabastecimiento INT PRIMARY KEY,
  V_id_producto INT,
  V_id_estado INT,
  V_cantidad INT,
  V_fecha DATE,
  V_estado VARCHAR2(255),
  CONSTRAINT FK_REABASTECIMIENTO_STOCK_PRODUCTOS FOREIGN KEY (V_id_producto) REFERENCES FIDE_PRODUCTOS_TB(V_id_producto),
  CONSTRAINT FK_REABASTECIMIENTO_STOCK_ESTADOS FOREIGN KEY (V_id_estado) REFERENCES FIDE_ESTADOS_TB(V_id_estado)
);
 --CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--INSERT #1
--INSERTS DE LAS TABLAS 
--INSERTS DE LAS TABLAS FIDE_CATEGORIAS_TB
INSERT INTO FIDE_CATEGORIAS_TB (V_nombre_categoria) VALUES ('Electr?nica');
INSERT INTO FIDE_CATEGORIAS_TB (V_nombre_categoria) VALUES ('Electrodom?sticos');
INSERT INTO FIDE_CATEGORIAS_TB (V_nombre_categoria) VALUES ('Muebles');

 --CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--INSERT #2
--INSERTS DE LAS TABLAS FIDE_Descripcion_TB (solo estas 3 opciones van a existir)
INSERT INTO FIDE_DESCRIPCION_TB (V_descripcion) VALUES ('Producto defectuaso');
INSERT INTO FIDE_DESCRIPCION_TB (V_descripcion) VALUES ('Entrega tard?a');
INSERT INTO FIDE_DESCRIPCION_TB (V_descripcion) VALUES ('Facturaci?n incorrecta');

 --CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--INSERT #3
--INSERTS DE LAS TABLAS FIDE_Estado_TB (solo estas 2 opciones van a existir)
INSERT INTO FIDE_ESTADOS_TB (V_descripcion) VALUES ('Activo');
INSERT INTO FIDE_ESTADOS_TB (V_descripcion) VALUES ('Inactivo');

 --CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 20/07/2024
--INSERT #4
--INSERTS DE LAS TABLAS FIDE_Motivos_TB (solo estas 3 categorias van a existir) producto, facturaci?n y entrega 
INSERT INTO FIDE_MOTIVOS_TB (V_id_reclamacion, V_id_descripcion, V_id_activo, V_categoria, V_fecha) VALUES ('');

--SELECTS 
SELECT * FROM FIDE_CATEGORIAS_TB;