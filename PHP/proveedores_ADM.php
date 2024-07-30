<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

$id_proveedor = isset($_POST['id_proveedor']) ? $_POST['id_proveedor'] : null;

$nombre_proveedor = '';

if ($id_proveedor !== null) {
    $query_select_proveedor = 'SELECT FIDE_PROVEEDORES_SELECT_FN(:id_proveedor) AS nombre_proveedor FROM dual';
    $stmt_select_proveedor = $conexion->prepare($query_select_proveedor);

    try {
        $stmt_select_proveedor->bindParam(':id_proveedor', $id_proveedor, PDO::PARAM_INT);
        $stmt_select_proveedor->execute();

        $resultado = $stmt_select_proveedor->fetch(PDO::FETCH_ASSOC);

        if ($resultado) {
            $nombre_proveedor = $resultado['NOMBRE_PROVEEDOR'];
        } else {
            $nombre_proveedor = "No se encontró el proveedor.";
        }
    } catch (PDOException $e) {
        $nombre_proveedor = "Error al ejecutar la consulta: " . $e->getMessage();
    }

    // Desconectar
    Desconectar($conexion);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Proveedor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .header {
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            color: #444;
        }
        .form-container {
            text-align: center;
        }
        .form-container input, .form-container button {
            width: calc(100% - 20px);
            margin: 10px;
            padding: 10px;
            font-size: 16px;
        }
        .form-container button {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #218838;
        }
        .result-container {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">Proveedores Existentes</div>
        <div class="form-container">
            <form action="proveedores_ADM.php" method="POST">
                <input type="number" id="id_proveedor" name="id_proveedor" placeholder="Ingrese ID del Proveedor" required>
                <button type="submit">Buscar Proveedor</button>
            </form>
        </div>
        <div class="result-container">
            <?php if ($nombre_proveedor !== ''): ?>
                <div class="card">
                    <?php echo htmlspecialchars($nombre_proveedor, ENT_QUOTES, 'UTF-8'); ?>
                </div>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
