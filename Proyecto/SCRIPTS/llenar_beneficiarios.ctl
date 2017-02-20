OPTIONS (SKIP=1)
load data
 	infile 'C:\Users\PC\Desktop\Universidad\DW\Proyecto - Seguros\CSV\BENEFICIARIOS.CSV'
 	into table beneficiario
 	fields terminated by ";"
 	( cod_poliza, cedula_beneficiario, nombre_beneficiario, apellido_beneficiario, fecha_nacimiento, parentesco)
	