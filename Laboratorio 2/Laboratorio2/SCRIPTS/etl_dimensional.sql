MERGE INTO dim_cuenta dc USING(
select  ic.id_cuenta,
		ic.numero_cuenta,
		ic.fecha_apertura,
		ic.id_sucursal,
		ic.id_status_cuenta,
		ic.descripcion_estatus,
		ic.id_tipo_cuenta,
		ic.descripcion_tipo_cuenta,
		ic.requisitos
FROM INTER.cuenta ic
)t
on (dc.id_cuenta=t.id_cuenta)
WHEN MATCHED THEN 
UPDATE SET dc.numero_cuenta=t.numero_cuenta, dc.fecha_apertura=t.fecha_apertura, dc.id_sucursal=t.id_sucursal, dc.id_status_cuenta=t.id_status_cuenta,
		   dc.descripcion_status=t.descripcion_estatus, dc.id_tipo_cuenta=t.id_tipo_cuenta, dc.descripcion_tipo=t.descripcion_tipo_cuenta, dc.requisitos_tipo=t.requisitos
WHEN NOT MATCHED THEN
INSERT (dim_id_cuenta, id_cuenta, numero_cuenta, fecha_apertura, id_sucursal, id_status_cuenta, descripcion_status, id_tipo_cuenta, descripcion_tipo, requisitos_tipo)
VALUES (cuenta.nextVal, t.id_cuenta, t.numero_cuenta, t.fecha_apertura, t.id_sucursal, t.id_status_cuenta, t.descripcion_estatus, t.id_tipo_cuenta, t.descripcion_tipo_cuenta, t.requisitos);

MERGE INTO dim_sucursal ds USING(
select  is.id_sucursal,
		is.descripcion,
		is.rif,
		is.telefono,
		is.fax
FROM INTER.sucursal is
)t
on (ds.id_sucursal=t.id_sucursal)
WHEN MATCHED THEN
UPDATE SET ds.descripcion=t.descripcion, ds.rif=t.rif, ds.telefono=t.telefono, ds.fax=t.fax
WHEN NOT MATCHED THEN
INSERT (dim_id_sucursal, id_sucursal, descripcion, rif, telefono, fax)
VALUES (sucursal.nextVal, t.id_sucursal, t.descripcion, t.rif, t.telefono, t.fax);


----------------------------------
MERGE INTO dim_cliente c USING (
select  cl.id_cliente, 
		cl.ci,
		cl.nombre,
		cl.apellido,
		cl.rif,
		cl.correo,
		cl.edad,
		cl.sexo,
		cl.direccion,
		cl.id_estado_civil, 
		cl.descripcion,
		cl.id_datos_c,
		cl.este_banco,
		cl.monto,
		cl.tasa_interes,
		cl.cant_plazos,
		cl.fecha_inicio,
		cl.fecha_fin,
		cl.status
FROM INTER.cliente cl
)t
on (c.id_cliente=t.id_cliente)
WHEN MATCHED THEN
UPDATE SET c.ci=t.ci, c.nombre=t.nombre, c.apellido=t.apellido, c.rif=t.rif, c.correo=t.correo, c.edad=t.edad, c.sexo=t.sexo, c.direccion=t.direccion,
		   c.id_estado_civil=t.id_estado_civil, c.descripcion_estado_civil=t.descripcion, c.id_datos_crediticios=t.id_datos_c,
		   c.este_banco=t.este_banco, c.monto_pedido=t.monto, c.tasa_interes=t.cant_plazos, c.fecha_inicio=t.fecha_inicio, c.fecha_fin=t.fecha_fin,
		   c.status_credito=t.status
WHEN NOT MATCHED THEN
INSERT (dim_id_cliente, id_cliente, ci, nombre, apellido, rif, correo, edad, sexo, direccion, id_estado_civil, descripcion_estado_civil, id_datos_crediticios, este_banco, monto_pedido, tasa_interes, cant_plazos, fecha_inicio, fecha_fin, status_credito)
VALUES (cliente.nextVal, t.id_cliente, t.ci, t.nombre, t.apellido, t.rif, t.correo, t.edad, t.sexo, t.direccion, t.id_estado_civil, t.descripcion, t.id_datos_c, t.este_banco, t.monto, t.tasa_interes, t.cant_plazos, t.fecha_inicio, t.fecha_fin, t.status);



