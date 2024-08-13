<?php
include '../DAL/conexion.php';
session_start(); // Inicia la sesión para acceder a la variable $_SESSION

// Verifica si se ha enviado un producto para agregar al carrito
if (isset($_GET['id_producto'])) {
    $id_producto = (int)$_GET['id_producto'];
    agregarAlCarrito($id_producto);
    header('Location: carrito.php'); // Redirige a la página del carrito para evitar múltiples envíos del formulario
    exit();
}

// Función para agregar un producto al carrito
function agregarAlCarrito($id_producto) {
    // Verifica si el carrito está vacío
    if (!isset($_SESSION['carrito'])) {
        $_SESSION['carrito'] = [];
    }

    $conexion = Conecta();
    
    $sql = "SELECT V_ID_PRODUCTO, V_NOMBRE_PRODUCTO, V_PRECIO 
            FROM FIDE_PRODUCTOS_TB 
            WHERE V_ID_PRODUCTO = :id_producto";
    
    try {
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_producto', $id_producto, PDO::PARAM_INT);
        $stmt->execute();
        $producto = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($producto) {
            // Verifica si el producto ya está en el carrito
            $encontrado = false;
            foreach ($_SESSION['carrito'] as &$item) {
                if ($item['V_ID_PRODUCTO'] == $id_producto) {
                    $item['cantidad']++;
                    $encontrado = true;
                    break;
                }
            }

            // Si el producto no estaba en el carrito, lo agrega con cantidad 1
            if (!$encontrado) {
                $producto['cantidad'] = 1;
                $_SESSION['carrito'][] = $producto;
            }
        }
    } catch (PDOException $e) {
        echo "Error al agregar producto al carrito: " . $e->getMessage();
    }

    Desconectar($conexion);
}

// Función para obtener los productos del carrito
function obtenerCarrito() {
    return isset($_SESSION['carrito']) ? $_SESSION['carrito'] : [];
}

// Obtiene los productos del carrito para mostrarlos en la página
$carrito = obtenerCarrito();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
    <link rel="stylesheet" href="/CSS/carrito.css">
    
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: #04022d;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }

        .header h1 {
            margin: 0;
            font-size: 2rem;
            text-align: center;
            flex: 1;
        }

        .header .button {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .cart-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .cart-section h2 {
            margin-top: 0;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .cart-items {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-item h3 {
            margin: 0;
            font-size: 1.2rem;
        }

        .cart-item .price {
            font-size: 1rem;
            font-weight: bold;
        }

        .total-section {
            text-align: right;
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .finalizar-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #28a745;
            border-radius: 4px;
            text-decoration: none;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .finalizar-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Carrito de Compras</h1>
            <a href="productos.php" class="button">Volver a Productos</a>
        </header>
        <main>
            <section class="cart-section">
                <h2>Tu Carrito</h2>
                <?php if (!empty($carrito)): ?>
                    <ul class="cart-items">
                        <?php foreach ($carrito as $item): ?>
                            <li class="cart-item">
                                <h3><?php echo htmlspecialchars($item['V_NOMBRE_PRODUCTO']); ?></h3>
                                <span class="price">$<?php echo htmlspecialchars($item['V_PRECIO']); ?> x <?php echo htmlspecialchars($item['cantidad']); ?> = $<?php echo htmlspecialchars($item['V_PRECIO'] * $item['cantidad']); ?></span>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                    <div class="total-section">
                        Total: $<?php 
                            $total = 0;
                            foreach ($carrito as $item) {
                                $total += $item['V_PRECIO'] * $item['cantidad'];
                            }
                            echo htmlspecialchars($total);
                        ?>
                    </div>
                    <a href="confirmacion.php" class="finalizar-button">Finalizar Compra</a>
                <?php else: ?>
                    <p>No tienes productos en tu carrito.</p>
                <?php endif; ?>
            </section>
        </main>
    </div>
</body>
</html>
