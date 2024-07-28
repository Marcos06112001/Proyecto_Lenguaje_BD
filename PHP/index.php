<?php
include '../DAL/conexion.php';
 
session_start();
 
$rol = 'cliente';
 
if (isset($_SESSION['rol'])) {
    $rol = $_SESSION['rol'];
}
 
function obtenerProductos()
{
    $conexion = Conecta();
    $consulta = "SELECT FIDE_PRODUCTOS_TB.*, FIDE_CATEGORIAS_TB.V_nombre_categoria 
                 FROM FIDE_PRODUCTOS_TB 
                 INNER JOIN FIDE_CATEGORIAS_TB 
                 ON FIDE_PRODUCTOS_TB.V_id_categoria = FIDE_CATEGORIAS_TB.V_id_categoria";
    try {
        $stmt = $conexion->query($consulta);
        $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error al obtener productos: " . $e->getMessage();
        $productos = [];
    }
 
    Desconectar($conexion);
 
    return $productos;
}
 
$productos = obtenerProductos();
 
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['agregar_carrito']) && isset($_SESSION['id_cliente'])) {
    $producto_id = $_POST['producto_id'];
    $cliente_id = $_SESSION['id_cliente'];
 
    $conexion = Conecta();
 
    try {
        // Consulta del producto
        $consulta_producto = "SELECT * FROM FIDE_PRODUCTOS_TB WHERE V_id_producto = :V_id_producto";
        $stmt_producto = $conexion->prepare($consulta_producto);
        $stmt_producto->bindParam(':producto_id', $producto_id, PDO::PARAM_INT);
        $stmt_producto->execute();
 
        if ($stmt_producto->rowCount() > 0) {
            $producto = $stmt_producto->fetch(PDO::FETCH_ASSOC);
            $precio_unitario = $producto['precio'];
 
            $subtotal = $precio_unitario;
 
            // Inserción en el carrito
            $consulta_carrito = "INSERT INTO FIDE_CARRITO_TB (V_id_cliente, V_id_producto, V_cantidad, V_precio_unitario, V_subtotal) 
                                 VALUES (:V_id_cliente, :V_id_producto, 1, :V_precio_unitario, :V_subtotal)";
            $stmt_carrito = $conexion->prepare($consulta_carrito);
            $stmt_carrito->bindParam(':V_id_cliente', $cliente_id, PDO::PARAM_INT);
            $stmt_carrito->bindParam(':V_id_producto', $producto_id, PDO::PARAM_INT);
            $stmt_carrito->bindParam(':V_precio_unitario', $precio_unitario, PDO::PARAM_STR);
            $stmt_carrito->bindParam(':V_subtotal', $subtotal, PDO::PARAM_STR);
 
            if ($stmt_carrito->execute()) {
                $mensaje = "El producto se agregó al carrito correctamente.";
            } else {
                $error = "Error al agregar el producto al carrito.";
            }
        } else {
            $error = "Error: No se encontró el producto en la base de datos.";
        }
    } catch (PDOException $e) {
        $error = "Error en la operación de la base de datos: " . $e->getMessage();
    }
 
    Desconectar($conexion);
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Electric</title>
    <link rel="stylesheet" href="../CSS/styles.css">
    </head>
<body>
    <header>
        <h1>Tienda Electric</h1>
        <div id="top-header">
            <?php if (isset($_SESSION['rol'])) : ?>
                <a href="cerrar_sesion.php" id="cerrar-sesion">Cerrar Sesión</a>
            <?php else : ?>
                <a href="inicio_sesion.php" id="iniciar-sesion">Iniciar Sesión</a>
            <?php endif; ?>
        </div>
        <nav id="main-nav">
            <ul>
                <?php if ($rol == 'administrador') : ?>
                    <li><a href="clientes.php">Clientes</a></li>
                    <li><a href="categorias.php">Categorías</a></li>
                    <li><a href="compras.php">Compras</a></li>
                    <li><a href="ventas.php">Ventas</a></li>
                    <li><a href="empleados.php">Empleados</a></li>
                    <li><a href="proveedores.php">Proveedores</a></li>
                    <li><a href="reabastecimiento.php">Reabastecimiento</a></li>
                    <li><a href="promociones.php">Promociones</a></li>
                    <li><a href="orden_del_dia.php">Orden del Día</a></li>
                    <li><a href="resenas_productos.php">Reseñas de Productos</a></li>
                    <li><a href="reclamaciones.php">Reclamaciones</a></li>
                    
                <?php elseif ($rol == 'cliente') : ?>
                    <li><a href="productos.php">Productos</a></li>
                    <li><a href="promociones.php">Promociones</a></li>
                    <li><a href="resenas_productos.php">Reseñas de Productos</a></li>
                    <li><a href="reclamaciones.php">Reclamaciones</a></li>
                    <li><a href="perfil.php">Perfil</a></li>
                    <li><a href="carrito.php">Carrito</a></li>
                    <li><a href="descripcion.php">Descripcion</a></li>
                <?php endif; ?>
            </ul>
        </nav>
        <img src="https://edifica.com.pe/blog/wp-content/uploads/conoce-siete-electrodomesticos-imprescindibles-cocina-portada.jpg" alt="Electrodomésticos" style="width: 100%; height: auto; border-bottom: 5px solid #007bff;">
    </header>

    <div class="container">
        <p>
            Bienvenido a nuestra tienda de electrodomésticos. Su destino integral para todo lo relacionado con la tecnología del hogar. Desde los electrodomésticos más básicos hasta los más avanzados, estamos aquí para proporcionarle una experiencia excepcional.
        </p>
        <h2>¿Quiénes Somos?</h2>
        <p>
            Somos una tienda especializada en la venta de electrodomésticos comprometidos con ofrecer productos de alta calidad, tecnología de punta y un servicio al cliente insuperable. Nuestro objetivo es satisfacer todas sus necesidades domésticas con soluciones innovadoras y eficientes.
        </p>
        <h2>Productos a Ofrecer</h2>
        <ul>
            <li>Cocina</li>
            <li>Limpieza</li>
            <li>Climatización</li>
            <li>Entretenimiento</li>
        </ul>
</body>
</html>