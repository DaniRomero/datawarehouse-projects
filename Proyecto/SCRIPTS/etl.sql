/* ------------------------------------------------------ */
MERGE INTO sucursal s USING (
SELECT 	su.cod_sucursal,
		su.nombre_sucursal,
		su.rif,
		su.telefono,
		su.fax,
		su.direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado,
		null nombre_estado,
		null cod_postal_e
FROM TRANS.sucursal su
UNION
SELECT 	su.cod_sucursal,
		su.nombre_sucursal,
		su.rif,
		su.telefono,
		su.fax,
		su.direccion_sucursal,
		ci.cod_ciudad,
		ci.nombre_ciudad,
		ci.cod_postal_c,
		null cod_estado,
		null nombre_estado,
		null cod_postal_e
FROM TRANS.sucursal su
join TRANS.ciudad ci
ON (su.cod_ciudad = ci.cod_ciudad)
UNION
SELECT 	su.cod_sucursal,
		su.nombre_sucursal,
		su.rif,
		su.telefono,
		su.fax,
		su.direccion_sucursal,
		ci.cod_ciudad,
		ci.nombre_ciudad,
		ci.cod_postal_c,
		es.cod_estado,
		es.nombre_estado,
		es.cod_postal_e
FROM TRANS.sucursal su
join TRANS.ciudad ci
ON (su.cod_ciudad = ci.cod_ciudad)
join TRANS.estado es 
ON (ci.cod_estado = es.cod_estado)
) t
ON (s.cod_sucursal=t.cod_sucursal)
WHEN MATCHED THEN
UPDATE SET s.nombre_sucursal=t.nombre_sucursal, 
		   s.rif=t.rif, s.telefono=t.telefono, 
		   s.direccion=t.direccion_sucursal,
		   s.cod_ciudad=t.cod_ciudad, 
		   s.nombre_ciudad=t.nombre_ciudad, 
		   s.codigo_postal_ciudad=t.cod_postal_c,
		   s.cod_estado=t.cod_estado, 
		   s.nombre_estado=t.nombre_estado, 
		   s.codigo_postal_estado=t.cod_postal_e
WHEN NOT MATCHED THEN
INSERT (cod_sucursal, nombre_sucursal, rif, telefono, fax, direccion, cod_ciudad, nombre_ciudad, codigo_postal_ciudad, cod_estado, nombre_estado, codigo_postal_estado)
VALUES (sucursal_c.nextVal, t.nombre_sucursal, t.rif, t.telefono, t.fax, t.direccion_sucursal, t.cod_ciudad, t.nombre_ciudad, t.cod_postal_c, t.cod_estado, t.nombre_estado, t.cod_postal_e);


