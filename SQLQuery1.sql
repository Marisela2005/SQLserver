create database db_ventas
go

use db_ventas
go

create table clientes (
idcliente varchar(10) primary key,
nombre varchar(20),
apellidos varchar(20),
dni varchar(8),
edad int,
sexo char(1),
telefono char(9),
direccion varchar(50)
)

create table proveedor(
idproveedor varchar(10) primary key,
razonsocial varchar(10),
ruc varchar(11),
telefono char(9),
direccion varchar(50)
)

create table categoria(
idcategoria int identity primary key,
descripcion varchar (15),
)

create table producto(
idproducto varchar(10) primary key,
serie varchar(30),
nombre varchar(30),
f_ingreso date,
f_vencimiento date,
prec_compra decimal(9,2),
prec_venta decimal(9,2),
cantidad int,
idcategoria int references categoria(idcategoria)
)

create table empleados(
idempleado varchar(5) primary key,
nombre varchar(20),
apellidos varchar(20),
dni varchar(8),
telefono char(9),
direccion varchar(50)
)
 
create table usuarios(
idusuario int identity primary key,
idempleado varchar(5) references empleados(idempleado),
usuario varchar(20),
pass varchar(20),
acceso varchar(20),
estado char(2)
)

create table compras(
idcompra int identity primary key,
fecha date,
hora varchar(10),
num_documento varchar(7),
tipo_documento varchar(7),
subtotal decimal(8,2),
igv decimal(8,2),
total decimal(8,2),
estado varchar(20),
idusuario int references usuarios(idusuario),
idproveedor varchar(10) references proveedor(idproveedor),
)

create table detalle_compras(
iddetallecompra int identity primary key,
idcompra int references compras(idcompra),
idproducto varchar(10) references producto(idproducto),
cantidad int,
precio decimal(8,2),
total decimal(8,2)
)

create table ventas(
idventa int identity primary key,
fecha date,
hora varchar(10),
serie varchar(7),
num_documento varchar(7),
tipo_documento varchar(7),
subtotal decimal(8,2),
igv decimal(8,2),
total decimal(8,2),
estado varchar(20),
idusuario int references usuarios(idusuario),
idcliente varchar(10) references clientes(idcliente)
)

create table detalle_ventas(
iddetalleventas int identity primary key,
idventa int references ventas(idventa),
idproducto varchar(10) references producto(idproducto),
cantidad int,
precio decimal(8,2),
total decimal(8,2)
)