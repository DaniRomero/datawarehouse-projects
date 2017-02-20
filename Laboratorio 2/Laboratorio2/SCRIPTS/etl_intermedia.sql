--ETL PARA LLENADO DE LA BD INTERMEDIA -- 
--LLENADO DE SUCURSAL--
MERGE INTO sucursal e USING TRANS.sucursal c 
ON (e.id_sucursal=c.id_sucursal)
WHEN NOT MATCHED THEN 
INSERT (id_sucursal, descripcion, rif, telefono, fax) 
VALUES (c.id_sucursal, c.descripcion, c.rif, c.telefono, c.fax);

--LLENADO DE PRODUCTO FINANCIERO--
MERGE INTO producto_financiero e USING TRANS.producto_financiero c 
ON (e.id_producto_financiero=c.id_producto_financiero)
WHEN NOT MATCHED THEN 
INSERT (id_producto_financiero, descripcion, beneficios) 
VALUES (c.id_producto_financiero, c.descripcion, c.beneficios);

--LLENADO DE ESTADO DE CUENTA--
MERGE INTO estado_cuenta e USING TRANS.estado_cuenta c 
ON (e.id_edo_cuenta=c.id_estado_cuenta)
WHEN NOT MATCHED THEN 
INSERT (id_edo_cuenta, descripcion_detalle, fecha_inicio, fecha_fin, saldo_a_favor, cant_movimientos, deuda) 
VALUES (c.id_estado_cuenta, c.descripcion, c.fecha_inicio, c.fecha_fin, c.saldo_favor, c.cant_movimientos, c.deuda);

--LLENADO DE TIPO TRANSACCION--
MERGE INTO tipo_transaccion e USING TRANS.tipo_transaccion c 
ON (e.id_tipo_transaccion=c.id_tipo_transaccion)
WHEN NOT MATCHED THEN 
INSERT (id_tipo_transaccion, descripcion, interes, porcentaje) 
VALUES (c.id_tipo_transaccion, c.descripcion, to_number(c.interes), to_number(c.porcentaje));

--LLENADO DE CUENTA--
MERGE INTO cuenta ct USING(
select c.id_cuenta,
		c.numero_cuenta,
		c.fecha_apertura,
		null id_tipo_cuenta,
		null descripcion_TC,
		null requisitos,
		null id_sucursal,
		null descripcion,
		null rif,
		null telefono,
		null fax,
		null id_status_cuenta,
		null descripcion_ST
from TRANS.cuenta c
union
select c.id_cuenta,
		c.numero_cuenta,
		c.fecha_apertura,
		tc.id_tipo_cuenta,
		tc.descripcion_TC,
		tc.requisitos,
		null id_sucursal,
		null descripcion,
		null rif,
		null telefono,
		null fax,
		null id_status_cuenta,
		null descripcion_ST
from TRANS.cuenta c
join TRANS.tipo_cuenta tc
on(c.id_tipo_cuenta=tc.id_tipo_cuenta)
union
select c.id_cuenta,
		c.numero_cuenta,
		c.fecha_apertura,
		tc.id_tipo_cuenta,
		tc.descripcion_TC,
		tc.requisitos,
		s.id_sucursal,
		s.descripcion,
		s.rif,
		s.telefono,
		s.fax,
		null id_status_cuenta,
		null descripcion_ST
from TRANS.cuenta c
join TRANS.tipo_cuenta tc
on(c.id_tipo_cuenta=tc.id_tipo_cuenta)
join TRANS.sucursal s
on (s.id_sucursal=c.id_sucursal)
union
select c.id_cuenta,
		c.numero_cuenta,
		c.fecha_apertura,
		tc.id_tipo_cuenta,
		tc.descripcion_TC,
		tc.requisitos,
		s.id_sucursal,
		s.descripcion,
		s.rif,
		s.telefono,
		s.fax,
		sc.id_status_cuenta,
		sc.descripcion_ST
from TRANS.cuenta c
join TRANS.tipo_cuenta tc
on(c.id_tipo_cuenta=tc.id_tipo_cuenta)
join TRANS.sucursal s
on (s.id_sucursal=c.id_sucursal)
join TRANS.status_cuenta sc
on(sc.id_status_cuenta=c.id_status_cuenta)
) aux
on(ct.id_cuenta=aux.id_cuenta)
when matched then
update set ct.numero_cuenta = aux.numero_cuenta, ct.fecha_apertura = aux.fecha_apertura,
			ct.id_tipo_cuenta = aux.id_tipo_cuenta, ct.descripcion_tipo_cuenta = aux.descripcion_TC, ct.requisitos = aux.requisitos,
			ct.id_sucursal = aux.id_sucursal, ct.descripcion_sucursal = aux.descripcion, ct.rif = aux.rif, ct.telefono = aux.telefono, ct.fax = aux.fax,
			ct.id_status_cuenta = aux.id_status_cuenta, ct.descripcion_estatus= aux.descripcion_ST
