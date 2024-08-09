--Triggers (5)

--Secuencias 
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
-- Secuencia para generar valores únicos para FIDE_RESENAS_SEQ
CREATE SEQUENCE FIDE_RESENAS_SEQ
START WITH 1
INCREMENT BY 1;