/* ------------------------------------------------------ */
MERGE INTO asegurado a USING (
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		null cod_sexo,
		null descripcion,
		null cod_tip_pers,
		null descripcion_tp,
		null beneficios_tp,
		null cod_est_civil,
		null descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal,
		null rif,
		null telefono,
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado, 
		null nombre_estado,
		null cod_postal_e 
FROM TRANS.asegurado ase 
UNION
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		sx.cod_sexo,
		sx.descripcion,
		null cod_tip_pers,
		null descripcion_tp,
		null beneficios_tp,
		null cod_est_civil,
		null descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal,
		null rif,
		null telefono,
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado, 
		null nombre_estado,
		null cod_postal_e 
FROM TRANS.asegurado ase 
join TRANS.sexo sx
ON (ase.cod_sexo=sx.cod_sexo)
UNION
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		sx.cod_sexo,
		sx.descripcion,
		tp.cod_tip_pers,
		tp.descripcion_tp,
		tp.beneficios_tp,
		null cod_est_civil,
		null descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal,
		null rif,
		null telefono,
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado, 
		null nombre_estado,
		null cod_postal_e 
FROM TRANS.asegurado ase
join TRANS.sexo sx
ON (ase.cod_sexo=sx.cod_sexo) 
join TRANS.tipo_persona tp
ON (ase.cod_tip_pers=tp.cod_tip_pers)
UNION
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		sx.cod_sexo,
		sx.descripcion,
		tp.cod_tip_pers,
		tp.descripcion_tp,
		tp.beneficios_tp,
		ec.cod_est_civil,
		ec.descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal,
		null rif,
		null telefono,
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado, 
		null nombre_estado,
		null cod_postal_e 
FROM TRANS.asegurado ase
join TRANS.sexo sx
ON (ase.cod_sexo=sx.cod_sexo) 
join TRANS.tipo_persona tp
ON (ase.cod_tip_pers=tp.cod_tip_pers)
join TRANS.estado_civil ec
ON (ase.cod_est_civil=ec.cod_est_civil)
UNION
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		sx.cod_sexo,
		sx.descripcion,
		tp.cod_tip_pers,
		tp.descripcion_tp,
		tp.beneficios_tp,
		ec.cod_est_civil,
		ec.descripcion_ec,
		su.cod_sucursal,
		su.nombre_sucursal,
		su.rif,
		su.telefono,
		su.fax,
		su.direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado, 
		null nombre_estado,
		null cod_postal_e 
FROM TRANS.asegurado ase
join TRANS.sexo sx
ON (ase.cod_sexo=sx.cod_sexo) 
join TRANS.tipo_persona tp
ON (ase.cod_tip_pers=tp.cod_tip_pers)
join TRANS.estado_civil ec
ON (ase.cod_est_civil=ec.cod_est_civil)
join TRANS.sucursal su 
ON (ase.cod_sucursal=su.cod_sucursal)
UNION
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		sx.cod_sexo,
		sx.descripcion,
		tp.cod_tip_pers,
		tp.descripcion_tp,
		tp.beneficios_tp,
		ec.cod_est_civil,
		ec.descripcion_ec,
		su.cod_sucursal,
		su.nombre_sucursal,
		su.rif,
		su.telefono,
		su.fax,
		su.direccion_sucursal,
		ci.cod_ciudad,
		ci.nombre_ciudad,
		ci.cod_postal_c,
		null cod_estado, 
		null nombre_estado,
		null cod_postal_e 
FROM TRANS.asegurado ase
join TRANS.sexo sx
ON (ase.cod_sexo=sx.cod_sexo) 
join TRANS.tipo_persona tp
ON (ase.cod_tip_pers=tp.cod_tip_pers)
join TRANS.estado_civil ec
ON (ase.cod_est_civil=ec.cod_est_civil)
join TRANS.sucursal su 
ON (ase.cod_sucursal=su.cod_sucursal)
join TRANS.ciudad ci 
ON (ase.cod_ciudad=ci.cod_ciudad)
UNION
SELECT  ase.cod_asegurado,
		ase.cedula_a,
		ase.rif_a,
		ase.nombre,
		ase.apellido,
		ase.edad_asegurado,
		ase.correo,
		ase.direccion,
		sx.cod_sexo,
		sx.descripcion,
		tp.cod_tip_pers,
		tp.descripcion_tp,
		tp.beneficios_tp,
		ec.cod_est_civil,
		ec.descripcion_ec,
		su.cod_sucursal,
		su.nombre_sucursal,
		su.rif,
		su.telefono,
		su.fax,
		su.direccion_sucursal,
		ci.cod_ciudad,
		ci.nombre_ciudad,
		ci.cod_postal_c,
		es.cod_estado, 
		es.nombre_estado,
		es.cod_postal_e 
FROM TRANS.asegurado ase
join TRANS.sexo sx
ON (ase.cod_sexo=sx.cod_sexo) 
join TRANS.tipo_persona tp
ON (ase.cod_tip_pers=tp.cod_tip_pers)
join TRANS.estado_civil ec
ON (ase.cod_est_civil=ec.cod_est_civil)
join TRANS.sucursal su 
ON (ase.cod_sucursal=su.cod_sucursal)
join TRANS.ciudad ci 
ON (ase.cod_ciudad=ci.cod_ciudad)
join TRANS.estado es
ON (ci.cod_estado=es.cod_estado)
) t
ON (a.cod_asegurado=t.cod_asegurado)
WHEN MATCHED THEN
UPDATE SET a.cedula_asegurado=t.cedula_a,
		   a.rif_asegurado=t.rif_a,
		   a.nombre_asegurado=t.nombre,
		   a.apellido_asegurado=t.apellido,
		   a.edad_asegurado=t.edad_asegurado,
		   a.correo_asegurado=t.correo,
		   a.direccion_asegurado=t.direccion,
		   a.cod_sexo_asegurado=t.cod_sexo,
		   a.sexo_asegurado=t.descripcion,
		   a.cod_tipo_persona=t.cod_tip_pers,
		   a.descripcion_tipo_persona=t.descripcion_tp,
		   a.beneficios=t.beneficios_tp,
		   a.cod_estado_civil_a=t.cod_est_civil,
		   a.descripcion_estado_civil_a=t.descripcion_ec,
		   a.cod_sucursal_a=t.cod_sucursal,
		   a.nombre_sucursal=t.nombre_sucursal,
		   a.rif=t.rif,
		   a.telefono=t.telefono,
		   a.fax=t.fax,
		   a.direccion=t.direccion_sucursal,
		   a.cod_ciudad=t.cod_ciudad,
		   a.nombre_ciudad=t.nombre_ciudad,
		   a.codigo_postal_ciudad=t.cod_postal_c,
		   a.cod_estado=t.cod_estado,
		   a.nombre_estado=t.nombre_estado,
		   a.codigo_postal_estado=t.cod_postal_e
