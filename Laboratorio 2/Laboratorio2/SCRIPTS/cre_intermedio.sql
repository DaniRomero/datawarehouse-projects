--Creacion de tablas del modelo intermedio -- 
create table datos_crediticios(
id_datos_c varchar(50) primary key, 
este_banco varchar(50), 
id_cliente number,
monto varchar(50), 
tasa_interes varchar(50), 
cant_plazos varchar(50), 
fecha_inicio varchar(50), 
fecha_fin varchar(50), 
status varchar(50)
);

CREATE TABLE cliente(
--CLIENTE--
id_cliente number primary key,
ci varchar(500),
nombre varchar(500),
apellido varchar(500),
rif varchar(500),
correo varchar(500),
edad number,
sexo varchar(3),
direccion varchar(500),
--ESTADO CIVIL--
id_estado_civil number,
descripcion varchar(500),
--DATOS CREDITICIOS--
id_datos_c varchar(50),
este_banco varchar(50), 
monto varchar(50), 
tasa_interes varchar(50), 
cant_plazos varchar(50), 
fecha_inicio varchar(50), 
fecha_fin varchar(50), 
status varchar(50),
CONSTRAINT datos_crediticios_fk FOREIGN KEY (id_datos_c) references datos_crediticios(id_datos_c)
);
---secuencia---
CREATE SEQUENCE cliente_c
INCREMENT BY 1
START WITH 1;


CREATE TABLE grupo_familiar(
id_grupo_familiar number primary key,
descripcion varchar(500),
cant_personas_familia number,
menores char,
cant_menores number,
--DATOS DEMOGRAFICOS
id_datos_demograficos number,
cant_personas number,
edad_promedio number,
ubicacion varchar(500),
tipo_vivienda varchar(500),
tipo_zona varchar(500),
clase_social varchar(500),
ingreso_mensual number(38,10)
);

CREATE TABLE conforma(
id_cliente number,
id_grupo_familiar number,
jefe_grupo char,
primary key (id_cliente, id_grupo_familiar),
CONSTRAINT c_cliente_fk FOREIGN KEY (id_cliente) references cliente(id_cliente),
CONSTRAINT c_gf_fk FOREIGN KEY (id_grupo_familiar) references grupo_familiar(id_grupo_familiar)
);

CREATE TABLE sucursal(
id_sucursal number primary key,
descripcion varchar(500),
rif varchar(500),
telefono varchar(500),
fax varchar(500)
);

CREATE TABLE producto_financiero(
id_producto_financiero number primary key,
descripcion varchar(500),
beneficios varchar(500)
);


CREATE TABLE estado_cuenta(
id_edo_cuenta number primary key,
descripcion_detalle varchar(500),
fecha_inicio date,
fecha_fin date,
saldo_a_favor number(38,10),
cant_movimientos number,
deuda number(38,10)
);

CREATE TABLE cuenta(
id_cuenta number primary key,
numero_cuenta number,
fecha_apertura date,
--TIPO DE CUENTA
id_tipo_cuenta number,
descripcion_tipo_cuenta varchar(500),
requisitos varchar(500),
--SUCURSAL--
id_sucursal number,
descripcion_sucursal varchar(500),
rif varchar(500),
telefono varchar(500),
fax varchar(500),
--STATUS CUENTA--
id_status_cuenta number,
descripcion_estatus varchar(500)
);
--secuencia--
CREATE SEQUENCE cuenta_c
INCREMENT BY 1
START WITH 1;

CREATE TABLE tipo_transaccion(
id_tipo_transaccion number primary key,
descripcion varchar(500),
interes number(22,6),
porcentaje number(22,6)
);

CREATE TABLE transaccion(
id_cliente number,
id_grupo_familiar number,
id_sucursal number,
id_producto_financiero number,
id_cuenta number,
id_tipo_transaccion number,
id_edo_cuenta number,
primary key (id_cliente, id_grupo_familiar, id_sucursal, id_producto_financiero, id_cuenta, id_tipo_transaccion, id_edo_cuenta),
CONSTRAINT t1_fk FOREIGN KEY (id_cliente) references cliente(id_cliente),
CONSTRAINT t2_fk FOREIGN KEY (id_grupo_familiar) references grupo_familiar(id_grupo_familiar),
CONSTRAINT t3_fk FOREIGN KEY (id_sucursal) references sucursal(id_sucursal),
CONSTRAINT t4_fk FOREIGN KEY (id_producto_financiero) references producto_financiero(id_producto_financiero),
CONSTRAINT t5_fk FOREIGN KEY (id_cuenta) references cuenta(id_cuenta),
CONSTRAINT t6_fk FOREIGN KEY (id_tipo_transaccion) references tipo_transaccion(id_tipo_transaccion),
CONSTRAINT t7_fk FOREIGN KEY (id_edo_cuenta) references estado_cuenta(id_edo_cuenta)
);

