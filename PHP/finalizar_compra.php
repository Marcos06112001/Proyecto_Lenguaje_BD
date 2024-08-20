<?php
include '../DAL/conexion.php';
session_start(); // Inicia la sesión para acceder a la variable $_SESSION

// Función para llamar al procedimiento almacenado
function finalizarCompra($id_cliente, $id_proveedor, $detalles) {
    $conexion = Conecta();

    try {
        // Prepara la llamada al procedimiento almacenado
        $stmt = $conexion->prepare("BEGIN FIDE_FINALIZAR_COMPRA(:p_id_cliente, :p_id_proveedor, :p_detalles); END;");
        
        // Bind de parámetros
        $stmt->bindParam(':p_id_cliente', $id_cliente, PDO::PARAM_INT);
        $stmt->bindParam(':p_id_proveedor', $id_proveedor, PDO::PARAM_INT);
        $stmt->bindParam(':p_detalles', $detalles, PDO::PARAM_STR);
        
        // Ejecuta el procedimiento almacenado
        $stmt->execute();
        
        return "Compra realizada con éxito.";
    } catch (PDOException $e) {
        return "Error al finalizar la compra: " . $e->getMessage();
    } finally {
        Desconectar($conexion);
    }
}

// Verifica si el ID del proveedor está disponible y el ID del cliente está en la sesión
if (isset($_SESSION['id_cliente']) && isset($_POST['id_proveedor'])) {
    $id_cliente = $_SESSION['id_cliente'];
    $id_proveedor = (int)$_POST['id_proveedor'];
    $detalles = 'Compra realizada desde el sitio web'; // Puedes ajustar este valor según sea necesario

    $mensaje = finalizarCompra($id_cliente, $id_proveedor, $detalles);
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizar Compra</title>
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
        form {
            text-align: center;
        }
        button {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
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
        <h1>Finalizar Compra</h1>
        <?php if (isset($mensaje)): ?>
            <p><?php echo htmlspecialchars($mensaje); ?></p>
        <?php endif; ?>
        <form method="post" action="">
            <input type="hidden" name="id_proveedor" value="1"> <!-- Ajusta según tu lógica -->
            <button type="submit">Confirmar Compra</button>
        </form>
        <p><a href="index.php">Volver al Inicio</a></p>
    </div>
</body>
</html>
