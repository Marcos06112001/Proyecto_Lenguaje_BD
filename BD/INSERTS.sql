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
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (1, 'Juan', 'Pérez', 'juan.perez@example.com', '123-456-7890', 'Calle Falsa 123, Ciudad', 'juan_perez.jpg', 'cliente', 'pass1234');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (2, 'Ana', 'Gómez', 'ana.gomez@example.com', '234-567-8901', 'Avenida Siempre Viva 456, Ciudad', 'ana_gomez.jpg', 'administrador', 'ana2024');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (3, 'Luis', 'Martínez', 'luis.martinez@example.com', '345-678-9012', 'Boulevard Libertad 789, Ciudad', 'luis_martinez.jpg', 'cliente', 'luis5678');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (4, 'María', 'Rodríguez', 'maria.rodriguez@example.com', '456-789-0123', 'Calle del Sol 101, Ciudad', 'maria_rodriguez.jpg', 'cliente', 'maria1234');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (5, 'Carlos', 'Hernández', 'carlos.hernandez@example.com', '567-890-1234', 'Avenida de la Paz 202, Ciudad', 'carlos_hernandez.jpg', 'administrador', 'carlos4321');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (6, 'Laura', 'Cano', 'laura.cano@example.com', '678-901-2345', 'Calle de los Árboles 303, Ciudad', 'laura_cano.jpg', 'cliente', 'laura2024');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (7, 'Jorge', 'Lopez', 'jorge.lopez@example.com', '789-012-3456', 'Avenida del Norte 404, Ciudad', 'jorge_lopez.jpg', 'cliente', 'jorge5678');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (8, 'Sofia', 'Torres', 'sofia.torres@example.com', '890-123-4567', 'Calle del Mar 505, Ciudad', 'sofia_torres.jpg', 'cliente', 'sofia9876');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (9, 'Pedro', 'Mendoza', 'pedro.mendoza@example.com', '901-234-5678', 'Avenida de la Ciudad 606, Ciudad', 'pedro_mendoza.jpg', 'administrador', 'pedro1234');
INSERT INTO FIDE_CLIENTES_TB (V_id_cliente, V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass)
VALUES (10, 'Isabel', 'Sánchez', 'isabel.sanchez@example.com', '012-345-6789', 'Calle de la Luna 707, Ciudad', 'isabel_sanchez.jpg', 'cliente', 'isabel5678');

