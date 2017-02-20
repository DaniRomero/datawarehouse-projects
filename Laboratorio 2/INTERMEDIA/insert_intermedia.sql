-- 1 --
MERGE INTO estado_civil e USING TRANS.estado_civil c 
ON (e.id_estado_civil=c.id_estado_civil)
WHEN NOT MATCHED THEN 
INSERT (id_estado_civil, descripcion) 
VALUES (c.id_estado_civil, c.descripcion);

-- 2 --
MERGE INTO grupo_familiar e USING TRANS.grupo_familiar c 
ON (e.id_grupo_familiar=c.id_grupo_familiar)
WHEN NOT MATCHED THEN 
INSERT (id_grupo_familiar, descripcion, cant_personas_familia, menores) 
VALUES (c.id_grupo_familiar, c.descripcion, c.cant_personas_familia,c.menores);

-- 3 --
MERGE INTO datos_demograficos e USING TRANS.datos_demograficos c 
ON (e.id_datos_demograficos=c.id_datos_demograficos)
WHEN NOT MATCHED THEN 
INSERT (id_datos_demograficos, id_grupo_familiar, cant_personas, edad_promedio, ubicacion, tipo_vivienda, tipo_zona, clase_social, ingreso_mensual) 
VALUES (c.id_datos_demograficos, c.id_grupo_familiar, c.cant_personas, c.edad_promedio, c.ubicacion, c.tipo_vivienda, c.tipo_zona, c.clase_social, c.ingreso_mensual);

-- 19 --
MERGE INTO excel e USING DATAW2.excel c
ON (e.id_datos_crediticios=c.id_datos_crediticios)
WHEN NOT MATCHED THEN 
INSERT (id_datos_crediticios, este_banco, id_cliente, monto_pedido, tasa_interes, cant_plazos, fecha_inicio, fecha_fin, status_credito)
VALUES (c.id_datos_crediticios, c.este_banco, c.id_cliente, c.monto_pedido, c.tasa_interes, c.cant_plazos, c.fecha_inicio, c.fecha_fin, c.status_credito);

-- 4 --
MERGE INTO cliente e USING TRANS.cliente c 
ON (e.id_cliente=c.id_cliente)
WHEN NOT MATCHED THEN 
INSERT (id_cliente, ci, nombre, apellido, rif, correo, edad, sexo, direccion, id_estado_civil, id_datos_crediticios) 
VALUES (c.id_cliente, c.ci, c.nombre, c.apellido, c.rif, c.correo, c.edad, c.sexo, c.direccion, c.id_estado_civil, c.id_datos_crediticios);

-- 5 --
MERGE INTO sucursal e USING TRANS.sucursal c 
ON (e.id_sucursal=c.id_sucursal)
WHEN NOT MATCHED THEN 
INSERT (id_sucursal, descripcion, rif, telefono, fax) 
VALUES (c.id_sucursal, c.descripcion, c.rif, c.telefono, c.fax);

-- 6 --
MERGE INTO tipo_cuenta e USING TRANS.tipo_cuenta c 
ON (e.id_tipo_cuenta=c.id_tipo_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_tipo_cuenta, descripcion, requisitos) 
VALUES (c.id_tipo_cuenta, c.descripcion, c.requisitos);

-- 7 -- 
MERGE INTO status_cuenta e USING TRANS.status_cuenta c 
ON (e.id_status_cuenta=c.id_status_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_status_cuenta, descripcion) 
VALUES (c.id_status_cuenta, c.descripcion);

-- 8 --
MERGE INTO cuenta e USING TRANS.cuenta c 
ON (e.id_cuenta=c.id_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_cuenta, numero_cuenta, fecha_apertura, id_tipo_cuenta, id_sucursal, id_status_cuenta) 
VALUES (c.id_cuenta, c.numero_cuenta, c.fecha_apertura, c.id_tipo_cuenta, c.id_sucursal, c.id_status_cuenta);

