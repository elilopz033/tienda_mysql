use tienda_pro;

-- Consultas corregidas y algunas adicionales útiles

-- 1. Total de ventas por producto
SELECT pr.nombre AS producto, SUM(dp.cantidad * pr.precio) AS total_ventas
FROM detalles_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto
GROUP BY pr.nombre;

-- 2. Clientes con sus pedidos
SELECT c.nombre AS cliente, p.id_pedido, p.fecha
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente;

-- 3. Total vendido por producto (ordenado descendentemente)
SELECT pr.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM detalles_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY total_vendido DESC;

-- 4. Clientes que no han realizado pedidos
SELECT c.nombre AS cliente
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- 5. Total de ventas por pedido
SELECT p.id_pedido, SUM(dp.precio_total) AS total_pedido
FROM pedidos p
JOIN detalles_pedidos dp ON p.id_pedido = dp.id_pedido
GROUP BY p.id_pedido;

-- 6. Detalles de un pedido específico (ej. pedido con id_pedido = 1)
SELECT p.id_pedido, pr.nombre AS producto, dp.cantidad, dp.precio_unitario, dp.precio_total
FROM pedidos p
JOIN detalles_pedidos dp ON p.id_pedido = dp.id_pedido
JOIN productos pr ON dp.id_producto = pr.id_producto
WHERE p.id_pedido = 1;

-- 7. Los 3 productos más vendidos
SELECT pr.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM detalles_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY total_vendido DESC
LIMIT 3;