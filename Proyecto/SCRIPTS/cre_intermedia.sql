CREATE TABLE sucursal(
/*sucursal*/
cod_sucursal number primary key, 
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

CREATE SEQUENCE sucursal_c
INCREMENT BY 1
START WITH 1;

CREATE TABLE asegurado(
cod_asegurado number primary key,
cedula_asegurado varchar(20),
rif_asegurado varchar(20),
nombre_asegurado varchar(500),
apellido_asegurado varchar(500),
edad_asegurado number,
correo_asegurado varchar(100),
direccion_asegurado varchar(500),
/*sexo*/
cod_sexo_asegurado number(8),
sexo_asegurado varchar(20),
/*tipo persona*/
cod_tipo_persona number,
descripcion_tipo_persona varchar(500),
beneficios varchar(500),
/*estado civil*/
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

CREATE SEQUENCE asegurado_c
INCREMENT BY 1
START WITH 1;

CREATE TABLE empleado(
cod_empleado number primary key,
cedula_empleado varchar(20),
rif_empleado varchar(20),
nombre_empleado varchar(500),
apellido_empleado varchar(500),
edad_empleado number,
correo_empleado varchar(100),
direccion_empleado varchar(500),
/*sexo*/
cod_sexo_empleado number(8),
sexo_empleado varchar(20),
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

CREATE SEQUENCE empleado_c
INCREMENT BY 1
START WITH 1;

CREATE TABLE tipo_poliza(
/*tipo_poliza*/
cod_tipo_poliza number primary key,
nombre_tipo_poliza varchar(255),
descripcion_tipo_p varchar(255),
requisitos varchar(510),
/*servicios*/
cod_servicio number,
nombre_servicio varchar(255),
descripcion_servicio varchar(255),
beneficios varchar(510)
);

CREATE SEQUENCE tipo_poliza_c
INCREMENT BY 1
START WITH 1;

CREATE TABLE tipo_siniestro(
cod_tipo_siniestro number primary key, 
descripcion_tipo_s varchar(210),
cod_tipo_poliza number,
CONSTRAINT cod_tipo_p_siniestro_fk FOREIGN KEY (cod_tipo_poliza) references tipo_poliza(cod_tipo_poliza)
);

CREATE TABLE poliza(
/*poliza*/
cod_poliza number primary key,
cod_tipo_poliza number,
cod_asegurado number,
cod_empleado number,
descripcion_poliza varchar(510),
suma_asegurada number(22,6),
fecha_apertura date,
vigente_hasta date,
/*forma de pago*/
cod_forma_pago number,
descripcion_tipo_fp varchar(255),
/*status*/
cod_status_poliza number,
descripcion_status_sp varchar(255),
/*sucursal*/
cod_sucursal_p number,
nombre_sucursal varchar(255),
rif varchar(20),
telefono varchar(20),
fax varchar(20),
direccion varchar(510),
CONSTRAINT cod_tipo_poliza_fk FOREIGN KEY (cod_tipo_poliza) references tipo_poliza(cod_tipo_poliza),
CONSTRAINT cod_empleado_fk FOREIGN KEY (cod_empleado) references empleado(cod_empleado),
CONSTRAINT cod_segurado_fk FOREIGN KEY (cod_asegurado) references asegurado(cod_asegurado),
CONSTRAINT cod_sucursal_poliza_fk FOREIGN KEY (cod_sucursal_p) references sucursal(cod_sucursal)
);

CREATE SEQUENCE poliza_c
INCREMENT BY 1
START WITH 1;

CREATE TABLE beneficiario(/*CTL*/
cod_poliza number,
cedula_beneficiario varchar(55) primary key,
nombre_beneficiario varchar(500),
apellido_beneficiario varchar(500),
fecha_nacimiento varchar(50),
parentesco varchar(50)
);

CREATE TABLE vehiculo(
cod_vehiculo number primary key,
cod_poliza_vehiculo number,
clase varchar(210),
marca varchar(210),
modelo varchar(210),
anio varchar(4),
version varchar(210),
color varchar(210),
placa varchar(210),
CONSTRAINT cod_beneficiario_behiculo_fk FOREIGN KEY (cod_poliza_vehiculo) references poliza(cod_poliza)
);

CREATE TABLE causa_siniestro(
cod_causa_siniestro number primary key,
descripcion_cs varchar(210)
);

CREATE TABLE status_siniestro(
cod_status_siniestro number(8) primary key,
descripcion_ss varchar(210)
);

CREATE TABLE perito(/*CTL*/
carnet varchar(50) primary key,
cod_ciudad number,
nombre_perito varchar(500),
apellido_perito varchar(500),
cedula varchar(50),
rif varchar(50),
telefono varchar(50),
fax varchar(50),
direccion varchar(50),
cod_sucursal number
);

CREATE TABLE centro_evaluacion(/*CTL*/
cod_centro number primary key,
cod_ciudad number,
nombre_centro varchar(500),
rif varchar(50),
tipo_centro varchar(50),
direccion varchar(500),
telefono varchar(50),
fax varchar(50)
);

CREATE TABLE clinica(/*CTL*/
cod_clinica number primary key,
cod_ciudad number,
nombre varchar(500),
rif varchar(50),
tipo_convenio varchar(500),
especialidad varchar(500),
direccion varchar(500),
telefono varchar(50),
fax varchar(50)
);

CREATE TABLE siniestro_salud(
cod_siniestro_salud number primary key,
cod_tipo_siniestro number,
cod_asegurado number,
cod_poliza number,
cod_empleado number,
cod_causa_siniestro number,
cod_status_siniestro number,
cod_clinica number,
fecha_examen date,
diagnostico varchar(510),
especialidad varchar(500),
monto_medicina number(22,6),
monto_total number(22,6),
monto_pagar number(22,6),
monto_deuda number(22,6),
CONSTRAINT cod_tipo_siniestro_fk FOREIGN KEY (cod_tipo_siniestro) references tipo_siniestro(cod_tipo_siniestro),
CONSTRAINT cod_asegurado_sinies_fk FOREIGN KEY (cod_asegurado) references asegurado(cod_asegurado),
CONSTRAINT cod_poliza_sini_fk FOREIGN KEY (cod_poliza) references poliza(cod_poliza),
CONSTRAINT cod_empleado_siniestro_fk FOREIGN KEY (cod_empleado) references empleado(cod_empleado),
CONSTRAINT cod_causa_siniestro_fk FOREIGN KEY (cod_causa_siniestro) references causa_siniestro(cod_causa_siniestro),
CONSTRAINT cod_status_siniestro_fk FOREIGN KEY (cod_status_siniestro) references status_siniestro(cod_status_siniestro),
CONSTRAINT cod_clinica_fk FOREIGN KEY (cod_clinica) references clinica(cod_clinica)
);

CREATE TABLE siniestro_vehiculo(
cod_siniestro_vehiculo number primary key,
cod_tipo_siniestro number,
cod_asegurado number,
cod_poliza number,
cod_empleado number,
cod_causa_siniestro number,
cod_vehiculo number, 
cod_status_siniestro number,
carnet_perito varchar(50),
cod_centro number,
fecha_inspeccion date,
resultado varchar(500),
monto_repuesto number(22,6),
monto_total number(22,6),
monto_pagar number(22,6),
monto_deuda number(22,6),
CONSTRAINT cod_tipo_siniestro_vhi_fk FOREIGN KEY (cod_tipo_siniestro) references tipo_siniestro(cod_tipo_siniestro),
CONSTRAINT cod_asegurado_sinies_vehi_fk FOREIGN KEY (cod_asegurado) references asegurado(cod_asegurado),
CONSTRAINT cod_poliza_sini_vehi_fk FOREIGN KEY (cod_poliza) references poliza(cod_poliza),
CONSTRAINT cod_empleado_siniestro_vehi_fk FOREIGN KEY (cod_empleado) references empleado(cod_empleado),
CONSTRAINT cod_causa_siniestro_vehi_fk FOREIGN KEY (cod_causa_siniestro) references causa_siniestro(cod_causa_siniestro),
CONSTRAINT cod_status_siniestrov_fk FOREIGN KEY (cod_status_siniestro) references status_siniestro(cod_status_siniestro),
CONSTRAINT cod_vehiculo_sinies_fk FOREIGN KEY (cod_vehiculo) references vehiculo(cod_vehiculo),
CONSTRAINT cod_perito_fk FOREIGN KEY (carnet_perito) references perito(carnet),
CONSTRAINT cod_centro_evaluacion_fk FOREIGN KEY (cod_centro) references centro_evaluacion(cod_centro)
);