WHEN NOT MATCHED THEN
INSERT (cod_asegurado, cedula_asegurado, rif_asegurado, nombre_asegurado, apellido_asegurado, edad_asegurado, correo_asegurado, direccion_asegurado, cod_sexo_asegurado, sexo_asegurado, cod_tipo_persona, descripcion_tipo_persona, beneficios, cod_estado_civil_a, descripcion_estado_civil_a, cod_sucursal_a, nombre_sucursal, rif, telefono, fax, direccion, cod_ciudad, nombre_ciudad, codigo_postal_ciudad, cod_estado, nombre_estado, codigo_postal_estado)
VALUES (asegurado_c.nextVal, t.cedula_a, t.rif_a, t.nombre, t.apellido, t.edad_asegurado, t.correo, t.direccion, t.cod_sexo, t.descripcion, t.cod_tip_pers, t.descripcion_tp, t.beneficios_tp, t.cod_est_civil, t.descripcion_ec, t.cod_sucursal, t.nombre_sucursal, t.rif, t.telefono, t.fax, t.direccion_sucursal, t.cod_ciudad, t.nombre_ciudad, t.cod_postal_c, t.cod_estado, t.nombre_estado, t.cod_postal_e);


/* ------------------------------------------------------ */
MERGE INTO empleado e USING (
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		null cod_sexo,
		null descripcion,
		null cod_tip_emp,
		null descripcion_te,
		null funciones_te,
		null cod_est_civil,
		null descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal, 
		null rif, 
		null telefono, 
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado,
		null nombre_estado, 
		null cod_postal_e
FROM TRANS.empleado em 
UNION
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		sx.cod_sexo,
		sx.descripcion,
		null cod_tip_emp,
		null descripcion_te,
		null funciones_te,
		null cod_est_civil,
		null descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal, 
		null rif, 
		null telefono, 
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado,
		null nombre_estado, 
		null cod_postal_e
FROM TRANS.empleado em 
join TRANS.sexo sx 
ON (em.cod_sexo=sx.cod_sexo)
UNION
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		sx.cod_sexo,
		sx.descripcion,
		te.cod_tip_emp,
		te.descripcion_te,
		te.funciones_te,
		null cod_est_civil,
		null descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal, 
		null rif, 
		null telefono, 
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado,
		null nombre_estado, 
		null cod_postal_e
FROM TRANS.empleado em 
join TRANS.sexo sx 
ON (em.cod_sexo=sx.cod_sexo)
join TRANS.tipo_empleado te
ON (em.cod_tip_emp=te.cod_tip_emp)
UNION
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		sx.cod_sexo,
		sx.descripcion,
		te.cod_tip_emp,
		te.descripcion_te,
		te.funciones_te,
		ec.cod_est_civil,
		ec.descripcion_ec,
		null cod_sucursal,
		null nombre_sucursal, 
		null rif, 
		null telefono, 
		null fax,
		null direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado,
		null nombre_estado, 
		null cod_postal_e
FROM TRANS.empleado em 
join TRANS.sexo sx 
ON (em.cod_sexo=sx.cod_sexo)
join TRANS.tipo_empleado te
ON (em.cod_tip_emp=te.cod_tip_emp)
join TRANS.estado_civil ec
ON (em.cod_est_civil=ec.cod_est_civil)
UNION
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		sx.cod_sexo,
		sx.descripcion,
		te.cod_tip_emp,
		te.descripcion_te,
		te.funciones_te,
		ec.cod_est_civil,
		ec.descripcion_ec,
		su.cod_sucursal,
		su.nombre_sucursal, 
		su.rif, 
		su.telefono, 
		su.fax,
		su.direccion_sucursal,
		null cod_ciudad,
		null nombre_ciudad,
		null cod_postal_c,
		null cod_estado,
		null nombre_estado, 
		null cod_postal_e
FROM TRANS.empleado em 
join TRANS.sexo sx 
ON (em.cod_sexo=sx.cod_sexo)
join TRANS.tipo_empleado te
ON (em.cod_tip_emp=te.cod_tip_emp)
join TRANS.estado_civil ec
ON (em.cod_est_civil=ec.cod_est_civil)
join TRANS.sucursal su
ON (em.cod_sucursal=su.cod_sucursal)
UNION
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		sx.cod_sexo,
		sx.descripcion,
		te.cod_tip_emp,
		te.descripcion_te,
		te.funciones_te,
		ec.cod_est_civil,
		ec.descripcion_ec,
		su.cod_sucursal,
		su.nombre_sucursal, 
		su.rif, 
		su.telefono, 
		su.fax,
		su.direccion_sucursal,
		ci.cod_ciudad,
		ci.nombre_ciudad,
		ci.cod_postal_c,
		null cod_estado,
		null nombre_estado, 
		null cod_postal_e
FROM TRANS.empleado em 
join TRANS.sexo sx 
ON (em.cod_sexo=sx.cod_sexo)
join TRANS.tipo_empleado te
ON (em.cod_tip_emp=te.cod_tip_emp)
join TRANS.estado_civil ec
ON (em.cod_est_civil=ec.cod_est_civil)
join TRANS.sucursal su
ON (em.cod_sucursal=su.cod_sucursal)
join TRANS.ciudad ci 
ON (em.cod_ciudad=ci.cod_ciudad)
UNION
SELECT  em.cod_empleado,
		em.cedula,
		em.rif_e,
		em.nombre,
		em.apellido,
		em.edad,
		em.correo,
		em.direccion,
		sx.cod_sexo,
		sx.descripcion,
		te.cod_tip_emp,
		te.descripcion_te,
		te.funciones_te,
		ec.cod_est_civil,
		ec.descripcion_ec,
		su.cod_sucursal,
		su.nombre_sucursal, 
		su.rif, 
		su.telefono, 
		su.fax,
		su.direccion_sucursal,
		ci.cod_ciudad,
		ci.nombre_ciudad,
		ci.cod_postal_c,
		es.cod_estado,
		es.nombre_estado, 
		es.cod_postal_e
FROM TRANS.empleado em 
join TRANS.sexo sx 
ON (em.cod_sexo=sx.cod_sexo)
join TRANS.tipo_empleado te
ON (em.cod_tip_emp=te.cod_tip_emp)
join TRANS.estado_civil ec
ON (em.cod_est_civil=ec.cod_est_civil)
join TRANS.sucursal su
ON (em.cod_sucursal=su.cod_sucursal)
join TRANS.ciudad ci 
ON (em.cod_ciudad=ci.cod_ciudad)
join TRANS.estado es 
ON (ci.cod_estado=es.cod_estado)
) t 
ON (e.cod_empleado=t.cod_empleado)
WHEN MATCHED THEN 
UPDATE SET e.cedula_empleado=t.cedula,
		   e.rif_empleado=t.rif,
		   e.nombre_empleado=t.nombre,
		   e.apellido_empleado=t.apellido,
		   e.edad_empleado=t.edad,
		   e.correo_empleado=t.correo,
		   e.direccion_empleado=t.direccion,
		   e.cod_sexo_empleado=t.cod_sexo,
		   e.sexo_empleado=t.descripcion,
		   e.cod_tipo_empleado=t.cod_tip_emp,
		   e.descripcion_tipo_empleado=t.descripcion_te,
		   e.funciones=t.funciones_te,
		   e.cod_estado_civil_e=t.cod_est_civil,
		   e.descripcion_estado_civil_e=t.descripcion_ec,
		   e.cod_sucursal_e=t.cod_sucursal,
		   e.nombre_sucursal=t.nombre_sucursal,
		   e.rif=t.rif_e,
		   e.telefono=t.telefono,
		   e.fax=t.fax,
		   e.direccion=t.direccion_sucursal,
		   e.cod_ciudad=t.cod_ciudad,
		   e.nombre_ciudad=t.nombre_ciudad,
		   e.codigo_postal_ciudad=t.cod_postal_c,
		   e.cod_estado=t.cod_estado,
		   e.nombre_estado=t.nombre_estado,
		   e.codigo_postal_estado=t.cod_postal_e
