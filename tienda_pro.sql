
-- Crear la base de datos
CREATE DATABASE tienda_pro;
USE tienda_pro;

-- Crear la tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;

-- Crear la tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    PRIMARY KEY (id_producto)
) ENGINE=InnoDB;

-- Crear la tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Crear la tabla de detalles de pedidos (CORREGIDA)
CREATE TABLE detalles_pedidos (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL, -- Añadido precio_unitario
    precio_total DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Inserción de datos en clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '555-1234'),
('Ana Gómez', 'ana.gomez@example.com', '555-5678');

-- Inserción de datos en productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Cuaderno', 'Cuaderno A5', 2.50, 100),
('Lápiz', 'Lápiz de grafito', 0.50, 200),
('Silla', 'Silla de oficina', 75.00, 50);

-- Inserción de datos en pedidos
INSERT INTO pedidos (fecha, id_cliente) VALUES
('2024-12-01', 1),
('2024-12-02', 2);

-- Inserción de datos en detalles de pedidos (CORREGIDA)
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 2.50), -- Pedido 1, Cuaderno, 2 unidades
(1, 2, 5, 0.50), -- Pedido 1, Lápiz, 5 unidades
(2, 3, 1, 75.00); -- Pedido 2, Silla, 1 unidad

-- Validación de datos
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM pedidos;
SELECT * FROM detalles_pedidos;

-- Consulta para obtener el total de un pedido
SELECT p.id_pedido, SUM(dp.precio_total) AS total_pedido
FROM pedidos p
JOIN detalles_pedidos dp ON p.id_pedido = dp.id_pedido
WHERE p.id_pedido = 1
GROUP BY p.id_pedido;

-- Consulta para obtener todos los productos de un pedido con sus detalles
SELECT p.id_pedido, prod.nombre AS nombre_producto, dp.cantidad, dp.precio_unitario, dp.precio_total
FROM pedidos p
JOIN detalles_pedidos dp ON p.id_pedido = dp.id_pedido
JOIN productos prod ON dp.id_producto = prod.id_producto
WHERE p.id_pedido = 1;