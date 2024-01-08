
 
 alter table productos
 add constraint Fk_productos_categoria
 foreign key (categoria_id) references categorias (id);

 alter table stocks
 add constraint Fk_stocks_sucursal
 foreign key (sucursal_id) references sucursales (id);

 alter table stocks
 add constraint Fk_stocks_producto
 foreign key (producto_id) references productos (id);

 alter table ordenes
 add constraint Fk_ordenes_clientes
 foreign key (cliente_id) references clientes (id);

 alter table ordenes
 add constraint Fk_ordenes_sucursal
 foreign key (sucursal_id) references sucursales (id);

 alter table items
 add constraint Fk_items_orden
 foreign key (orden_id) references ordenes (id);

 alter table items
 add constraint Fk_items_producto
 foreign key (producto_id) references productos (id);

-- Calcular el precio promedio de los productos en cada categoría

 select cat.nombre as "categorias", avg (prod.precio_unitario) as "promedio categoria"
 from productos prod inner join stocks st
 on st.producto_id=prod.id
 inner join categorias cat
 on st.id=cat.id
 group by cat.nombre;

-- Obtener la cantidad total de productos en stock por categoría

 select cat.nombre , sum(cantidad) 
 from stocks st inner join categorias cat
 on st.cantidad= st.cantidad
 group by nombre ;

-- Calcular el total de ventas por sucursal

 select  suc.nombre  , sum(total) 
 from ordenes ord inner join sucursales suc
 on ord.sucursal_id = suc.id 
 group by suc.nombre;

-- Obtener el cliente que ha realizado el mayor monto de compras

 select cli.nombre as "nombre_persona", SUM(total) as "total_gastado"
 from clientes cli
 join ordenes ord on cli.id = ord.cliente_id
 group by cli.id, cli.nombre
 order by total_gastado DESC
 limit 1;



 