WHEN NOT MATCHED THEN
INSERT (cod_empleado, cedula_empleado, rif_empleado, nombre_empleado, apellido_empleado, edad_empleado, correo_empleado, direccion_empleado, cod_sexo_empleado, sexo_empleado, cod_tipo_empleado, descripcion_tipo_empleado, funciones, cod_estado_civil_e, descripcion_estado_civil_e, cod_sucursal_e, nombre_sucursal, rif, telefono, fax, direccion, cod_ciudad, nombre_ciudad, codigo_postal_ciudad, cod_estado, nombre_estado, codigo_postal_estado)
VALUES (empleado_c.nextVal, t.cedula, t.rif, t.nombre, t.apellido, t.edad, t.correo, t.direccion, t.cod_sexo, t.descripcion, t.cod_tip_emp, t.descripcion_te, t.funciones_te, t.cod_est_civil, t.descripcion_ec, t.cod_sucursal, t.nombre_sucursal, t.rif_e, t.telefono, t.fax, t.direccion_sucursal, t.cod_ciudad, t.nombre_ciudad, t.cod_postal_c, t.cod_estado, t.nombre_estado, t.cod_postal_e);


/* ------------------------------------------------------ */
MERGE INTO tipo_poliza p USING (
SELECT  tp.cod_tipo_poliza,
		tp.nomb_tip_poliza,
		tp.descripcion,
		tp.requisitos,
		null cod_servicio,
		null nombre_servicio,
		null descripcion_servicio,
		null beneficios
FROM TRANS.tipo_poliza tp
UNION 
SELECT  tp.cod_tipo_poliza,
		tp.nomb_tip_poliza,
		tp.descripcion,
		tp.requisitos,
		sv.cod_servicio,
		sv.nombre_servicio,
		sv.descripcion_servicio,
		sv.beneficios
FROM TRANS.tipo_poliza tp
join TRANS.servicio sv
ON (tp.cod_tipo_poliza=sv.cod_tipo_poliza)
) t
ON (p.cod_tipo_poliza=t.cod_tipo_poliza)
WHEN MATCHED THEN
UPDATE SET p.nombre_tipo_poliza=t.nomb_tip_poliza,
		   p.descripcion_tipo_p=t.descripcion,
		   p.requisitos=t.requisitos,
		   p.cod_servicio=t.cod_servicio,
		   p.nombre_servicio=t.nombre_servicio,
		   p.descripcion_servicio=t.descripcion_servicio,
		   p.beneficios=t.beneficios
