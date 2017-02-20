OPTIONS (SKIP=1)
load data
 	infile 'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\CSV\PERITOS.csv'
 	into table perito
 	fields terminated by ";"
 	(carnet, cod_ciudad, nombre_perito, apellido_perito, cedula, rif, telefono, fax, direccion, cod_sucursal)