-- 9 --
MERGE INTO estado_cuenta e USING TRANS.estado_cuenta c 
ON (e.id_estado_cuenta=c.id_estado_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_estado_cuenta, descripcion, fecha_inicio, fecha_fin, saldo_favor, cant_movimientos, deuda) 
VALUES (c.id_estado_cuenta, c.descripcion, c.fecha_inicio, c.fecha_fin, c.saldo_favor, c.cant_movimientos, c.deuda);

-- 10 -- 
MERGE INTO producto_financiero e USING TRANS.producto_financiero c 
ON (e.id_producto_financiero=c.id_producto_financiero)
WHEN NOT MATCHED THEN 
INSERT (id_producto_financiero, descripcion, beneficios) 
VALUES (c.id_producto_financiero, c.descripcion, c.beneficios);

-- 11 -- 
MERGE INTO tipo_transaccion e USING TRANS.tipo_transaccion c 
ON (e.id_tipo_transaccion=c.id_tipo_transaccion)
WHEN NOT MATCHED THEN 
INSERT (id_tipo_transaccion, descripcion, interes, porcentaje) 
VALUES (c.id_tipo_transaccion, c.descripcion, c.interes, c.porcentaje);

-- 12 --
MERGE INTO TRANSACCION e USING TRANS.TRANSACCION c 
ON (e.ID_TRANSACCION=c.ID_TRANSACCION)
WHEN NOT MATCHED THEN 
INSERT (ID_TRANSACCION, id_cuenta, id_cliente, id_producto_financiero, id_tipo_transaccion, fecha, descripcion, monto, impuesto) 
VALUES (c.id_transaccion, c.id_cuenta, c.id_cliente, c.id_producto_financiero, c.id_tipo_transaccion, c.fecha, c.descripcion, c.monto, c.impuesto);

-- 13 --
MERGE INTO pertenece e USING TRANS.pertenece c
ON (e.id_cliente=c.id_cliente and e.id_cuenta=c.id_cuenta and e.id_sucursal=c.id_sucursal)
WHEN NOT MATCHED THEN 
INSERT (id_cliente, id_cuenta, id_sucursal, fecha)
VALUES (c.id_cliente, c.id_cuenta, c.id_sucursal, c.fecha);

-- 14 --
MERGE INTO tiene e USING TRANS.tiene c
ON (e.id_producto_financiero=c.id_producto_financiero and e.id_cuenta=c.id_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_producto_financiero, id_cuenta)
VALUES (c.id_producto_financiero, c.id_cuenta);

-- 15 --
MERGE INTO posee e USING TRANS.posee c
ON (e.id_cuenta=c.id_cuenta and e.id_estado_cuenta=c.id_estado_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_cuenta, id_estado_cuenta)
VALUES (c.id_cuenta, c.id_estado_cuenta);

-- 16 --
MERGE INTO refleja e USING TRANS.refleja c
ON (e.id_estado_cuenta=c.id_estado_cuenta and e.id_transaccion=c.id_transaccion)
WHEN NOT MATCHED THEN 
INSERT (id_estado_cuenta, id_transaccion, fecha, saldo)
VALUES (c.id_estado_cuenta, c.id_transaccion, c.fecha, c.saldo);

-- 17 --
MERGE INTO conforma e USING TRANS.conforma c
ON (e.id_cliente=c.id_cliente and e.id_grupo_familiar=c.id_grupo_familiar)
WHEN NOT MATCHED THEN 
INSERT (id_cliente, id_grupo_familiar, jefe_grupo)
VALUES (c.id_cliente, c.id_grupo_familiar, c.jefe_grupo);

-- 18 -- 
MERGE INTO agrupa e USING TRANS.agrupa c
ON (e.id_grupo_familiar=c.id_grupo_familiar and e.id_cuenta=c.id_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_grupo_familiar, id_cuenta)
VALUES (c.id_grupo_familiar, c.id_cuenta);