WHEN NOT MATCHED THEN
INSERT (cod_tipo_poliza, nombre_tipo_poliza, descripcion_tipo_p, requisitos, cod_servicio, nombre_servicio, descripcion_servicio, beneficios)
VALUES (tipo_poliza_c.nextVal, t.nomb_tip_poliza, t.descripcion, t.requisitos, t.cod_servicio, t.nombre_servicio, t.descripcion_servicio, t.beneficios);


/* ------------------------------------------------------ */
MERGE INTO tipo_siniestro s USING TRANS.tipo_siniestro t
ON (s.cod_tipo_siniestro=t.cod_tipo_sin)
WHEN NOT MATCHED THEN
INSERT (cod_tipo_siniestro, descripcion_tipo_s, cod_tipo_poliza)
VALUES (t.cod_tipo_sin, t.descripcion, t.cod_tipo_poliza);


/* ------------------------------------------------------ */
MERGE INTO poliza p USING (
SELECT  po.cod_poliza,
		po.cod_tipo_poliza,
		po.cod_asegurado,
		po.cod_empleado, 
		po.descripcion_poliza,
		po.suma_asegurada,
		po.fecha_apertura,
		po.vigente_hasta,
		null cod_forma_pago,
		null descripcion,
		null cod_status_pol,
		null descripcion_sp,
		null cod_sucursal,
		null nombre_sucursal,
		null rif, 
		null telefono, 
		null fax, 
		null direccion_sucursal
FROM TRANS.poliza po 
UNION
SELECT  po.cod_poliza,
		po.cod_tipo_poliza,
		po.cod_asegurado,
		po.cod_empleado, 
		po.descripcion_poliza,
		po.suma_asegurada,
		po.fecha_apertura,
		po.vigente_hasta,
		fp.cod_forma_pago,
		fp.descripcion,
		null cod_status_pol,
		null descripcion_sp,
		null cod_sucursal,
		null nombre_sucursal,
		null rif, 
		null telefono, 
		null fax, 
		null direccion_sucursal
FROM TRANS.poliza po 
join TRANS.forma_pago fp
ON(po.cod_forma_pago=fp.cod_forma_pago)
UNION
SELECT  po.cod_poliza,
		po.cod_tipo_poliza,
		po.cod_asegurado,
		po.cod_empleado, 
		po.descripcion_poliza,
		po.suma_asegurada,
		po.fecha_apertura,
		po.vigente_hasta,
		fp.cod_forma_pago,
		fp.descripcion,
		sp.cod_status_pol,
		sp.descripcion_sp,
		null cod_sucursal,
		null nombre_sucursal,
		null rif, 
		null telefono, 
		null fax, 
		null direccion_sucursal
FROM TRANS.poliza po 
join TRANS.forma_pago fp
ON(po.cod_forma_pago=fp.cod_forma_pago)
join TRANS.status_poliza sp
ON (po.cod_status_pol=sp.cod_status_pol)
UNION
SELECT  po.cod_poliza,
		po.cod_tipo_poliza,
		po.cod_asegurado,
		po.cod_empleado, 
		po.descripcion_poliza,
		po.suma_asegurada,
		po.fecha_apertura,
		po.vigente_hasta,
		fp.cod_forma_pago,
		fp.descripcion,
		sp.cod_status_pol,
		sp.descripcion_sp,
		su.cod_sucursal,
		su.nombre_sucursal,
		su.rif, 
		su.telefono, 
		su.fax, 
		su.direccion_sucursal
FROM TRANS.poliza po 
join TRANS.forma_pago fp
ON(po.cod_forma_pago=fp.cod_forma_pago)
join TRANS.status_poliza sp
ON (po.cod_status_pol=sp.cod_status_pol)
join TRANS.sucursal su
ON (po.cod_sucursal=su.cod_sucursal)
) t
ON (p.cod_poliza=t.cod_poliza)
WHEN MATCHED THEN
UPDATE SET p.cod_tipo_poliza=t.cod_tipo_poliza,
		   p.cod_asegurado=t.cod_asegurado,
		   p.cod_empleado=t.cod_empleado,
		   p.descripcion_poliza=t.descripcion_poliza,
		   p.suma_asegurada=t.suma_asegurada,
		   p.fecha_apertura=t.fecha_apertura,
		   p.vigente_hasta=t.vigente_hasta,
		   p.cod_forma_pago=t.cod_forma_pago,
		   p.descripcion_tipo_fp=t.descripcion,
		   p.cod_status_poliza=t.cod_status_pol,
		   p.descripcion_status_sp=t.descripcion_sp,
		   p.cod_sucursal_p=t.cod_sucursal,
		   p.nombre_sucursal=t.nombre_sucursal,
		   p.rif=t.rif,
		   p.telefono=t.telefono,
		   p.fax=t.fax,
		   p.direccion=t.direccion_sucursal
