<?php
include '../DAL/conexion.php';
 
// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}
 
// Preparar la consulta para la vista FIDE_PROMOCIONES_ACTIVAS_V
$query_select_promociones = 'SELECT * FROM FIDE_PROMOCIONES_ACTIVAS_SIN_ID_V';
$stmt_select_promociones = $conexion->prepare($query_select_promociones);
 
try {
    // Ejecutar la consulta
    $stmt_select_promociones->execute();
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
<title>Gestión de Promociones</title>
<link rel="stylesheet" href="/CSS/promo.css">
<style> /*Momentanio*/
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
    form {
        margin-bottom: 20px;
        padding: 20px;
        background: #fafafa;
        border-radius: 8px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }
    input[type="text"], input[type="date"], input[type="number"], input[type="submit"] {
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: calc(100% - 22px);
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #3498db;
        color: #fff;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #2980b9;
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
 
<center><h1>Promociones Del Momento</h1><center>
 
<!-- Tabla para mostrar promociones activas -->
<center><h2>Promociones Existentes</h2><center>

<a href="index.php" class="button">Menú</a>
<?php
// Mostrar los datos en la tabla
echo '<table border="1">';
echo '<tr><th>Nombre Promoción</th><th>Descripción</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Descuento</th></tr>';
 
while ($row = $stmt_select_promociones->fetch(PDO::FETCH_ASSOC)) {
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
 
</body>
</html>