when not matched then
insert (id_cuenta, numero_cuenta, fecha_apertura, id_tipo_cuenta, descripcion_tipo_cuenta, requisitos, id_sucursal, descripcion_sucursal, rif, telefono, fax, id_status_cuenta, descripcion_estatus)
values (cuenta_c.nextVal, aux.numero_cuenta, aux.fecha_apertura, aux.id_tipo_cuenta, aux.descripcion_TC, aux.requisitos,
		aux.id_sucursal, aux.descripcion, aux.rif, aux.telefono, aux.fax, aux.id_status_cuenta, aux.descripcion_ST);

--LLENADO DE CLIENTE--
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
INSERT (id_cliente, ci, nombre, apellido, rif, correo, edad, sexo, direccion, id_estado_civil, descripcion, id_datos_c, este_banco, monto, tasa_interes, cant_plazos, fecha_inicio, fecha_fin, status)
VALUES (cliente_c.nextVal, p.ci, p.nombre, p.apellido, p.rif, p.correo, p.edad, p.sexo, p.direccion, p.id_estado_civil, p.descripcion, p.id_datos_c, p.este_banco, p.monto, p.tasa_interes, p.cant_plazos, p.fecha_inicio, p.fecha_fin, p.status);



INSERT INTO transaccion 
SELECT cl.id_cliente,
	   gf.id_grupo_familiar,
	   su.id_sucursal,
	   p.id_producto_financiero,
	   cu.id_cuenta,
	   tt.id_tipo_transaccion,
	   ec.id_edo_cuenta
FROM ( select cl.id_cliente id_cliente, gf.id_grupo_familiar id_grupo_familiar, su.id_sucursal id_sucursal, p.id_producto_financiero id_producto_financiero, cu.id_cuenta id_cuenta, tt.id_tipo_transaccion id_tipo_transaccion,  ec.id_estado_cuenta A
from TRANS.cliente cl, TRANS.grupo_familiar gf, TRANS.sucursal su, TRANS.producto_financiero p, TRANS.cuenta cu, TRANS.tipo_transaccion tt, TRANS.estado_cuenta ec, TRANS.conforma conf, TRANS.tiene ti, TRANS.transaccion trs, TRANS.posee po 
where id_cliente=conf.id_cliente and conf.id_grupo_familiar=id_grupo_familiar and id_producto_financiero=ti.id_producto_financiero and ti.id_cuenta=id_cuenta and cu.id_sucursal=id_sucursal and trs.id_cuenta=id_cuenta and trs.id_tipo_transaccion=id_tipo_transaccion and id_cuenta=po.id_cuenta and po.id_estado_cuenta=ec.id_estado_cuenta
) x
join cliente cl
on (cl.id_cliente=x.id_cliente)
join grupo_familiar gf
on (gf.id_grupo_familiar=x.id_grupo_familiar)
join sucursal su
on (su.id_sucursal=x.id_sucursal)
join producto_financiero p
on (p.id_producto_financiero=x.id_producto_financiero)
join cuenta cu
on (cu.id_cuenta=x.id_cuenta)
join tipo_transaccion tt
on (tt.id_tipo_transaccion=x.id_tipo_transaccion)
join estado_cuenta ec
on (ec.id_edo_cuenta=x.id_ec)
