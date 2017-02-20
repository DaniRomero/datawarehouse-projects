CREATE TABLE dim_vehiculo(
	dim_vehiculo_id number primary key,
	cod_vehiculo number,
	clase varchar(210),
	marca varchar(210),
	modelo varchar(210),
	anio varchar(4),
	version varchar(210),
	color varchar(210),
	placa varchar(210)
);

CREATE SEQUENCE vehiculo_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_asegurado(
dim_asegurado_id number primary key,
/*asegurado*/
cod_asegurado number,
cedula_asegurado varchar(20),
rif_asegurado varchar(20),
nombre_asegurado varchar(500),
apellido_asegurado varchar(500),
edad_asegurado number,
correo_asegurado varchar(100),
direccion_asegurado varchar(500),
/*sexo*/
sexo varchar(20),
/*tipo persona*/
cod_tipo_persona number,
descripcion_tipo_persona varchar(500),
beneficios varchar(500),
/*estado_civil*/
cod_estado_civil_a number,
descripcion_estado_civil_a varchar(20),
/*sucursal*/
cod_sucursal_a number,
nombre_sucursal varchar(255),
rif varchar(20),
telefono varchar(20),
fax varchar(20),
direccion varchar(510),
/*ciudad*/
cod_ciudad number,
nombre_ciudad varchar(255),
codigo_postal_ciudad varchar(6),
/*estado*/
cod_estado number,
nombre_estado varchar(255),
codigo_postal_estado varchar(255)
);

CREATE SEQUENCE dim_asegurado_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_causa_siniestro(
dim_causa_siniestro_id number primary key,
cod_causa_siniestro number,
descripcion_cs varchar(210)
);

CREATE SEQUENCE dim_causa_siniestro_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_tipo_siniestro(
dim_tipo_siniestro_id number primary key,
cod_tipo_siniestro number,
descripcion_tipo_s varchar(210)
);

CREATE SEQUENCE tipo_siniestro_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_tipo_poliza(
dim_tipo_poliza number primary key,
cod_tipo_poliza number,
nombre_tipo_poliza varchar(255),
descripcion_tipo_p varchar(255),
requisitos varchar(510),
/*servicios*/
cod_servicio number,
nombre_servicio varchar(255),
descripcion_servicio varchar(255),
beneficios varchar(510)
);

CREATE SEQUENCE tipo_poliza_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_empleado(
dim_empleado_id number primary key,
/*empleado*/
cod_empleado number,
cedula_empleado varchar(20),
rif_empleado varchar(20),
nombre_empleado varchar(500),
apellido_empleado varchar(500),
edad_empleado number,
correo_empleado varchar(100),
direccion_empleado varchar(500),
/*sexo*/
sexo varchar(20),
/*tipo empleado*/
cod_tipo_empleado number,
descripcion_tipo_empleado varchar(255),
funciones varchar(510),
/*estado civil*/
cod_estado_civil_e number,
descripcion_estado_civil_e varchar(20),
/*sucursal*/
cod_sucursal_e number,
nombre_sucursal varchar(255),
rif varchar(20),
telefono varchar(20),
fax varchar(20),
direccion varchar(510),
/*ciudad*/
cod_ciudad number,
nombre_ciudad varchar(255),
codigo_postal_ciudad varchar(6),
/*estado*/
cod_estado number,
nombre_estado varchar(255),
codigo_postal_estado varchar(255)
);

CREATE SEQUENCE empleado_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_status_siniestro(
dim_status_siniestro_id number primary key,
cod_status_siniestro number,
descripcion_ss varchar(210)
);

CREATE SEQUENCE status_siniestro_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_centro_evaluacion(
dim_centro_evaluacion_id number primary key,
cod_centro number,
cod_ciudad number,
nombre_centro varchar(500),
rif varchar(50),
tipo_centro varchar(50),
direccion varchar(500),
telefono varchar(50),
fax varchar(50)
);

CREATE SEQUENCE centro_evaluacion_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_forma_pago(
dim_forma_pago_id number primary key,
cod_forma_pago number,
descripcion_tipo_fp varchar2(255)
);

CREATE SEQUENCE forma_pago_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE perito(
dim_perito_id number primary key,
carnet varchar(50),
cod_ciudad number,
nombre_perito varchar(500),
cedula number,
rif varchar(50),
telefono varchar(50),
fax varchar(50),
direccion varchar(50),
cod_sucursal number
);

CREATE SEQUENCE perito_seq
INCREMENT BY 1
START WITH 1;

CREATE TABLE dim_tiempo(
	dim_tiempo_id number PRIMARY KEY,
	-- Año
	ano number,
	id_ano number,
	desc_ano varchar(100),
	-- Mes
	mes varchar(10),
	id_mes number, 
	desc_mes varchar(100),
	-- Dia
	dia varchar(10),
	id_dia number,
	desc_dia varchar(100),
	fecha_completa date
);


CREATE TABLE fact_table(
	dim_tiempo_id number,
	dim_perito_id number,
	dim_forma_pago_id number,
	dim_centro_evaluacion_id number,
	dim_status_siniestro_id number,
	dim_empleado_id number,
	dim_tipo_poliza number,
	dim_tipo_siniestro number,
	dim_causa_siniestro_id number,
	dim_asegurado_id number,
	dim_vehiculo_id number,
	fecha_inspeccion date,
	resultado varchar2(500),
	monto_repuesto number(22,6),
	monto_total number(22,6),
	monto_pagar number(22,6),
	monto_deuda number(22,6),
	primary key (dim_tiempo_id, dim_perito_id, dim_forma_pago_id, dim_centro_evaluacion_id, dim_status_siniestro_id, dim_empleado_id,
				dim_tipo_poliza, dim_tipo_siniestro, dim_causa_siniestro_id, dim_asegurado_id, dim_vehiculo_id),
	CONSTRAINT fk1 FOREIGN KEY (dim_tiempo_id) references dim_tiempo(dim_tiempo_id),
	CONSTRAINT fk2 FOREIGN KEY (dim_perito_id) references perito(dim_perito_id),
	CONSTRAINT fk3 FOREIGN KEY (dim_forma_pago_id) references dim_forma_pago(dim_forma_pago_id),
	CONSTRAINT fk4 FOREIGN KEY (dim_centro_evaluacion_id) references dim_centro_evaluacion(dim_centro_evaluacion_id),
	CONSTRAINT fk5 FOREIGN KEY (dim_status_siniestro_id) references dim_status_siniestro(dim_status_siniestro_id),
	CONSTRAINT fk6 FOREIGN KEY (dim_empleado_id) references dim_empleado(dim_empleado_id),
	CONSTRAINT fk7 FOREIGN KEY (dim_tipo_poliza) references dim_tipo_poliza(dim_tipo_poliza),
	CONSTRAINT fk12 FOREIGN KEY (dim_tipo_siniestro) references dim_tipo_siniestro(dim_tipo_siniestro_id),
	CONSTRAINT fk8 FOREIGN KEY (dim_causa_siniestro_id) references dim_causa_siniestro(dim_causa_siniestro_id),
	CONSTRAINT fk9 FOREIGN KEY (dim_asegurado_id) references dim_asegurado(dim_asegurado_id),
	CONSTRAINT fk10 FOREIGN KEY (dim_vehiculo_id) references dim_vehiculo(dim_vehiculo_id)
);