--------------------------------------
MERGE INTO dim_producto_financiero pf USING (
select  p.id_producto_financiero,
		p.descripcion, 
		p.beneficios
FROM INTER.producto_financiero p
)t
on (pf.id_producto_financiero=t.id_producto_financiero)
WHEN MATCHED THEN 
UPDATE SET pf.descripcion=t.descripcion, pf.beneficios=t.beneficios
WHEN NOT MATCHED THEN
INSERT (dim_id_producto_financiero, id_producto_financiero, descripcion, beneficios)
VALUES (producto_financiero.nextVal, t.id_producto_financiero, t.descripcion, t.beneficios);



---------------------------------------------
MERGE INTO dim_tipo_transaccion dt USING (
select  tt.id_tipo_transaccion,
		tt.descripcion,
		tt.interes,
		tt.porcentaje
FROM INTER.tipo_transaccion tt
)t
on (dt.id_tipo_transaccion=t.id_tipo_transaccion)
WHEN MATCHED THEN
UPDATE SET dt.descripcion=t.descripcion, dt.interes=t.interes, dt.porcentaje=t.porcentaje
WHEN NOT MATCHED THEN
INSERT (dim_id_tipo_transaccion, id_tipo_transaccion, descripcion, interes, porcentaje)
VALUES (tipo_transaccion.nextVal, t.id_tipo_transaccion, t.descripcion, t.interes, t.porcentaje);




---------------------------------------
MERGE INTO dim_grupo_familiar gf USING (
select  g.id_grupo_familiar,
		g.descripcion,
		g.cant_personas_familia,
		g.menores,
		g.cant_menores,
		g.id_datos_demograficos,
		g.cant_personas,
		g.edad_promedio,
		g.ubicacion,
		g.tipo_vivienda,
		g.tipo_zona, 
		g.clase_social,
		g.ingreso_mensual
FROM INTER.grupo_familiar g
)t
on (gf.id_grupo_familiar=t.id_grupo_familiar)
WHEN MATCHED THEN 
UPDATE SET gf.descripcion=t.descripcion, gf.cant_personas_familia=t.cant_personas_familia, gf.menores=t.menores, gf.cant_menores=t.cant_menores,
	       gf.id_datos_demograficos=t.id_datos_demograficos, gf.cant_personas=t.cant_personas, gf.edad_promedio=t.edad_promedio,
	       gf.ubicacion=t.ubicacion, gf.tipo_vivienda=t.tipo_vivienda, gf.tipo_zona=t.tipo_zona, gf.clase_social=t.clase_social,
	       gf.ingreso_mensual=t.ingreso_mensual
WHEN NOT MATCHED THEN
INSERT (dim_id_grupo_familiar, id_grupo_familiar, descripcion, cant_personas_familia, menores, cant_menores, id_datos_demograficos, cant_personas, edad_promedio, ubicacion, tipo_vivienda, tipo_zona, clase_social, ingreso_mensual)
VALUES (grupo_familiar.nextVal, t.id_grupo_familiar, t.descripcion, t.cant_personas_familia, t.menores, t.cant_menores, t.id_datos_demograficos, t.cant_personas, t.edad_promedio, t.ubicacion, t.tipo_vivienda, t.tipo_zona, t.clase_social, t.ingreso_mensual);

---- ETL TIEMPO
DECLARE
FechaDesde date;
FechaHasta date;
nano number;
nmes number;
id number;
BEGIN
	FechaDesde := TO_DATE('20000101','YYYYMMDD');
	FechaHasta := TO_DATE((TO_CHAR(sysdate,'YYYY')+13 || '1231'),'YYYYMMDD');
	nano := 0;
	nmes := 100;
	id := 1000;
	WHILE FechaDesde <= FechaHasta LOOP
		INSERT INTO dim_tiempo(
			dim_id_tiempo,
			ano,
			id_ano,
			desc_ano,
			mes,
			id_mes,
			desc_mes,
			fecha_completa
		)
		VALUES(
			id,
			to_char(FechaDesde,'YYYY'),
			nano,
			'Indica el año en que el articulo ingreso',
			to_char(FechaDesde,'MM'),
			nmes,
			'Indica el mes en que el articulo ingreso',
			FechaDesde
		);
		FechaDesde := FechaDesde + 1;
		id := id + 1;
		nano := nano + 1;
		nmes := nmes + 1;
	END LOOP;
END;	
/