--CREADO POR Nicole Hidalgo
--FECHA 25/07/2024
--INSERT #5
--INSERT DE LA TABLA FIDE_EMPLEADOS_TB  
--SE INSERTAN DATOS A LA TABLA  FIDE_EMPLEADOS_TB 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen)
VALUES (1, 1, 'Juan', 'Pérez', 'juan.perez@example.com', '555-1234', 'Avenida Central 123, San José', 'juan_perez.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen) 
VALUES (2, 1, 'Ana', 'López', 'ana.lopez@example.com', '555-5678', 'Calle 45, Alajuela', 'ana_lopez.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen) 
VALUES (3, 1, 'Carlos', 'Ruiz', 'carlos.ruiz@example.com', '555-9101', 'Boulevard 99, Heredia', 'carlos_ruiz.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen)
VALUES (4, 1, 'María', 'Fernández', 'maria.fernandez@example.com', '555-1122', 'Avenida 7, San José', 'maria_fernandez.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen)
VALUES (5, 1, 'Luis', 'González', 'luis.gonzalez@example.com', '555-3344', 'Calle Real 55, Alajuela', 'luis_gonzalez.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen)
VALUES (6, 1, 'Laura', 'Martínez', 'laura.martinez@example.com', '555-5566', 'Avenida Norte 22, Heredia', 'laura_martinez.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen) 
VALUES (7, 1, 'Jorge', 'Salazar', 'jorge.salazar@example.com', '555-7788', 'Calle 32, San José', 'jorge_salazar.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen) 
VALUES (8, 1, 'Sofía', 'Jiménez', 'sofia.jimenez@example.com', '555-9900', 'Calle Mayor 88, Alajuela', 'sofia_jimenez.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_imagen) 
VALUES (9, 1, 'Ricardo', 'Castro', 'ricardo.castro@example.com', '555-2233', 'Avenida 50, Heredia', 'ricardo_castro.jpg');
 
INSERT INTO FIDE_EMPLEADOS_TB (V_id_empleado, V_id_estado, V_nombre_empleado, V_apellido_empleado, V_email, V_telefono, V_direccion, V_image) 
VALUES (10, 1, 'Paola', 'Vargas', 'paola.vargas@example.com', '555-4455', 'Boulevard Central 12, San José', 'paola_vargas.jpg');

--CREADO POR MARCOS VINICIO SOLIS MORALES 
--FECHA 25/07/2024
--INSERT #6
--INSERT DE LA TABLA FIDE_PROVEEDORES_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_PROVEEDORES_TB 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (1, 1, 'ElectroTech S.A.', 'Juan Pérez', 'contacto@electrotech.com', '555-1234', 'Avenida Central 123, San José');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (2, 1, 'TecnoMuebles Ltda.', 'Ana López', 'info@tecnomuebles.com', '555-5678', 'Calle 45, Alajuela');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (3, 1, 'Innovación Hogar', 'Carlos Ruiz', 'ventas@innovacionhogar.com', '555-9101', 'Boulevard 99, Heredia');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedo)
VALUES (4, 1, 'Electrodomésticos ABC', 'María Fernández', 'soporte@abc.com', '555-1122', 'Avenida 7, San José');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (5, 1, 'Muebles del Valle', 'Luis González', 'contacto@mueblesvalle.com', '555-3344', 'Calle Real 55, Alajuela');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (6, 1, 'Hogar y Tecnología', 'Laura Martínez', 'ventas@hogarytecnologia.com', '555-5566', 'Avenida Norte 22, Heredia');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (7, 1, 'Distribuciones Modernas', 'Jorge Salazar', 'info@distribucionesmodernas.com', '555-7788', 'Calle 32, San José');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES ( 8, 1, 'ElectroFacil', 'Sofía Jiménez', 'ventas@electrofacil.com', '555-9900', 'Calle Mayor 88, Alajuela');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (9, 1, 'Equipos y Soluciones', 'Ricardo Castro', 'contacto@equiposy.com', '555-2233', 'Avenida 50, Heredia');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (10, 1, 'ElectroTech S.A.', 'Juan Pérez', 'contacto@electrotech.com', '555-1234', 'Avenida Central 123, San José');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (11, 1, 'TecnoMuebles Ltda.', 'Ana López', 'info@tecnomuebles.com', '555-5678', 'Calle 45, Alajuela');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor)
VALUES (12, 1, 'Innovación Hogar', 'Carlos Ruiz', 'ventas@innovacionhogar.com', '555-9101', 'Boulevard 99, Heredia');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (13, 1, 'Electrodomésticos ABC', 'María Fernández', 'soporte@abc.com', '555-1122', 'Avenida 7, San José');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (14, 1, 'Muebles del Valle', 'Luis González', 'contacto@mueblesvalle.com', '555-3344', 'Calle Real 55, Alajuela');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor)
VALUES (15, 1, 'Hogar y Tecnología', 'Laura Martínez', 'ventas@hogarytecnologia.com', '555-5566', 'Avenida Norte 22, Heredia');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (16, 1, 'Distribuciones Modernas', 'Jorge Salazar', 'info@distribucionesmodernas.com', '555-7788', 'Calle 32, San José');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (17, 1, 'ElectroFacil', 'Sofía Jiménez', 'ventas@electrofacil.com','555-9900', 'Calle Mayor 88, Alajuela');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (18, 1, 'Equipos y Soluciones', 'Ricardo Castro', 'contacto@equiposy.com', '555-2233', 'Avenida 50, Heredia');
 
INSERT INTO FIDE_PROVEEDORES_TB (V_id_proveedor, V_id_estado, V_nombre_proveedor, V_contacto_proveedor, V_email_proveedor, V_telefono_proveedor, V_direccion_proveedor) 
VALUES (19, 1, 'Servicios Tecnológicos S.A.', 'Paola Vargas', 'info@serviciostecsa.com', '555-4455', 'Boulevard Central 12, San José');
 
--CREADO POR MARCOS VINICIO SOLIS MORALES
--FECHA 25/07/2024
--INSERT #7
--INSERT DE LA TABLA FIDE_CARRITO_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_CARRITO_TB 
INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (1, 1, 1, 1, 150.00, 300.00, 150.00 * 300.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (2, 2, 2, 1, 200.00, 200.00, 200.00 * 200.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (3, 3, 3, 1, 50.00, 150.00, 50.00 * 150.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (4, 4, 4, 2, 80.00, 400.00, 80.00 * 400.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (5, 5, 5, 2, 120.00, 120.00, 120.00 * 120.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (6, 6, 6, 1, 75.00, 300.00, 75.00 * 300.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (7, 7, 7, 1, 60.00, 120.00, 60.00 * 120.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (8, 8, 8, 2, 100.00, 300.00, 100.00 * 300.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (9, 9, 9, 2, 140.00, 140.00, 140.00 * 140.00);

INSERT INTO FIDE_CARRITO_TB (V_id_carrito, V_id_cliente, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (10, 10, 10, 1, 45.00, 270.00, 45.00 * 270.00);


--CREADO POR MARCOS VINICIO SOLIS MORALES 
--FECHA 25/07/2024
--INSERT #8
--INSERT DE LA TABLA FIDE_VENTA_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_VENTA_TB
INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (1, 1, 2, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 150.00);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (2, 3, 4, 2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 200.50);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (3, 5, 6, 1, TO_DATE('2024-07-03', 'YYYY-MM-DD'), 350.75);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (4, 7, 8, 3, TO_DATE('2024-07-04', 'YYYY-MM-DD'), 120.00);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (5, 2, 1, 2, TO_DATE('2024-07-05', 'YYYY-MM-DD'), 420.40);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (6, 4, 3, 1, TO_DATE('2024-07-06', 'YYYY-MM-DD'), 275.30);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (7, 6, 5, 2, TO_DATE('2024-07-07', 'YYYY-MM-DD'), 190.00);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (8, 8, 7, 2, TO_DATE('2024-07-08', 'YYYY-MM-DD'), 330.25);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (9, 9, 9, 1, TO_DATE('2024-07-09', 'YYYY-MM-DD'), 145.00);

INSERT INTO FIDE_VENTA_TB (V_id_venta, V_id_cliente, V_id_empleado, V_id_estado, V_fecha, V_total)
VALUES (10, 10, 10, 2, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 560.60);


--CREADO POR MARCOS VINICIO SOLIS MORALES 
--FECHA 25/07/2024
--INSERT #9
--INSERT DE LA TABLA FIDE_DETALLE_VENTA_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_DETALLE_VENTA_TB 
INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (1, 1, 1, 1, 10, 15.00, 10 * 15.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (2, 1, 2, 1, 5, 50.00, 5 * 50.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (3, 2, 3, 2, 20, 25.00, 20 * 25.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (4, 2, 4, 1, 7, 75.00, 7 * 75.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (5, 3, 5, 3, 12, 10.00, 12 * 10.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (6, 3, 6, 2, 15, 20.00, 15 * 20.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (7, 4, 7, 1, 8, 40.00, 8 * 40.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (8, 4, 8, 2, 10, 30.00, 10 * 30.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (9, 5, 9, 2, 6, 60.00, 6 * 60.00);

INSERT INTO FIDE_DETALLE_VENTA_TB (V_id_detalle_venta, V_id_venta, V_id_producto, V_id_estado, V_cantidad, V_precio_unitario, V_subtotal)
VALUES (10, 5, 10, 1, 5, 90.00, 5 * 90.00);


--CREADO POR Anderson Espinoza Ulate 
--FECHA 25/07/2024
--INSERT #10
--INSERT DE LA TABLA FIDE_RECLAMACIONES_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_RECLAMACIONES_TB 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (1, 1, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (2, 2, 2, TO_DATE('2024-07-05', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (3, 3, 3, TO_DATE('2024-07-10', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (4, 4, 1, TO_DATE('2024-07-12', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (5, 5, 2, TO_DATE('2024-07-15', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (6, 6, 3, TO_DATE('2024-07-18', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (7, 7, 1, TO_DATE('2024-07-20', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (8, 8, 2, TO_DATE('2024-07-22', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (9, 9, 3, TO_DATE('2024-07-25', 'YYYY-MM-DD'));
 
INSERT INTO FIDE_RECLAMACIONES_TB (V_id_reclamacion, V_id_cliente, V_id_estado, V_fecha)
VALUES (10, 10, 1, TO_DATE('2024-07-28', 'YYYY-MM-DD'));

--CREADO POR  Anderson Espinoza Ulate 
--FECHA 25/07/2024
--INSERT #11
--INSERT DE LA TABLA FIDE_DESCRIPCION_TB
--SE INSERTAN DATOS A LA TABLA  FIDE_DESCRIPCION_TB
INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
VALUES (1, 'Descripción general del producto');
 
INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
VALUES (2, 'Características técnicas del producto');
 
INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
VALUES (3, 'Instrucciones de uso del producto');
 
INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
VALUES (4, 'Garantía y servicio postventa');
 
INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
VALUES (5, 'Información de seguridad y precauciones');
 
INSERT INTO FIDE_DESCRIPCION_TB (V_id_descripcion, V_descripcion)
VALUES (6, 'Datos de contacto para soporte técnico');