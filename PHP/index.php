<?php
session_start();
include '../DAL/conexion.php'; 


$rol = isset($_SESSION['rol']) ? $_SESSION['rol'] : 'cliente';

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



function obtenerCliente($cliente_id) {
    $conexion = Conecta();
    
    $sql = "SELECT V_nombre_cliente, V_apellido_cliente, V_email, V_telefono, V_direccion, V_imagen, V_rol, V_pass
            FROM FIDE_CLIENTES_TB
            WHERE V_id_cliente = :cliente_id";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':cliente_id', $cliente_id, PDO::PARAM_INT);
        $stmt->execute();
        $cliente = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error al obtener cliente: " . $e->getMessage();
        $cliente = [];
    }
    
    Desconectar($conexion);
    
    return $cliente;
}

$productos = obtenerProductos();

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
            <?php if (isset($_SESSION['user_id'])) : ?>
                <a href="logout.php" id="cerrar-sesion">Cerrar Sesión</a>
            <?php else : ?>
                <a href="inicio_sesion.php" id="iniciar-sesion">Iniciar Sesión</a>
            <?php endif; ?>
        </div>
        <nav id="main-nav">
            <ul>
                <?php if ($rol == 'administrador') : ?>
                    <li class="dropdown">
                        <a href="#" class="dropbtn">Gestión</a>
                        <div class="dropdown-content">
                            <a href="clientes_ADM.php">Clientes</a>
                            <a href="categorias_ADM.php">Categorías</a>
                            <a href="compras_ADM.php">Compras</a>
                            <a href="ventas_ADM.php">Ventas</a>
                            <a href="empleados_ADM.php">Empleados</a>
                            <a href="proveedores_ADM.php">Proveedores</a>
                        </div>
                    </li>
                    <li><a href="reabastecimiento_ADM.php">Reabastecimiento</a></li>
                    <li><a href="promociones_ADM.php">Promociones</a></li>
                    <li><a href="orden_del_dia.php">Orden del Día</a></li>
                    <li><a href="resenas_productos_ADM.php">Reseñas de Productos</a></li>
                    <li><a href="reclamaciones_ADM.php">Reclamaciones</a></li>
                    <li><a href="productos_ADM.php">Productos</a></li>
                <?php elseif ($rol == 'cliente') : ?>
                    <li><a href="productos.php">Productos</a></li>
                    <li><a href="promociones.php">Promociones</a></li> 
                    <li><a href="resenas_productos.php">Reseñas de Productos</a></li>
                    <li><a href="reclamaciones.php">Reclamaciones</a></li>
                    <li><a href="carrito.php">Carrito</a></li>
                <?php endif; ?>
                <!-- Botón de perfil al final del menú -->
                <li id="perfil-menu-item">
            <a href="perfil.php" id="perfil-boton">
                <?php if (!empty($_SESSION['imagen'])): ?>
                    
                    <img src="<?php echo htmlspecialchars($_SESSION['imagen']); ?>" alt="Perfil" class="user-image">

                <?php else: ?>
                    <img src="../images/default-profile.jpg" alt="Perfil" class="user-image">
                    
                <?php endif; ?>
                <span class="user-name"><?php echo isset($_SESSION['user_name']) ? htmlspecialchars($_SESSION['user_name']) : ''; ?></span>
            </a>
</div>

                </li>
            </ul>
        </nav>
        <img src="https://edifica.com.pe/blog/wp-content/uploads/conoce-siete-electrodomesticos-imprescindibles-cocina-portada.jpg" alt="Electrodomésticos" style="width: 100%; height: auto; border-bottom: 5px solid #007bff;">
    </header>

    <main>
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
        </div>
    </main>
</body>
</html>
