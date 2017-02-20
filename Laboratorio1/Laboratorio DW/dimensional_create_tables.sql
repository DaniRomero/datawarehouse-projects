CREATE TABLE dim_producto(
	dim_producto_id number PRIMARY KEY,
	-- Producto
	id_producto number,
	nombre_producto varchar2(100), 
	pvp float,
	iva float,
	-- Subcategoria
	id_subcategoria number,
	nombre_subcategoria varchar2(100),
	-- Categoria
	id_categoria number,
	nombre_categoria varchar2(100),
	-- Marca
	id_marca number,
	nombre_marca varchar2(100)
);

CREATE SEQUENCE producto
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_tienda(
	dim_tienda_id number PRIMARY KEY,
	-- Tienda
	id_tienda number,
	nombre_tienda varchar2(100),
	rif varchar2(15),
	telf varchar2(15),
	fax varchar2(15),
	cantidad_productos number, 
	-- Ciudad
	id_ciudad number,
	nombre_ciudad varchar2(100),
	siglas_ciudad varchar(2),
	-- Estado
	id_estado number,
	nombre_estado varchar2(100),
	siglas_estado varchar2(2)
);

CREATE SEQUENCE tienda 
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_almacen(
	dim_almacen_id number PRIMARY KEY,
	id_almacen number,
	nombre_almacen varchar2(100),
	rif varchar2(15),
	telf varchar2(15),
	dimensiones varchar2(15),
	capacidad_producto number,	
	-- Ciudad
	id_ciudad number,
	nombre_ciudad varchar2(100),
	siglas_ciudad varchar2(2),
	-- Estado
	id_estado number,
	nombre_estado varchar2(100),
	siglas_estado varchar2(2)
);

CREATE SEQUENCE almacen 
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_tiempo(
	dim_id_tiempo number PRIMARY KEY,
	-- Año
	ano number,
	id_ano number,
	desc_ano varchar2(100),
	-- Mes
	mes varchar2(10),
	id_mes number, 
	desc_mes varchar2(100),
	-- Dia
	dia varchar2(10),
	id_dia number,
	desc_dia varchar2(100),
	fecha_completa date
);

CREATE TABLE dim_proveedor(
	dim_id_proveedor number PRIMARY KEY,
	id_prov number,
	nombre varchar2(100),
	rif varchar2(15),
	telf varchar2(15),
	-- Ciudad
	id_ciudad number,
	nombre_ciudad varchar2(100),
	siglas_ciudad varchar2(2),
	-- Estado
	id_estado number,
	nombre_estado varchar2(100),
	siglas_estado varchar2(2)
);

CREATE SEQUENCE proveedor
INCREMENT BY 1
START WITH 1;

CREATE TABLE fact_table_n1(
	dim_producto_id number,
	dim_tienda_id number,
	dim_id_tiempo number,
	dim_almacen_id number,
	cantidad number,
	NOPA number,
	NMRD number,
	nivel_demanda number,
	iva number,
	monto number
);

ALTER TABLE fact_table_n1 ADD CONSTRAINT fact_n1_producto_FK FOREIGN KEY (dim_producto_id) REFERENCES dim_producto(dim_producto_id);
ALTER TABLE fact_table_n1 ADD CONSTRAINT fact_n1_tienda_FK FOREIGN KEY (dim_tienda_id) REFERENCES dim_tienda(dim_tienda_id);
ALTER TABLE fact_table_n1 ADD CONSTRAINT fact_n1_tiempo_FK FOREIGN KEY (dim_id_tiempo) REFERENCES dim_tiempo(dim_id_tiempo);
ALTER TABLE fact_table_n1 ADD CONSTRAINT fact_n1_almacen_FK FOREIGN KEY (dim_almacen_id) REFERENCES dim_almacen(dim_almacen_id);
ALTER TABLE fact_table_n1 ADD CONSTRAINT fact_n1_PK PRIMARY KEY (dim_producto_id, dim_tienda_id, dim_id_tiempo, dim_almacen_id);

CREATE TABLE fact_table_n2(
	dim_id_proveedor number,
	dim_id_tiempo number,
	dim_almacen_id number,
	dim_producto_id number,
	cantidad number,
	NOPAL number, 
	NMRS number,
	tiempo_respuesta number,
	costo_produccion number,
	costo_envio number,
	costo_total number
);

ALTER TABLE fact_table_n2 ADD CONSTRAINT fact_n2_proveedor_FK FOREIGN KEY (dim_id_proveedor) REFERENCES dim_proveedor(dim_id_proveedor);
ALTER TABLE fact_table_n2 ADD CONSTRAINT fact_n2_tiempo_FK FOREIGN KEY (dim_id_tiempo) REFERENCES dim_tiempo(dim_id_tiempo);
ALTER TABLE fact_table_n2 ADD CONSTRAINT fact_n2_almacen_FK FOREIGN KEY (dim_almacen_id) REFERENCES dim_almacen(dim_almacen_id);
ALTER TABLE fact_table_n2 ADD CONSTRAINT fact_n2_producto_FK FOREIGN KEY (dim_producto_id) REFERENCES dim_producto(dim_producto_id);
ALTER TABLE fact_table_n2 ADD CONSTRAINT fact_n2_PK PRIMARY KEY (dim_id_proveedor, dim_id_tiempo, dim_almacen_id, dim_producto_id);
