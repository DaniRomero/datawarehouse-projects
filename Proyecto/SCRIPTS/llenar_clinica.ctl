OPTIONS (SKIP=1)
load data
 	infile 'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\CSV\CLINICAS.csv'
 	into table clinica
 	fields terminated by ";"
 	(cod_clinica, cod_ciudad, nombre, rif, tipo_convenio, especialidad, direccion, telefono, fax)