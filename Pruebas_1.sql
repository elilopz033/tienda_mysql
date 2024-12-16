USE Tienda;

/* PRIMERO INSERTAMOS DATOS EN LA TABLA CATEGORÍAS*/

INSERT ignore into categorias (nombre_categoria) VALUES 
('Electrónica'),
('Hogar'),
('Juguetes');

/* INSERTAMOS DATOS EN LA TABLA CLIENTES*/

INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Juan Pérez', 'juan.perez@example.com', '5551234567', 'Av. Principal 123'),
('Ana López', 'ana.lopez@example.com', '5559876543', 'Calle Secundaria 456');

/* INSERTAMOS DATOS EN LA TABLA PROVEEDORES*/

INSERT INTO proveedores (nombre, telefono, direccion) VALUES
('Proveedor A', '5551112222', 'Parque Industrial 101'),
('Proveedor B', '5553334444', 'Zona Comercial 202');

/* INSERTAMOS DATOS EN LA TABLA PRODUCTOS*/

INSERT INTO productos (nombre, precio, stock, id_categoria) VALUES
('Smartphone', 250.00, 100, 1),  -- Electrónica
('Televisor', 400.00, 50, 1),    -- Electrónica
('Sofá', 300.00, 10, 2),         -- Hogar
('Pelota', 15.00, 200, 3);       -- Juguetes

/* INSERTAMOS DATOS EN LA TABLA PEDIDOS*/

INSERT INTO pedidos (fecha, id_cliente) VALUES
('2024-12-01', 1),  -- Pedido de Juan Pérez
('2024-12-02', 2);  -- Pedido de Ana López

/* INSERTAMOS DATOS EN LA TABLA DETALLES_PEDIDOS*/

INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 250.00),  -- Juan compró 2 smartphones
(1, 4, 1, 15.00),   -- Juan compró 1 pelota
(2, 3, 1, 300.00);  -- Ana compró 1 sofá

/* INSERTAMOS DATOS EN LA TABLA PROVEEDORES_PRODUCTOS*/

INSERT INTO proveedores_productos (id_proveedor, id_producto) VALUES
(1, 1),  -- Proveedor A distribuye Smartphone
(1, 2),  -- Proveedor A distribuye Televisor
(2, 3),  -- Proveedor B distribuye Sofá
(2, 4);  -- Proveedor B distribuye Pelota

UPDATE categorias SET nombre_categoria = 'Electrónica' WHERE nombre_categoria = 'Hogar';


/* --- Pruebas de Restricciones --- Insertamos un producto de categoía existente */

-- Probar restricción de clave foránea, insertando un producto que no está en la Base de Datos

INSERT INTO productos (nombre, precio, stock, id_categoria) VALUES
('Tablet', 150.00, 50, 99);  -- Categoría inexistente

-- Intentar eliminar una categoría refenciada por un producto

DELETE FROM categorias WHERE id_categoria = 4;

-- Eliminar un cliente que tiene pedidos

DELETE FROM clientes WHERE id_cliente = 1;

-- Insertar un precio en negativo

INSERT INTO productos (nombre, precio, stock, id_categoria) VALUES
('Producto Inválido', -100.00, 10, 1);