WHEN NOT MATCHED THEN
INSERT (cod_poliza, cod_tipo_poliza, cod_asegurado, cod_empleado, descripcion_poliza, suma_asegurada, fecha_apertura, vigente_hasta, cod_forma_pago, descripcion_tipo_fp, cod_status_poliza, descripcion_status_sp, cod_sucursal_p, nombre_sucursal, rif, telefono, fax, direccion)
VALUES (poliza_c.nextVal, t.cod_tipo_poliza, t.cod_asegurado, t.cod_empleado, t.descripcion_poliza, t.suma_asegurada, t.fecha_apertura, t.vigente_hasta, t.cod_forma_pago, t.descripcion, t.cod_status_pol, t.descripcion_sp, t.cod_sucursal, t.nombre_sucursal, t.rif, t.telefono, t.fax, t.direccion_sucursal);


/* ------------------------------------------------------ */
MERGE INTO vehiculo v USING TRANS.vehiculo t
ON (v.cod_vehiculo=t.cod_vehiculo)
WHEN NOT MATCHED THEN
INSERT (cod_vehiculo, cod_poliza_vehiculo, clase, marca, modelo, anio, version, color, placa)
VALUES (t.cod_vehiculo, t.cod_poliza, t.clase, t.marca, t.modelo, t.anio, t.version, t.color, t.placa);


