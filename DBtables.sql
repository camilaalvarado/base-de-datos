CREATE TABLE  categoria (
    ID INTEGER PRIMARY KEY NOT NULL,
    nombre TEXT
  );


CREATE TABLE producto (
    ID INTEGER PRIMARY KEY,
    nombre TEXT,
    marca TEXT,
    categoria_id TEXT,
    precio_unitario REAL
);

 CREATE TABLE sucursal (
    ID PRIMARY KEY,
    nombre TEXT,
    direccion TEXT
);

 CREATE TABLE cliente (
    ID PRIMARY KEY,
    nombre TEXT,
    telefono INTEGER
);

 CREATE TABLE orden (
    ID PRIMARY KEY,
    cliente_id INTEGER,
    sucursal_id INTEGER ,
    fecha INTEGER ,
    total REAL
);

CREATE TABLE  stock (
    ID PRIMARY KEY,
    sucursal_id int UNIQUE NOT NULL,
    producto_id int UNIQUE NOT NULL,
    cantidad INTEGER
    
);

 CREATE TABLE item (
    ID PRIMARY KEY,
    orden_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    monto_venta REAL
);
