--INSERTS DE LAS TABLAS 
--CREADO POR Nicole Hidalgo
--FECHA 25/07/2024
--INSERT #1
--INSERT DE LA TABLA FIDE_ESTADOS_TB  
--LA DESCRIPCION TIENE 2 ESTADOS (ACTIVO/INACTIVO)
INSERT INTO FIDE_ESTADOS_TB (V_id_estado, V_descripcion) VALUES (1, 'Activo');
INSERT INTO FIDE_ESTADOS_TB (V_id_estado, V_descripcion) VALUES (2, 'Inactivo');

--CREADO POR Nicole Hidalgo
--FECHA 25/07/2024
--INSERT #2
--INSERT DE LA TABLA FIDE_CATEGORIAS_TB  
--El ATRIBUTO V_nombre_categoria TIENE UN TOTAL DE 21 CATEFORIAS 
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (1, 'Portátiles');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (2, 'Cocinas');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (3, 'Microondas');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (4, 'Lavavajillas');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (5, 'Campanas extractoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (6, 'Lavadoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (7, 'Secadoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (8, 'Centros de lavado');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (9, 'Aires acondicionados');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (10, 'Ventiladores');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (11, 'Calefactores');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (12, 'Licuadoras y Batidoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (13, 'Tostadoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (14, 'Cafeteras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (15, 'Freidoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (16, 'Procesadores de alimentos');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (17, 'Aspiradoras');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (18, 'Planchas');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (19, 'Secadores de pelo');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (20, 'Hornos');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (21, 'Televisores');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (22, 'Sistemas de sonido');
INSERT INTO FIDE_CATEGORIAS_TB (V_id_categoria, V_nombre_categoria) VALUES (23, 'Refrigeradores');

--CREADO POR Nicole Hidalgo
--FECHA 25/07/2024
--INSERT #3
--INSERT DE LA TABLA FIDE_PRODUCTOS_TB  
--SE PRESENTA UNA GRAN VARIADAD DE PRODUCTOS CON BASE A LA CATEGORIAS EXISTENTES
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (1, 1, 1, 'Portátil Dell XPS 13', 'Portátil Dell XPS 13 con Intel Core i7', 999.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (2, 1, 2, 'Portátil MacBook Air', 'Portátil Apple MacBook Air con M1', 1099.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (3, 2, 1, 'Cocina Samsung', 'Cocina Samsung con horno eléctrico', 699.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (4, 2, 2, 'Cocina LG', 'Cocina LG con 5 quemadores', 749.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (5, 3, 1, 'Microondas Panasonic', 'Microondas Panasonic 1200W', 199.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (6, 3, 2, 'Microondas LG', 'Microondas LG con tecnología Smart Inverter', 229.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (7, 4, 1, 'Lavavajillas Bosch', 'Lavavajillas Bosch silencioso', 599.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (8, 4, 2, 'Lavavajillas Whirlpool', 'Lavavajillas Whirlpool con 14 cubiertos', 549.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (9, 5, 1, 'Campana Extractora Teka', 'Campana extractora Teka de 90cm', 299.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (10, 5, 2, 'Campana Extractora Bosch', 'Campana extractora Bosch con iluminación LED', 349.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (11, 6, 1, 'Lavadora LG', 'Lavadora LG con inteligencia artificial', 799.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (12, 6, 2, 'Lavadora Samsung', 'Lavadora Samsung con ecobubble', 749.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (13, 7, 1, 'Secadora Bosch', 'Secadora Bosch con bomba de calor', 899.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (14, 7, 2, 'Secadora Whirlpool', 'Secadora Whirlpool con sensor de humedad', 849.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (15, 8, 1, 'Centro de Lavado LG', 'Centro de lavado LG TwinWash', 1299.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (16, 8, 2, 'Centro de Lavado Samsung', 'Centro de lavado Samsung FlexWash', 1249.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (17, 9, 1, 'Aire Acondicionado LG', 'Aire acondicionado LG dual inverter', 599.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (18, 9, 2, 'Aire Acondicionado Samsung', 'Aire acondicionado Samsung Wind-Free', 649.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (19, 10, 1, 'Ventilador Dyson', 'Ventilador Dyson sin aspas con purificador', 299.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (20, 10, 2, 'Ventilador Honeywell', 'Ventilador Honeywell turbo con múltiples velocidades', 79.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (21, 11, 1, 'Calefactor DeLonghi', 'Calefactor DeLonghi cerámico', 129.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (22, 11, 2, 'Calefactor Lasko', 'Calefactor Lasko con control remoto', 89.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (23, 12, 1, 'Licuadora Oster', 'Licuadora Oster con 12 velocidades y jarra de vidrio', 79.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (24, 12, 2, 'Licuadora Ninja', 'Licuadora Ninja con Auto-iQ y 1000W de potencia', 99.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (25, 13, 1, 'Tostadora Cuisinart', 'Tostadora Cuisinart con 4 ranuras', 49.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (26, 13, 2, 'Tostadora Breville', 'Tostadora Breville con controles inteligentes', 99.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (27, 14, 1, 'Cafetera Nespresso', 'Cafetera Nespresso con sistema de cápsulas', 199.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (28, 14, 2, 'Cafetera Keurig', 'Cafetera Keurig con programación automática', 149.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (29, 15, 1, 'Freidora Philips', 'Freidora Philips Airfryer XXL', 299.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (30, 15, 2, 'Freidora Tefal', 'Freidora Tefal ActiFry Genius XL', 249.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (31, 16, 1, 'Procesador de Alimentos KitchenAid', 'Procesador de alimentos KitchenAid 7 cup', 129.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (32, 16, 2, 'Procesador de Alimentos Cuisinart', 'Procesador de alimentos Cuisinart 11 cup', 149.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (33, 17, 1, 'Aspiradora Dyson', 'Aspiradora Dyson V11 con tecnología ciclónica', 599.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (34, 17, 2, 'Aspiradora Roomba', 'Aspiradora iRobot Roomba con navegación inteligente', 399.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (35, 18, 1, 'Plancha Philips', 'Plancha Philips Azur Performer', 79.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (36, 18, 2, 'Plancha T-fal', 'Plancha T-fal Ultraglide', 59.99, 'tfal_iron.jpg');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (37, 19, 1, 'Secador de Pelo Dyson', 'Secador de pelo Dyson Supersonic', 399.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (38, 19, 2, 'Secador de Pelo Remington', 'Secador de pelo Remington Pro', 49.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (39, 20, 1, 'Horno Bosch', 'Horno Bosch con autolimpieza pirolítica', 499.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (40, 20, 2, 'Horno LG', 'Horno LG multifunción con vapor', 549.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (41, 21, 1, 'Televisor Samsung', 'Televisor Samsung QLED 55 pulgadas', 899.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (42, 21, 2, 'Televisor LG', 'Televisor LG OLED 65 pulgadas', 1299.99, 'lg_oled.jpg');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (43, 22, 1, 'Sistema de Sonido Bose', 'Sistema de sonido Bose con bluetooth', 299.99,  '');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (44, 22, 2, 'Sistema de Sonido Sony', 'Sistema de sonido Sony con Dolby Atmos', 399.99, ' ');
INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (45, 23, 1, 'Refrigerador Samsung', 'Refrigerador Samsung French Door', 1999.99, ' ');

INSERT INTO FIDE_PRODUCTOS_TB (V_id_producto, V_id_categoria, V_id_estado, V_nombre_producto, V_descripcion_producto, V_precio, V_imagen) 
VALUES (46, 23, 2, 'Refrigerador LG', 'Refrigerador LG Door-in-Door', 1899.99, ' ');

--CREADO POR Nicole Hidalgo
--FECHA 25/07/2024
--INSERT #4
--INSERT DE LA TABLA FIDE_CLIENTES_TB
--SE INSERTA CLIENTES UN DOS ROLES POIBLES (CLIENTE, ADMINISTRADOR)

--CREADO POR Nicole Hidalgo
--FECHA 25/07/2024
--INSERT #5
--INSERT DE LA TABLA FIDE_EMPLEADOS_TB  
--SE INSERTAN DATOS A LA TABLA  FIDE_EMPLEADOS_TB 

--CREADO POR MARCOS VINICIO SOLIS MORALES 
--FECHA 25/07/2024
--INSERT #6
--INSERT DE LA TABLA FIDE_PROVEEDORES_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_PROVEEDORES_TB 

--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 25/07/2024
--INSERT #7
--INSERT DE LA TABLA FIDE_CARRITO_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_CARRITO_TB 

--CREADO POR MARCOS VINICIO SOLIS MORALES 
--FECHA 25/07/2024
--INSERT #8
--INSERT DE LA TABLA FIDE_VENTA_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_VENTA_TB 

--CREADO POR MARCOS VINICIO SOLIS MORALES 
--FECHA 25/07/2024
--INSERT #9
--INSERT DE LA TABLA FIDE_DETALLE_VENTA_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_DETALLE_VENTA_TB 

--CREADO POR Anderson Espinoza Ulate 
--FECHA 25/07/2024
--INSERT #10
--INSERT DE LA TABLA FIDE_RECLAMACIONES_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_RECLAMACIONES_TB 

--CREADO POR  Anderson Espinoza Ulate 
--FECHA 25/07/2024
--INSERT #11
--INSERT DE LA TABLA FIDE_DESCRIPCION_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_DESCRIPCION_TB

--CREADO POR Anderson Espinoza Ulate 
--FECHA 25/07/2024
--INSERT #12
--INSERT DE LA TABLA  FIDE_MOTIVOS_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_MOTIVOS_TB

--CREADO POR Anderson Espinoza Ulate 
--FECHA 25/07/2024
--INSERT #13
--INSERT DE LA TABLA FIDE_PROMOCIONES_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_PROMOCIONES_TB

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 25/07/2024
--INSERT #14
--INSERT DE LA TABLA FIDE_RESENAS_PRODUCTO_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_RESENAS_PRODUCTO_TB

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 25/07/2024
--INSERT #15
--INSERT DE LA TABLA FIDE_COMPRAS_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_COMPRAS_TB

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 25/07/2024
--INSERT #16
--INSERT DE LA TABLA FIDE_ORDEN_DEL_DIA_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_ORDEN_DEL_DIA_TB

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 25/07/2024
--INSERT #17
--INSERT DE LA TABLA  FIDE_REABASTECIMIENTO_STOCK_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_REABASTECIMIENTO_STOCK_TB