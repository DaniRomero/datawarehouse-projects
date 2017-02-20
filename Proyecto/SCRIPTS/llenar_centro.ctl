OPTIONS (SKIP=1)
load data
 	infile 'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\CSV\CENTROS.csv'
 	into table centro_evaluacion
 	fields terminated by ";"
 	(cod_centro, cod_ciudad, nombre_centro, rif, tipo_centro, direccion, telefono, fax)
