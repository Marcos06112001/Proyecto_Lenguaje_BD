<?php
include '../DAL/conexion.php';
session_start(); // Inicia la sesión para acceder a la variable $_SESSION

// Función para llamar el procedimiento almacenado
function agregarProductoCarrito($id_cliente, $id_producto, $cantidad) {
    $conexion = Conecta();

    try {
        // Prepara la llamada al procedimiento almacenado
        $stmt = $conexion->prepare("BEGIN AGREGARALCARRITO(:p_id_cliente, :p_id_producto, :p_cantidad); END;");
        
        // Bind de parámetros
        $stmt->bindParam(':p_id_cliente', $id_cliente, PDO::PARAM_INT);
        $stmt->bindParam(':p_id_producto', $id_producto, PDO::PARAM_INT);
        $stmt->bindParam(':p_cantidad', $cantidad, PDO::PARAM_INT);
        
        // Ejecuta el procedimiento almacenado
        $stmt->execute();
        
        return "Producto agregado al carrito con éxito.";
    } catch (PDOException $e) {
        return "Error al agregar producto al carrito: " . $e->getMessage();
    } finally {
        Desconectar($conexion);
    }
}

// Verifica si se ha enviado el ID del producto y el ID del cliente está disponible en la sesión
if (isset($_GET['id_producto']) && isset($_SESSION['id_cliente'])) {
    $id_producto = (int)$_GET['id_producto'];
    $id_cliente = $_SESSION['id_cliente'];
    $cantidad = 1; // Cantidad por defecto, puedes ajustarla según sea necesario

    $mensaje = agregarProductoCarrito($id_cliente, $id_producto, $cantidad);
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar al Carrito</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            text-align: center;
            color: #555;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Agregar al Carrito</h1>
        <?php if (isset($mensaje)): ?>
            <p><?php echo htmlspecialchars($mensaje); ?></p>
        <?php endif; ?>
        <p><a href="index.php">Volver al Inicio</a></p>
        <p><a href="finalizar_compra.php">Compra</a></p>
    </div>
</body>
</html>
