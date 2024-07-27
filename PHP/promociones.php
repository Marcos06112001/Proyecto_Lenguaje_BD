<?php
include '../DAL/conexion.php';

// Establecer la conexión
try {
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Preparar la consulta
$query = 'SELECT V_id_promocion, V_nombre_promocion, V_descripcion_promocion, V_fecha_inicio, V_fecha_fin, V_descuento, V_id_estado FROM FIDE_PROMOCIONES_TB';
$stmt = $conexion->prepare($query);

try {
    // Ejecutar la consulta
    $stmt->execute();
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
</head>
<body>

<h1>Gestión de Promociones</h1>

<!-- Formulario para agregar nuevas promociones -->
<form action="insertar_promocion.php" method="POST">
    <h2>Agregar Nueva Promoción</h2>
    <label for="nombre_promocion">Nombre de la Promoción:</label>
    <input type="text" id="nombre_promocion" name="nombre_promocion" required><br>

    <label for="descripcion_promocion">Descripción:</label>
    <input type="text" id="descripcion_promocion" name="descripcion_promocion" required><br>

    <label for="fecha_inicio">Fecha de Inicio:</label>
    <input type="date" id="fecha_inicio" name="fecha_inicio" required><br>

    <label for="fecha_fin">Fecha de Fin:</label>
    <input type="date" id="fecha_fin" name="fecha_fin" required><br>

    <label for="descuento">Descuento (%):</label>
    <input type="number" id="descuento" name="descuento" required><br>

    <label for="id_estado">Estado:</label>
    <input type="text" id="id_estado" name="id_estado" required><br>

    <input type="submit" value="Agregar Promoción">
</form>

<!-- Tabla para mostrar promociones existentes -->
<h2>Promociones Existentes</h2>
<?php
// Mostrar los datos en la tabla
echo '<table>';
echo '<tr><th>ID Promoción</th><th>Nombre Promoción</th><th>Descripción</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Descuento</th><th>Estado</th></tr>';

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
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
