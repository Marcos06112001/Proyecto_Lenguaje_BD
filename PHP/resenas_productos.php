<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta para la vista FIDE_PRODUCTOS_RESENAS_SI_ID_V
$query_select_resenas = 'SELECT * FROM FIDE_PRODUCTOS_RESENAS_SI_ID_V';
$stmt_select_resenas = $conexion->prepare($query_select_resenas);

try {
    // Ejecutar la consulta
    $stmt_select_resenas->execute();
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
    <title>Reseñas de Productos Electrónicos</title>
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
        .product {
            display: flex;
            flex-direction: column;
            margin-bottom: 2rem;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            padding: 1rem;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .product h2 {
            margin: 0 0 0.5rem;
            color: #333;
        }
        .price {
            font-weight: bold;
            color: #333;
        }
        .review {
            font-style: italic;
            color: #555;
        }
        .no-data {
            text-align: center;
            color: #888;
        }
    </style>
</head>
<body>

<header>
    <h1>Reseñas de Productos Electrónicos</h1>
    <a href="index.php" class="return-btn">Menú</a>
</header>

<div class="container">
    <h2>Reseñas de Productos</h2>
    <?php
    while ($row = $stmt_select_resenas->fetch(PDO::FETCH_ASSOC)) {
        echo '<div class="product">';
        echo '<h2>' . htmlspecialchars($row['V_NOMBRE_PRODUCTO']) . '</h2>';
        echo '<p class="price">Calificación: ' . htmlspecialchars($row['V_CALIFICACION']) . '</p>';
        echo '<p class="review">' . htmlspecialchars($row['V_COMENTARIO']) . '</p>';
        echo '<p>Fecha Realizada: ' . htmlspecialchars($row['V_FECHA']) . '</p>';
        echo '<p>Nombre del usuario: ' . htmlspecialchars($row['NOMBRE_CLIENTE']) . '</p>';
        echo '</div>';
    }
    ?>
</div>

</body>
</html>
