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
    <h1>Compras Existentes</h1>
    <a href="index.php" class="return-btn">Menú</a>
</header>

<div class="container">
    <h2>Compras de Usuarios</h2>
    <?php
// Mostrar los datos en la tabla
    echo '<table border="1">';
    echo '<tr><th>Nombre del usuario</th><th>Producto</th><th>Cantidad comprada</th><th>Precio</th><th>Total</th><th>Estado</th></tr>';
 
while ($row = $stmt_select_carrito->fetch(PDO::FETCH_ASSOC)) {
    echo '<tr>';
    foreach ($row as $key => $value) {
        echo '<td>' . htmlspecialchars($value) . '</td>';
    }
    echo '</tr>';
}
echo '</table>';
 
// Desconectar
Desconectar($conexion);
?>
</div>

</body>
</html>

