MERGE INTO grupo_familiar gp USING(
SELECT  g.id_grupo_familiar, 
		g.descripcion,
		g.cant_personas_familia,
		g.menores,
		g.cant_menores,
		g.jefe_grupo,
		null id_datos_demograficos,
		null cant_personas,
		null edad_promedio,
		null ubicacion,
		null tipo_vivienda, 
		null tipo_zona
		null clase_social,
		null ingreso_mensual
FROM TRANS.grupo_familiar g
UNION
SELECT  g.id_grupo_familiar, 
		g.descripcion,
		g.cant_personas_familia,
		g.menores,
		g.cant_menores,
		g.jefe_grupo,
		dd.id_datos_demograficos,
		dd.cant_personas,
		dd.edad_promedio,
		dd.ubicacion,
		dd.tipo_vivienda, 
		dd.tipo_zona,
		dd.clase_social,
		dd.ingreso_mensual
FROM TRANS.grupo_familiar g
join TRANS.datos_demograficos dd
ON (g.id_grupo_familiar=dd.id_grupo_familiar)
) p 
ON (gp.id_grupo_familiar=p.id_grupo_familiar)
WHEN MATCHED THEN
UPDATE SET gp.descripcion=p.descripcion, gp.cant_personas_familia=p.cant_personas_familia,
	       gp.menores=p.menores, gp.cant_menores=p.cant_menores, gp.jefe_grupo=p.jefe_grupo,
	       gp.id_datos_demograficos=p.id_datos_demograficos, gp.cant_personas=p.cant_personas,
	       gp.edad_promedio=p.edad_promedio, gp.ubicacion=p.ubicacion, gp.tipo_vivienda=p.tipo_vivienda,
	       gp.tipo_zona=p.tipo_zona, gp.clase_social=p.clase_social, gp.ingreso_mensual=p.ingreso_mensual
WHEN NOT MATCHED THEN
INSERT (id_grupo_familiar, descripcion, cant_personas_familia, menores, cant_menores, jefe_grupo, id_datos_demograficos, cant_personas, edad_promedio, ubicacion, tipo_vivienda, tipo_zona, clase_social, ingreso_mensual)
VALUES (p.id_grupo_familiar, p.descripcion, p.cant_personas_familia, p.menores, p.cant_menores, p.jefe_grupo, p.id_datos_demograficos, p.cant_personas, p.edad_promedio, p.ubicacion, p.tipo_vivienda, p.tipo_zona, p.clase_social, p.ingreso_mensual);	       



MERGE INTO cliente c USING(
SELECT cl.id_cliente,
	   cl.ci,
	   cl.nombre,
	   cl.apellido,
	   cl.rif,
	   cl.correo,
	   cl.edad,
	   cl.sexo,
	   cl.direccion,
	   null id_estado_civil,
	   null descripcion,
	   null id_datos_c,
	   null este_banco,
	   null monto,
	   null tasa_interes, 
	   null cant_plazos, 
	   null fecha_inicio,
	   null fecha_fin,
	   null status
FROM TRANS.cliente cl 
UNION
SELECT cl.id_cliente,
	   cl.ci,
	   cl.nombre,
	   cl.apellido,
	   cl.rif,
	   cl.correo,
	   cl.edad,
	   cl.sexo,
	   cl.direccion,
	   ec.id_estado_civil,
	   ec.descripcion,
	   null id_datos_c,
	   null este_banco,
	   null monto,
	   null tasa_interes, 
	   null cant_plazos, 
	   null fecha_inicio,
	   null fecha_fin,
	   null status
FROM TRANS.cliente cl
join TRANS.estado_civil ec
ON (cl.id_estado_civil=ec.id_estado_civil)
UNION
SELECT cl.id_cliente,
	   cl.ci,
	   cl.nombre,
	   cl.apellido,
	   cl.rif,
	   cl.correo,
	   cl.edad,
	   cl.sexo,
	   cl.direccion,
	   ec.id_estado_civil,
	   ec.descripcion,
	   dc.id_datos_c,
	   dc.este_banco,
	   dc.monto,
	   dc.tasa_interes, 
	   dc.cant_plazos, 
	   dc.fecha_inicio,
	   dc.fecha_fin,
	   dc.status
FROM TRANS.cliente cl
join TRANS.estado_civil ec
ON (cl.id_estado_civil=ec.id_estado_civil)
join datos_crediticios dc
ON (cl.id_cliente=dc.id_cliente)
) p
ON(c.id_cliente=p.id_cliente)
WHEN MATCHED THEN
update set c.ci=p.ci, c.nombre=p.nombre, c.apellido=c.apellido, 
		   c.rif=p.rif, c.correo=p.correo, c.edad=p.edad, c.sexo=p.sexo,
		   c.direccion=p.direccion, c.id_estado_civil=p.id_estado_civil, c.descripcion=p.descripcion,
		   c.id_datos_c=p.id_datos_c, c.este_banco=p.este_banco, c.monto=p.monto, c.tasa_interes=p.tasa_interes, 
		   c.cant_plazos=p.cant_plazos, c.fecha_inicio=p.fecha_inicio, c.fecha_fin=p.fecha_fin, c.status=p.status
WHEN NOT MATCHED THEN
INSERT (id_cliente ci, nombre, apellido, rif, correo, edad, sexo, direccion, id_estado_civil, descripcion, id_datos_c, este_banco, monto, tasa_interes, cant_plazos, fecha_inicio, fecha_fin, status)
VALUES (client.nextVal, p.ci, p.nombre, p.apellido, p.rif, p.correo, p.edad, p.sexo, p.direccion, p.id_estado_civil, p.descripcion, p.id_datos_c, p.este_banco, p.monto, p.tasa_interes, p.cant_plazos, p.fecha_inicio, p.fecha_fin, p.status);		