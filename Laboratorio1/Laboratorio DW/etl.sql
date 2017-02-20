---------------------------------------------------------------------------------------------ETL PRODUCTO
MERGE INTO dim_producto dp USING (
select null id_producto,
		null nombre_producto,
		null pvp,
		null iva,
		null id_subcategoria,
		null nombre_subcategoria,
		null id_categoria,
		null nombre_categoria,
		m.id_marca id_marca,
		m.nombre_marca nombre_marca
from FUENTE.marca m
union
select p.id_producto id_producto,
		p.nombre_producto nombre_producto,
		p.pvp pvp,
		p.iva iva,
		null id_subcategoria,
		null nombre_subcategoria,
		null id_categoria,
		null nombre_categoria,
		m.id_marca id_marca,
		m.nombre_marca nombre_marca
from FUENTE.marca m
join FUENTE.producto  p
on (m.id_marca=p.id_marca)
union
select p.id_producto id_producto,
		p.nombre_producto nombre_producto,
		p.pvp pvp,
		p.iva iva,
		sc.id_sub id_subcategoria,
		sc.nombre_subca nombre_subcategoria,
		null id_categoria,
		null nombre_categoria,
		m.id_marca id_marca,
		m.nombre_marca nombre_marca
from FUENTE.marca m
join FUENTE.producto  p
on (m.id_marca=p.id_marca)
join FUENTE.subcategoria sc
on(sc.id_sub=p.id_sub)
union
select p.id_producto id_producto,
		p.nombre_producto nombre_producto,
		p.pvp pvp,
		p.iva iva,
		sc.id_sub id_subcategoria,
		sc.nombre_subca nombre_subcategoria,
		c.id_categoria id_categoria,
		c.nombre_categoria nombre_categoria,
		m.id_marca id_marca,
		m.nombre_marca nombre_marca
from FUENTE.marca m
join FUENTE.producto  p
on (m.id_marca=p.id_marca)
join FUENTE.subcategoria sc
on(sc.id_sub=p.id_sub)
join FUENTE.categoria c
on(sc.id_categoria=c.id_categoria)
) auxp
on (dp.id_producto= auxp.id_producto)
WHEN MATCHED THEN 
UPDATE SET 	dp.nombre_producto=auxp.nombre_producto, dp.pvp=auxp.iva, dp.id_subcategoria=auxp.id_subcategoria, dp.nombre_subcategoria=auxp.nombre_subcategoria,
			dp.id_categoria=auxp.id_categoria, dp.nombre_categoria=auxp.nombre_categoria, dp.id_marca=auxp.id_marca, dp.nombre_marca=auxp.nombre_marca
WHEN NOT MATCHED THEN
INSERT (dim_producto_id, id_producto, nombre_producto, pvp, iva, id_subcategoria, nombre_subcategoria, id_categoria, nombre_categoria, id_marca, nombre_marca) VALUES (producto.nextVal, auxp.id_producto, auxp.nombre_producto, auxp.pvp, auxp.iva, auxp.id_subcategoria, auxp.nombre_subcategoria, auxp.id_categoria, auxp.nombre_categoria, auxp.id_marca, auxp.nombre_marca);  


