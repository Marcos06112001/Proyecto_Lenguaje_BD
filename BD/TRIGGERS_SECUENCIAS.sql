--Triggers
CREATE SEQUENCE SECUENCIA_TRIGGER_SEQ
START WITH 1
INCREMENT BY 1; 

--CREADO POR MARIA Celeste SOLANO HIDALGO
--FECHA 11/08/2024
--Trigger #1
CREATE OR REPLACE TRIGGER FIDE_RESENAS_PRODUCTO_CREACION_TRG
BEFORE INSERT ON FIDE_RESENAS_PRODUCTO_TB
FOR EACH ROW 
BEGIN
    :NEW.V_CREATED_BY := USER;
    :NEW.V_CREATION_DATE := SYSDATE; 
END;

--CREADO POR NICOLE HIDALGO
--FECHA 11/08/2024
--Trigger #2
CREATE OR REPLACE TRIGGER FIDE_RESENAS_PRODUCTO_UPDATE_TRG
BEFORE UPDATE ON FIDE_RESENAS_PRODUCTO_TB
FOR EACH ROW 
BEGIN
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE; 
END;

--CREADO POR MARCOS SOLIS
--FECHA 11/08/2024
--Trigger #3
CREATE OR REPLACE TRIGGER FIDE_RESENAS_PRODUCTO_ACCION_TRG
BEFORE INSERT ON FIDE_RESENAS_PRODUCTO_TB
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        :NEW.V_ACCION:= 'INSERT';
    ELSIF UPDATING THEN
        :NEW.V_ACCION:= 'UPDATE';
    END IF;
END; 

--CREADO POR ANDERSON ESPINOZA 
--FECHA 11/08/2024
--Trigger #4 *NO CORRER*
CREATE OR REPLACE TRIGGER FIDE_RESENAS_PRODUCTO_ESTADO_TRG
BEFORE INSERT ON FIDE_RESENAS_PRODUCTO_TB
FOR EACH ROW 
BEGIN
 :NEW.ESTADO:= 'A';
END;

--TRIGGER DE PRODUCTO 
--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 6/08/2024
--CREACION DE UN TRIGGER PARA PRODUCTO DONDE SE ASEGURA QUE CADA NUEVO REGISTRO SEA UNICO
--TRIGGER #5
CREATE OR REPLACE TRIGGER FIDE_PRODUCTOS_TRG
BEFORE INSERT ON FIDE_PRODUCTOS_TB
FOR EACH ROW
BEGIN
    IF :NEW.V_ID_PRODUCTO IS NULL THEN
        SELECT FIDE_PRODUCTOS_SEQ.NEXTVAL INTO :NEW.V_ID_PRODUCTO FROM DUAL;
    END IF;
END;

SELECT * FROM FIDE_RESENAS_PRODUCTO_TB;


UPDATE FIDE_RESENAS_PRODUCTO_TB
SET V_ACCION='UPDATE'
WHERE V_id_resena_producto = 19;

--CREADO POR Maria Celeste Solano Hidalgo
--FECHA 13/08/2024
-- Trigger ·#6
-- Trigger para actualizar datos de clientes
CREATE OR REPLACE TRIGGER FIDE_CLIENTES_UPDATE_TRG
BEFORE UPDATE ON FIDE_CLIENTES_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
END;

//

--CREADO POR Maria Celeste Solano Hidalgo
--FECHA 13/08/2024
-- Trigger ·#7
-- Trigger para establecer datos de creación de clientes
CREATE OR REPLACE TRIGGER FIDE_CLIENTES_CREACION_TRG
BEFORE INSERT ON FIDE_CLIENTES_TB
FOR EACH ROW
BEGIN
    :NEW.V_CREATED_BY := USER;
    :NEW.V_CREATION_DATE := SYSDATE;
END;


----------------------------- Secuencias ---------------------------------------------------------
--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--Secuencia #1
--Secuencia para generar valores únicos para V_id_estado 
CREATE SEQUENCE FIDE_ESTADOS_SEQ
START WITH 1
INCREMENT BY 1;

--Función para generar un código único para V_id_estado
CREATE OR REPLACE FUNCTION FIDE_ESTADOS_GENERAR_CODIGO_FN
RETURN VARCHAR2
IS
    V_CODIGO VARCHAR2(100);
    V_SECUENCIA NUMBER;
    V_LETRA CHAR(1);
    V_RANDOM NUMBER;
BEGIN
    V_SECUENCIA := FIDE_ESTADOS_SEQ.NEXTVAL;
    V_RANDOM := TRUNC(DBMS_RANDOM.VALUE(1, 26));
    V_LETRA := CHR(64 + V_RANDOM);
    V_CODIGO := TO_CHAR(SYSDATE, 'YYYY-MM-DD') || '-' || LPAD(V_SECUENCIA, 4, '0') || '-' || V_LETRA; 
    RETURN V_CODIGO;
END;
/
-- Para generar un código único para V_id_estado
SELECT FIDE_ESTADOS_GENERAR_CODIGO_FN AS ID_ESTADO FROM dual;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--Secuencia #2
--Secuencia para generar valores únicos para V_id_categoria 
CREATE SEQUENCE FIDE_CATEGORIAS_SEQ
START WITH 1
INCREMENT BY 1;

-- Función para generar un código único para V_id_categoria 
CREATE OR REPLACE FUNCTION FIDE_CATEGORIAS_GENERAR_CODIGO_FN
RETURN VARCHAR2
IS
    V_CODIGO VARCHAR2(100);
    V_SECUENCIA NUMBER;
    V_LETRA CHAR(1);
    V_RANDOM NUMBER;
