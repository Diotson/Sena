Create database [Lotus_glamping]
go
use [Lotus_glamping]
go

create table rol(
 idrol int primary key not null,
 nombre varchar(30) 
)

create table permisos(
idpermisos int primary key not null,
nombre varchar(30)
)

create table usuario(
cedula int primary key not null,
nombres varchar (30),
apellidos varchar (30),
correo varchar (60),
pass varchar (20),
celular varchar (15),
tipo nchar,

)
create table rol_permisos(
idrol_permisos int primary key not null,
nombre_operacion varchar(30),
permiso int foreign key (permiso) references permisos (idpermisos),
rol int foreign key (rol) references rol(idrol),
cedula int foreign key (cedula) references usuario (cedula),
)

 
create table caracteristicas (
idcaracteristica int primary key not null,
nombre varchar(30),
detalle varchar (100),
cantidad char(1) ,
estado char(10)
)


create table servicios (
idservicio int primary key not null,
nombre varchar (60),
precio float (10),
estado nchar(1)

)

create table domo (
Iddomo int primary key not null,
nombre varchar (100),
descripcion varchar (100),
)

create table planes(
idplan int  primary key not null,
nombre varchar (80),
descripcion varchar (100),
precio_plandoble float (10),
domo int foreign key (domo) references domo(iddomo),
caracteristicas int foreign key (caracteristicas) references caracteristicas (idcaracteristica),
servicios int foreign key (servicios) references servicios(idservicio)
)

create table reserva(
id_reserva int primary key not null,
fecha_reserva date not null,
fecha_inicio date not null,
fecha_fin date not null,
numero_personas int not null,
recomendacion varchar(500),
precio float (10),
usuario int foreign key (usuario) references usuario(cedula),

)

create table servicios_reserva (
idservicios_reserva int primary key not null,
precio float (10),
cantidad int,
servicio int foreign key (servicio)references servicios(idservicio),
reserva int foreign key (reserva) references reserva(id_reserva),

)

create table domo_reserva (
Iddomo_reserva int primary key not null,
precio float (10),
cantidad int,
domo int foreign key (domo) references domo(iddomo),
reserva int foreign key (reserva) references reserva(id_reserva),
)

create table planes_reserva(
idplan_reserva int  primary key not null,
precio float (10),
reserva int foreign key (reserva) references reserva(id_reserva),
planes int foreign key (planes) references planes (idplan),
cantidad int
)


create table factura (
idfactura int primary key not null,
fecha_registro date, 
total float(10),
precio float(10),
reserva int foreign key (reserva) references reserva(id_reserva)

)