---------------------------------------------------------------------------------------------ETL TIENDA
MERGE INTO dim_tienda dt USING (
select e.id_estado id_estado,
		e.nombre_estado nombre_estado,
		e.siglas siglas_estado,
		null id_tienda,
		null nombre_tienda,
		null rif,
		null telf,
		null fax,
		null cantidad_productos, 
		null id_ciudad,
		null nombre_ciudad,
		null siglas_ciudad
from FUENTE.estado e
UNION
select 
		e.id_estado id_estado,
		e.nombre_estado nombre_estado,
		e.siglas siglas_estado,
		null id_tienda,
		null nombre_tienda,
		null rif,
		null telf,
		null fax,
		null cantidad_productos, 
		c.id_ciudad id_ciudad,
		c.nombre_ciudad nombre_ciudad,
		c.siglas siglas_ciudad
from FUENTE.estado e
join FUENTE.ciudad c
on (c.id_estado=e.id_estado)
union
--
select 
		e.id_estado id_estado,
		e.nombre_estado nombre_estado,
		e.siglas siglas_estado,
		t.id_tienda id_tienda,
		t.nombre_tienda nombre_tienda,
		t.rif rif,
		t.telf telf,
		t.fax fax,
		t.cantidad_productos cantidad_productos, 
		c.id_ciudad id_ciudad,
		c.nombre_ciudad nombre_ciudad,
		c.siglas siglas_ciudad
from FUENTE.estado e
join FUENTE.ciudad c
on (c.id_estado=e.id_estado)
join FUENTE.tienda t
on (t.id_ciudad=c.id_ciudad)
) prueba
on (dt.id_tienda=prueba.id_tienda)
WHEN MATCHED THEN 
UPDATE SET 	dt.nombre_tienda=prueba.nombre_tienda, dt.rif=prueba.rif, dt.telf=prueba.telf, dt.fax=prueba.fax, 
			dt.id_ciudad=prueba.id_ciudad, dt.nombre_ciudad=prueba.nombre_ciudad, dt.siglas_ciudad=prueba.siglas_ciudad,
			dt.id_estado=prueba.id_estado, dt.nombre_estado=prueba.nombre_estado, dt.siglas_estado=prueba.siglas_estado
WHEN NOT MATCHED THEN
INSERT (dim_tienda_id, id_tienda, nombre_tienda, rif, telf, fax, cantidad_productos, id_ciudad, nombre_ciudad, siglas_ciudad, id_estado, nombre_estado, siglas_estado) 
VALUES (tienda.nextVal, prueba.id_tienda, prueba.nombre_tienda, prueba.rif, prueba.telf, prueba.fax, prueba.cantidad_productos, prueba.id_ciudad, prueba.nombre_ciudad, prueba.siglas_ciudad, prueba.id_estado, prueba.nombre_estado, prueba.siglas_estado); 

----------------------------------------------------------------------------------------------ETL PROVEEDOR
MERGE INTO dim_proveedor p USING (
	select null id_prov,
	       null nombre,
	       null rif,
	       null telf,
	       null id_ciudad,
	       null nombre_ciudad,
	       null siglas_ciudad,
		   e.id_estado id_estado,
	       e.nombre_estado nombre_estado,
		   e.siglas siglas_estado
	from FUENTE.estado e
	UNION
	select null id_prov,
	       null nombre,
	       null rif,
	       null telf,
			c.id_ciudad id_ciudad,
	       c.nombre_ciudad nombre_ciudad,
	       c.siglas siglas_ciudad,
		   e.id_estado id_estado,
	       e.nombre_estado nombre_estado,
	       e.siglas siglas_estado
	from FUENTE.estado e
	join FUENTE.ciudad c 
	on (e.id_estado=c.id_estado)
	UNION
	select pr.id_prov id_prov,
	       pr.nombre nombre,
	       pr.rif rif,
	       pr.telf telf,
	       c.id_ciudad id_ciudad,
	       c.nombre_ciudad nombre_ciudad,
	       c.siglas siglas_ciudad,
		   e.id_estado id_estado,
	       e.nombre_estado nombre_estado,
	       e.siglas siglas_estado
	from FUENTE.estado e
	join FUENTE.ciudad c 
	on (e.id_estado=c.id_estado)
	join FUENTE.proveedor pr
	on (c.id_ciudad=pr.id_ciudad)
) l
ON (l.id_prov = p.id_prov)
WHEN MATCHED THEN
	update SET p.nombre=l.nombre, p.rif=l.rif, p.telf=l.telf,
			   p.id_ciudad=l.id_ciudad, p.nombre_ciudad=l.nombre_ciudad,
			   p.siglas_ciudad=l.siglas_ciudad, p.id_estado=l.id_estado,
			   p.nombre_estado=l.nombre_estado, p.siglas_estado=l.siglas_estado
