

CREATE TABLE  categorias (
    ID SERIAL primary key,
    nombre VARCHAR (50) NOT NULL
  );


CREATE TABLE productos (
    ID SERIAL PRIMARY KEY,
    nombre VARCHAR (50),
    marca VARCHAR (50),
    categoria_id INTEGER NOT NULL,
    precio_unitario numeric (10,2) NOT NULL
);

 CREATE TABLE sucursales (
    ID SERIAL PRIMARY KEY,
    nombre VARCHAR (50),
    direccion VARCHAR (50) NOT NULL
);

 CREATE TABLE clientes (
    ID SERIAL PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    telefono VARCHAR (10) NOT NULL
);

 CREATE TABLE ordenes (
    ID SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    sucursal_id INTEGER NOT NULL ,
    fecha date NOT NULL,
    total numeric (10,2) NOT NULL
);

CREATE TABLE  stocks (
    ID SERIAL PRIMARY KEY,
    sucursal_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL
);

 CREATE TABLE items (
    ID SERIAL PRIMARY KEY,
    orden_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    monto_venta numeric (10,2)
);

insert into categorias (nombre)
values ('Electrónicos'),('Ropa'),('Hogar'),('Deportes'),('Juguetes');

insert  into productos (nombre,marca,categoria_id,precio_unitario) 
values ('Televisor','Sony',1,1000),('Laptop','HP',1,800),('Camisa','Zara',2,50),('Pantalón','Levi''s',2,70),('Sartén','T-fal',3,30),('Toalla','Cannon',3,20),('Pelota','Nike',4,15),('Raqueta','Wilson',4,50),('Muñeca','Barbie',5,25),('Carro','Hot Wheels',5,10);

insert into sucursales (nombre,direccion) 
values ('Sucursal A','Calle 1'),('Sucursal B','Calle 2'),('Sucursal C','Calle 3');

insert into clientes (nombre,telefono) 
values ('Juan','1234567890'),('María','0987654321'),('Pedro','5555555555');

insert into ordenes (cliente_id,sucursal_id,fecha,total) 
values (1,3,'2023-06-12',575),(2,1,'2023-06-12',705),(3,3,'2023-06-12',9000),(2,3,'2023-06-12',10400),(3,3,'2023-06-12',85),(1,1,'2023-06-12',830),(1,1,'2023-06-12',490),(3,3,'2023-06-12',16100),(3,2,'2023-06-12',680),(2,1,'2023-06-12',7525),(2,3,'2023-06-12',725),(3,1,'2023-06-12',11430),(3,3,'2023-06-12',4900),(3,3,'2023-06-12',5490),(1,1,'2023-06-12',420);

insert into stocks (Sucursal_Id,Producto_Id,Cantidad) 
values (1,1,65),(1,2,71),(1,3,8),(1,4,42),(1,5,61),(1,6,14),(1,7,70),(1,8,66),(1,9,13),(1,10,68),(2,1,14),(2,2,67),(2,3,74),(2,4,32),(2,5,75),(2,6,37),(2,7,14),(2,8,42),(2,9,51),(2,10,41),(3,1,59),(3,2,98),(3,3,52),(3,4,85),(3,5,31),(3,6,17),(3,7,13),(3,8,18),(3,9,76),(3,10,1);

insert into items (orden_id,producto_id,cantidad,monto_venta) 
values (1,9,7,175),(1,8,8,400),(2,9,3,75),(2,5,9,270),(2,5,10,300),(2,6,3,60),(3,1,9,9000),(4,1,4,4000),(4,2,8,6400),(5,6,2,40),(5,7,3,45),(6,4,9,630),(6,9,4,100),(6,3,2,100),(7,5,8,240),(7,9,6,150),(7,8,2,100),(8,1,6,6000),(8,1,10,10000),(8,3,2,100),(9,8,9,450),(9,3,3,150),(9,7,2,30),(9,10,5,50),(10,9,9,225),(10,1,7,7000),(10,3,6,300),(11,7,5,75),(11,9,8,200),(11,3,9,450),(12,2,7,5600),(12,1,5,5000),(12,6,9,180),(12,8,9,450),(12,8,4,200),(13,9,4,100),(13,2,6,4800),(14,1,5,5000),(14,4,7,490),(15,9,6,150),(15,5,9,270);

-- Obtener el precio mínimo, precio máximo y precio promedio de todos los productos.

select min(precio_unitario), max(precio_unitario), avg(precio_unitario) from productos;

-- Calcular la cantidad total de productos en stock por sucursal.

select s.nombre , sum(cantidad) 
  from stocks st 
 inner 
  join sucursales s  
    on st.sucursal_id = s.id 
 group 
    by nombre ;

 -- Obtener el total de ventas por cliente.
   
 select  c.nombre  , sum(total) 
  from ordenes o 
 inner 
  join clientes c 
    on o.cliente_id = c.id 
 group by c.nombre
 
 