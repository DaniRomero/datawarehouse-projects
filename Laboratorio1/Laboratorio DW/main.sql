CREATE USER FUENTE IDENTIFIED BY jadr123;
CREATE TABLESPACE fuente DATAFILE 'fuentedata.DBF' SIZE 1G;
CREATE TEMPORARY TABLESPACE fuente_temporal TEMPFILE 'fuente_temporal_data.DBF' SIZE 1G;
ALTER USER Fuente DEFAULT TABLESPACE fuente;
GRANT ALL PRIVILEGES TO Fuente;

CREATE USER DATAW IDENTIFIED BY jadr123;
CREATE TABLESPACE dw DATAFILE 'dwdata.DBF' SIZE 1G;
CREATE TEMPORARY TABLESPACE dw_temporal TEMPFILE 'dw_temporal_data.DBF' SIZE 1G;
ALTER USER DATAW DEFAULT TABLESPACE dw;
GRANT ALL PRIVILEGES TO DATAW;

CONNECT FUENTE/jadr123
@'C:\Users\Jean\Desktop\Laboratorio DW\almacen_create_tables.sql'
@'C:\Users\Jean\Desktop\Laboratorio DW\insert_oltp.sql'
CONNECT DATAW/jadr123
@'C:\Users\Jean\Desktop\Laboratorio DW\dimensional_create_tables.sql'
@'C:\Users\Jean\Desktop\Laboratorio DW\etl.sql'
@'C:\Users\Jean\Desktop\Laboratorio DW\insert_hechos.sql'