WHEN NOT MATCHED THEN
	INSERT (dim_id_proveedor, id_prov, nombre, rif, telf, 
		    id_ciudad, nombre_ciudad, siglas_ciudad, 
		    id_estado, nombre_estado, siglas_estado) 
	VALUES (proveedor.nextVal, l.id_prov, l.nombre, l.rif, l.telf, 
		    l.id_ciudad, l.nombre_ciudad, l.siglas_ciudad, 
		    l.id_estado, l.nombre_estado, l.siglas_estado);
			
----------------------------------------------------------------------------------------------------ETL ALMACEN
MERGE INTO dim_almacen da USING(
SELECT null id_almacen,
		null nombre_almacen,
		null rif,
		null telf,
		null dimensiones,
		null capacidad_producto,
		null id_ciudad,
		null nombre_ciudad,
		null siglas_ciudad,
		e.id_estado id_estado,
		e.nombre_estado nombre_estado,
		e.siglas siglas_estado
from FUENTE.estado e
UNION
select null id_almacen,
		null nombre_almacen,
		null rif,
		null telf,
		null dimensiones,
		null capacidad_producto,
		c.id_ciudad id_ciudad,
		c.nombre_ciudad nombre_ciudad,
		c.siglas siglas_ciudad,
		e.id_estado id_estado,
		e.nombre_estado nombre_estado,
		e.siglas siglas_estado
from FUENTE.estado e
join FUENTE.ciudad c
on(e.id_estado=c.id_estado)
union
select a.id_almacen id_almacen,
		a.nombre_almacen nombre_almacen,
		a.rif rif,
		a.telf telf,
		a.dimensiones dimensiones,
		a.capacidad_producto capacidad_producto,
		c.id_ciudad id_ciudad,
		c.nombre_ciudad nombre_ciudad,
		c.siglas siglas_ciudad,
		e.id_estado id_estado,
		e.nombre_estado nombre_estado,
		e.siglas siglas_estado
from FUENTE.estado e
join FUENTE.ciudad c
on(e.id_estado=c.id_estado)
join FUENTE.almacen a
on(c.id_ciudad=a.id_ciudad)
) auxa
on(auxa.id_almacen=da.id_almacen)
WHEN MATCHED THEN 
UPDATE SET da.nombre_almacen=auxa.nombre_almacen, da.rif=auxa.rif, da.telf=auxa.telf, da.dimensiones=auxa.dimensiones, da.capacidad_producto=auxa.capacidad_producto,
			da.id_ciudad=auxa.id_ciudad, da.nombre_ciudad=auxa.nombre_ciudad, da.siglas_ciudad=auxa.siglas_ciudad,
			da.id_estado=auxa.id_estado, da.nombre_estado=auxa.nombre_estado, da.siglas_estado=auxa.siglas_estado
WHEN NOT MATCHED THEN
INSERT (dim_almacen_id, id_almacen, nombre_almacen, rif, telf, dimensiones, capacidad_producto, id_ciudad, nombre_ciudad, siglas_ciudad, id_estado, nombre_estado, siglas_estado) 
VALUES (almacen.nextVal, auxa.id_almacen, auxa.nombre_almacen, auxa.rif, auxa.telf, auxa.dimensiones, auxa.capacidad_producto, auxa.id_ciudad, auxa.nombre_ciudad, auxa.siglas_ciudad, auxa.id_estado, auxa.nombre_estado, auxa.siglas_estado);
----------------------------------------------------------------------------------------------------------- ETL TIEMPO
DECLARE
FechaDesde date;
FechaHasta date;
nano number;
ndia number;
nmes number;
id number;
BEGIN
	FechaDesde := TO_DATE('20000101','YYYYMMDD');
	FechaHasta := TO_DATE((TO_CHAR(sysdate,'YYYY')+13 || '1231'),'YYYYMMDD');
	nano := 0;
	ndia := 10;
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
			dia,
			id_dia,
			desc_dia,
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
			to_char(FechaDesde,'DD'),
			ndia,
			'Indica el dia en que el articulo ingreso',
			FechaDesde
		);
		FechaDesde := FechaDesde + 1;
		id := id + 1;
		nano := nano + 1;
		ndia := ndia + 1;
		nmes := nmes + 1;
	END LOOP;
END;	
/