BEGIN
    V_SECUENCIA := FIDE_CATEGORIAS_SEQ.NEXTVAL;
    V_RANDOM := TRUNC(DBMS_RANDOM.VALUE(1, 26));
    V_LETRA := CHR(64 + V_RANDOM);
    V_CODIGO := TO_CHAR(SYSDATE, 'YYYY-MM-DD') || '-' || LPAD(V_SECUENCIA, 4, '0') || '-' || V_LETRA; 
    RETURN V_CODIGO;
END;
/
-- Para generar un código único para V_id_categoria
SELECT FIDE_CATEGORIAS_GENERAR_CODIGO_FN AS ID_CATEGORIA FROM dual;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--Secuencia #3
-- Secuencia para generar valores únicos para V_id_producto 3
CREATE SEQUENCE FIDE_PRODUCTOS_SEQ
START WITH 1
INCREMENT BY 1;

-- Función para generar un código único para V_id_producto 
CREATE OR REPLACE FUNCTION FIDE_PRODUCTOS_GENERAR_CODIGO_FN
RETURN VARCHAR2
IS
    V_CODIGO VARCHAR2(100);
    V_SECUENCIA NUMBER;
    V_LETRA CHAR(1);
    V_RANDOM NUMBER;
BEGIN
    V_SECUENCIA := FIDE_PRODUCTOS_SEQ.NEXTVAL;
    V_RANDOM := TRUNC(DBMS_RANDOM.VALUE(1, 26));
    V_LETRA := CHR(64 + V_RANDOM);
    V_CODIGO := TO_CHAR(SYSDATE, 'YYYY-MM-DD') || '-' || LPAD(V_SECUENCIA, 4, '0') || '-' || V_LETRA; 
    RETURN V_CODIGO;
END;
/
-- Para generar un código único para V_id_producto
SELECT FIDE_PRODUCTOS_GENERAR_CODIGO_FN AS ID_PRODUCTO FROM dual;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--Secuencia #4
-- Secuencia para generar valores únicos para V_id_cliente 4
CREATE SEQUENCE FIDE_CLIENTES_SEQ
START WITH 1
INCREMENT BY 1;

-- Función para generar un código único para V_id_cliente
CREATE OR REPLACE FUNCTION FIDE_CLIENTES_GENERAR_CODIGO_FN
RETURN VARCHAR2
IS
    V_CODIGO VARCHAR2(100);
    V_SECUENCIA NUMBER;
    V_LETRA CHAR(1);
    V_RANDOM NUMBER;
BEGIN
    V_SECUENCIA := FIDE_CLIENTES_SEQ.NEXTVAL;
    V_RANDOM := TRUNC(DBMS_RANDOM.VALUE(1, 26));
    V_LETRA := CHR(64 + V_RANDOM);
    V_CODIGO := TO_CHAR(SYSDATE, 'YYYY-MM-DD') || '-' || LPAD(V_SECUENCIA, 4, '0') || '-' || V_LETRA; 
    RETURN V_CODIGO;
END;
/
-- Para generar un código único para V_id_cliente
SELECT FIDE_CLIENTES_GENERAR_CODIGO_FN AS ID_CLIENTE FROM dual;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 24/07/2024
--Secuencia #5
-- Secuencia para generar valores únicos para V_id_venta 5
CREATE SEQUENCE FIDE_VENTA_SEQ
START WITH 1
INCREMENT BY 1;

-- Función para generar un código único para V_id_venta
CREATE OR REPLACE FUNCTION FIDE_VENTA_GENERAR_CODIGO_FN
RETURN VARCHAR2
IS
    V_CODIGO VARCHAR2(100);
    V_SECUENCIA NUMBER;
    V_LETRA CHAR(1);
    V_RANDOM NUMBER;
BEGIN
    V_SECUENCIA := FIDE_VENTA_SEQ.NEXTVAL;
    V_RANDOM := TRUNC(DBMS_RANDOM.VALUE(1, 26));
    V_LETRA := CHR(64 + V_RANDOM);
    V_CODIGO := TO_CHAR(SYSDATE, 'YYYY-MM-DD') || '-' || LPAD(V_SECUENCIA, 4, '0') || '-' || V_LETRA; 
    RETURN V_CODIGO;
END;
/
-- Para generar un código único para V_id_venta
SELECT FIDE_VENTA_GENERAR_CODIGO_FN AS ID_VENTA FROM dual;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 08/08/2024
--Secuencia #6
--Secuencia para generar valores únicos para FIDE_RESENAS_SEQ
CREATE SEQUENCE FIDE_RESENAS_SEQ
START WITH 1
INCREMENT BY 1;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 11/08/2024
--Secuencia #7
--Secuencia para generar valores únicos para FIDE_RECLAMOS_SEQ
CREATE SEQUENCE FIDE_RECLAMACIONES_SEQ
START WITH 1
INCREMENT BY 1;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 11/08/2024
--Secuencia #8
--Secuencia para generar valores únicos para FIDE_RECLAMOS_SEQ
CREATE SEQUENCE FIDE_MOTIVOS_SEQ
START WITH 1
INCREMENT BY 1;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 11/08/2024
--Secuencia #9
--Secuencia para generar valores únicos para FIDE_RECLAMOS_SEQ
CREATE SEQUENCE FIDE_DESCRIPCION_SEQ
START WITH 1
INCREMENT BY 1;

--CREADO POR Nicole Hidalgo Hidalgo
--FECHA 16/08/2024
--Secuencia #10
--Secuencia para generar valores únicos para FIDE_EMPELADOS_SEQ
CREATE SEQUENCE FIDE_EMPLEADOS_SEQ
START WITH 1
INCREMENT BY 1;

