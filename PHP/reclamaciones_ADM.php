
<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta para la vista FIDE_DETALLES_REABASTECIMIENTO_V
$query_select_reabastecimiento = 'SELECT * FROM FIDE_DETALLES_RECLAMACIONES_V';
$stmt_select_reabastecimiento = $conexion->prepare($query_select_reabastecimiento);

try {
    // Ejecutar la consulta
    $stmt_select_reabastecimiento->execute();
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles de Reabastecimiento</title>
    <link rel="stylesheet" href="/CSS/promo.css">
    <style> /* Estilos para la página */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        h2 {
            color: #3498db;
            margin-top: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #3498db;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reclamaciones Existentes</h1>
        <!-- Tabla para mostrar detalles de reabastecimiento -->
        <h2>Reclamaciones</h2>
        <?php
        // Mostrar los datos en la tabla
        echo '<table>';
        echo '<tr><th>ID del reclamo</th><th>Nombre</th><th>Fecha</th><th>Estado</th></tr>';

        while ($row = $stmt_select_reabastecimiento->fetch(PDO::FETCH_ASSOC)) {
            echo '<tr>';
            foreach ($row as $key => $value) {
                echo '<td>' . htmlspecialchars($value) . '</td>';
            }
            echo '</tr>';
        }
        echo '</table>';

        // Desconectar
        $conexion = null;
        ?>
    </div>
</body>
</html>
