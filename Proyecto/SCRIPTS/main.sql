DROP TABLESPACE TRANSACCIONAL INCLUDING CONTENTS AND DATAFILES;
CREATE TABLESPACE TRANSACCIONAL DATAFILE 'TRANSACCIONAL.DBF' SIZE 200M;
DROP USER TRANS CASCADE;
CREATE USER TRANS IDENTIFIED BY jadr123;
ALTER USER TRANS QUOTA UNLIMITED ON TRANSACCIONAL;
ALTER USER TRANS DEFAULT TABLESPACE TRANSACCIONAL;
GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO TRANS;

DROP TABLESPACE INTERMEDIA INCLUDING CONTENTS AND DATAFILES;
CREATE TABLESPACE INTERMEDIA DATAFILE 'INTERMEDIA.DBF' SIZE 200M;
DROP USER INTER CASCADE;
CREATE USER INTER IDENTIFIED BY jadr123;
ALTER USER INTER QUOTA UNLIMITED ON INTERMEDIA;
ALTER USER INTER DEFAULT TABLESPACE INTERMEDIA;
GRANT ALL PRIVILEGES TO INTER;
GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO INTER;

DROP TABLESPACE DWH INCLUDING CONTENTS AND DATAFILES;
CREATE TABLESPACE DWH DATAFILE 'DWH.DBF' SIZE 200M;
DROP USER UDWH CASCADE;
CREATE USER UDWH IDENTIFIED BY jadr123;
ALTER USER UDWH QUOTA UNLIMITED ON DWH;
ALTER USER UDWH DEFAULT TABLESPACE DWH;
GRANT ALL PRIVILEGES TO UDWH;
GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO UDWH;


/*
Antes de la ejecución del archivo 'main.sql' debe cambiar las rutas donde se encuentran los archivos
a la ubicación física dentro de su equipo 
*/

CONNECT TRANS/jadr123;
@'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\SCRIPTS\cre_transaccional.sql'
@'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\SCRIPTS\insert_transaccional.sql'

CONNECT INTER/jadr123;
@'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\SCRIPTS\cre_intermedia.sql'

/*
CONNECT UDWH/jadr123;
@'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\SCRIPTS\cre_dimensional.sql'
*/