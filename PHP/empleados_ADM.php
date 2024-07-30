<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta para la vista de FIDE_DETALLES_EMPLEADOS_V
$query_select_empleados = 'SELECT * FROM FIDE_DETALLES_EMPLEADOS_V';
$stmt_select_empleados = $conexion->prepare($query_select_empleados);

try {
    // Ejecutar la consulta
    $stmt_select_empleados->execute();
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
    <title>Clientes</title>
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
        .product h3 {
            margin: 0 0 0.5rem;
            color: #333;
        }
        .product img {
            max-width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid #3498db;
            object-fit: cover;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>

<header>
    <h1>Empleados</h1>
    <a href="index.php" class="return-btn">Menú</a>
</header>

<div class="container">
    <?php
        while ($row = $stmt_select_empleados->fetch(PDO::FETCH_ASSOC)) {
            echo '<div class="product">';
            echo '<h3>' . htmlspecialchars($row['V_NOMBRE_EMPLEADO']) .' ' . htmlspecialchars($row['V_APELLIDO_EMPLEADO']) . '</h3>'; 
            echo '<p>Correo electrónico: ' . htmlspecialchars($row['V_EMAIL']) . '</p>';
            echo '<p>Número telefónico: ' . htmlspecialchars($row['V_TELEFONO']) . '</p>';
            echo '<p>Dirección: ' . htmlspecialchars($row['V_DIRECCION']) . '</p>';

    // Mostrar la imagen usando el formato solicitado
            $imagen = htmlspecialchars($row['V_IMAGEN'] ?? 'placeholder.jpg');
            $nombre_cliente = htmlspecialchars($row['V_NOMBRE_EMPLEADO'] ?? 'Imagen del empleado');
            echo '<img src="' . $imagen . '" alt="' . $nombre_cliente . '">';

            echo '</div>';
        }
    ?>
</div>

</body>
</html>
