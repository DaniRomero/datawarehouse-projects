CREATE TABLE marca (
	id_marca number  PRIMARY KEY check (id_marca > 0),
	nombre_marca varchar2(100) NOT NULL 
);	
	

CREATE TABLE categoria (
	id_categoria number PRIMARY KEY check (id_categoria > 0),
	nombre_categoria varchar2(100) NOT NULL
);

CREATE TABLE subcategoria (
	id_sub number PRIMARY KEY check (id_sub > 0),
	nombre_subca varchar2(100) NOT NULL,
	id_categoria number
);

ALTER TABLE subcategoria ADD CONSTRAINT subcategoria_categoria_FK FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);

CREATE TABLE producto (
	id_producto number PRIMARY KEY check (id_producto > 0),
	nombre_producto varchar2(100) NOT NULL,
	id_marca number, 
	pvp float,
	iva float,
	id_sub number
);

ALTER TABLE producto ADD CONSTRAINT producto_marca_FK FOREIGN KEY (id_marca) REFERENCES marca(id_marca);
ALTER TABLE producto ADD CONSTRAINT producto_subcategoria_FK FOREIGN KEY (id_sub) REFERENCES subcategoria (id_sub);

CREATE TABLE estado(
	id_estado number PRIMARY KEY CHECK (id_estado > 0),
	nombre_estado varchar2(20) NOT NULL,
	siglas varchar2(2)
);
 
CREATE TABLE ciudad (
	id_ciudad number PRIMARY KEY CHECK (id_ciudad > 0),
	nombre_ciudad varchar2(20) NOT NULL,
	siglas varchar2(2),
	id_estado number
); 
 
ALTER TABLE ciudad ADD CONSTRAINT ciudad_estado_FK FOREIGN KEY (id_estado) REFERENCES estado (id_estado);

CREATE TABLE tienda (
	id_tienda number PRIMARY KEY CHECK (id_tienda > 0),
	nombre_tienda varchar2(30) NOT NULL,
	rif varchar2(15) UNIQUE NOT NULL,
	telf varchar2(15),
	fax varchar2(15),
	cantidad_productos number, 
	id_ciudad number
);

ALTER TABLE tienda ADD CONSTRAINT tienda_ciudad_FK FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad);

CREATE TABLE proveedor (
	id_prov number PRIMARY KEY CHECK (id_prov > 0),
	nombre varchar2(40) NOT NULL,
	rif varchar2(15) UNIQUE NOT NULL,
	telf varchar2(15),
	id_ciudad number
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_ciudad_FK FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);

CREATE TABLE almacen (
	id_almacen number PRIMARY KEY CHECK (id_almacen > 0),
	nombre_almacen varchar2(40) NOT NULL,
	rif varchar2(15) UNIQUE NOT NULL,
	telf varchar2(15),
	dimensiones varchar2(15) NOT NULL,
	capacidad_producto number,	
	id_ciudad number
);

ALTER TABLE almacen ADD CONSTRAINT almacen_ciudad_FK FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);

CREATE TABLE tiene ( 
	fecha date,
	id_tienda number,
	id_producto number,
	cant_vend number,
	cant_existente number,
	NOPA number,
	NMRD number
);

ALTER TABLE tiene ADD CONSTRAINT tiene_tienda_FK FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda);
ALTER TABLE tiene ADD CONSTRAINT tiene_producto_FK FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
ALTER TABLE tiene ADD CONSTRAINT tiene_PK PRIMARY KEY (fecha, id_tienda, id_producto);

CREATE TABLE almacena (
	fecha date,
	id_almacen number,
	id_producto number,
	cant_despacho number,
	cant_existente number,
	NOPAL number,
	NMRS number
);

ALTER TABLE almacena ADD CONSTRAINT almacena_almacen_FK FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);
ALTER TABLE almacena ADD CONSTRAINT almacena_producto_FK FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
ALTER TABLE almacena ADD CONSTRAINT almacena_PK PRIMARY KEY (fecha, id_almacen, id_producto);

CREATE TABLE abastece (
	fecha_rec date,
	fecha_desc date,
	id_almacen number,
	id_tienda number,
	id_producto number,
	cant number CHECK (cant > 0)
);

ALTER TABLE abastece ADD CONSTRAINT abastece_almacen_FK FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);
ALTER TABLE abastece ADD CONSTRAINT abastece_tienda_FK FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda);
ALTER TABLE abastece ADD CONSTRAINT abastece_producto_FK FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
ALTER TABLE abastece ADD CONSTRAINT abastece_PK PRIMARY KEY (fecha_rec, fecha_desc, id_almacen, id_tienda, id_producto);

CREATE TABLE provee (
	fecha_rec date,
	fecha_env date,
	id_prov number,
	id_almacen number,
	id_producto number,
	cant number,
	costo_prod number CHECK (costo_prod > 0),
	costo_env number CHECK (costo_env > 0 ),
	costo_total number CHECK (costo_total > 0)
);

ALTER TABLE provee ADD CONSTRAINT provee_proveedor_FK FOREIGN KEY (id_prov) REFERENCES proveedor(id_prov);
ALTER TABLE provee ADD CONSTRAINT provee_almacen_FK FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);
ALTER TABLE provee ADD CONSTRAINT provee_producto_FK FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
ALTER TABLE provee ADD CONSTRAINT provee_PK PRIMARY KEY (fecha_rec, fecha_env, id_prov, id_almacen, id_producto);