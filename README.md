# **1. Entender los Requisitos de la Tienda**
Define qué datos necesitas manejar. Por ejemplo:

Productos: Nombre, precio, categoría, stock.
Clientes: Nombre, contacto, dirección.
Pedidos: Fecha, cliente, detalles de los productos pedidos.
Proveedores: Información de los proveedores para el inventario.
Empleados: Gestión de quienes trabajan en la tienda.


# **2. Diseñar el Modelo Relacional**
Diseña las tablas y sus relaciones. Algunas tablas esenciales serían:

## Ejemplo de Tablas:

>Productos
  >id_producto (PRIMARY KEY)
  >nombre
  >precio
  >stock
  >id_categoria (FOREIGN KEY, relacionada con Categorías)

>Categorías
  >id_categoria (PRIMARY KEY)
  >nombre_categoria

>Clientes
  >id_cliente (PRIMARY KEY)
  >nombre
  >email
  >telefono
  >direccion
  >Pedidos
  >id_pedido (PRIMARY KEY)
  >fecha
  >id_cliente (FOREIGN KEY, relacionada con Clientes)


>Detalles de Pedidos
  >id_detalle (PRIMARY KEY)
  >id_pedido (FOREIGN KEY, relacionada con Pedidos)
  >id_producto (FOREIGN KEY, relacionada con Productos)
  >cantidad
  >precio_unitario