/* ------------------------------------------------------ */
MERGE INTO causa_siniestro cs USING TRANS.causa_sin t 
ON (cs.cod_causa_siniestro=t.cod_causa_sin)
WHEN NOT MATCHED THEN
INSERT (cod_causa_siniestro, descripcion_cs)
VALUES (t.cod_causa_sin, t.descripcion);


/* ------------------------------------------------------ */
MERGE INTO status_siniestro cs USING TRANS.status_siniestro t 
ON (cs.cod_status_siniestro=t.cod_status_sin)
WHEN NOT MATCHED THEN
INSERT (cod_status_siniestro, descripcion_ss)
VALUES (t.cod_status_sin, t.descripcion);


/* ------------------------------------------------------ */
MERGE INTO siniestro_salud ss USING TRANS.siniestro_salud sv 
ON (ss.cod_siniestro_salud=sv.cod_sin_salud)
WHEN NOT MATCHED THEN 
INSERT (cod_siniestro_salud, cod_tipo_siniestro, cod_asegurado, cod_poliza, cod_empleado, cod_causa_siniestro, cod_status_siniestro, cod_clinica, fecha_examen, diagnostico, especialidad, monto_medicina, monto_total, monto_pagar, monto_deuda )
VALUES (sv.cod_sin_salud, sv.cod_tipo_sin, sv.cod_asegurado, sv.cod_poliza, sv.cod_empleado, sv.cod_causa_sin, sv.cod_status_sin, sv.clinica, sv.fecha_examen, sv.diagnostico, sv.especialidad, sv.monto_medicina, sv.monto_total, sv.monto_a_pagar, sv.monto_deuda);


/* ------------------------------------------------------ */
MERGE INTO siniestro_vehiculo ss USING TRANS.siniestro_vehiculo sv 
ON (ss.cod_siniestro_vehiculo=sv.cod_sin_vehi)
WHEN NOT MATCHED THEN 
INSERT (cod_siniestro_vehiculo, cod_tipo_siniestro, cod_asegurado, cod_poliza, cod_empleado, cod_causa_siniestro, cod_vehiculo, cod_status_siniestro, carnet_perito, cod_centro, fecha_inspeccion, resultado, monto_repuesto, monto_total, monto_pagar, monto_deuda)
VALUES (sv.cod_sin_vehi, sv.cod_tipo_sin, sv.cod_asegurado, sv.cod_poliza, sv.cod_empleado, sv.cod_causa_sin, sv.cod_vehiculo, sv.cod_status_sin, sv.carnet_perito, sv.centro_insp, sv.fecha_inspec, sv.resultado, sv.monto_repuestos, sv.monto_total, sv.monto_a_pagar, sv.monto_deuda);