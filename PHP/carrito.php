<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta para la vista FIDE_PRODUCTOS_RESENAS_SI_ID_Va
$query_select_carrito = 'SELECT * FROM FIDE_PRODUCTOS_CARRITO_RESIVO_V';
$stmt_select_carrito = $conexion->prepare($query_select_carrito);

try {
    // Ejecutar la consulta
    $stmt_select_carrito->execute();
} catch (PDOException $e) {
    echo "Error al ejecutar la consulta: " . $e->getMessage();
    exit();
}

// Desconectar
Desconectar($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 1rem;
        }
        header {
            background-color: #ffffff;
            padding: 1rem;
            text-align: center;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            margin: 0;
            color: #333;
        }
        .return-btn {
            display: inline-block;
            margin-top: 0.5rem;
            color: #007bff;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        .table-container {
            background-color: #ffffff;
            padding: 1rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .table {
            margin-bottom: 0;
        }
        .no-data {
            text-align: center;
            color: #888;
            padding: 2rem;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<header>
    <h1>Compras Realizadas</h1>
    <a href="index.php" class="return-btn">Menú</a>
</header>

<div class="container">
    <center><h4>Si deseas seguir comprando puedes hacerlo. Aproveche las promociones, las promociones no te esperan</h4><center>
    <div class="table-container">
        <?php
        if ($stmt_select_carrito->rowCount() > 0) {
            echo '<table class="table table-striped">';
            echo '<thead class="thead-dark">';
            echo '<tr><th>Nombre del usuario</th><th>Producto</th><th>Cantidad comprada</th><th>Precio</th><th>Total</th><th>Estado</th></tr>';
            echo '</thead>';
            echo '<tbody>';

            while ($row = $stmt_select_carrito->fetch(PDO::FETCH_ASSOC)) {
                echo '<tr>';
                foreach ($row as $key => $value) {
                    echo '<td>' . htmlspecialchars($value) . '</td>';
                }
                echo '</tr>';
            }
            
            echo '</tbody>';
            echo '</table>';
        } else {
            echo '<div class="no-data">No hay datos disponibles</div>';
        }
        ?>
    </div>
</div>

</body>
</html>
