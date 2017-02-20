INSERT INTO fact_table_n1
SELECT dp.dim_producto_id,
	   dt.dim_tienda_id,
	   t.dim_id_tiempo,
	   da.dim_almacen_id,
	   -- Hechos
	   tab.cant_existente, 
	   tab.NOPA,
	   tab.NMRD, 
	   tab.cant,
	   tab.iva, 
	   tab.pvp
FROM 
( select ti.id_tienda id_tienda, ti.id_producto id_producto, ti.NOPA NOPA, ti.NMRD NMRD, ti.fecha fecha, 
	ti.cant_existente cant_existente, aba.cant cant, aba.id_almacen id_almacen, p.iva iva, p.pvp pvp 
	FROM FUENTE.tiene ti, FUENTE.abastece aba, FUENTE.producto p 
	where ti.id_producto=p.id_producto and p.id_producto=aba.id_producto
) tab
JOIN dim_producto dp
ON (dp.id_producto=tab.id_producto)
JOIN dim_tienda dt
ON (dt.id_tienda=tab.id_tienda)
JOIN dim_tiempo t 
ON (t.fecha_completa=tab.fecha)
JOIN dim_almacen da
ON (da.id_almacen=tab.id_almacen);

INSERT INTO fact_table_n2
Select p.dim_id_proveedor,
		t.dim_id_tiempo,
		a.dim_almacen_id,
		pto.dim_producto_id,
		x.cant, --medidas
		x.NOPAL,
		x.NMRS,
		(x.fecha_rec - x.fecha_env), --tiempo respuesta
		x.costo_prod,
		x.costo_env,
		x.costo_total
from (Select pro.id_prov id_prov, pro.id_almacen id_almacen, pro.id_producto id_producto, al.fecha fecha, 
	pro.cant cant, al.NOPAL NOPAL, al.NMRS NMRS, pro.fecha_env fecha_env, pro.fecha_rec fecha_rec, pro.costo_prod costo_prod, pro.costo_env costo_env, 
	pro.costo_total costo_total 
	from FUENTE.provee pro, FUENTE.almacena al 
	where pro.id_almacen=al.id_almacen) x
join dim_proveedor p
on(x.id_prov=p.id_prov)
join dim_almacen a
on(x.id_almacen=a.id_almacen)
join dim_producto pto
on(x.id_producto=pto.id_producto)
join dim_tiempo t
on(x.fecha=t.fecha_completa);
