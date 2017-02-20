OPTIONS (SKIP=1)
load data
 	infile 'C:\Users\PC\Desktop\Universidad\DW\Laboratorio 2 - Servicios Financieros\Laboratorio2\CSV\DATOS_CREDITICIOS.CSV'
 	into table datos_crediticios
 	fields terminated by ";"
 	( ID_DATOS_C, ESTE_BANCO, ID_CLIENTE, MONTO, TASA_INTERES, CANT_PLAZOS, FECHA_INICIO, FECHA_FIN, STATUS)
	
	
	
