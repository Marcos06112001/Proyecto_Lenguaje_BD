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
 
// Obtener los estados para el menú desplegable
$query_select_estados = 'SELECT V_id_estado, V_descripcion FROM FIDE_ESTADOS_TB';
$stmt_select_estados = $conexion->prepare($query_select_estados);
$stmt_select_estados->execute();
$estados = $stmt_select_estados->fetchAll(PDO::FETCH_ASSOC);
?>
 
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión de Promociones</title>
<link rel="stylesheet" href="/CSS/promo.css">
</head>
<body>
 
<h1>Gestión de Promociones</h1>
 
<!-- Tabla para mostrar promociones activas -->
<h2>Promociones Activas</h2>
<?php
// Mostrar los datos en la tabla
echo '<table border="1">';
echo '<tr><th>Nombre Promoción</th><th>Descripción</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Descuento</th><th>Estado</th></tr>';
 
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